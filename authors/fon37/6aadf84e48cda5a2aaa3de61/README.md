# fon37's Secret Menu

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aadf84e48cda5a2aaa3de61) · id `6aadf84e48cda5a2aaa3de61`

Crackme **Python** (PyInstaller ELF64), calculatrice BEP/ROI avec menu secret.  
Auteur : [fon37](https://crackmes.one/user/fon37) · difficulté site **2.0**.

Dossier : `authors/fon37/6aadf84e48cda5a2aaa3de61/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/chall`](original/chall) | binaire PyInstaller |
| [`analysis/chall_extracted/chall.pyc`](analysis/chall_extracted/chall.pyc) | entry PyInstaller (Py 3.13) |
| [`analysis/source/chall.py`](analysis/source/chall.py) | source reconstruite |
| [`tools/secret-menu-solve.py`](tools/secret-menu-solve.py) | secret / `--check` |

## Réponse

Au prompt `Calculate:`, entrer le **menu secret** (ni `1` ni ROI) :

| | |
|---|---|
| **Secret** | `justasimplexor` |
| OK | `Congratulations, you win!` |

```bash
python3 tools/secret-menu-solve.py -q
# justasimplexor
printf '%s\n' "$(python3 tools/secret-menu-solve.py -q)" | ./original/chall
# ou :
python3 tools/secret-menu-solve.py --check
```

---

## 1. Premier regard

```text
chall: ELF 64-bit LSB pie, x86-64, PyInstaller, stripped
sha256  7cb1206c8ca80c8e3fb23269d45255ef75579f52eb7f34314ad9e494cd484b8c
size    ~7.8 MiB
```

```bash
python3.13 tools/pyinstxtractor.py original/chall   # depuis la racine repo : ../../../tools/
# → analysis/chall_extracted/chall.pyc  (Python 3.13)
```

Banner live : `1 = BEP, 2 = ROI` / `Calculate:`.

---

## 2. Flow

1. `secret = decode()` (XOR de la liste `p`).
2. `choice = input("Calculate: ")`.
3. `choice == "1"` → BEP ; `choice == secret` → `win()` ; sinon → ROI.

---

## 3. Prédicat

```python
p = [193, 222, 216, 223, 202, 216, 194, 198, 219, 199, 206, 211, 196, 217]

def decode():
    text = ""
    for i in p:
        text += chr(i ^ 171)
    return text  # "justasimplexor"
```

---

## 4. Vérification

```text
$ printf 'justasimplexor\n' | ./original/chall
1 = BEP, 2 = ROI
Calculate: Congratulations, you win!
```

```bash
python3 tools/secret-menu-solve.py --check
# OK
```

---

## 5. Notes

- Pas de username / keygen name→serial.
- GDB non nécessaire (Python clair après extract).
- Spoiler public crackmes.one (SVz) donnait déjà le même XOR ; confirmé ici par extract + live.
