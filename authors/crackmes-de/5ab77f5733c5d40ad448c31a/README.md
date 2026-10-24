# crackmes.de's crackme13 by attilhaz

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c31a`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c31a) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (AttilhaZ, 2004) |
| **Plateforme** | Windows PE32 GUI, Visual Basic 6 **natif** (pas de P-Code) |
| **SHA-256 (zip)** | `8be8957afca6d90acd7cd6d49d8aef5c289366f307edf74cee4329a72e9c4ee9` |
| **SHA-256 (`Crackme13.exe`)** | `ac63e7f6ad564c355cb67f87ce04162d69102119d58264fdad10f0fc8202600c` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme13.zip` | archive d'origine (mot de passe `crackmes.one`) : `Crackme13.exe` + `Readme.txt` |
| `analysis/x/` | zip extrait (copie de travail, `original/` intact) |
| `tools/crackme13-solve.py` | solveur (`-o keyfile.dat`, `-q`, `--check` = preuve live Wine + cas KO) |

## Réponse

Le crackme est un **keyfile** : il faut un fichier `keyfile.dat` dans le répertoire courant, de **taille exactement 25 octets**. Le contenu n'est jamais examiné.

| Entrée | Valeur |
|---|---|
| **Fichier** | `keyfile.dat`, **25 octets** |
| Exemple (`petik`) | `petik--------------------` (`petik` + 20 `-`) |

```bash
python3 tools/crackme13-solve.py -o keyfile.dat   # écrit le keyfile (25 o)
python3 tools/crackme13-solve.py --check          # Xvfb+Wine : 25 o -> Good ; 24 o / absent -> Bad
# ou à la main : head -c 25 /dev/zero > keyfile.dat
```

## Premier regard

```
$ file Crackme13.exe   # PE32 executable (GUI) Intel i386, 3 sections
$ diec Crackme13.exe   # Linker: MS Linker 6.0 ; Compiler: Visual Basic 6.00.8041 [Native]
```

- `Readme.txt` : « Register it without patching. This crackme use a keyfile. »
- Imports VB runtime (`MSVBVM60.DLL`) : `__vbaFileOpen`, `__vbaFileClose`, `__vbaPowerR8`, `__vbaFpR8`, `__vbaStrCopy`, ordinaux `595` (`rtcMsgBox`), `570` (`rtcFileLength` = `LOF`), `621` (`rtcInputCount` = `Input$`)…
- Chaînes UTF-16 (`strings -el`) : `Register this crackme without patch it!!!`, `Crackme13`, **`keyfile.dat`**, `Registered`, **`Good`**, `Unregistered`, **`Bad`**. Les deux paires (`Good`/`Registered`, `Bad`/`Unregistered`) sont le titre et le corps des MsgBox finales.

## Flow

1. Au démarrage, une MsgBox « Register this crackme without patch it!!! » (titre `Crackme13`).
2. Le handler (`0x401cf0`, `Form_Load`) ouvre `keyfile.dat` (`On Error Resume Next`), lit son contenu, calcule la longueur du fichier.
3. Si la longueur vaut la constante attendue → MsgBox **Good** (icône info, flag `0x40`), sinon **Bad** (flag `0x10`, erreur).

## Comment on trouve

**Ancrage** : `objdump -d -M intel Crackme13.exe` ; la table d'imports (IAT à `0x401000`) est décodée avec `pefile` (`0x40104c = __vbaFileClose`, `0x401078 = __vbaFileOpen`, `0x40107c = ord 570`, `0x401094 = __vbaPowerR8`, `0x401040 = __vbaFpR8`, `0x401018 = ord 621`). Les `call [0x401078]` / `[0x40107c]` / `[0x401094]` sont tous dans `0x401cf0–0x4020ff`.

**Lecture du handler** (extraits commentés) :

