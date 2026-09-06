# tdaron's Use your brain

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/69d8fe40471059af19ad08ca) · id `69d8fe40471059af19ad08ca`

Crackme **ELF64 PIE** Linux (GCC, debug_info, **non strippé**).  
Auteur site : **tdaron**.

Dossier : `authors/tdaron/69d8fe40471059af19ad08ca/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/a.out`](original/a.out) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`tools/use-your-brain-solve.py`](tools/use-your-brain-solve.py) | lift BF + password / `--run` |
| [`analysis/lifted.bf`](analysis/lifted.bf) | Brainfuck reconstruit depuis `main` |
| [`analysis/ok.txt`](analysis/ok.txt) | run live → `you made it hero` |

## Réponse

| Input | Valeur |
|---|---|
| Password | **`bruh wtf`** (8 octets, espace inclus) |

```bash
python3 tools/use-your-brain-solve.py -q
# bruh wtf

printf 'bruh wtf' | ./original/a.out
# you made it hero
```

Pas de newline obligatoire (mais `\n` final est toléré).

---

## 1. Premier regard

```text
file original/a.out
# ELF 64-bit LSB pie executable, x86-64, dynamically linked, with debug_info, not stripped
```

```bash
nm -n original/a.out | grep ' T '
# … 0000000000001199 T main
# … 00000000000282d8 T _fini   ← main fait ~160 Ko de code
```

Observations immédiates :

| Indice | Détail |
|---|---|
| Taille de `main` | ~`0x1199` → ~`0x282d8` (des dizaines de milliers d’instructions) |
| `memset(..., 0x7530)` | **30000** octets = taille de tape Brainfuck classique |
| Imports | `getchar` / `putchar` (I/O BF `,` / `.`) + `usleep` / `getpid` / `write` |
| Strings utiles | quasi aucune (pas de `"Enter password"` / `"CORRECT"`) |
| Comportement live | n’importe quel input → souvent **exit 0** et **sortie vide** ; le succès affiche un message |

Hint auteur sur crackmes.one : *« this is brainfuck compiled to C »*.  
Sans ce hint, le même diagnostic vient de la combo « `main` monstrueux + tape 30000 + getchar/putchar ».

Hashes :  
MD5 `fb75feff41bee244467e5da3a05fedf6` · SHA-256 `74dac86091d2b943ed99c55c183f0d38afae5c975cac88ff17157bf0d34de452`.

Site : difficulty **4.0** · quality **4.0**.

---

## 2. Comment on a trouvé (cheminement)

### 2.1. Ce que ce n’est *pas*

- Pas un `strcmp` sur une chaîne en clair (rien dans `.rodata`).
- Pas un hash unique facile à brute en aveugle sans modèle.
- Lire `main` à la main ligne par ligne est irréaliste : le C généré depuis BF est **déroulé** + pollué.

Il faut donc **reconnaître les motifs machine** qui correspondent aux 8 ops BF, reconstruire le programme source, puis lire le prédicat dessus.

### 2.2. Obfuscation à ignorer

En tête de `main` (et partout) on voit du bruit qui ne change pas la sémantique BF :

```text
usleep(0);
write(2, "", 0);          // write vide sur stderr (strace : write(2,"",0) × N)
ptr ^= 0xdeadbeef;        // résultat stocké dans une variable morte
if (getpid() < 0) return 1;  // jamais vrai
for (i = 0; i <= 0; i++) { junk += i; }  // boucles mortes
```

Une fois filtrés, il reste les vrais mouvements de **pointeur de cellule** et de **valeur de cellule**.

### 2.3. Correspondance asm ↔ Brainfuck

Pointeur courant ≈ `[rbp-0x88b0]` (pointe dans la tape `[rbp-0x7540]`).

| BF | Motif asm (après `objdump -M intel`) |
|---|---|
| `+` | `movzx eax,BYTE PTR [rax]` puis `lea edx,[rax+0x1]` puis `mov BYTE PTR [rax],dl` |
| `-` | idem avec `lea edx,[rax-0x1]` |
| `>` | `add QWORD PTR [rbp-0x88b0],0x1` (souvent précédé d’un check « pas au-delà de la fin ») |
| `<` | `sub QWORD PTR [rbp-0x88b0],0x1` |
| `,` | `call getchar@plt` puis `mov BYTE PTR [rax],dl` |
| `.` | `movzx` cellule → `mov edi,eax` → `call putchar@plt` |
| fin de bande | `lea rax,[tape]` ; `add rax,0x752f` → `p = 29999` (noté `E` dans le lift) |

