# crackme_2 by cobrasniper555

- Origine : [ORIGIN.yml](ORIGIN.yml) · [crackmes.one `…c288`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c288)
- Auteur : cobrasniper555 (mirror crackmes.de) · Plateforme : Windows PE32, C++ MinGW (GCC, SJLJ), GUI Win32 — **pas de packer**
- Difficulté annoncée : 1.0 (readme : « second crackme », utilise le registre)

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Test.zip` | archive crackmes.one (mot de passe `crackmes.one`) |
| `original/Test.exe` | binaire d’origine (47 780 octets) |
| `original/Readme.txt` | message de l’auteur |
| `analysis/getSerial-checkReg.txt` | désassemblage `checkReg` / `CreateReg` / `DelReg` / `getSerial` (0x401290..0x4014b0) |
| `analysis/DlgProc.txt` | désassemblage du `DlgProc` du dialogue d’enregistrement (0x401666..) |
| `tools/crackme2-cobra-solve.py` | keygen (`NOM…`, `--check NOM SERIAL`) |
| `tools/verify-live.c` | driver Win32 (mingw) : ferme le popup « trial », ouvre *Register*, remplit, clique, lit la MessageBox |

## Réponse

**Keygen** — serial au format `REG-<A>-<A+C>-KEY` (hexadécimal majuscule, sans zéros de tête) :

| Nom | Serial |
|---|---|
| `petik` | **`REG-D0-190-KEY`** |
| `crackmes` | `REG-C0-1B0-KEY` |
| `Cobra` | `REG-F0-1E0-KEY` |

```
$ python3 tools/crackme2-cobra-solve.py petik
petik -> REG-D0-190-KEY
$ python3 tools/crackme2-cobra-solve.py --check petik REG-D0-190-KEY
OK
```

Les 4 couples ci-dessus ont été validés sous Wine (« You are now registered! »), un serial faux donne « You're information is wrong. ».

## Premier regard

```
$ file Test.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386 (stripped to external PDB), 6 sections
$ diec Test.exe
PE32  Compiler: MinGW
$ strings -n 5 Test.exe
This is a trial version of...umm...nothing.
Software\Cobra
REG-%lX-%lX-KEY
You are now registered!
You're information is wrong.
...
RegCreateKeyA / RegDeleteKeyA / RegOpenKeyA / GetDlgItemTextA / wsprintfA / strcmp / strlen
```

Deux indices énormes : un format de serial `REG-%lX-%lX-KEY` passé à `wsprintfA`, et la clé `HKCU\Software\Cobra`. Le binaire MinGW a gardé ses **symboles C++ manglés** : `objdump -d -M intel` affiche directement `checkReg()`, `CreateReg()`, `DelReg()`, `getSerial(char*, char*)`, `validate(char*, char*)`, `DlgProc`, `WindowProcedure`.

## Flow du programme

1. `WinMain` crée la fenêtre `WindowsApp` (« Windows App ») ; le menu dépend de `checkReg()`.
2. `WindowProcedure`, **WM_CREATE** : `checkReg()` = `RegOpenKeyA(HKCU, "Software\\Cobra")`. Si la clé n’existe pas (retour ≠ 0) → MessageBox « This is a trial version… » (OK pour continuer, Annuler = quitter).
3. **WM_COMMAND 0x69** (menu *Register*) → `DialogBoxParamA(…, 0x64, …, DlgProc)`. 0x6d = *Restart* (`DelReg()`, efface la clé).
4. `DlgProc`, **WM_COMMAND 0x6e** (bouton) :

```asm
4016e8: GetDlgItemTextA(hDlg, 0x6a, name,   0x14)   ; [ebp-0x28], 19 car. max
40170d: GetDlgItemTextA(hDlg, 0x6b, serial, 0x50)   ; [ebp-0x78]
401725: getSerial(name, good)                      ; good = [ebp-0xc8]
40173a: strcmp(serial, good)
40173f: test eax,eax / jne bad
        MessageBox "You are now registered!" ; CreateReg()  -> crée HKCU\Software\Cobra
