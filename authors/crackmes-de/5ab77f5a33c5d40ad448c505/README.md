# crackmes.de 's grainne2 (stefanie)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5a33c5d40ad448c505)

## Réponse

| Password | **`LOVE`** |

Embarqué dans le padding `e_ident` de l'ELF (offset 8).

```bash
python3 tools/grainne2-solve.py --check
xxd -l 16 original/grainne2
```