**Boucles** (forme générée ici, style « test en bas ») :

```asm
    jmp  test          ;  ←  '['
body:
    … corps …
test:
    movzx eax, BYTE PTR [rax]   ; *p
    test  al, al
    jne   body         ;  ←  ']'
```

On a dénombré **42** paires `jmp` / `jne` de ce type → 42 `[` / `]` une fois le lift corrigé.

### 2.4. Lift automatique

Script : `tools/use-your-brain-solve.py --lift`  
Sortie : [`analysis/lifted.bf`](analysis/lifted.bf) (~2480 caractères utiles).

Compteurs typiques après lift :

```text
+ 1504   - 835   > 11   < 11   . 16   , 8   [ 42   ] 42   E 11
```

**8 virgules** ⇒ password de **8 caractères** (un `getchar` chacun).

### 2.5. Lecture du prédicat

Structure répétée 8 fois (schéma) :

```brainfuck
,--------------------…--------------------[<[-]E>[-]]
```

Autrement dit, pour chaque caractère lu dans la cellule courante (en pratique en **fin de tape**) :

1. Soustraire **N** (`N` fois `-`).
2. Si le résultat est **non nul**, une boucle « clear » tourne (et pourrit l’état).
3. Si le résultat est **0**, la boucle est sautée → on enchaîne sur le caractère suivant.

Donc la condition locale est simplement :

```text
ord(password[i]) == N_i
```

Comptage des `-` **immédiatement après** chaque `,` jusqu’au `[` suivant :

| i | N | ASCII | char |
|---|---|---|---|
| 0 | 98 | 0x62 | `b` |
| 1 | 114 | 0x72 | `r` |
| 2 | 117 | 0x75 | `u` |
| 3 | 104 | 0x68 | `h` |
| 4 | 32 | 0x20 | ` ` |
| 5 | 119 | 0x77 | `w` |
| 6 | 116 | 0x74 | `t` |
| 7 | 102 | 0x66 | `f` |

→ **`bruh wtf`**

Après les 8 checks, le programme construit le message avec des blocs `+++…+.[-]` (un caractère affiché puis clear) → `you made it hero`.

### 2.6. Ce qui a aidé / piégé

- **Aide** : hint « brainfuck » ; taille de tape 30000 ; 8× `getchar` bien visibles ; message de succès seulement si le chemin est bon.
- **Piège** : mauvais password → **exit 0** aussi, mais **aucune sortie** (pas de `WRONG!`) → on peut croire à tort que « n’importe quoi marche ».
- **Piège lift** : confondre les `lea rax,[tape]` de *bounds-check* avec un reset `p=0` → trop de faux `S` ; ne garder que `add rax,0x752f` pour « aller en fin de bande ».
- **Anecdote** : un commentaire site *« bruh wtf »* était littéralement le flag — on l’a dérivé du binaire *avant* de le relier au commentaire.

```bash
python3 tools/use-your-brain-solve.py --lift
# wrote analysis/lifted.bf (2480 chars)
# bruh wtf
```

---


## Debug GDB (pas à pas)

ELF64 **PIE**, debug_info, non strippé. `main` file `0x1199` → live `@0x5555555551a4` (énorme : jusqu’à `~0x282d8`). Tape BF `memset(..., 0x7530)`.

```bash
export DEBUGINFOD_URLS=
gdb -nx -q ./original/a.out
(gdb) set debuginfod enabled off
(gdb) start
# main @ base+0x1199
(gdb) info proc mappings
(gdb) break getchar
(gdb) run < <(printf 'bruh wtf')
# 8× (getchar + N×dec) ; message "you made it hero"
```

Ne pas tenter de `disassemble main` en entier. S’appuyer sur le lift Brainfuck (`analysis/lifted.bf`).

`solution_summary` : password `bruh wtf` — brainfuck→C.

## 3. Vérification

```bash
printf 'bruh wtf' | ./original/a.out
# you made it hero

printf 'wrongpwd' | ./original/a.out
# (aucune sortie)
```

Preuve : [`analysis/ok.txt`](analysis/ok.txt).

---

## Notes

- Challenge « utiliser sa tête » : une fois le modèle BF vu, le password est un simple tableau d’offsets.
- `chmod +x original/a.out` si besoin après extraction ZIP.
