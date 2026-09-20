# vetementsvmnts's KeygenMe

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aa94afadbb3353b7539687a) · id `6aa94afadbb3353b7539687a`

ELF64 console name→serial. Diff. site **1.7**.

| Fichier | Rôle |
|---|---|
| [`original/keygen_crackme`](original/keygen_crackme) | binaire |
| [`tools/keygenme-solve.py`](tools/keygenme-solve.py) | keygen / `--check` |

## Réponse

| | |
|---|---|
| **Name** | `petik` |
| **Serial** | `3910` |
| Formule | `sum(ord(c)) * 7 + 0x7b` |
| OK | `Correct! Access Granted.` |

```bash
python3 tools/keygenme-solve.py -q --name petik
printf 'petik\n3910\n' | ./original/keygen_crackme
```
