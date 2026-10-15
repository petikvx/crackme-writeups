# crackmes.de's crackme_by_fereter_2 by fereter

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2ca`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2ca) |
| **Auteur (site)** | crackmes.de (auteur réel : Fereter) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 GUI, assembleur pur (3 Ko, sections `.data` / `.code` / `.idata`) |
| **Difficulté** | 2.0 |
| **SHA-256 (zip)** | `c59e5a39d820f9aa47b2dd318400fcf56f6256945310979835fd8d3a9a70256b` |
| **SHA-256 (CrackMeByFereter#2.exe)** | `9006e3e207fee2acca1a7ee0c96a389cc60629120f0c5d14ceedab1de991ff0c` |

## Origine

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2ca
- Download : https://crackmes.one/download/crackme/5ab77f5633c5d40ad448c2ca
- ZIP password : `crackmes.one` (le zip interne n'a pas de mot de passe)

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Contenu

```
original/   CrackMeByFereter#2.zip, CrackMeByFereter#2.exe, CrackMeByFereter#2ReadMe.txt
analysis/   disasm-check.txt (handler du bouton Check), disasm-helpers.txt (somme, XOR, appel caché)
tools/      crackme_by_fereter_2-solve.py (keygen + vérification unicorn sur le vrai code)
```

## Énoncé

> The CrackMe has a protection from static analysis (crypted strings, complex logics of execution,
> some hidden API calls), anti-debug, a light protection against patching.
> The goal is either to patch CrackMe so it accepted any data or to create a KeyGen.

On fait un **keygen**.

## Solution

| Nom | Serial |
|---|---|
| `petik` | **`23A-A03-AAF`** |
| `Fereter` | `74A-A04-AAH` |

```bash
python3 tools/crackme_by_fereter_2-solve.py petik --verify
# petik : 23A-A03-AAF
# unicorn : Registed
```

## Analyse

### 1. Les protections annoncées

- **Chaînes chiffrées** : toute la section `.data` (0x401000) est XORée par `0xC6`. Deux petites
  routines la déchiffrent juste avant usage puis la rechiffrent :
  `0x402590` (XOR jusqu'au `\0` en clair) et `0x40257e` (XOR jusqu'à retrouver `0xC6`).
  En clair : `WIN`, `CrackMe by Fereter #2`, `BUTTON`, `EDIT`, `STATIC`, `Check`, `Exit`,
  `Name`, `Serial key`, `Clear all`, `Unregistred`, `Registred`, `Fatal error`. Le message de
  succès est, lui, stocké dans `.code` à `0x4025a5` : `94 a3 a1 af b5 b2 a3 a2 c6` → `Registed`.
- **Appel d'API caché** : `SendMessageA` n'est jamais appelé directement. Le pointeur
  `[0x401164]` reçoit `0x402557`, un trampoline qui sauve l'adresse de retour, met `eax = 0`
  (`0x4025a2`), lit l'IAT en `0x40310e + 2 = 0x403110` (= `SendMessageA`) et l'appelle.
  C'est ainsi que sont faits les `WM_GETTEXT` (0x0D) et le `WM_SETTEXT` (0x0C) final.
- **Anti-debug** : à la création de l'EDIT « Name », le handle renvoyé par `CreateWindowExA` est
  additionné au résultat de `IsDebuggerPresent` avant d'être stocké en `[0x401078]`. Sous
  débogueur le handle est faux de 1, le `WM_GETTEXT` du nom échoue et rien ne marche.
- **Anti-patch** : avant la boucle de messages, `0x4020d8` balaie le code de `0x402010` à
  `0x4025a5` et quitte s'il trouve un `0xCC` (int3) ou un `0x90` (nop) hors de trois adresses
  autorisées ; il vérifie aussi que le premier octet de `SendMessageA` n'est pas `0xCC`.

Aucune ne gêne un keygen fait en lecture statique.

### 2. Le handler du bouton Check (`WM_COMMAND`, id `0x3e9`)

```asm
; nom  -> 0x40108c (max 0x64), serial -> 0x4010f0 (max 0x64)
40244f  call [0x401164]            ; SendMessageA(hSerial, WM_GETTEXT, 0x64, 0x4010f0)
40245a  cmp  eax, 0xb              ; serial de 11 caractères exactement
402463  call 0x40254a              ; dl = somme des octets du nom (sur 8 bits)
402468  mov  ax, dx                ; ax = somme (dh = 0)
40246b  mov  bx, 9
        div  bx  -> push dx        ; r0 = somme % 9
        div  bx  -> push dx        ; r1 = (somme / 9) % 9
        dl = r1 + '0' ; bl = r0 + '0'
402498  cmp  ch, dl                ; serial[1] == r1
4024a0  cmp  cl, bl                ; serial[0] == r0
4024ad  call 0x40254a              ; même somme, mais sur le SERIAL
        ... mêmes divisions par 9 ...
4024e0  mov  ecx, [eax+5]
4024e3  call 0x402541              ; serial[6] == r1' , serial[5] == r0'
4024eb  cmp  cl, '-'               ; serial[3] == '-'
4024f3  cmp  cl, '-'               ; serial[7] == '-'
4024f8  ...                        ; succès : WM_SETTEXT "Registed" sur le STATIC
```

`0x40254a` additionne `[ebx]` dans `dl` jusqu'à ce que l'octet *suivant* soit nul : c'est
`sum(chaîne) & 0xFF`.

### 3. Format du serial

```
position :  0   1   2   3   4   5   6   7   8   9   10
           N0  N1   x   -   x  S0  S1   -   x   x   x
```

- `N0 = s % 9`, `N1 = (s // 9) % 9` avec `s = somme(nom) & 0xFF` ;
- `S0 = t % 9`, `S1 = (t // 9) % 9` avec `t = somme(serial complet) & 0xFF` ;
- `x` : libres (5 caractères).

La seconde condition est auto-référente (les chiffres S0/S1 font partie de la somme `t`) : le
keygen fixe N0/N1, met des lettres dans les cases libres et essaie les 81 couples (S0, S1) en
faisant varier les lettres jusqu'à ce que la somme retombe juste.

Exemple `petik` : `s = 112+101+116+105+107 = 541 & 0xFF = 29` → `N0 = 2`, `N1 = 3`.
Pour `23A-A03-AAF` : `t = 620`, `t & 0xFF = 108` → `S0 = 0`, `S1 = 3`, ce qui correspond bien aux positions 5 et 6 (`03`).

## Vérification

Pas de GUI pilotable dans la boucle automatique : `--verify` charge les sections `.data` et
`.code` du vrai binaire dans **unicorn**, place le nom et le serial dans les buffers
`0x40108c` / `0x4010f0`, `eax = 11` (retour du `WM_GETTEXT`) et exécute le code d'origine à
partir de `0x402455`. On s'arrête sur `0x4024f8` (branche « Registed ») ou `0x40253a` (échec).

| Nom | Serial | Résultat |
|---|---|---|
| petik | `23A-A03-AAF` | Registed |
| Fereter | `74A-A04-AAH` | Registed |
| petik | `23A-A03-AAG` | échec (somme du serial fausse) |
| petik | `32A-A03-AAF` | échec (chiffres du nom inversés) |
| petik | `23A-A00-AAA` | échec |

## Status

- [x] reverse
- [x] write-up
- [x] solveur
