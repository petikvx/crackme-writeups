# CrackmesForBeginners (CFB) #5 — Conway's Game of Life

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a1569de2b3df128c1df5cb1) · id `6a1569de2b3df128c1df5cb1`

Crackme **PE32+ console** (x86-64), C++ MSVC (VS 2026 / toolset 19.50).  
Auteur site : **CrackNotMe** · tagline `pwn.by` / `pwned.space`.

Dossier : `authors/cracknotme/6a1569de2b3df128c1df5cb1/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/CFB5.exe`](original/CFB5.exe) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`tools/cfb5-solve.py`](tools/cfb5-solve.py) | simu GoL + password |
| [`tools/gol_fast.c`](tools/gol_fast.c) | reverse BFS 4 gens (OpenMP) |

## Réponse

| Input | Valeur |
|---|---|
| Activation password | **`LifeGame`** (8 caractères) |

```bash
python3 tools/cfb5-solve.py -q
# LifeGame
```

D’autres préimages ASCII existent (le mapping GoL n’est pas injectif) :  
`lifeGame`, `LifeFame`, `lifeFame`, `LifeGane`, … — toutes donnent **ACCESS GRANTED**.  
La forme thématique **`LifeGame`** est celle retenue ici.

```text
L i f e G a m e
```

Preuve live (Wine) :

```text
[*] Welcome to CFB5 - Conway's Game of Life.
[*] Enter the 8-character activation password:
[+] Password: LifeGame
[*] Running 4 generations of Game of Life...
   [+] ACCESS GRANTED! Congratulations!
```

---

## 1. Premier regard

```text
file original/CFB5.exe
# PE32+ executable (console) x86-64
```

```text
===================================================
            Crackme #5
           [+] by pwn.by [+]
         --> pwned.space <--
===================================================

[*] Welcome to CFB5 - Conway's Game of Life.
[*] Enter the 8-character activation password:
[+] Password: …
[*] Running 4 generations of Game of Life...
   [+] ACCESS GRANTED! …   ou   [-] ACCESS DENIED! Invalid password.
```

Hashes :  
MD5 `5ca7daf6aed16f799a797a433fffdbe6` · SHA-256 `64bb4fd05efff08db82a5cc77df08cdcfdf980f1e6fc72a1a961b270de6a8336`.

Contrainte : **exactement 8 caractères**.

---

## 2. Flow

```text
banner CFB5
lire password (getline + trim)
si len != 8 → erreur
decoder chaque octet en 8 cellules (bit0 → col 0) → grille 8×8
afficher "[*] Running 4 generations of Game of Life..."
pour gen = 1..4 :
  double-buffer : appliquer B3/S23 sur tore 8×8
re-packer chaque ligne en octet
comparer aux 8 cibles hardcodées
si toutes OK → ACCESS GRANTED
```

### « Game of Life » — ce que c’est

| Interprétation naïve | Réalité dans CFB5 |
|---|---|
| Animation / affichage de la grille | **Non** (pas de dump console de la grille) |
| Vraies règles de Conway sur un tore | **Oui** — 4 générations, puis prédicat |
| Anti-debug / VM | **Non** (prédicat = état final) |

---

## 3. Prédicat

### Grille initiale

Pour `pwd[0..7]` :

```text
grid[row][col] = (pwd[row] >> col) & 1
# col 0 = LSB, col 7 = MSB
```

Stockage runtime : 64 octets 0/1 à partir de `rsp+0x70`, double buffer (+64).

### Règles (tore)

Pour chaque cellule, 8 voisins avec wrap `mod 8` (MSVC `idiv`-style `and 0x80000007`) :

| État | Voisins | Suivant |
|---|---|---|
| vivante | 2 ou 3 | reste vivante |
| vivante | sinon | meurt |
| morte | 3 | naît |
| morte | sinon | reste morte |

= **B3/S23** classique.

4 itérations (`[rsp+0x24] = 4`), buffers alternés ; état final dans le buffer d’index 0.

### Cibles finales (lignes re-packées)

```text
row:  0    1    2    3    4    5    6    7
hex:  1b   13   01   20   d0   44   07   11
bits: ##.##... ##..#... #....... .....#.. ....#.## ..#...#. ###..... #...#...
      (col0 à gauche = bit 0)
```

Comparaisons dans le main (`~0x1400067f8`) : `cmp al, 0x1b` … `cmp dil, 0x7` … `cmp al, 0x11` ; la ligne 2 est comparée à `r15b` qui vaut **1**.

### Inversion

GoL n’est pas bijective : reverse BFS 4 pas sur les états 64-bit (tore 8×8).

| Étape reverse | # d’états uniques (approx.) |
|---|---|
| 1 | 60 |
| 2 | 1286 |
| 3 | 5399 |
| 4 + filtre ASCII imprimable | **~170** |

Implémentation : [`tools/gol_fast.c`](tools/gol_fast.c) (DPLL + OpenMP).

Parmi les solutions imprimables, **`LifeGame`** colle au thème du challenge.

---

## 4. Vérification

```bash
python3 tools/cfb5-solve.py -q
# LifeGame

python3 tools/cfb5-solve.py --check LifeGame
# OK LifeGame

python3 tools/cfb5-solve.py --trace LifeGame

printf 'LifeGame\n\n' | wine original/CFB5.exe
# … ACCESS GRANTED! …
```

---

## 5. Notes

- **Pas** une mini-VM (CFB #3) ni des rotors arithmétiques (CFB #4) : automate cellulaire.
- Plusieurs passwords valides → un keygen « unique » est impossible ; le solveur renvoie la solution thématique et peut lister d’autres préimages connues (`--all`).
- Le message console annonce bien la méta : *Running 4 generations of Game of Life*.
- Série CFB : #1 serial · #2 maze · #3 mini-VM · #4 rotors · **#5 Game of Life**.
