# first_keygenme — twistedtux (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5733c5d40ad448c363 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, dynamique, **strippé** (GCC, 2006)
- Archive : `original/keygenme.tgz` → `keygenme` (extrait sous `analysis/`)
- Usage : `./keygenme <pseudo> <clef>`

## Réponse

| Pseudo | Clef |
|---|---|
| `petik` | `uipJXY` |
| `admin` | `uwE-Oa` |
| `Zorro` | `ubo9-Z` |

```bash
python3 -I tools/first-keygenme-solve.py petik --check
# pseudo: petik / clef  : uipJXY / check: OK
./analysis/keygenme petik uipJXY      # Bravo !!
```

La clef fait toujours **6 caractères**, piochés dans une table de 64 caractères.

## Premier regard

```text
$ ./analysis/keygenme
Utilisation : ./keygenme <pseudo> <clef>
$ strings -n 6 analysis/keygenme
A-CHRDw87lNS0E9B2TibgpnMVys5XzvtOGJcYLU+4mjW6fxqZeF3Qa1rPhdKIouk
Bravo !!
```

Imports : `srand`, `rand`, `strlen`, `printf` — le générateur pseudo-aléatoire de la libc entre dans le calcul.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn analysis/keygenme`, `main` @`0x8048450` (argument de `__libc_start_main` @`0x80483a7`). Table `T` @`0x804a042` (.data, offset fichier `vaddr - 0x8049000`).

`main` vérifie `argc >= 3`, `strlen(clef) == 6`, puis 6 fois : `clef[i] == T[f_i(pseudo)]`, où chaque `f_i` est une petite fonction (convention stdcall, `ret 4/8`) qui renvoie un indice `& 0x3f` :

| i | Fonction | Calcul (n = pseudo, len = strlen) |
|---|---|---|
| 0 | `0x80485cd` | `(len ^ 0x3b) & 0x3f` |
| 1 | `0x80485e3` | `(Σ n[j] ^ 0x4f) & 0x3f` (somme sur 8 bits) |
| 2 | `0x804861a` | `acc = 1 ; acc = (acc * n[j]) & 0xff` ; `(acc ^ 0x55) & 0x3f` |
| 3 | `0x8048650` | `srand(max(n[j]) ^ 0x0e)` ; `rand() & 0x3f` |
| 4 | `0x804868e` | `s = Σ n[j]² mod 256` (via `pow(x,2)` @`0x8048708`) ; `(s ^ 0xef) & 0x3f` |
| 5 | `0x80486d1` | `n[0]` appels de `rand()` à la suite de la graine posée en `f3` ; `((dernier & 0xff) ^ 0xe5) & 0x3f` |

Exemple `petik` (`70 65 74 69 6b`, len 5) :

| i | valeur | indice | `T[indice]` |
|---|---|---|---|
| 0 | `5 ^ 0x3b = 0x3e` | 62 | `u` |
| 1 | `Σ = 0x1e1 → 0xe1 ^ 0x4f = 0xae` | 0x2e | `i` |
| 2 | produit en cascade ^ `0x55` | … | `p` |
| 3 | `max = 0x74`, `srand(0x7a)`, `rand()&0x3f` | … | `J` |
| 4 | `Σ n²` mod 256 ^ `0xef` | … | `X` |
| 5 | 112 appels de `rand()` | … | `Y` |

(les colonnes « … » sont calculées par `tools/first-keygenme-solve.py`, résultat final `uipJXY`.)

**Pièges :**
- `srand`/`rand` sont ceux de la glibc : la même séquence est reproduite en Python via `ctypes.CDLL("libc.so.6")` (même algorithme sur 32/64 bits). Avec une autre libc le keygen donnerait autre chose.
- Les fonctions sont `stdcall` : l'ordre des arguments poussés est (longueur, pseudo) → dans la fonction `[ebp+8]` = pseudo, `[ebp+0xc]` = longueur.
- `f5` ne ré-initialise **pas** la graine : il enchaîne sur la suite de `rand()` entamée en `f3` (un premier `rand()` y est déjà consommé).
- Les accumulateurs sont tronqués à 8 bits (`and eax,0xff`) à chaque tour pour le produit.

## Vérification

```text
$ ./analysis/keygenme petik uipJXY ; ./analysis/keygenme petik uipJXZ     # analysis/verify.txt
Bravo !!
(rien : clef fausse)
```

`--check` valide aussi `admin` et `Zorro` et rejette une clef altérée d'un caractère.

## Fichiers

- `analysis/keygenme`, `analysis/dis.txt` (objdump), `analysis/verify.txt`
- `tools/first-keygenme-solve.py` : keygen + `--check` natif
