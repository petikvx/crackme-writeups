# crackmes.de's cm01 by cyriel

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c356`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c356) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (cyriel) |
| **Plateforme** | Windows PE32 console, MSVC 2008 (C++), sans packer |
| **SHA-256 (zip)** | `6f39d694f5d747a98c339b951012664dfc54028493b681de1e4a8f67a23b69e4` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/cm01.zip` | archive d'origine (mot de passe du site : `crackmes.one`), non modifiée |
| `analysis/cm01.exe` | `cm01.exe` extrait du zip (copie de travail) |
| `analysis/readme-auteur.txt` | readme de l'auteur (« 1 easy anti-debug », « no patching ») |
| `analysis/objdump-cm01.txt` | `objdump -d -M intel` complet |
| `tools/cm01-solve.py` | solveur + `--check` (Wine) |

## Réponse

Mot de passe fixe (pas de nom d'utilisateur, donc pas de `petik` ici) :

```
1337cracker;]
```

```bash
python3 tools/cm01-solve.py -q          # 1337cracker;]
python3 tools/cm01-solve.py --check     # rejoue sous xvfb-run wine : « Well done :) » ; variante fausse : rien
```

## Premier regard

```bash
unzip -P crackmes.one original/cm01.zip -d /tmp/cm01x
file cm01.exe     # PE32 console, i386
diec cm01.exe     # MSVC 15.00 (VS2008), pas de packer
strings -n 5 cm01.exe
```

Strings utiles : `CM01... pwd:`, `Checking password.....`, `Start checking...`, `Well done :)`, `Better, but stil not ok;)`, `Bad password! Try again...!`, `1337cr`, **`IsItThis?`** (leurre) et les imports `IsDebuggerPresent`, `ReadProcessMemory`, `WriteProcessMemory`, `timeGetTime`.

## Flow

`main` @ `0x401400` :

1. `cin >> std::string` (objet global @`0x404380`, longueur @`0x404394`), `printf("Checking password.....")`.
2. Appelle `GetCurrentProcess`, puis **`ReadProcessMemory(self, IsDebuggerPresent, buf, 0x12)`** et **`WriteProcessMemory(self, 0x401050, buf, 0xe)`** : le stub @`0x401050` (qui renvoie 0) est écrasé par les 14 premiers octets de `IsDebuggerPresent` (auto-patch anti-debug « maison »).
3. `call 0x401050` → vaut maintenant `IsDebuggerPresent()` :
   - **≠ 0 (debugger)** → `0x401000` : compare le mot de passe au leurre `IsItThis?` (mismatch ⇒ `Bad password!` / `Better, but stil not ok;)`), jamais le bon chemin.
   - **= 0** → `call 0x401060` : le **vrai** contrôle.
4. En fin de `0x401060`, le message de succès n'est pas un `push` direct : le code **s'auto-modifie** (voir plus bas) pour que le `printf` final affiche `Well done :)`.

Sous Wine/sans debugger, `IsDebuggerPresent` renvoie 0 et on tombe bien dans `0x401060`.

## Comment on trouve le prédicat

**Ancrage** : `objdump -d -M intel --no-show-raw-insn cm01.exe` (fichier `analysis/objdump-cm01.txt`). Les `call DWORD PTR ds:0x403054` sont `std::string::operator[](idx)` (thiscall, `ecx=0x404380`, index poussé juste avant) : `push N ; call [0x403054]` ⇒ lecture de `pw[N]`. Ça rend le désassemblage très lisible : chaque contrainte est une suite de `pw[i]`.

Les imports : `0x403008` GetCurrentProcess, `0x40300c` Sleep, `0x403010` ReadProcessMemory, `0x403014` IsDebuggerPresent, `0x403018` WriteProcessMemory (ordre des `strings`), `0x4030e4` printf.

**`0x401060`** — contrainte par contrainte (`p[i]` = `pw[i]`) :

| Étape | Asm | Contrainte |
|---|---|---|
| longueur | `mov eax,[0x404394] ; xor eax,0xd ; jne` | `len == 13` |
| préfixe | boucle `0x4010c0`, `cmp` avec `"1337cr"` copié sur la pile | `p[0..5] == "1337cr"` |
| somme | boucle `0x4010e0`, 13 `movsx` ajoutés ; `cmp edi,0x441` | `Σ p[0..12] == 0x441` (1089) |
| c3 | `p4 / p7` (idiv), `p9 - q - p2` rangé en octet 1 d'un tampon | `p9 - p4/p7 - p2 == 0x31` (voir piège) |
| c4 | `p6 - p0 == 0x30` | `p6 = 0x31+0x30 = 'a'` |
| c5 | `(p11-p3)` arrondi vers 0 puis `sar 1` ; `p7 - p6` | `p7 - p6 == (p11-p3)/2` |
| c6 | `(p8+p5) idiv 0x9c`, `dl-1` rangé en octet 2 du tampon | `(p8+p5) % 156 == 0x41` |
| c7 | `lea esi,[edx+esi+1]` | `p9 == p1+p0+1` |
| c8 | `add esi,0xd` | `p10 == p9+13` |
| c9 | `p5 idiv p11`, reste `== p3` | `p5 % p11 == p3` |
| c10 | `(p2-p0)*p0 - 5` | `p12 == (p2-p0)*p0 - 5` |

**Piège / le truc sympa : le chemin « Well done »**. Après c10 le code fait (`0x401394`) :

```asm
mov  dl, p12 ; sub dl, p12       ; dl = 0 toujours
...
push 0 ; push 4 ; lea eax,[esp+0x14]   ; source = tampon pile de 4 octets
push 0x4013d4 ; push [0x404374]        ; destination = opérande du « push imm32 » @0x4013d3
call WriteProcessMemory
4013d3: push 0x0 ; call printf         ; ← l'opérande est réécrit juste avant
```

Le `push imm32` @`0x4013d3` voit donc son opérande remplacé par les 4 octets du tampon pile. Ce tampon contient : octet 0 = `0x3c` (posé au début, `mov BYTE PTR [esp+0xc],0x3c`), octet 1 = `p9 - p4/p7 - p2`, octet 2 = `(p8+p5)%0x9c - 1`, octet 3 = `p12-p12 = 0`. Pour que le `printf` affiche le message, le pointeur reconstitué doit valoir `0x0040313c` (adresse de `"Well done :)"`, octets `3c 31 40 00`), ce qui donne :

- octet 1 = `0x31` → `p9 - p4/p7 - p2 == 0x31`
- octet 2 = `0x40` → `(p8+p5)%0x9c == 0x41` (le `dec dl`)

Ce sont **ces deux contraintes** (c3 et c6) qui ne sont pas des `cmp` mais des valeurs « calculées » : si elles sont fausses, le `printf` pointe ailleurs (junk / crash), il n'y a pas de branche d'erreur explicite. (`Sleep` est appelé ensuite pour laisser le message visible.)

**Assemblage de la réponse** :

1. `p[0..5] = "1337cr"` = 49,51,51,55,99,114.
2. c4 : `p6 = 49+48 = 97 = 'a'`.
3. c6 : `p8+p5 ∈ {65, 221}`, `p5=114` ⇒ `p8 = 107 = 'k'` (65 impossible, négatif).
4. c7 : `p9 = 51+49+1 = 101 = 'e'`.
5. c8 : `p10 = 101+13 = 114 = 'r'`.
6. c9 : `114 % p11 == 55` ⇒ `p11 | 59`, `p11 > 55` ⇒ `p11 = 59 = ';'`.
7. c5 : `(59-55)/2 = 2` ⇒ `p7 = 97+2 = 99 = 'c'`.
8. c3 : `p4/p7 = 99/99 = 1` ⇒ `101 - 1 - 51 = 49 = 0x31` ✓.
9. c10 : `(51-49)*49 - 5 = 93 = ']'`.
10. Somme : `419 + 97+99+107+101+114+59+93 = 1089 = 0x441` ✓ (la contrainte de somme est redondante, bon test de cohérence).

Résultat : `1337cracker;]` (« 1337 cracker » + `;]`, smiley).

## Vérification

Wine sans debugger (`xvfb-run -a wine`) :

```text
$ echo '1337cracker;]' | xvfb-run -a wine cm01.exe
CM01... pwd:
Checking password.....
Start checking...
Well done :)

$ echo '1337crackerX]' | xvfb-run -a wine cm01.exe
CM01... pwd:
Checking password.....
Start checking...
(rien : pas de message)
```

`python3 tools/cm01-solve.py --check` rejoue les deux cas (affiche `OK`).

## Notes

- Analyse 100 % statique + Wine ; pas de session GDB/x64dbg, donc pas de section « Debug GDB ».
- Sous debugger, `IsDebuggerPresent` ≠ 0 route vers le leurre `IsItThis?` : ne pas se laisser piéger par cette chaîne, ce n'est **pas** le mot de passe.
- Une mauvaise réponse sur c3/c6/c4 etc. ne produit pas de `Bad password!` mais un silence (ou `printf` sur un pointeur invalide) : les messages d'échec n'appartiennent qu'au chemin leurre.
- Le bloc `loop`/`shl` @`0x40148b` (basé sur `timeGetTime % 25`) est du bruit anti-analyse sans effet.
