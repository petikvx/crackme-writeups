# crackme_1_by_sharpe / Keygenme #2 (sharpe)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6233c5d40ad448c9df)  
> ZIP interne : `two.exe` (challenge) + `solution.exe` (spoiler auteur).

| Fichier | Rôle |
|---|---|
| [`original/_u/two.exe`](original/_u/two.exe) | challenge |
| [`tools/sharpe1-solve.py`](tools/sharpe1-solve.py) | keygen |

## Réponse

| Name | Serial (16 octets) |
|---|---|
| **`petik`** | **`@tAvw,+*)('&%$#"`** |

```bash
python3 tools/sharpe1-solve.py -q --user petik
python3 tools/sharpe1-solve.py --check
```

## Prédicat

Pour `ecx = 16 … 1` et chaque octet du name (0 après le NUL) :
`v = name[i] + ecx`; si `v < 0x21` → `v += 0x21`; si `v > 0x7b` → `v >>= 1`.
Le début de `4011A9` est du code mort (réécrit avant le `ret`).
