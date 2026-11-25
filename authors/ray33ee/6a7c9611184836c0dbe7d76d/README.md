# ray33ee's shifty keygen

| | |
|---|---|
| **ID** | [`6a7c9611184836c0dbe7d76d`](https://crackmes.one/crackme/6a7c9611184836c0dbe7d76d) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | ray33ee |
| **Plateforme** | Windows x86-64, PE32+ console (GNU ld 2.40, MinGW) |
| **SHA-256** | `548719a71a26c7bdd0dfae2cc3bfe442083e7f187edfadb5b1fb89705af9fd8e` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/shifty.exe` | binaire d’origine (non modifié) |
| `tools/shifty-solve.py` | keygen (`--user`, `-q`, `--check` via Wine) |

## Réponse

Keygen username → serial `XXXXXX-XXXXX-XXX-XX` (hex).

| Username | Serial |
|---|---|
| `petik` | `b936ff-2a5af-525-23` |

```bash
python3 -I tools/shifty-solve.py --user petik          # → serial
python3 -I tools/shifty-solve.py --user petik --check  # lance shifty.exe sous xvfb-run + wine
```

## Premier regard

- `strings` : `Enter username:`, `Enter serial:`, format `%6x-%5x-%3x-%2x`, succès `yeh great now go make a keygen…`, échec `git gud`.
- `.rdata` contient la S-box AES à `0x1400140c0` et une table de 17 pointeurs de fonctions à `0x1400141c0` (le pointeur vers cette table est à `0x140014f20`).

## Flow

`main` (`0x140001875`) : `scanf("%39s")` du username, du serial ; exige `strlen(user) <= 0x20` et `strlen(serial) == 0x13` (19), puis `sscanf(serial, "%6x-%5x-%3x-%2x", a, b, c, d)` (4 champs obligatoires). Les champs sont assemblés en un u64 :

```
x = a<<40 | b<<20 | c<<8 | d      (24+20+12+8 = 64 bits, aucun recouvrement)
```

puis `check(user, x)` (`0x1400017a8`).

## Comment on trouve

Pas de décompileur dispo ici (`decc` absent du shell agent) : `objdump -d -M intel original/shifty.exe` suffit, le code est du GCC non optimisé, très lisible.

`check` (`0x1400017a8`) :

1. `h = FNV-1a64(user)` (`0x1400016cb`, offset `0xcbf29ce484222325`, prime `0x100000001b3`).
2. PRNG **splitmix64** (`0x140001728`, constantes `0x9e3779b97f4a7c15`, `0xbf58476d1ce4e5b9`, `0x94d049bb133111eb`), état initial `h`.
3. `target = next()`.
4. `x = table[16](x, 0x6d8c5a83e9463c96)` (op de pré-traitement).
5. 10000 fois : `i = next() & 0xf`, `arg = next()`, `x = table[i](x, arg)`.
6. Succès ssi `x == target`.

Les 17 opérations (table `0x1400141c0`, 64 bits) sont **toutes bijectives** : on déroule donc l’algorithme à l’envers depuis `target`.

| i | Adresse | Op | Inverse |
|---|---|---|---|
| 0 | `1a30` | `x+a` | `y-a` |
| 1 | `1a49` | `x-a` | `y+a` |
| 2 | `1a5f` | `x*(2a+1)` | `y*(2a+1)⁻¹ mod 2⁶⁴` |
| 3 | `1a7d` | `-x` | `-y` |
| 4 | `1a92` | `~x` | `~y` |
| 5 | `1aa7` | `x^a` | `y^a` |
| 6 | `1abd` | `x*(2·lo(a)+1)+hi(a)` | `(y-hi)*inv` |
| 7 | `1b03` | `x ^ (x >> s)`, `s=a%63+1` | itération de point fixe |
| 8 | `1b6b` | `x ^ (x << s)` | idem |
| 9 | `1bd3` | permutation d’octets | permutation de bits inversée (sondage) |
| 10 | `1dcb` | échange de champs de bits | idem |
| 11 | `1c86` | S-box AES sur chaque octet | S-box inverse |
| 12 | `1d0c` | `ror 0x17` | `rol 0x17` |
| 13 | `1cf6` | `rol 7` | `ror 7` |
| 14 | `1d61` | Feistel 1 tour, F = `fmix32` (murmur3) de `lo ^ (lo(a)^hi(a))` | on récupère `lo` puis `hi` |
| 15 | `1e5a` | inversion des 64 bits | permutation inversée |
| 16 | `1f80` | 2 tours mul-add 32 bits (`m1=lo(a)|1`, `m2=hi(a)|1`) | soustractions dans l’ordre inverse |

Extrait (op 2, `1a5f`) : `lea`-like `rax = a*2+1 ; imul rax, x` → multiplication par un impair, inversible mod 2⁶⁴.
Extrait (op 7, `1b03`) : `a % 63` compilé en multiplication par `0x410410410410411` (division par 63 par réciproque), puis `+1` → décalage 1..63.

Le solveur calcule `target`, rejoue la suite `(i, arg)` (10000 paires), applique les inverses en ordre inverse, puis l’inverse de l’op 16, et formate `%06x-%05x-%03x-%02x`.

Exemple `petik` : `FNV1a("petik")` → graine splitmix → `target` → 10000 inverses → `x = 0xb936ff2a5af52523` → `b936ff-2a5af-525-23` (a=`b936ff`, b=`2a5af`, c=`525`, d=`23`).

Pièges : les ops 9/10/15 sont des permutations de bits, plus sûr de les inverser par sondage (`1<<i`) que de réécrire les masques ; l’op 12 est un `ror` (donc inverse `rol`) alors que 13 est un `rol` ; le `strlen(serial)` doit valoir 19 (pas de zéros de tête omis : `%06x` etc.).

## Vérification

```text
$ printf 'petik\nb936ff-2a5af-525-23\n' | xvfb-run -a wine original/shifty.exe
yeh great now go make a keygen
(unless you have in which case go touch grass)

$ printf 'petik\nb936ff-2a5af-525-24\n' | xvfb-run -a wine original/shifty.exe   # KO (1 bit changé)
git gud

$ python3 -I tools/shifty-solve.py --user Alice --check                         # autre user : OK
```

## Notes

Aucune session GDB / debugger : reverse 100 % statique (`objdump`) + preuve live Wine.
