# toasterbirb — branchless

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/68692748aadb6eeafb398fe3) · id `68692748aadb6eeafb398fe3`

Crackme **ELF64** NASM (headers de sections corrompus / `e_shnum=0`). Mot de passe argv ; CFG **sans `jcc`**.  
Auteur : [toasterbirb](https://crackmes.one/user/toasterbirb).

Dossier : `authors/toasterbirb/68692748aadb6eeafb398fe3/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`branchless`](original/branchless) | binaire d’origine |
| [`branchless-solve.py`](tools/branchless-solve.py) | prédicat + `--check` |

## Réponse

| | |
|---|---|
| Password | **`5$`** (len=2, sum=89) |

Autres paires ASCII imprimables avec les mêmes contraintes : `$5`, `4%`, `9 `, …

```bash
python3 tools/branchless-solve.py -q
# 5$

./original/branchless '5$'
# correct! you really know your numbers …

python3 tools/branchless-solve.py --check
```

---

## 1. Premier regard

```text
file → ELF 64-bit LSB executable, statically linked
# « no section header » / e_shnum=0 → objdump échoue ; OK via program headers + Capstone
sha256: 1f914ca2ff5dd284320e6c7a1a235ed023c9dc518da3beb874827499ed560bda
```

```text
usage: branchless <password>
oopsie... your password is incorrect …
correct! you really know your numbers …
```

---

## 2. Flow

```text
argc == 2 ?  (branchless select via imul/sete)
  non → usage + exit 1
  oui → r10 = argv[1]
        (L, S) = strlen + sum des octets
        fib_loop : génère 2,3,5,8,13,… jusqu’à ≥ S
                   flags si L ou S rencontrés
        si L et S sont Fibonacci :
           si is_prime(L) et is_prime(S) → success
           sinon fail
```

Toutes les branches sont du motif `sete` → `imul addr` → `add` → `sub const` → `jmp rax`.

---

## 3. Prédicat

```text
L = strlen(password)
S = Σ password[i]

OK ⇔ L ∈ Fib ∧ S ∈ Fib ∧ is_prime(L) ∧ is_prime(S)
```

Fib utiles (à partir de 2) ∩ premiers : **2, 3, 5, 13, 89, 233, …**

Exemple minimal imprimable : **`5$`** → L=2, S=53+36=**89**.

---

## 4. Vérification

```bash
./original/branchless '5$'
# correct! you really know your numbers (˶˃ ᵕ ˂˶)
```

---

## 5. Notes

- ≠ [branchless branching](../68692679aadb6eeafb398fdf/) (login S-box) malgré le même nom de fichier `branchless`.
- Pas de solution 100 % digits : pour L∈{2,3,5,13}, un sum digit-only ne peut pas tomber sur un fib-premier compatible.
- Suite : `jump`, `branchless-fixed`.
