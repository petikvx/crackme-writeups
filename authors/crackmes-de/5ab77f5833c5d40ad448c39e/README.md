# newcoma's CrackMe #1 (`newcoma-CrackMe.exe`) — newcoma

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c39e`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c39e) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de / newcoma group |
| **Plateforme** | Windows PE32 GUI, Visual Basic 6 (code natif), packé **ASPack 2.12–2.42** |
| **SHA-256 (zip)** | `2d225c69e32811563ec76bce1c89fc8ef00ddde6d6bbb6c7639cef906af5e648` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/newcoma.crackme1.zip` | archive d'origine (mot de passe `crackmes.one`) : `newcoma-CrackMe.exe` + `.nfo` |
| `tools/newcoma-crackme1-solve.py` | keygen (`--name`, `--hour`/`--timer`, `-q`) |
| `analysis/newcoma-CrackMe.memdump-0x400000.bin` | image mémoire dépackée (0x400000..0x418000), dumpée depuis `/proc/<pid>/mem` sous Wine |
| `analysis/screenshot-ok.png` / `screenshot-ko.png` | preuve live Wine (OK / KO) |

## Réponse

Le serial **dépend de l'heure locale** (VB `Timer`, arrondi à l'heure la plus proche).

| Name | Heure | Serial |
|---|---|---|
| `petik` | 11 h 42 (→ 12) | **`5D5363595C`** |
| `petik` | 00 h 00 | `5147574D50` |
| `petik` | 05 h 24 (→ 5) | `564C5C5255` |

```bash
python3 tools/newcoma-crackme1-solve.py --name petik -q   # utilise l'heure courante
python3 tools/newcoma-crackme1-solve.py --name petik --hour 11.7
```

Nom : 5 à 40 caractères.

## Premier regard

```bash
unzip -P crackmes.one original/newcoma.crackme1.zip -d /tmp/nc   # hors dépôt
file newcoma-CrackMe.exe   # PE32 GUI, 5 sections (.text .data .rsrc .aspack .adata)
diec newcoma-CrackMe.exe   # Linker MS 6.0, Visual Basic 6 [Native], Packer ASPack 2.12-2.42
```

Le `.nfo` dit « coded in VB ». `strings` ne montre rien d'utile sur le fichier packé (EP `0x15001` dans `.aspack`).
Fenêtre : champs **Name**, **Serial**, boutons TRY! / EXIT.

## Flow

`TRY!` → handler VB `0x411240` :
1. `Len(Name) > 40` → MsgBox « Maximal 40 Zeichen! ».
2. Boucle `For i = 1 To Len(Name)` : calcule un fragment hex par caractère (`arr[i-1]`).
3. Concatène les fragments dans une TextBox cachée (`+0x2fc`).
4. `StrCmp(TextBox Serial (+0x300).Text, TextBox cachée.Text)` : égal → « Congrats! Nice work… », sinon « Don't cry and try again! » puis « You should ask your mom… » en alternance (flag `[esi+0x34]`).

Un autre handler (`0x411c10`) refuse les noms `Len < 5` (« Mindestens 5 Zeichen! »).

## Comment on trouve le prédicat

### 1. Dépacker (ASPack) sans toucher à `original/`

Pas d'unpacker ASPack dans le dépôt ; plus simple : laisser Wine dépacker et dumper l'image.

```bash
xvfb-run -a wine newcoma-CrackMe.exe &            # (ou Xvfb :77 + DISPLAY)
pid=$(pgrep -f '^newcoma-CrackMe.exe')
python3 - <<EOF
f=open('/proc/$pid/mem','rb'); f.seek(0x400000)
open('dump.bin','wb').write(f.read(0x18000))
EOF
```

`/proc/<pid>/maps` : `.text` est devenu RWX `0x401000-0x413000`. Le dump contient le code VB natif, la table d'IAT (`0x401000..`) et les chaînes **UTF-16** (`strings -el`) :
`Maximal 40 Zeichen!`, `Don't cry…`, `You should ask your mom…`, `Congrats!…`, `Mindestens 5 Zeichen!`.

### 2. Retrouver le handler par xrefs de chaînes

