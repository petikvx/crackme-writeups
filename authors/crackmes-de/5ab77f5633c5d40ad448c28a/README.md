# crackmes.de's keygenme_1 by chaak

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c28a`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c28a) |
| **Auteur (site)** | crackmes.de (chaak) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 GUI (dialogue), MinGW, 2011 |
| **Difficulté** | 2.5 |
| **SHA-256 (ZIP)** | `0531bc4cdc58ba302b1fbbae4c05f2b4b43d6e72266e49282a70dcdcb18e2523` |
| **SHA-256 (CKGM1a.exe)** | `fd8fe70fb7bfca6aa6a39f7007ae44d1837e08b717a1e72bbf2731ed6968e126` |

## Origine

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c28a
- Download : https://crackmes.one/download/crackme/5ab77f5633c5d40ad448c28a
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## TL;DR

Le serial est un **chemin dans un labyrinthe 13×13** (l'image du dialogue est d'ailleurs une haie de labyrinthe) :

```text
CKGM1AB-ABCBEBGB-IBIDKDMD-MBOBQBSB-UBWBWDYD
```

Pas de nom (champ « Name » grisé, *Not used*). Keygen : [`tools/chaak-keygenme-1-solve.py`](tools/chaak-keygenme-1-solve.py) (`--random` pour d'autres serials, `--check SERIAL`).

## Premier regard

```text
$ file original/CKGM1a.exe
PE32 executable (GUI) Intel 80386, 6 sections
$ diec original/CKGM1a.exe
PE32  Compiler: MinGW[stripped]
$ strings -n 5 original/CKGM1a.exe
ACEGIKMOQSUWY
BDFHYLNPRTVXZ
CKGM1%2s-%8s-%8s-%8s-%8s
Please enter your serial number. / Serial is too long... / Invalid serial number.
You have found a valid serial!
```

Pas de packer. Deux alphabets de 13 lettres et un format `sscanf` donnent déjà la structure.

## Reverse

### DialogProc (`0x401682`)

`WM_COMMAND` avec ID **1** (`IDOK`, bouton « Check serial ») :

1. `GetDlgItem(0x3ED)` → `GetWindowTextLengthA` : 0 → *Please enter…*, > 99 → *Serial is too long…*
2. `GetWindowTextA` puis `check(buf)` en `0x401332` : `-1` → *Invalid serial number.*, sinon *Congratulation!*

### Prédicat `0x401332`

1. `strlen(serial) == 43` (`repnz scasb`, `ecx == -45`).
2. `sscanf(serial, "CKGM1%2s-%8s-%8s-%8s-%8s", k, p1, p2, p3, p4) == 5`. Les 4 blocs sont contigus dans la pile (`ebp-0x58`, `-0x50`, `-0x48`, `-0x40`) : les `\0` successifs sont écrasés par le bloc suivant → une chaîne de **32 caractères**.
3. `k[0] ∈ A1 = "ACEGIKMOQSUWY"` et `k[1] ∈ A2 = "BDFHYLNPRTVXZ"` (`0x401656` = « appartient à »). Attention : A2 contient `Y` (pas de `J`).
4. Construction de deux **alphabets tournés** (13 car.) :
   - `0x405018` : `A1'[j] = A1[(idx(k[0]) + j) mod 13]`
   - `0x405026` : `A2'[j] = A2[(idx(k[1]) + j) mod 13]`
5. Les 32 caractères : position paire ∈ A1', impaire ∈ A2'.
6. Boucle sur les **16 paires** : `x = idx(A1', c[2i])`, `y = idx(A2', c[2i+1])` (`0x40163a`) puis :
   - `0x40161a` : `grid[y*13 + x] == 1` — table de 169 dwords en `.data` (`0x403000`, offset fichier `0x1600`) ;
   - `0x401588(px, py, x, y)` : règle de déplacement.

### Règle de déplacement (`0x401588`)

```c
if (px == -1) return x == 0 ? OK : KO;           // 1re case : colonne 0
if (px == 12) return KO;                          // on ne peut pas continuer depuis la colonne 12
if (x == px && (y == py + 1 || y == py - 1)) OK;  // bas / haut
if (x == px + 1 && y == py) OK;                   // droite
else KO;                                          // pas de gauche, pas de diagonale
```

