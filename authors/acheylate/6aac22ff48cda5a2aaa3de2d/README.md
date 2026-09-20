# acheylate's Find the password Windows ver

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aac22ff48cda5a2aaa3de2d) · id `6aac22ff48cda5a2aaa3de2d`

PE64 Rust console (jumeau Windows du Linux). Diff. site **3.0**.

| Fichier | Rôle |
|---|---|
| [`original/crackme-01.exe`](original/crackme-01.exe) | binaire |
| [`tools/find-password-win-solve.py`](tools/find-password-win-solve.py) | password / `--check` Wine |

## Réponse

| | |
|---|---|
| **Password** | `HVUHADN` |
| OK | `Correct Password` |

```bash
python3 tools/find-password-win-solve.py -q
printf '%s\n' HVUHADN | wine original/crackme-01.exe
```

## Prédicat

Comme la version Linux : immediates u32 LE assemblées en `HVUHADN`.
