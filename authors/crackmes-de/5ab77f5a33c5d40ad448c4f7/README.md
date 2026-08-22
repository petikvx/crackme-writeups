# crackmes.de's frogger_crackme (macabre)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5a33c5d40ad448c4f7)

## Réponse

| User | Key |
|---|---|
| `petik` | **`62-qqqqqv`** |

`atoi(num)==62` patche un `jmp` relatif ; `(sum(user)^2 ⊕ -sum(tail)) & 0xff == 0x1c`.  
Sur Linux moderne : `mprotect` le `.text` (gdb dans le solveur).

```bash
python3 tools/frogger-solve.py --check --user petik
```
