# PopaCracker's Python CrackMe

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/62bb2f0933c5d4251e723a46) · id `62bb2f0933c5d4251e723a46`

Crackme **PE32 console** PyInstaller (CPython **3.7**).  
Auteur site : **[PopaCracker](https://crackmes.one/user/PopaCracker)**.

| Fichier | Rôle |
|---|---|
| [`original/CrackTool.exe`](original/CrackTool.exe) | binaire |
| [`original/source/CrackTool.py`](original/source/CrackTool.py) | source reconstruit |
| [`analysis/CrackTool.pyc`](analysis/CrackTool.pyc) | entry |
| [`tools/python-crackme-solve.py`](tools/python-crackme-solve.py) | password + `--check` |

## Réponse

| Champ | Valeur |
|---|---|
| Option | `1` (Register) |
| Name | **`petik`** (libre) |
| Password | **`YouSuccCracked`** |

```bash
python3 tools/python-crackme-solve.py -q --check
# YouSuccCracked
printf '1\npetik\nYouSuccCracked\n' | xvfb-run -a wine original/CrackTool.exe
# Correct! You Successfuly Registered as petik
```

---

## Flow

```text
menu → "1" → name → password == "YouSuccCracked"
```

Extract : `python3 tools/pyinstxtractor.py original/CrackTool.exe` → constante `Pass`.

## Notes

- `exit()` sans `import` → traceback après le message (bug auteur).