Pour chaque chaîne, recherche de son adresse (`0x410dd0` Maximal, `0x410e04` Don't cry, `0x410ec0` Congrats, `0x410f88` Mindestens) comme immediate dans `.text` → handler à `0x411240` (`objdump -D -b binary -m i386 -M intel --adjust-vma=0x401000`).

### 3. Nommer l'IAT (imports VB `msvbvm60`)

Le fichier packé n'a pas de noms exploitables ; dans le process vivant, l'IAT `0x401000..0x4010f8` contient les adresses résolues de `msvbvm60.dll`. On les croise avec les exports de la DLL Wine (`pefile`, `/proc/<pid>/maps` pour la base) :

| IAT | Fonction |
|---|---|
| `0x40100c` | `__vbaLenBstr` |
| `0x401024` | `rtcAnsiValueBstr` (`Asc`) |
| `0x401058` | `rtcMidCharBstr` (`Mid$`) |
| `0x401098` | `rtcStrConvVar2` (`StrConv`) |
| `0x40109c` | **`rtcGetTimer`** (`Timer`) |
| `0x4010a8` | `__vbaR8Str` (`Val`) |
| `0x4010b8` | `rtcHexVarFromVar` (`Hex`) |
| `0x4010d0` | `__vbaVarAdd` |
| `0x4010d8` | `__vbaFpI2` (arrondi → Integer) |
| `0x40102c` | `__vbaStrCat` |
| `0x401068` | `__vbaStrCmp` |

### 4. Lecture du calcul (boucle, `0x4114xx..0x4116cd`)

```asm
4114f9  call rtcMidCharBstr      ; Mid$(Name, i, 1)
411532  call rtcStrConvVar2      ; StrConv(c, 3 = vbProperCase)  -> majuscule pour 1 char
411587  call rtcAnsiValueBstr    ; Asc(...)                      -> ax
4115ac  call __vbaVarAdd         ; i + Asc(UCase(c))   (Variant)
4115ca  call rtcGetTimer         ; Timer (secondes depuis minuit) -> st0
4115d3  fstp dword [ebp-0xfc]    ;   stocké en Single
4115da  call __vbaR8Str          ; Val(str(i+Asc))  -> st0
4115e0  fld  dword [ebp-0xfc]
4115ef  fdiv dword [0x401100]    ; /60.0f   (0x401100 = 0x42700000 = 60.0)
41160b  fdiv dword [0x401100]    ; /60.0f   => Timer/3600 = heures décimales
411628  faddp st(1), st          ; (i+Asc) + Timer/3600
411634  call __vbaFpI2           ; CInt : arrondi banquier -> Integer 16 bits
41165e  call rtcHexVarFromVar    ; Hex$()
41169d  call __vbaStrCopy        ; arr[i-1] = hex   (tableau de 41 chaînes)
```

(`cmp [0x413000],0 / jne` autour des `fdiv` = garde-fou du bug FDIV du Pentium, à ignorer.)

Piège : le `call 0x40109c` ressemble à du bruit entre deux `fstp/fld` ; c'est bien `Timer`. Le serial change donc au fil de la journée.

### 5. Assemblage et comparaison

Deuxième boucle (`0x411785..0x411885`) : `Text(+0x2fc) = StrCat(arr[i-1], Text)` pour `i = 1..Len`. `__vbaStrCat(rhs, lhs)` prend ses arguments dans l'ordre inverse (`Text` est poussé en premier), donc c'est `Text & arr[i-1]` : concaténation dans l'**ordre direct**.
(Ma première lecture inversait l'ordre → serial refusé ; confirmé en cherchant dans la mémoire du process la chaîne UTF-16 générée par le crackme : `5D5363595C`, pas `5C5963535D`.)

Puis `StrCmp(Text(+0x300) /*Serial saisi*/, Text(+0x2fc))` @ `0x4118fd`.

### 6. Exemple pas à pas — `petik` à 11 h 42 (`Timer/3600 = 11.7`, soit +12)

| i | c | UCase | Asc | i+Asc | +11.7 → CInt | Hex |
|---|---|---|---|---|---|---|
| 1 | p | P | 80 | 81 | 93 | `5D` |
| 2 | e | E | 69 | 71 | 83 | `53` |
| 3 | t | T | 84 | 87 | 99 | `63` |
| 4 | i | I | 73 | 77 | 89 | `59` |
| 5 | k | K | 75 | 80 | 92 | `5C` |

Serial = `5D 53 63 59 5C` → **`5D5363595C`**.

## Prédicat consolidé

```text
shift  = round_half_even(Timer / 3600)            # à ±epsilon près, voir CInt
frag_i = Hex$( CInt(i + Asc(UCase$(Mid$(Name,i,1))) + Timer/3600) )
serial = frag_1 & frag_2 & ... & frag_Len         # 5 <= Len <= 40
```

Implémentation : [`tools/newcoma-crackme1-solve.py`](tools/newcoma-crackme1-solve.py).

## Vérification

Pas de GDB utilisé (analyse dump + objdump). Preuve live : `Xvfb :77` + `wine newcoma-CrackMe.exe` + `xdotool` (saisie), capture via `PIL.ImageGrab`.

- OK : Name `petik`, Serial `5D5363595C` (généré par le solveur à 11 h 4x) → [`screenshot-ok.png`](analysis/screenshot-ok.png) : « Congrats! Nice work. ;-) Now code a KeyGen… ».
- KO : même nom, serial `5D53635000` → [`screenshot-ko.png`](analysis/screenshot-ko.png) : « Don't cry and try again! ».
- KO aussi avec l'ordre inversé `5C5963535D` (premier essai) : « You should ask your mom… ».

## Notes

- Le serial n'est valable que dans l'heure d'arrondi courante (il change à xx:30:00) ; à la frontière exacte, `CInt` fait un arrondi banquier (écart négligeable, non géré à la µs).
- La TextBox `+0x2fc` (serial attendu) existe dans la fenêtre mais n'est pas visible.
- Sous Wine, `Timer` suit l'heure locale du système (ici CET).
- Les écrans de saisie : `Ctrl+A` ne sélectionne pas tout dans ces TextBox ; vider avec `End` + `BackSpace`.
