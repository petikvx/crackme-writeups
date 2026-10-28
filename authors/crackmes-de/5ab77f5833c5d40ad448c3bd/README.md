# crackmes.de's euler_keygenme / Euler.exe by servitute

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3bd`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3bd) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | crackmes.de / servitute |
| **Plateforme** | Windows PE32 console, MinGW (GCC 3.x, SJLJ) + stub `.xxx` au point d'entrée |
| **SHA-256 (zip)** | `77d04fcc66af661060412a6a86476e74fa83c6a512148331e0d0b8ef29cd40b6` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/Euler_-_KGM.zip` | archive d'origine (mot de passe `crackmes.one`), contient `Euler.exe` |
| `analysis/extract/Euler.exe` | extraction du zip (hors `original/`) |
| `analysis/text.asm` | désassemblage capstone de `.text` (0x401000–0x402e00) |
| `analysis/Euler_strcpy_verif.exe` | **copie** patchée (1 appel `strcat`→`strcpy`) pour la preuve Wine, voir *Pièges* |
| `tools/euler-solve.py` | keygen nom → serial (`-q`, `--check`) |

## Réponse

Keygen : le serial dépend du nom (5 à 15 lettres, pas de chiffre).

| Nom | Serial |
|---|---|
| `petik` | **`7307146440557548`** |
| `abcdefg` | `2688147700572668` |

```bash
python3 tools/euler-solve.py --name petik        # name=petik serial=7307146440557548
python3 tools/euler-solve.py -q                  # serial seul
python3 tools/euler-solve.py --check analysis/Euler_strcpy_verif.exe
```

## Premier regard

```bash
unzip -P crackmes.one -d analysis/extract original/Euler_-_KGM.zip
file analysis/extract/Euler.exe     # PE32 console, 9 sections
diec analysis/extract/Euler.exe     # MinGW [stripped]
strings -n 4 analysis/extract/Euler.exe
```

- Sections : `.text .data .rdata .bss .idata .rsrc .stab .stabstr` + **`.xxx`** (EP `0x4b7061`) : petit stub (reloc, `LoadLibraryA`/`GetProcAddress`) qui recharge l'IAT puis saute sur le vrai code ; `.text` est **en clair**.
- `objdump -d` échoue (« file truncated », table de symboles stabs cassée) → désassemblage via `pefile` + `capstone` (`analysis/text.asm`).
- Strings : bannière `H*E*L*L*O*!`, « Type in Name (between 5 and 15 characters, no digits please) », « Type in Serial (Just digits please) », « Good Name/Serial combination! », « Nein! Try again... », et des noms de process (`OLLYDBG.EXE`, `idag.exe`, `peid.exe`) → anti-debug par énumération de processus (fonction `0x401a16`, sans effet sous Wine).
- Imports : l'IAT du header ne liste que `LoadLibraryA/GetProcAddress` ; les vrais imports sont dans `.idata` (RVA `0x6000`). Les noms se retrouvent en suivant les slots `0x406150…` : `0x406150=_ecvt`, `0x406154=_itoa`, `0x406190=exp`, `0x4061a0=gets`, `0x4061b4=printf`, `0x4061bc=strcat`, `0x4061c0=strcmp`, `0x4061c8=strlen`. Les thunks `0x4027xx–0x4028xx` sont de simples `jmp [slot]`.

## Flow (`main` @ `0x4012b0`)

1. Affiche la bannière, `gets(name)` (buffer `ebp-0xe8`).
2. Boucle `0x401375` : `isdigit(c)` ou `ispunct(c)` → « Just characters. Adieu! », `system("pause")`.
3. Longueur 5..15 sinon on redemande.
4. Gros bloc de leurres (`0x401413–0x4016cb` : variables à `7`, `0x68`, `0xffffffe0`, tests `'s' 'e' 'r' …` sur un buffer jamais rempli) : n'influence pas le serial.
5. Appels anti-debug `0x401a16` (OLLYDBG, idag, peid).
6. **Calcul du serial** (`0x40178f–0x401969`), puis `gets(serial)` et `strcmp` (`0x4019aa`).

## Comment on trouve le prédicat