```

Pas d’anti-debug, pas de checksum : c’est une comparaison en clair avec un serial calculé depuis le nom → **keygen**.

## `getSerial(name, out)` (0x4012fc)

Deux boucles quasi symétriques, chacune ne conserve **que la valeur de sa dernière itération** (la variable est écrasée à chaque tour).

Transformation commune (`mix`) appliquée à une somme `t` :

```asm
xor  [t], 0x12c
t = (t<<2)+t ; t <<= 2          ; t *= 20
if (t < 0) t += 3 ; sar t, 2    ; division signée par 4  -> t*5
and  [t], 0xf0f0f0f0            ; ne garde que le quartet haut de chaque octet
```

**Boucle avant** (`i = 0 .. len-1`, résultat `A` dans `[ebp-0x10]`) :

```
t = name[i] + (i ? name[i-1] : 5)      ; movsx : caractères signés
A = mix(t)
```

→ seule compte la dernière itération : `A = mix(name[len-1] + name[len-2])` (ou `mix(name[0]+5)` si le nom fait 1 caractère).

**Boucle arrière** (`i = len .. 1`, résultat `C` dans `[ebp-0x14]`) — elle démarre **sur le NUL terminal** :

```
t = name[i] + (i == len ? 5 : name[i+1])
C = mix(t)
```

→ dernière itération `i = 1` : `C = mix(name[1] + name[2])` (le caractère `name[0]` n’intervient jamais dans `C`).

Fin :

```asm
401484: wsprintfA(out, "REG-%lX-%lX-KEY", A, A + C, C)   ; 3e argument ignoré (2 %lX)
```

### Exemple `petik`

| | somme | `^0x12c` | `*5` | `& 0xf0f0f0f0` |
|---|---|---|---|---|
| A : `i`+`k` | 105+107 = 0xD4 | 0x1F8 | 0x9D8 | **0xD0** |
| C : `e`+`t` | 101+116 = 0xD9 | 0x1F5 | 0x9C9 | **0xC0** |

`A+C = 0x190` → **`REG-D0-190-KEY`**.

Comme on ne garde que des quartets hauts et que les sommes restent < 0x200, l’espace des serials est minuscule : beaucoup de noms partagent le même serial (ex. `grokbot` → `REG-0-0-KEY`).

## Solveur

`tools/crackme2-cobra-solve.py` reproduit fidèlement le binaire : troncature du nom à 19 caractères (`GetDlgItemTextA(…, 20)`), `movsx` (caractères > 0x7F négatifs), division signée « C » (`int(t/4)`), masque `0xF0F0F0F0`, puis `%X` sur 32 bits. Nom vide refusé (côté binaire, `C` serait une variable non initialisée).

## Vérification live (Wine)

`tools/verify-live.c` (compilé avec `i686-w64-mingw32-gcc`) :

1. supprime `HKCU\Software\Cobra` (sinon pas de popup « trial » et menu différent) ;
2. lance `Test.exe`, ferme le popup « Information » (IDOK) ;
3. `PostMessage(WM_COMMAND, 0x69)` sur la fenêtre `WindowsApp` → dialogue *Register* ;
4. `SetDlgItemTextA(0x6a, nom)`, `SetDlgItemTextA(0x6b, serial)`, clic sur `0x6e` ;
5. lit le texte de la MessageBox « Alert », tue le process, re-supprime la clé.

```
$ i686-w64-mingw32-gcc -O1 -o verify-live.exe tools/verify-live.c
$ xvfb-run -a wine verify-live.exe original/Test.exe petik REG-D0-190-KEY
[*] popup initiale 'Information' -> OK
name='petik' serial='REG-D0-190-KEY' -> msgbox 'Alert': 'You are now registered!'
$ xvfb-run -a wine verify-live.exe original/Test.exe petik REG-D0-191-KEY
name='petik' serial='REG-D0-191-KEY' -> msgbox 'Alert': 'You're information is wrong.
Please try again!'
```

## Status

- [x] reverse (statique, `objdump`, symboles C++ conservés)
- [x] write-up
- [x] solveur + vérification live Wine