```asm
401dfa  mov  edx,0x401a04          ; BSTR "keyfile.dat"
401e02  call [__vbaStrCopy]
401e19  call [__vbaFileOpen]       ; Open "keyfile.dat" ... As #1
401e28  call [ord570 LOF]          ; LOF(1)
401e35  call [ord621 Input$]       ; Input$(LOF(1),#1) -> [ebp-0x28]  (jamais comparé ensuite)
401e62  call [ord570 LOF]          ; LOF(1) encore
401e6e  fild [ebp-0xd0]            ; -> double
401e74  fstp [ebp-0xd8]            ; n = LOF(1) (double)

401e7a  push 0x40000000 ; push esi(0) ; push 0x40000000 ; push esi
401e86  call [__vbaPowerR8]        ; pow(2.0, 2.0) = 4
401e8c  fadd [0x401140]            ; + 21.0
401e92  fadd [0x401138]            ; + 98.0
401e98  fsub [0x401130]            ; - 90.0
401e9e  fadd [0x401128]            ; + 10.0
401ea4  fsub [0x401120]            ; - 16.0     => 27.0
401eb4  fstp [ebp-0xe0]
401ebc  push 0x407c8000 ...        ; double 456.0 ; exposant 0.0
401ec2  call [__vbaPowerR8]        ; pow(456.0, 0.0) = 1
401ec8  fsubr [ebp-0xe0]           ; 27 - 1 = 26
401ece  fsub [0x401118]            ; - 1.0      => 25.0
401ede  call [__vbaFpR8]
401ee4  fcomp [ebp-0xd8]           ; 25.0 vs n
401eec  test ah,0x40 ; je 0x401fc6 ; ZF=0 -> Bad (0x401fc6), ZF=1 -> Good (0x401ef5)
```

**Décodage** : les immédiates doubles sont des little-endian IEEE-754. `0x40000000:00000000` = `2.0`, `0x407c8000:00000000` = `456.0`. Les constantes de la `.data` en `0x401118…0x401140` sont lues avec `struct.unpack('<d', …)` : `1.0, 16.0, 10.0, 90.0, 98.0, 21.0`.

**Assemblage** : `2² + 21 + 98 − 90 + 10 − 16 = 27`, puis `− 456⁰ − 1 = 25`. Le test est donc `LOF(1) == 25`. La partie lue (`Input$`) est stockée mais **n'est jamais comparée** : le contenu est libre. Exemple `petik` : `petik` + 20 × `-` = 25 octets.

**Pièges** :
- Le test est en virgule flottante (`fcomp`, `test ah,0x40`) : la constante n'est pas un immediate entier lisible, il faut évaluer la chaîne de `fadd/fsub`.
- Les deux `__vbaPowerR8` sont de la pure obfuscation (`456^0 = 1`).
- Les chaînes `Registered`/`Unregistered` ne sont pas les titres de fenêtre ; les fenêtres s'appellent `Good` / `Bad` (relevé via `xdotool getwindowname`).

## Prédicat consolidé

```
open("keyfile.dat")           # cwd ; absent -> erreur ignorée -> LOF != 25 -> Bad
LOF == 2**2 + 21 + 98 - 90 + 10 - 16 - 456**0 - 1 == 25
```

## Debug GDB / x64dbg

Non utilisés : reverse statique (objdump + `pefile`) et preuve live Wine. Aucun processus actif sur ce binaire dans x32dbg (non sollicité).

## Vérification

```bash
$ python3 tools/crackme13-solve.py --check
keyfile.dat = 25 octets : b'petik--------------------'
25 o     -> Good
24 o     -> Bad
absent   -> Bad
```

- OK : `keyfile.dat` de 25 octets (`petik` + `-`) → après la 1re MsgBox, fenêtre **`Good`**.
- KO : 24 octets, ou fichier absent → fenêtre **`Bad`**.
- Preuve faite sur une copie de l'exe dans un répertoire temporaire (le keyfile est lu dans le cwd) sous `Xvfb :97` + Wine ; pas de capture d'écran (aucun outil de capture dispo sur la machine).

## Notes

- `original/` non modifié ; l'exe est extrait sous `analysis/x/`.
- Pas de nom d'utilisateur dans ce crackme : `petik` n'est que le préfixe du contenu d'exemple.
- Il suffit d'avoir un fichier de la bonne taille ; ce n'est donc pas un « vrai » keyfile à calculer.