Aucune vérification d'arrivée ni d'unicité des cases : n'importe quelle suite de 16 cases libres respectant ces pas passe (même un aller-retour haut/bas). Le keygen cherche quand même par DFS un **chemin simple** qui atteint la colonne 12 pile à la 16ᵉ case (traversée « propre » du labyrinthe), avec repli sur n'importe quel chemin simple.

### Labyrinthe (`0x403000`, `#` = mur, `*` = chemin du serial d'exemple)

```text
     x: 0123456789ABC
  y= 0  *****#******.
  y= 1  ..##***####**
  y= 2  #....#.......
  y= 3  ..##....#....
  y= 4  ..##.#.##....
  y= 5  .......##..##
  y= 6  ...........##
  y= 7  #.#....###...
  y= 8  ....##.....#.
  y= 9  .#......#....
  y=10  .#.###.......
  y=11  .........#..#
  y=12  .......####..
```

Chemin : `(0,0)→(4,0)↓(4,1)→(6,1)↑(6,0)→(11,0)↓(11,1)→(12,1)`.

Avec `k = "AB"` les alphabets ne sont pas tournés : `x` → `ACEGIKMOQSUWY[x]`, `y` → `BDFHYLNPRTVXZ[y]` :

| case | (0,0) | (1,0) | (2,0) | (3,0) | (4,0) | (4,1) | (5,1) | (6,1) | (6,0) | (7,0) | (8,0) | (9,0) | (10,0) | (11,0) | (11,1) | (12,1) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| paire | AB | CB | EB | GB | IB | ID | KD | MD | MB | OB | QB | SB | UB | WB | WD | YD |

→ `CKGM1AB-ABCBEBGB-IBIDKDMD-MBOBQBSB-UBWBWDYD`.

Autres serials (k tournés, `--random`) : `CKGM1AH-AXCXEXEZ-GZIZKZMZ-OZOXQXSX-UXUZWZYZ`, `CKGM1EH-EYGYGHIH-KHMHMYOY-QYQHSHUH-WHYHAHCH`…

(La fonction `0x401290` est du code mort / runtime, non appelée par le check.)

## Solveur

```bash
python3 tools/chaak-keygenme-1-solve.py              # k1=A k2=B → serial ci-dessus
python3 tools/chaak-keygenme-1-solve.py --random     # k1/k2 et chemin aléatoires
python3 tools/chaak-keygenme-1-solve.py --check CKGM1AB-ABCBEBGB-IBIDKDMD-MBOBQBSB-UBWBWDYD
```

Le script relit la grille directement dans `original/CKGM1a.exe` et réimplémente le prédicat complet (`check`) pour valider chaque serial produit.

## Vérification live (wine)

Sous Xvfb sans gestionnaire de fenêtres, `xdotool type` n'atteint pas le champ (pas de focus clavier). D'où un petit injecteur Win32 [`tools/inject.c`](tools/inject.c) (mingw) : `FindWindowA("Keygenme #1 by CHAAK")` → `SetDlgItemTextA(0x3ED, serial)` → `PostMessage(WM_COMMAND, IDOK)`. Le texte de la MessageBox est lu via `WINEDEBUG=+msgbox`.

```text
$ tools/verify-wine.sh CKGM1AB-ABCBEBGB-IBIDKDMD-MBOBQBSB-UBWBWDYD
trace:msgbox:MSGBOX_OnInit L"You have found a valid serial!"
$ tools/verify-wine.sh CKGM1AH-AXCXEXEZ-GZIZKZMZ-OZOXQXSX-UXUZWZYZ
trace:msgbox:MSGBOX_OnInit L"You have found a valid serial!"
$ tools/verify-wine.sh CKGM1AB-ABCBEBGB-IBIDKDMD-MBOBQBSB-UBWBWDYB   # dernière case (12,0) = mur
trace:msgbox:MSGBOX_OnInit L"Invalid serial number."
```

## Contenu

```text
original/   CKGM1a.zip (archive crackmes.one), CKGM1a.exe
analysis/   check-0x401332-0x401682.asm (objdump), maze-0x403000.txt
tools/      chaak-keygenme-1-solve.py, inject.c, verify-wine.sh
```

## Status

- [x] reverse
- [x] write-up
- [x] solveur (keygen, vérifié wine)
