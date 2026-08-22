# crackmes.de's easy_crackme_2 (lord)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6333c5d40ad448ca8b) · id `5ab77f6333c5d40ad448ca8b`

ELF32 NASM (gzip dans le ZIP site). Auteur : **lord**.

| Fichier | Rôle |
|---|---|
| [`original/cm1eng.gz`](original/cm1eng.gz) | archive gzip site |
| [`original/cm1eng`](original/cm1eng) | ELF |
| [`tools/easy-crackme-2-solve.py`](tools/easy-crackme-2-solve.py) | solveur |
| [`analysis/ok.txt`](analysis/ok.txt) | `Great you did it !:)` |

## Réponse

| Input | Valeur |
|---|---|
| Password | **`pucybut`** |

```bash
printf 'pucybut\n' | ./original/cm1eng
# Great you did it !:)
```

## Prédicat

Ciphertext en `.data` : `QTBXCTU`. Au runtime, XOR `0x21` in-place, puis `rep cmps` sur 7 octets avec l’entrée.
