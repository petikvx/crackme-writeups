# crackmes.de's Crackme3 (S!x0r)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5c33c5d40ad448c62e) · [`ORIGIN.yml`](ORIGIN.yml)

## Réponse

| User | Serial |
|---|---|
| `sixor` | **`6E9F-0065`** |

Username ≥5, serial `XXXX-XXXX` (hex). Hash produit + pow/mod (`0xf2a7`, `0x3ca9d`). Inputs sur **fd 1** (PTY).

```bash
python3 tools/crackme3-sx0r-solve.py --check --user sixor
```
