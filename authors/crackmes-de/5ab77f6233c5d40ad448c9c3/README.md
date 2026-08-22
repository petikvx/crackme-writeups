# crackmes.de's yyyyyyy1

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6233c5d40ad448c9c3) · id `5ab77f6233c5d40ad448c9c3`

Keygenme **ELF32** NASM, fortement obfusqué (junk, chemins inversés). Auteur : **yyyyyyy**.

| Fichier | Rôle |
|---|---|
| [`original/yyyyyyy1.tar.gz`](original/yyyyyyy1.tar.gz) | archive |
| [`original/yyyyyyy1`](original/yyyyyyy1) | ELF |
| [`original/readme.txt`](original/readme.txt) | brief |
| [`tools/yyyyyyy1-solve.py`](tools/yyyyyyy1-solve.py) | keygen |
| [`analysis/ok.txt`](analysis/ok.txt) | `win!` |

## Réponse

| Input | Exemple |
|---|---|
| Key (16 chars) | **`8bwh8ZVdOlNOZ5T\`** |

```bash
python3 tools/yyyyyyy1-solve.py -q
printf '%s\n' '8bwh8ZVdOlNOZ5T\' | ./original/yyyyyyy1
# yyyyyyy1 ~> win!
```

## Prédicat

1. `read` puis longueur effective `n-1 == 16` (donc 16 chars + `\n`).
2. Chaque octet ∈ `[0x21, 0x7a]` (`!`..`z`).
3. Checksum :

```text
ebx = 0
for c in key[1:16]:
    ebx = (~((ebx ^ c) + 0x2a) - 1) & 0xffffffff
key[0] == ebx & 0xff
```

Beaucoup de clés valides — le solveur en tire une au hasard (seed fixe).

## Notes

- Prompt / messages décodés via `~(c) + remaining + 1`.
- Branche « 0x1337 » / ret 0 : fumée anti-RE ; le vrai succès affiche `win!` quand le check renvoie **0**.
