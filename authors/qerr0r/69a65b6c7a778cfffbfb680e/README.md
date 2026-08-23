# QERR0R's crackit

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/69a65b6c7a778cfffbfb680e) · id `69a65b6c7a778cfffbfb680e`

Crackme **ELF64** packé **PyInstaller** (CPython **3.14**).  
Auteur site : **[QERR0R](https://crackmes.one/user/QERR0R)**.

Dossier : `authors/qerr0r/69a65b6c7a778cfffbfb680e/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/crackit`](original/crackit) | binaire d’origine |
| [`original/source/crackit.py`](original/source/crackit.py) | source reconstruit |
| [`analysis/crackit.pyc`](analysis/crackit.pyc) | entry PyInstaller |
| [`tools/crackit-solve.py`](tools/crackit-solve.py) | flag + `--check` |
| [`README.md`](README.md) | ce write-up |

## Réponse

```text
CTF{My_S3cr3t_Fl4g}WoWYouFoundMe
```

```bash
python3 tools/crackit-solve.py -q --check
./original/crackit 'CTF{My_S3cr3t_Fl4g}WoWYouFoundMe'
# You cracked me!
```

---

## 1. Premier regard

```text
file original/crackit
# ELF 64-bit … Packer: PyInstaller (diec)
./original/crackit
# usage: ./crackit <flag>
```

SHA-256 `c17a56fe9caf1c9105212f8b4c72b9d7b998f3b862521e8a1235b532a97e5cd8`.

---

## 2. Flow

```text
argv[1] == "".join(("CTF{", "My_", "S3c", "r3t_", "Fl4g", "}WoW", "You", "Found", "Me"))
  → "You cracked me!" / sinon "Try again…"
```

---

## 3. Extraction

```bash
python3 tools/pyinstxtractor.py original/crackit
# entry: crackit.pyc — tuple `parts` dans co_consts
```

(Le runtime est 3.14 ; sous 3.12 le PYZ peut skip, l’entry suffit.)

---

## 4. Vérification

```bash
./original/crackit 'CTF{My_S3cr3t_Fl4g}WoWYouFoundMe'
# You cracked me!
```
