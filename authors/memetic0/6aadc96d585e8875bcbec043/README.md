# memetic0's Tropical

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aadc96d585e8875bcbec043) · id `6aadc96d585e8875bcbec043`

Crackme **ELF64 PIE** console (TUI UTF-8), algèbre **tropicale** (min-plus).  
Auteur : [memetic0](https://crackmes.one/user/memetic0) · difficulté site **5.0**.  
Règles : keygen ; pas de patch du bit « lock ».

Dossier : `authors/memetic0/6aadc96d585e8875bcbec043/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/Tropical.zip`](original/Tropical.zip) | archive site (`README.md` + `tropical`) |
| [`original/tropical`](original/tropical) | binaire ELF |
| [`analysis/README-author.md`](analysis/README-author.md) | consignes auteur |
| [`analysis/tropical.i64.c`](analysis/tropical.i64.c) | Hex-Rays (`decc`) |
| [`analysis/live_fa0.txt`](analysis/live_fa0.txt) | table FA0 post-`sub_6C90` |
| [`tools/tropical-solve.py`](tools/tropical-solve.py) | keygen / `--check` / `--derive` |

## Réponse

| | |
|---|---|
| **Serial** (16 hex) | `5242b75304439277` |
| λ (hauteur) | `3` |
| vecteur propre (x₀=0) | `(0, 2, 5, 1, 4, 3)` |
| OK | barre / label **`locked`** (plus de « no lock ») |

```bash
python3 tools/tropical-solve.py -q
# 5242b75304439277
python3 tools/tropical-solve.py --check
# … locked … / OK
```

Terminal couleur UTF-8 : `./original/tropical`, taper le serial (backspace OK), `q` pour quitter.

---

## 1. Premier regard

```text
tropical: ELF 64-bit LSB pie, x86-64, stripped
sha256  2132f2a38c7f9e37203909b65b4b826b3beace5791b26b56ffcc9c66248dd27c
```

TUI : grille **6×6** « FIELD », panneau « eigenvector », champ `serial` (16 hex).  
Anti-debug : `TracerPid`, `LD_PRELOAD`, scans INT3, intégrité de chaînes, table FA0.

```bash
bash -ic 'decc original/tropical'   # → analysis/tropical.i64.c
```

---

## 2. Flow

1. Init anti-tamper (`sub_6C90` → FA0) + matrice plantée depuis `byte_9660`.
2. Boucle TUI : saisie hex → `sub_4BA0` (16 nibbles).
3. `sub_42E0` : mix serial → `v28` ; λ = `v28 & 0xff` ; MAC sur les bits hauts vs `hash36(field)`.
4. Construit A (poids tropicaux) et x (x₀=0, récurrence sur la surdiagonale).
5. Vérifie l’équation min-plus `(A ⊙ x)_i = λ + x_i` (+ contrôles d’intégrité).
6. Succès → **`locked`**.

---

## 3. Prédicat (tropique)

Poids (après XOR PRNG sur le champ, puis `%17/%19/%23` → combinaison mod 7429) — arêtes utiles `Aij ≤ 89` :

```text
A = [
  [99, 1, 0, 4, 99, 99],
  [99, 99, 0, 6, 3, 99],
  [99, 99, 99, 7, 99, 7],
  [ 6, 99, 99, 99, 0, 99],
  [99, 7, 99, 99, 99, 4],
  [ 6, 99, 3, 99, 99, 99],
]
```

Valeur propre tropicale (min mean cycle / eigen min-plus) : **λ = 3**.  
Vecteur (échelle tropicale, **x₀ fixé à 0**) : **(0, 2, 5, 1, 4, 3)** — reconstruit aussi par  
`x[i+1] = λ + x[i] − A[i][i+1]`.

Le serial n’est pas x en clair : c’est la **préimage** du mix `sub_42E0` qui produit un `v28` dont le bas est λ et le reste satisfait les MAC `hash36`.

```bash
python3 tools/tropical-solve.py --derive
# 5242b75304439277
```

---

## 4. Debug GDB / mémoire (pas à pas)

Pour calibrer FA0 **sans** être un traceur (sinon `TracerPid≠0`) :

```bash
./original/tropical &          # sous un vrai TTY / PTY
pid=$!
# lire /proc/$pid/maps → bias PIE
# /proc/$pid/mem @ bias+0xC660 … → FA0 = C660[i]^C640
# (C648 doit être 0, C3F0=0)
```

Breakpoints utiles (RVA, ajouter le bias PIE) :

| RVA | Rôle |
|---|---|
| `0x4BA0` | parse 16 hex → nibbles |
| `0x42E0` | mix → λ / matrice / x |
| `0x4C80` | vérif tropique + lock |

Sous GDB classique le anti-debug `TracerPid` fausse C3F0 / FA0 — préférer `/proc/pid/mem` ou un run clean + keygen offline.

---

## 5. Vérification

```bash
python3 tools/tropical-solve.py --check
# … eigenvector … 5242B75304439277 … locked
# OK
```

---

## 6. Notes

- « The usual product is the wrong product » → semiring **min-plus**, pas l’algèbre linéaire usuelle.
- « Height, not a point » / « one coordinate pinned » → λ + x avec x₀=0.
- Anti-debug dense ; le keygen offline s’appuie sur FA0 figé (`analysis/live_fa0.txt`) dumpé d’un process non tracé.
