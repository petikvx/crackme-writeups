# crackmes.de's crackme_2.0_find_the_secret_text by devoney

| | |
|---|---|
| **ID** | [`5ab77f5333c5d40ad448c109`](https://crackmes.one/crackme/5ab77f5333c5d40ad448c109) |
| **Auteur (site)** | crackmes.de |
| **Auteur (local)** | crackmes-de |
| **SHA-256** | `38ba5d2d75b6e244c99cdf7de2609e5f79edc0a3c849a0b0bdbf712e11aa2386` |

## Origine

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c109
- Download : https://crackmes.one/download/crackme/5ab77f5333c5d40ad448c109
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Contenu

```
original/   # binaire d'origine
analysis/   # IDA, screenshots
tools/      # solveur, recon
```

## Status

- [x] reverse
- [x] write-up — [`analysis/writeup.md`](analysis/writeup.md)
- [x] solveur — [`tools/solve.py`](tools/solve.py)

**Password :** `[_Crack_]` · **Secret text :** `greed`

PE32 GUI auto-modifiant : l'input (edit id `0x65`) est transformé octet par
octet puis écrit sur un NOP sled en `0x401351` via `WriteProcessMemory` et
exécuté. Avec le bon mot de passe, les 19 octets forment un appel `MessageBoxA`
affichant « The Secret Text is: greed ». Vérifié par émulation Unicorn
(`./tools/solve.py --emulate`).
