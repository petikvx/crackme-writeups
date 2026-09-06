# ThePhilosopher — Bruteverse

> [crackmes.one](https://crackmes.one/crackme/634bdec633c5d4425e2cd8ee)

NASM tiny : entry imprime un leurre ; code mort XOR `0xa3` (jibberish). Le vrai flag vient d’un **bruteforce XOR** sur `.data` → clé **`0xf3`**.

## Réponse

| Flag |
|---|
| **`R2V2R5IN5_4S_R42LL7_F2N`** |

```text
Here is your flag : R2V2R5IN5_4S_R42LL7_F2N
```

```bash
python3 tools/bruteverse-solve.py -q
```

## Debug GDB (pas à pas)

ELF64 **statique**, **non-PIE**, NASM. Entry `_start` @ `0x401000` : imprime le leurre `@0x40202c` puis `exit`. Le blob XORé `@0x402000` n’est **pas** décodé sur ce chemin ; `l2`/`l3` (XOR `0xa3`) sont du **code mort** (jibberish).

```bash
gdb -q ./original/crackme
(gdb) set debuginfod enabled off
(gdb) info functions
# _start 0x401000 · l1 0x40100a · exit 0x401027 · l2 0x401033 · l3 0x40103d
(gdb) x/s 0x40202c
# "You need another path to get the precious flag!"
(gdb) x/44xb 0x402000
# bb 96 81 96 d3 9a … (ciphertext)
(gdb) break exit
(gdb) run
# stdout → leurre ; jamais "Here is your flag"
```

Décoder `.data` hors exécution (clé `0xf3`) :

```bash
python3 -c 'd=open("original/crackme","rb").read()[0x2000:0x202b]; print(bytes(b^0xf3 for b in d).decode())'
# ou : python3 tools/bruteverse-solve.py --check
# Here is your flag : R2V2R5IN5_4S_R42LL7_F2N
```

Pour voir le chemin mort `l2`/`l3` : copie avec entry `0x401033` → [`analysis/crackme-altentry`](analysis/crackme-altentry) (sortie XOR `0xa3`, pas le flag).

## Vérification

```bash
./original/crackme
# You need another path to get the precious flag!
python3 tools/bruteverse-solve.py --check
# xor key=0xf3 / Here is your flag : R2V2R5IN5_4S_R42LL7_F2N / OK
```
