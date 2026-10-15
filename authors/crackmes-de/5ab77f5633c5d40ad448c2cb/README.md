# crackmes.de's crackme_by_fereter_1 by fereter

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2cb`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2cb) |
| **Auteur (site)** | crackmes.de |
| **Auteur (local)** | crackmes-de |
| **SHA-256** | `8f227be6bf65d64e3439e46a5e389d452ce3ebbf5de416f63c3b28033cca5858` |

## Origine

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2cb
- Download : https://crackmes.one/download/crackme/5ab77f5633c5d40ad448c2cb
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Contenu

```
original/   # crackmebyfereter.zip + crackme.EXE (PE32 GUI, FASM 1.71, 3,5 Ko)
analysis/   # disasm.txt (objdump de .code), verify-unicorn.txt
tools/      # crackme_by_fereter_1-solve.py (solution + vérification unicorn)
```

## Énoncé

Une petite fenêtre « CrackMe by Fereter » avec un champ de saisie et un bouton **Check**.
Pas de nom : il faut trouver **le nombre** accepté. Messages possibles :
`Incorrect number.` / `Correct numner.` (sic).

## Solution

```
$ ./tools/crackme_by_fereter_1-solve.py
8294810
$ ./tools/crackme_by_fereter_1-solve.py --verify
'8294810'    -> MessageBox ['Correct numner.']
'8294811'    -> MessageBox ['Incorrect number.']
'12345'      -> MessageBox ['Incorrect number.']
```

Le nombre est **`8294810`**, une constante : pas de keygen.

## Analyse

### 1. Reconnaissance

`diec` donne `PE32, FASM(1.71)`. Quatre sections (`.data`, `.data?`, `.code`, `.idata`),
imports minimalistes : `KERNEL32` (`ExitProcess`, `GetModuleHandleA`, `IsDebuggerPresent`)
et `USER32` (`CreateWindowExA`, `GetDlgItemInt`, `GetDlgItemTextA`, `MessageBoxA`…).
`strings` laisse déjà voir `7294A9` et `810` dans `.code` : ce sont les octets des
constantes `mov ecx, 0x34393237` (`b9 37 32 39 34`) et `mov ecx, 0x303138`.

### 2. Les protections

- **`IsDebuggerPresent`** au démarrage (`0x40309e`) : le résultat est ajouté à `0x40308b`
  pour former la cible d'un `jmp eax`. Ce saut n'est pris que si `GetMessageA` renvoie
  autre chose que 0 ou 1 (erreur `-1`) ; avec un debugger, il retomberait 1 octet plus
  loin, en plein milieu d'une instruction. En pratique la boucle de messages normale ne
  l'emprunte jamais, donc cette protection ne gêne pas.
- **`rdtsc` ×2** (`0x4031c4` et `0x4032c3`) : si plus de `0x100` cycles séparent les deux
  lectures (pas à pas), saut vers `0x4032d8`, une zone de « code » qui n'est en fait que
  du texte (`ppppp94882p82p1010`), donc crash.
- **Scan anti-breakpoint** (`0x403234`–`0x40328b`) : le code parcourt les octets de
  `0x4031dd` à `0x4032b9` (le cœur de la vérification) et plante s'il y trouve un `0xCC`
  (`int3`) ou un `0x90` (`nop`, signe d'un patch). Trois adresses sont sautées
  (`0x4031ff`, `0x403274`, `0x403279`) ; les deux dernières sont les octets `0xCC` et `0x90`
  des comparaisons du scan lui-même.

Rien de tout cela ne gêne une analyse statique.

### 3. Le handler du bouton Check (`WM_COMMAND`, id `0x65`)

```asm
4031ac  push 1                 ; bSigned = TRUE
4031ae  push 0x402020          ; &translated
4031b3  push 0x64              ; id du champ = 100
4031b8  call GetDlgItemInt
4031be  push [0x402020]        ; translated
        ...rdtsc...
4031d7  pop  ecx
4031d8  cmp  ecx, 1            ; le texte doit être un entier valide
4031db  je   0x403203          ; sinon -> "Incorrect number."
403203  mov  [0x402024], eax   ; valeur entière (non utilisée ensuite)
403208  push 0x10 / 0x402028 / 0x64
403214  call GetDlgItemTextA   ; buf = texte brut (16 octets max)
40321a  mov  eax, [0x402028]   ; 4 premiers octets
40321f  mov  ecx, 0x34393237
403224  inc  ecx               ; 0x34393238
403225  cmp  eax, ecx
403227  jne  0x4031dd          ; -> "Incorrect number."
40322a  mov  eax, [0x40202c]   ; 4 octets suivants
40322f  mov  ecx, 0x303138
        ...scan 0xCC/0x90...
40328d  cmp  eax, ecx
40328f  jne  0x4031dd
403295  call 0x4032c2          ; 2e rdtsc
4032a1  push "Correct numner." -> MessageBoxA
```

Le test ne porte donc pas sur la valeur numérique mais sur le **texte** du champ,
lu comme deux dwords little-endian :

| dword | valeur | octets | texte |
|---|---|---|---|
| `buf[0..3]` | `0x34393237 + 1 = 0x34393238` | `38 32 39 34` | `8294` |
| `buf[4..7]` | `0x00303138` | `38 31 30 00` | `810` + NUL |

Le NUL final impose exactement 7 caractères : `8294810`. Le `inc ecx` sert juste à ce que
la vraie constante (`8294`) n'apparaisse pas telle quelle dans `strings` (on y voit `7294`).
Le passage par `GetDlgItemInt` ajoute la condition « c'est bien un nombre », ce que
`8294810` respecte.

## Vérification

`tools/crackme_by_fereter_1-solve.py --verify` charge le PE d'origine sous **unicorn**,
remplace les imports par des stubs (`GetDlgItemInt`, `GetDlgItemTextA`, `MessageBoxA`,
`SetFocus`), rend `rdtsc` déterministe (+0x10 par lecture, donc sous le seuil `0x100`) et
appelle le vrai `WndProc` (`0x4030e7`) avec `WM_COMMAND` / id `0x65`. Le code d'origine,
scan anti-breakpoint compris, s'exécute tel quel :

- `8294810` → `Correct numner.`
- `8294811`, `12345` → `Incorrect number.`

Sortie dans [`analysis/verify-unicorn.txt`](analysis/verify-unicorn.txt).

## Status

- [x] reverse
- [x] write-up
- [x] solveur