Ancrage : on part des chaînes « Type in Serial » (`0x404126`) et « Good Name/Serial » (`0x404151`), référencées en `0x401971` / `0x4019c9` ; le `strcmp` est juste avant (`0x4019aa`), ses deux arguments sont le buffer `ebp-0x418` (serial attendu) et `ebp-0x488` (saisie).

Construction de `ebp-0x418` (extraits commentés) :

```asm
4017a0: call strlen(name)                  ; eax = len
4017a5: movsx ax, byte [eax+ebp-0xec]      ; ebp-0xec+len = name[len-4]  (ebp-0xe8 = name)
4017b0: fild word [esp] ; fstp qword [esp]
4017ba: call exp                            ; x = exp(name[len-4])   <- « Euler »
4017f4: call _ecvt(x, 5, &decpt, &sign)    ; 5 chiffres significatifs -> ptr (ebp-0x1bc)
        ; S = somme des 5 caractères ASCII renvoyés (0x401830-0x40186d)
401876: imul eax, eax, 0xb4                 ; A = S*180
40189a: lea eax,[edx+edx] ; add eax,edx ; shl eax,2 ; add eax,0x10c   ; B = 12*A + 0x10c
401904: _itoa(A, buf1, 10)   401924: _itoa(B, buf2, 10)
40193c: strcat(attendu, digits) ; strcat(attendu, buf1) ; strcat(attendu, buf2)
4019aa: strcmp(attendu, saisie)
```

Donc `serial = ecvt5(exp(name[len-4])) ‖ A ‖ B` avec `A = 180·Σ ascii(chiffres)`, `B = 12·A + 268`.

Exemple `petik` : `len=5` → `name[1]='e'=101` ; `exp(101)=7.307146…e43` → `_ecvt` = `73071` ; `Σ = 55+51+48+55+49 = 258` ; `A = 258·180 = 46440` ; `B = 46440·12+268 = 557548` ; serial = `73071` + `46440` + `557548` = **`7307146440557548`**.

Pièges :
- Index `ebp-0xec+len` : on pense à un octet « avant » le nom ; en fait c'est `name[len-4]` (le dword `ebp-0xec` est écrasé par les valeurs de retour anti-debug, mais pas lu ici).
- Les thunks sans symbole : il faut recoller slot → nom depuis `.idata` brut (IAT du header trompeuse à cause du stub).
- Gros bloc de leurres (variables `-0x18c…-0x1ac`) jamais utilisées dans le serial.
- **Buffer attendu non initialisé** : le premier `strcat` (`0x40193c`) écrit dans `ebp-0x418` sans `strcpy`/`memset` préalable. Le résultat dépend donc des résidus de pile.

## Vérification

```text
$ python3 tools/euler-solve.py --check analysis/Euler_strcpy_verif.exe
name=petik serial=7307146440557548
   Good Name/Serial combination!
CHECK: OK
$ python3 tools/euler-solve.py --name abcdefg --check analysis/Euler_strcpy_verif.exe   -> Good Name/Serial combination!
$ (serial 123456 sur la copie)                                                           -> Nein! Try again...
```

Preuve sous Wine/`xvfb-run`. **Réserve honnête** : sur le binaire d'origine `analysis/extract/Euler.exe`, Wine renvoie « Nein » pour le bon serial. En remplaçant `strcmp` par `printf` sur une copie, le buffer attendu vaut `"\xe0d5" + 7307146440557548` : le préfixe (`0x003564e0`-like, premier octet variable d'un run à l'autre) est un pointeur résiduel de pile propre à Wine, non saisissable. Sur Windows réel (pile propre/zéro à cet endroit, comportement visé par l'auteur) le préfixe est vide. La copie `Euler_strcpy_verif.exe` (un seul `call strcat` → `call strcpy` à `0x40193c`, équivalent à un buffer zéro) prouve que formule et serial sont corrects ; `original/` n'est pas modifié. Pas testé sur un vrai Windows.

## Notes

- Pas de session GDB ni x64dbg ; reverse 100 % statique (capstone) + Wine pour la preuve.
- Le « Euler » du titre = fonction `exp` (nombre d'Euler).
