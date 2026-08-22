# crackmes.de's j333 (josamont)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5c33c5d40ad448c669)

ELF32 (UPX-like / no section headers). Auteur : **josamont**.

| Fichier | Rôle |
|---|---|
| [`original/j333.tar.gz`](original/j333.tar.gz) | archive |
| [`original/j333`](original/j333) | ELF |
| [`tools/j333-solve.py`](tools/j333-solve.py) | solveur |
| [`analysis/ok.txt`](analysis/ok.txt) | `Well done!` |

## Réponse

| Password | **`246581`** |

`read` sur **fd 1** (6 octets) ; comparer à la sous-chaîne de `2793246581`. PTY requis (mode canonique + newline).

```bash
python3 tools/j333-solve.py --check
```
