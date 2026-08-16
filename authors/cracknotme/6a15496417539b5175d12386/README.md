# CrackmesForBeginners (CFB) #2 — The Maze Runner

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a15496417539b5175d12386) · id `6a15496417539b5175d12386`

Crackme **PE32+ console** (x86-64), C++ MSVC (VS 2026 / toolset 19.50).  
Auteur site : **CrackNotMe** · tagline `pwn.by` / `pwned.space`.

Dossier : `authors/cracknotme/6a15496417539b5175d12386/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/CFB2.exe`](original/CFB2.exe) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`tools/cfb2-solve.py`](tools/cfb2-solve.py) | BFS maze → chemin W/A/S/D |

## Réponse

| Input | Valeur |
|---|---|
| Solution path | **`SDDSSASSDDSSDDDSSDDD`** (20 coups, W/A/S/D) |

```bash
python3 tools/cfb2-solve.py -q
# SDDSSASSDDSSDDDSSDDD
```

Preuve Wine : `ACCESS GRANTED! … successfully solved CFB2!`

---

## 1. Premier regard

```text
file original/CFB2.exe
# PE32+ executable (console) x86-64
# MSVC 19.50 / VS 2026
```

```text
[*] Welcome to CFB2 - The Maze Runner.
[*] Enter your solution path (using W/A/S/D):
[+] Key: …
```

Hashes :  
MD5 `a30f7459cb23e70ba1d4dfcef4b4639f` · SHA-256 `20aa2133b4694a036e349a28b2203d729fa3964cde3a07f641e33e1abe26596b`.

Pas de username : une seule chaîne de déplacements.

---

## 2. Flow

```text
banner CFB2 / Maze Runner
lire std::string key  (getline)
trim espaces gauche/droite
si vide → "Key cannot be empty!"
x = 0, y = 0, finish = false
pour chaque caractère c (toupper) :
  W → y-- ; S → y++ ; A → x-- ; D → x++
  sinon → Invalid move / only W,A,S,D
  si x ou y hors [0..9] → out of bounds
  cell = maze[y * 10 + x]
  si cell == 1 → Hit a wall
  si cell == 2 → finish = (c est le dernier caractère)
si finish && position finale sur la case 2
  → ACCESS GRANTED
sinon messages DENIED (pas fini l’input sur la sortie / pas en (9,9) / …)
```

---

## 3. Le labyrinthe

Tableau **10×10** en `.rdata` à **VA `0x14002b3c0`** (file offset `0x2a1c0`) :

| Valeur | Signification |
|---|---|
| `0` | case libre |
| `1` | mur |
| `2` | sortie (unique, en **(9,9)**) |

```text
y\x  0 1 2 3 4 5 6 7 8 9
 0   S # # # # # # # # #
 1   . . . # . . . . . #
 2   # # . # . # # # . #
 3   # . . . . # . . . #
 4   # . # # # # . # # #
 5   # . . . # . . . . #
 6   # # # . # # # # . #
 7   # . . . . . . # . #
 8   # . # # # # . # . .
 9   # # # # # # . . . F
```

`S` = départ (0,0) · `F` = finish (valeur 2).

Index dans le code (`~0x14000666c`) :

```asm
; edi = y, esi = x
lea  eax, [rdi + rdi*4]   ; y*5
lea  eax, [rsi + rax*2]   ; y*10 + x
movzx edx, BYTE PTR [rax + maze]
```

Bornes : `cmp esi/edi, 9` puis `ja` (unsigned) → hors grille.

---

## 4. Solution (BFS)

Plus court chemin en nombre de coups, sans traverser les murs :

```text
SDDSSASSDDSSDDDSSDDD
```

Trace :

| step | move | (x,y) |
|---|---|---|
| 0–2 | S D D | (0,1)→(2,1) |
| 3–4 | S S | (2,3) |
| 5 | A | (1,3) |
| 6–7 | S S | (1,5) |
| 8–9 | D D | (3,5) |
| 10–11 | S S | (3,7) |
| 12–14 | D D D | (6,7) |
| 15–16 | S S | (6,9) |
| 17–19 | D D D | **(9,9)** = F |

Minuscules acceptées (`toupper` avant le switch).

### Carte + chemin

```text
S#########
***#.....#
##*#.###.#
#****#...#
#*####.###
#***#....#
###*####.#
#******#.#
#.####*#..
######***F
```

---

## 5. Vérification

```bash
cd authors/cracknotme/6a15496417539b5175d12386
python3 tools/cfb2-solve.py
python3 tools/cfb2-solve.py -q
python3 tools/cfb2-solve.py --check SDDSSASSDDSSDDDSSDDD
# OK

# Wine
printf 'SDDSSASSDDSSDDDSSDDD\n\n' | wine original/CFB2.exe
# [+] ACCESS GRANTED! … solved CFB2!
```

---

## 6. Solveur Python

[`tools/cfb2-solve.py`](tools/cfb2-solve.py) — maze embarqué (ou `--pe original/CFB2.exe`), BFS, `--check`.

---

## 7. Notes

- Suite de **CFB #1** (serial hex) : ici purement un **pathfinding** sur une grille statique.
- Pas de crypto ; la difficulté = trouver la grille dans `.rdata` et les conventions W/A/S/D + finish.
- Messages utiles : *Hit a wall*, *out of bounds*, *didn't finish the input key there*, *did not reach the finish point (9,9)*.
