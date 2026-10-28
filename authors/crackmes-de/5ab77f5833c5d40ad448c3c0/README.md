# crackmes.de's triangle_keygenme / KeyGenMe.exe (iSSoGoo)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3c0`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3c0) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (iSSoGoo, 2013-07-08) |
| **Plateforme** | Windows PE32 GUI, MASM32 (Linker 5.12), sans CRT, FPU x87 |
| **SHA-256 (zip)** | `cad90ceef046f51bdab6b0f49bcd5efc6ccc4f5111eab7c7359b8d6558af5ed8` |
| **SHA-256 (`KeyGenMe.exe` dans le zip)** | `b71df70a6f8109de05cad5668c3049a62218cc8647a8c28064e9636e8bdf5e12` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/trianglekeygenme_issogoo.zip` | archive d'origine (`KeyGenMe.exe` + `ReadMe.txt`), mot de passe `crackmes.one` |
| `tools/triangle-keygenme-solve.py` | keygen (`--name`, `-q`) + `--check` (émule la vraie routine du PE sous Unicorn) |

## Réponse

Keygen **name → serial** (serial de 16 caractères hexa, dépend uniquement du nom, 3 à 49 caractères).

| Name | Serial |
|---|---|
| `petik` | **`9557DFE9CD5E8E51`** |
| `Hello World, this is a test` | `2EF446F16494E251` |

```bash
python3 tools/triangle-keygenme-solve.py --name petik          # name=petik  serial=9557DFE9CD5E8E51
python3 tools/triangle-keygenme-solve.py -q --name petik
python3 tools/triangle-keygenme-solve.py --check --name petik  # Python == routine x87 du PE (Unicorn)
```

## Premier regard

```bash
unzip -P crackmes.one original/trianglekeygenme_issogoo.zip -d /tmp/tri   # dossier vide dédié
diec KeyGenMe.exe          # PE32, MASM 6.14 / MASM32, Linker 5.12
objdump -d -M intel --no-show-raw-insn KeyGenMe.exe
strings -n 5 KeyGenMe.exe
```

`strings` : `Need at least ` / ` chars!`, `Maximum length is `, `Please enter something!`, `Yes! You made it!…` (Goodboy), `Nope! Try harder!` (Badboy). Imports : `DialogBoxParamA`, `GetDlgItemTextA`, `MessageBoxA`… → boîte de dialogue, deux champs (Name `0xFA1`, Serial `0xFA2`), bouton Check (`0x7D1`). Le ReadMe demande un vrai keygen et demande « pourquoi *Triangle* » : la réponse est dans le calcul (aire de triangles, voir plus bas).

## Flow

`DlgProc` @`0x401217`, `WM_COMMAND` (`0x111`) avec bouton `0x7D1` :

1. `0x401110(hDlg, 0xFA1, min=3, max=0x32)` lit le nom (`GetDlgItemTextA`) et vérifie la longueur (message d'erreur « Need at least 3 chars! » / « Maximum length is 50 chars! »).
2. `GetDlgItemTextA(0xFA1, 0x40315c, 0x32)` (nom → `0x40315c`, donc 49 caractères utiles) puis `GetDlgItemTextA(0xFA2, 0x4031d2, 0x12)`. Le serial doit faire **exactement 16 caractères** (`cmp eax,0x10`).
3. `0x4013eb(nom)` : calcul « triangle » en x87 → un `double` R stocké en `0x40324f`.
4. `0x4010b1(0x4031c1, 0x40324f, 8, 1)` : hex majuscule des 8 octets de R (little-endian, 16 caractères).
5. `0x401378(hex, serial)` : comparaison particulière (voir ci-dessous) → Goodboy / Badboy.

## Comment on trouve

### 1. Ancrage : le test du serial `0x401378`

Depuis la `DlgProc`, juste avant le `MessageBoxA`, le `cmp eax,1` suit l'appel `0x401378`. Boucle de 16 tours, `ah = hex[i]`, `al = serial[i]` :

```asm
401391  cmp ah,'9'  / jne … / jmp 4013c7     ; ah=='9' -> xor direct
40139a  cmp ah,'F'  / jne … / jmp 4013c7     ; ah=='F' -> xor direct
4013a3  cmp al,'0' … cmp al,'9' … cmp al,'A' … cmp al,'F'   ; sinon al doit être un chiffre hexa
4013c5  dec al                               ; puis al-1
4013c7  xor al,ah ; jne … ; inc edx          ; égalité -> compteur
4013d0  cmp edx,0x10                         ; les 16 positions doivent matcher
```

Donc `serial[i] = hex[i] + 1` pour tout caractère hexa **sauf** `9` et `F` qui restent identiques (`'9'+1` et `'F'+1` ne sont pas des chiffres hexa). Le serial n'est qu'un « décalage de +1 » du hex de R. Ex. R hex `9446CED8BC4D7D40` → `9557DFE9CD5E8E51`.

### 2. Construction du hex : `0x4010b1`

Table `0x403000` = `0123456789ABCDEF` (1er argument = 1 → majuscules ; sinon `0x403010`, minuscules). Pour chacun des 8 octets de R : nibble haut puis nibble bas. Comme c'est dans l'ordre mémoire, c'est `struct.pack('<d', R).hex().upper()`.

### 3. Le calcul de R : `0x4013eb`

D'abord le remplissage du nom (`0x4013f7`…) :

```asm
call strlen            ; eax = n
mov ecx,0x63 ; sub ecx,eax ; lea edi,[name+n+1]
store: stos byte [edi],al ; inc al ; loop store   ; octets n, n+1, n+2… jusqu'à l'index 99
```

Le nom est complété jusqu'à 100 octets : `s[n]=0` (terminateur conservé), puis `s[n+1+k] = (n+k) & 0xFF`. `fninit` fixe la précision étendue (64 bits de mantisse). `L = n` (strlen, **avant** padding, le terminateur restant en place), constante `2.0`, `R = 0.0`.

Puis boucle `i = 0..98` sur les paires d'octets consécutifs `(s[i], s[i+1])` (fenêtre glissante, `ebx` n'est incrémenté qu'une fois par tour) :

```
sa = sqrt(s[i])      (arrondi en double, fst/fstp qword)
sb = sqrt(s[i+1])
T1 = (sa + L) * (sb - sa) / 2      -> stocké double
T2 = (sa + sb) * (L  - sb) / 2
T  = T1 + T2                        -> stocké double
U  = (sb + L) * (L  - sa) / 2
R += |T - U|                        -> stocké double
```

Ce sont des aires de trapèzes/triangles sur les points `(sa, ·)`, `(sb, ·)`, `(L, ·)` — d'où le nom « Triangle KeyGenMe ». Le test `fcom` + `test ax,0x100` + `fchs` est une valeur absolue (si `T-U < 0`, on inverse le signe).

Détails de fidélité numérique (importants car on compare les 64 bits du double) :
- tout est chargé en double (`fld qword`), les intermédiaires restent en 80 bits dans la pile x87, et seuls `sa`, `sb`, `T`, `R` sont arrondis en double (écritures `fst/fstp qword`) ; le solveur utilise `numpy.longdouble` (x87 80 bits sous Linux x86-64) et arrondit exactement aux mêmes points ;
- `fninit` met le control word à `0x037F` (précision étendue), ce que reproduit `longdouble` ; sans ce `fninit`, Windows laisserait 53 bits ;
- `ffree st(0)` ne dépile pas, mais marque le registre libre : pas d'overflow de pile FPU, il n'y a pas d'effet de bord sur les valeurs.

### 4. Assemblage de la réponse (`petik`)

`n = 5`, `s = "petik" 00 05 06 07 … 62` (indices 6..99 = 5..98). Boucle de 99 tours → `R` double de bits `40 7D 4D BC D8 CE 46 94` ; en mémoire little-endian : `9446CED8BC4D7D40` (hex). Décalage +1 sauf `9`/`F` : `9557DFE9CD5E8E51`.

### Pièges

- Le serial n'est **pas** le hex de R brut : le +1 sauf `9`/`F` est facile à rater (un test naïf sur `9446CED8BC4D7D40` donnerait « Badboy »).
- Octets `>= 0x80` possibles dans le padding quand n est grand (`movzx`), pas de signe.
- Le buffer du nom est limité à 49 caractères (taille passée à `GetDlgItemTextA` = `0x32`).

## Vérification

1. **Émulation de la routine réelle** : `--check` charge `.text`/`.data` du vrai `KeyGenMe.exe` dans Unicorn, exécute `0x4013eb` sur le nom et relit R en `0x40324f` :

```text
$ python3 tools/triangle-keygenme-solve.py --check --name petik
unicorn: 9446CED8BC4D7D40 python: 9446CED8BC4D7D40 OK
name=petik  serial=9557DFE9CD5E8E51
$ python3 tools/triangle-keygenme-solve.py --check --name "Hello World, this is a test"
unicorn: 1DE335E05383D140 python: 1DE335E05383D140 OK
name=Hello World, this is a test  serial=2EF446F16494E251
```

2. **Binaire live sous Wine** (`xvfb-run -a wine KeyGenMe.exe`, saisie pilotée par `xdotool`, titre de la fenêtre MessageBox lu avec `xdotool getwindowname`) :

| Name | Serial | Résultat |
|---|---|---|
| `petik` | `9557DFE9CD5E8E51` | **Goodboy** |
| `Hello World, this is a test` | `2EF446F16494E251` | **Goodboy** |
| `petik` | `9557DFE9CD5E8E50` (dernier car. modifié) | **Badboy** |

## Notes

- Pas de GDB, pas de debug live x64dbg : lecture statique (`objdump`) + émulation Unicorn + preuve Wine.
- Aucune modification de `original/`.
- Le ReadMe demande de ne pas patcher et de faire un keygen « externe » : c'est le cas ici.
