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
