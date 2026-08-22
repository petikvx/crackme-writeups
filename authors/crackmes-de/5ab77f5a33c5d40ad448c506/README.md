# crackmes.de 's grainne (stefanie)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5a33c5d40ad448c506)

## Réponse

| Password | **`stefu!u|`** |

Embarqué dans le padding `e_ident` de l'ELF (offset 8).

```bash
python3 tools/grainne-solve.py --check
xxd -l 16 original/grainne
```
