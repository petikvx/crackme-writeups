# Jenya — math_crackme

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/659ffe1beef082e477ff59d0) · id `659ffe1beef082e477ff59d0`

Deux entiers ; `check` sans `jcc` (div / bitwise). ZIP avec **source** + `solution.txt` auteur.  
Auteur : [Jenya](https://crackmes.one/user/Jenya).

Dossier : `authors/jenya/659ffe1beef082e477ff59d0/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`math_crackme.zip`](original/math_crackme.zip) | archive site |
| [`main`](original/main) | ELF64 static |
| [`main.asm`](analysis/extracted/math_crackme/source_code/main.asm) | source |
| [`solution.txt`](analysis/extracted/math_crackme/solution.txt) | notes auteur |
| [`math-crackme-solve.py`](tools/math-crackme-solve.py) | n1→n2 + `--check` |

## Réponse

| n1 (exemple) | n2 |
|---|---|
| **12** | **6** |
| 4 | 2 |
| 5 | 0 |

```bash
python3 tools/math-crackme-solve.py -q
# 6

python3 tools/math-crackme-solve.py --check
# CORRECT
```

---

## 1. Premier regard

```text
math_crackme.zip → main + source_code/main.asm + solution.txt
ELF 64-bit LSB executable, statically linked, stripped
sha256 zip: f9d4695c882d8125fdf82c7652aab2446856585875476e5b76fe6377f765c8bd
```

---

## 2. Flow

```text
print "enter first number: ";  read(20); atoi → num1
print "enter second number: "; read(20); atoi → num2
rdi = check(num1)
si rdi == num2 → CORRECT sinon WRONG
```

Piège pipe : **chaque `read` demande 20 octets**. Si on envoie `12\n6\n` d’un coup, le 1er read avale tout. Padder la 1re ligne à 20 bytes (après `\n`).

---

## 3. Prédicat

D’après `solution.txt` / `check` :

```text
n2 = 6  si n1 ≡ 0 (mod 6)
n2 = 2  si n1 ≡ 0 (mod 2) et n1 ≢ 0 (mod 6)
n2 = 0  sinon
```

Astuce asm (sans branche) : reste `%2` / `%3`, décalages, puis `6 / f(…)` × facteur parité.

---

## 4. Vérification

```bash
python3 tools/math-crackme-solve.py --check --n1 12
python3 tools/math-crackme-solve.py --check --n1 4
python3 tools/math-crackme-solve.py --check --n1 5
```

---

## 5. Notes

- L’auteur livre déjà `solution.txt` dans le ZIP — le défi est surtout le `check` branchless.
- Suite Jenya : [linux_asm_jenya](https://crackmes.one/crackme/655b43750f4238b24302bc42).
