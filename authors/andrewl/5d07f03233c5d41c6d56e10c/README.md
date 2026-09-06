# andrewl's Quick Crypto, 18k

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5d07f03233c5d41c6d56e10c) · id `5d07f03233c5d41c6d56e10c`

Crackme **ELF32** Linux, asm, **statique**, **non strippé** (~18 KiB).  
Auteur : **andrewl** (lab / vibe CSAW Finals — plaintext `CSAWHAHA`).

| Fichier | Rôle |
|---|---|
| [`original/chall`](original/chall) | binaire |
| [`tools/quick-crypto-solve.py`](tools/quick-crypto-solve.py) | keygen (inverse de `decipher`) |
| [`analysis/ok.txt`](analysis/ok.txt) | sortie live `pass` |

## Réponse

| Input | Valeur |
|---|---|
| Key | **`9B916917-B6117336`** |

```bash
python3 tools/quick-crypto-solve.py -q
# 9B916917-B6117336

printf '9B916917-B6117336\n' | ./original/chall
# enter key: pass

python3 tools/quick-crypto-solve.py --check
```

---

## Premier regard

```text
ELF 32-bit LSB executable, Intel 80386, statically linked, not stripped
SHA-256 0f2335c1d73b87e3d2d5c315bc749c4abb743cb8e48e8b6f6177fc92342d61bf
```

Symboles utiles : `_start`, `parse_uint32_hex`, `decipher`, `v0` / `v1`, chaînes `enter key:`, `pass`, `fail`, et les dwords de comparaison `CSAW` / `HAHA`.

## Flow

1. Affiche `enter key: `, lit **17** octets (`sys_read`, fd 0).
2. Exige le format **`AAAAAAAA-BBBBBBBB`** (byte `[8] == '-'`).
3. Parse chaque moitié en `uint32` hex → `v0`, `v1` (BSS).
4. `decipher(&v0)` modifie le bloc en place.
5. Succès ssi après déchiffrement :
   - `v0 == 0x57415343` (`"CSAW"` LE)
   - `v1 == 0x41484148` (`"HAHA"` LE)

## Prédicat — TEA-like unrolled

`decipher` est un **TEA / XTEA-style** entièrement déroulé :

```text
f(x) = ((x << 4) ^ (x >> 5)) + x
v1 -= f(v0) ^ C_i
v0 -= f(v1) ^ C_{i+1}
…  (742 half-rounds)
```

Les `C_i` sont des **constantes immédiates** (schedule clé+sum précalculé), dont un dernier `0xDEADBEEF` qui ne touche que `v0` (le store de `v1` a lieu juste avant).

Pas de clé runtime : l’entrée utilisateur **est** le ciphertext.  
Pour keygen : partir de `CSAW`/`HAHA` et **inverser** chaque half-round (`+=` au lieu de `-=`, ordre inverse) — c’est ce que fait le solveur en relisant les XOR via `objdump`.


## Debug GDB (pas à pas)

ELF32 **statique**, non strippé, pas de PIE. Entry / `_start` `@0x8048080`. Mapping : `0x08048000` r-xp.

Symboles utiles : `decipher` `@0x8048214`, branche succès `_start.pass` `@0x8048103`, échec `@0x804810f`.

```bash
export DEBUGINFOD_URLS=
gdb -nx -q ./original/chall
(gdb) set debuginfod enabled off
(gdb) break decipher
(gdb) run 9B916917-B6117336
# decipher @ 0x8048219
(gdb) finish
(gdb) break *0x8048103
(gdb) continue
# clé TEA-like OK → plaintext CSAWHAHA
```

Batch :

```bash
gdb -nx -batch -ex 'set debuginfod enabled off' \
  -ex 'break *0x8048103' -ex 'run 9B916917-B6117336' \
  -ex 'printf "pass=%p\n",$pc' -ex 'quit' ./original/chall
```

`solution_summary` : key `9B916917-B6117336` — TEA-like unrolled → `CSAWHAHA`.

## Vérification

```bash
printf '9B916917-B6117336\n' | ./original/chall
# enter key: pass
```

Voir [`analysis/ok.txt`](analysis/ok.txt).

## Notes

- Hex **majuscule ou minuscule** accepté (`parse_nib`).
- Ce n’est **pas** un keygenme à secret séparé : le « serial » est le ciphertext du plaintext fixe.
- Taille ~18k = surtout le `.text` unrolled de `decipher`.
