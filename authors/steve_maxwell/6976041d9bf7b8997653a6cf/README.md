# steve_maxwell's X-0-R

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6976041d9bf7b8997653a6cf) · id `6976041d9bf7b8997653a6cf`

Crackme **ELF64** PyInstaller + fichier `flag.txt.enc`.  
Auteur site : **[steve_maxwell](https://crackmes.one/user/steve_maxwell)**.

Dossier : `authors/steve_maxwell/6976041d9bf7b8997653a6cf/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/chall.zip`](original/chall.zip) | archive site |
| [`original/chall`](original/chall) | outil XOR (PyInstaller) |
| [`original/flag.txt.enc`](original/flag.txt.enc) | ciphertext |
| [`original/source/chall.py`](original/source/chall.py) | logique reconstruite |
| [`analysis/chall.pyc`](analysis/chall.pyc) | entry extrait |
| [`tools/x-0-r-solve.py`](tools/x-0-r-solve.py) | decrypt XOR |
| [`README.md`](README.md) | ce write-up |

## Réponse

XOR **constant 7** sur chaque octet de `flag.txt.enc` :

```text
CTFLearn{y0u_x0r3d_th3_c0d3}
```

```bash
python3 tools/x-0-r-solve.py -q --check
```

---

## 1. Premier regard

```text
# ZIP → challenge/chall + flag.txt.enc
file original/chall
# ELF64 PyInstaller
./original/chall
# Usage: python chall <filename>
```

Description site : *« Every byte has been nudged in the same way »* → XOR mono-octet.

---

## 2. Flow

```text
chall <file>  →  écrit <file>.enc = bytes XOR key
flag.txt.enc  →  déjà chiffré ; on inverse avec la même clé
```

---

## 3. Prédicat

Known-plaintext sur le préfixe `CTFLearn{` :

```text
'D' ^ 'C' = 7  (idem pour chaque octet du préfixe)
```

```python
plain = bytes(b ^ 7 for b in open("flag.txt.enc","rb").read().rstrip(b"\r\n"))
# CTFLearn{y0u_x0r3d_th3_c0d3}
```

---

## 4. Vérification

```bash
python3 tools/x-0-r-solve.py --check
# flag = CTFLearn{y0u_x0r3d_th3_c0d3}  (xor key=7)
# check: OK
```

---

## 5. Notes

- `chall` sert surtout à **chiffrer** ; le flag est dans `flag.txt.enc` sans avoir besoin du binaire.
- Extraction PyInstaller optionnelle (CPython 3.8) pour confirmer la clé / API.
