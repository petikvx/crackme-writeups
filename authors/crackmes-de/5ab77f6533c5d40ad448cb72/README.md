# crackmes.de's BeatMe (rezk2ll)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6533c5d40ad448cb72) · id `5ab77f6533c5d40ad448cb72`

Keygenme **ELF32** NASM, strippé. Strings en **ROT−1**. Auteur : **rezk2ll**.

| Fichier | Rôle |
|---|---|
| [`original/BeatMe.zip`](original/BeatMe.zip) | archive |
| [`original/BeatMe`](original/BeatMe) | ELF |
| [`tools/beatme-solve.py`](tools/beatme-solve.py) | keygen |
| [`analysis/ok.txt`](analysis/ok.txt) | `CORRECT , YOU WIN` |

## Réponse

| Champ | Exemple |
|---|---|
| Username | **`petik`** (longueur 3..8) |
| Password | **`5tshwln`** |

```bash
python3 tools/beatme-solve.py -q --user petik
# petik:5tshwln
python3 tools/beatme-solve.py --check --user petik
```

## Prédicat

1. Username lu : longueur ∈ [4..9] → corps `L` ∈ [3..8].
2. `password[0] == '0' + L`
3. `password[1] == username[2]`
4. Sur `password[2:]` : decode ROT−1, puis `c -= L//2` ; le résultat (L octets) == username.
5. Anti-debug `rdtsc` (écart > `0x3500` → crash).

Keygen : `pwd[2+i] = user[i] + (L//2) + 1`.

## Notes

- Bannières ASCII art décodées à la volée (`dec` sur chaque octet).
- Envoyer user/pass en **deux écritures** (même piège pipe que KeygenmeNasm).
