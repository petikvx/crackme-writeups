# crackmes.de's fr0g_kgm1

> [crackmes.one](https://crackmes.one/crackme/5ab77f5c33c5d40ad448c65b) · [`ORIGIN.yml`](ORIGIN.yml)

## Réponse

Login exemple **`fr0g1`** (≥5). Serial 32 octets dans `/var/tmp/thegame.serial` :

`serial[i] = login[(31-i) % len] XOR "SeRiAlAbCdEfGhIjKlMnOpQrStUvWxYz"[i]`

```bash
python3 tools/fr0g-kgm1-solve.py --check --login fr0g1
# Yeh, you did it
```
