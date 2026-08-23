# crackmes.de's crackme_0x01_by_qfqe by qfqe

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6033c5d40ad448c8a4) · id `5ab77f6033c5d40ad448c8a4`

Crackme **PE32 console** compilé avec **py2exe** (CPython **2.6**).  
Auteur d’origine : **qfqe** (miroir crackmes.de).

| Fichier | Rôle |
|---|---|
| [`original/crkm0x1.exe`](original/crkm0x1.exe) | binaire py2exe |
| [`original/crkm0x1.zip`](original/crkm0x1.zip) | archive site (exe + readme) |
| [`original/readme.txt`](original/readme.txt) | note auteur |
| [`analysis/resources/PYTHONSCRIPT.bin`](analysis/resources/PYTHONSCRIPT.bin) | resource script |
| [`analysis/crkm0x1_reconstructed.py`](analysis/crkm0x1_reconstructed.py) | logique reconstruite |
| [`tools/qfqe-0x01-solve.py`](tools/qfqe-0x01-solve.py) | serial + `--check` |

## Réponse

| Champ | Valeur |
|---|---|
| Serial | **`qeavG1ZX`** |

```bash
python3 tools/qfqe-0x01-solve.py -q --check
# qeavG1ZX
printf 'qeavG1ZX\n\n' | xvfb-run -a wine original/crkm0x1.exe
# Serial: Good!
```

---

## Premier regard

```text
$ file original/crkm0x1.exe
PE32 executable … py2exe / Zip SFX

$ cat original/readme.txt
… Programming Language:Python … compiled with py2exe.
```

Resource `PYTHONSCRIPT` (wrestool `--raw`) : magic `0x78563412`, script `crkm0x1.py`.

---

## Flow

```text
raw_input("Serial: ")
  == "".join(map(lambda x: chr(x ^ 0x90),
                 [0xe1, 0xf5, 0xf1, 0xe6, 0xd7, 0xa1, 0xca, 0xc8]))
  → "Good!" / "Bad..."
```

---

## Prédicat

| Encoded | `^ 0x90` | Char |
|---|---|---|
| `0xe1` | `0x71` | `q` |
| `0xf5` | `0x65` | `e` |
| `0xf1` | `0x61` | `a` |
| `0xe6` | `0x76` | `v` |
| `0xd7` | `0x47` | `G` |
| `0xa1` | `0x31` | `1` |
| `0xca` | `0x5a` | `Z` |
| `0xc8` | `0x58` | `X` |

→ **`qeavG1ZX`**

---

## Vérification

```bash
python3 tools/qfqe-0x01-solve.py --check
# check: OK (Wine+xvfb → Good!)
```

---

## Notes

- Marshal Python **2.6** : pas chargeable tel quel sous CPython 3 ; strings + opcodes dans `PYTHONSCRIPT` suffisent.
- Pas de username : serial fixe.
