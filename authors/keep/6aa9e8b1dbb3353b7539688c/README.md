# Keep's sygil.fun

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aa9e8b1dbb3353b7539688c) · id `6aa9e8b1dbb3353b7539688c`

ELF64 console (cousin de la GUI). Diff. site **3.3**.

| Fichier | Rôle |
|---|---|
| [`original/sygil`](original/sygil) | binaire |
| [`tools/sygil-solve.py`](tools/sygil-solve.py) | keygen / `--check` |

## Réponse

| | |
|---|---|
| **Name** | `petik` |
| **Sigil/token** | `syg-8fbf90b6-0f02-8fecc6f3` |
| OK | `the pact is sealed.` |

```bash
python3 tools/sygil-solve.py -q --name petik
printf 'petik\n%s\n' "$(python3 tools/sygil-solve.py -q)" | ./original/sygil
```

## Prédicat

Identique à la version GUI : FNV-1a → `syg-%08x-%04x-%08x` (voir write-up GUI).
