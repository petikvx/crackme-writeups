# s4r — matrice

| | |
|---|---|
| **ID** | [`5aa9b47f33c5d40a63746b1f`](https://crackmes.one/crackme/5aa9b47f33c5d40a63746b1f) |
| **Auteur** | s4r |
| **Publié** | 2018-03-16 |
| **Plateforme** | Windows PE32 GUI, assembleur (MASM, `.text` = 0x260 octets) |
| **Difficulté** | 2.2 |
| **SHA-256** | `629ed38d1d02f72424868614504deddd7ddc2f34e876d4aa481c5a93534e8f42` |
| **Solution** | `/!?\I_hope_you_liked_win32_Dis4$sembly/*$\` |

ZIP password : `crackmes.one`. Voir [`ORIGIN.yml`](ORIGIN.yml).

## TL;DR

Le mot de passe (42 caractères) vérifie `in[i] * in[i+1] == W[i]` pour 41 mots 16 bits stockés
en `.data` (`0x403000`), avec `in[0] ∈ [0x23, 0x37]`. On fixe `in[0]`, puis on divise de proche
en proche : une seule valeur de départ donne une chaîne entièrement imprimable.

Piège : la boîte de dialogue de saisie n’est **jamais** affichée normalement — elle ne s’ouvre
que si `MessageBoxA("wanna flag?", MB_YESNO)` retourne `0x11144574` (impossible : 6 = Oui → « not that way »,
7 = Non → « bye! »). Le flag se trouve donc par analyse statique ; la preuve est faite en
**émulant le vrai code du binaire** (voir plus bas).

## Premier regard — comment on trouve

```bash
file original/matrice.exe        # PE32 GUI i386, 4 sections
objdump -h original/matrice.exe  # .text 0x260 octets, .data 0x40714 (≈ 256 KiB de table)
strings -n 6 original/matrice.exe
```

`strings` : `wanna flag?`, `OneChallCoolChall`, `not that way`, `bye!`, `well done!`, `wrong input`,
imports `DialogBoxParamA`, `GetDlgItemTextA`, `IsDebuggerPresent`, `lstrlenA`. Le code est minuscule :
tout se lit d’un coup avec `objdump -d -M intel`.

## Reverse

### Point d’entrée `0x401000`

```asm
call IsDebuggerPresent ; jne exit
push 4 (MB_YESNO) ; "OneChallCoolChall" ; "wanna flag?" ; call MessageBoxA
cmp  eax, 6          ; IDYES → "not that way"
cmp  eax, 0x11144574 ; → DialogBoxParamA(0x539, DlgProc=0x40108c)
                     ; sinon → "bye!"
```

Un patch du `cmp` ou un debugger (eax ← `0x11144574`) ouvrirait le dialogue ; on ne patche pas `original/`.

### DlgProc `0x40108c`

- `WM_INITDIALOG (0x110)` : construit une table `T` à `0x403054` :

  ```c
  *(DWORD*)&T[0] = 0xff;
  for (i = 0; W[i]; i++) *(DWORD*)&T[W[i]] = i + 1;   // W = WORD[] @0x403000
  ```

- `WM_COMMAND`, id `0x3f9` : `GetDlgItemTextA(0x3f6, buf@0x443054, 0x40)` puis `check()`
  (`0x401197`) → `well done!` ou `wrong input`.

### `check()` `0x401197`

```c
n = lstrlenA(buf);
if (n % 6 || n % 7) return 0;              // n multiple de 42
if (buf[0] > 0x37 || buf[0] < 0x23) return 0;
for (c = 0;; ) {
    v = T[buf[c] * buf[c+1]];
    if (v == 0xff) return 1;              // T[0] : atteint sur le NUL final
    if (v != ++c) return 0;
}
```

Il faut donc `T[in[c]*in[c+1]] == c+1`, c.-à-d. `in[c]*in[c+1] == W[c]` pour `c = 0..40`, puis
`in[41]*0 == 0` → `0xff` → succès. 41 mots + 1 = 42 caractères, cohérent avec `n % 42 == 0`.

`W` = `1551, 2079, 5796, 6716, …, 1512, 3312`. Ex. : `1551 = 47 * 33` → `'/' '!'`.

## Solveur

[`tools/s4r-matrice-solve.py`](tools/s4r-matrice-solve.py) lit `W` dans le binaire, essaie
`in[0] = 0x23..0x37`, divise successivement et vérifie avec une ré-implémentation de `check()` :

```bash
python3 tools/s4r-matrice-solve.py
# /!?\I_hope_you_liked_win32_Dis4$sembly/*$\
```

## Vérification

Le dialogue n’étant pas atteignable sans patch/debugger, la preuve est **statique + émulation** :
[`tools/s4r-matrice-emu.py`](tools/s4r-matrice-emu.py) charge `.text`/`.data` du binaire original dans
Unicorn, exécute la vraie boucle d’init (`0x401146..0x401174`) puis la vraie routine `0x401197`
(`lstrlenA` simulé) :

```bash
pip install --user unicorn
python3 tools/s4r-matrice-emu.py
# '/!?\\I_hope_you_liked_win32_Dis4$sembly/*$\\' -> 1 (1 = well done!)
# 'petik' -> 0 (1 = well done!)
```

Pas de nom d’utilisateur : mot de passe unique (l’exemple `petik` est refusé).

## Status

- [x] reverse
- [x] write-up
- [x] solveur
