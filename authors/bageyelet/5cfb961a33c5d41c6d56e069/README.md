# bageyelet's rop-obf

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5cfb961a33c5d41c6d56e069) · id `5cfb961a33c5d41c6d56e069`

Crackme **ELF32 PIE** Linux, asm, strippé (~9 KiB).  
Auteur : **bageyelet**. Objectif : faire afficher **`1`** (sans patch).

| Fichier | Rôle |
|---|---|
| [`original/rop-obf`](original/rop-obf) | binaire |
| [`tools/rop-obf-solve.py`](tools/rop-obf-solve.py) | solveur |
| [`analysis/ok.txt`](analysis/ok.txt) | sortie live `1` |

## Réponse

| Input | Valeur |
|---|---|
| Password (6 ints) | **`4 8 15 16 23 42`** |

```bash
python3 tools/rop-obf-solve.py -q
# 4 8 15 16 23 42

printf '4 8 15 16 23 42\n' | ./original/rop-obf
# 1
```

SHA-256 de la solution (hint auteur / commentaire x0r19x91) :
`21f2049d5b7a94430621acbc5f6c467c134d368a2c69a8283cc08b1f6183962c`.

---

## Premier regard

```text
ELF 32-bit LSB pie executable, Intel 80386, dynamically linked, stripped
imports : printf, scanf, fflush, getchar, exit
```

Pas de `.rodata` utile : tout le « programme » est une **énorme ROP-chain** poussée au `_start`, puis `ret`.

## Flow / obfuscation

1. Gadgets minuscules (`add/sub/xor` sur `esi/edi`, `pop esi`, load/store `vars[]`, comparaisons + **skip conditionnel** de la chaîne).
2. Adresses absolues dans les gadgets = **relocations PIE** (`R_386_RELATIVE`) → OK sous ASLR.
3. Anti-tamper : profondeur de stack (`saved_esp - esp > 0x762`) et constantes magiques `!=` (jamais vraies en exec normale).
4. Init de `vars[0..11]` puis boucle `ebx = 0..5` :
   - `scanf("%d", &buf)`
   - `buf ^ vars[ebx] == vars[eax]` avec `eax` partant à 6
   - échec → `vars[12] = 0`
5. `printf("%d\n", vars[12])` — succès si `vars[12]` reste à **1**.

## Prédicat

```text
V = [0x83, 0x36, 0x9d, 0xcd, 0xec, 0xf6, 0x87, 0x3e, 0x92, 0xdd, 0xfb, 0xdc]
input[i] ^ V[i] == V[i+6]   for i in 0..5
→ 4, 8, 15, 16, 23, 42
```

(Les nombres de *Lost* — clin d’œil probable.)


## Debug GDB (pas à pas)

ELF32 **PIE** strippé. Entry file `0x11e0`. Sous GDB (`starti`) base typique `0x56555000` r-xp (ASLR).

Les 6 checks ROP font `cmp edi,esi` aux offsets fichier `0x102b`, `0x1040`, `0x1055`, `0x106a`, `0x107f`, `0x1094` (= base+offset).

```bash
export DEBUGINFOD_URLS=
gdb -nx -q ./original/rop-obf
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) info proc mappings   # noter BASE (ex. 0x56555000)
(gdb) break *(0x56555000+0x102b)   # ajuster BASE ASLR
(gdb) run <<< '4 8 15 16 23 42'
(gdb) printf "edi=%#x esi=%#x\n", $edi, $esi
# input^V[i] doit égaler V[i+6] → print 1
```

Sans symbole `main` : rester sur les gadgets / `cmp` ci-dessus. Anti-tamper stack depth documenté dans le prédicat.

`solution_summary` : password `4 8 15 16 23 42` — ROP VM.

## Vérification

```bash
printf '4 8 15 16 23 42\n' | ./original/rop-obf
# 1
python3 tools/rop-obf-solve.py --check
```

Voir [`analysis/ok.txt`](analysis/ok.txt).

## Notes

- Ce n’est **pas** un exploit distant : la ROP est le style d’obfuscation du crackme.
- Un seul entier ne suffit pas : il faut les **six** valeurs (espaces ou newlines).
