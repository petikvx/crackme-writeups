# toasterbirb — branchless-fixed

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/68c1f30a224c0ec5dcedbeda) · id `68c1f30a224c0ec5dcedbeda`

**DLC** de [branchless](../68692748aadb6eeafb398fe3/) : même crackme, **petit bugfix** dans `is_prime`.  
Auteur : [toasterbirb](https://crackmes.one/user/toasterbirb) — *« If you already figured out the buggy one, think of this as DLC :P »*.

Dossier : `authors/toasterbirb/68c1f30a224c0ec5dcedbeda/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`branchless`](original/branchless) | binaire d’origine (fixed) |
| [`branchless-fixed-solve.py`](tools/branchless-fixed-solve.py) | prédicat + `--check` |

## Réponse

Même famille de mots de passe que le sibling :

| Password | |
|---|---|
| **`5$`** | L=2, S=89 (tous deux Fibonacci ∩ premiers) |

```bash
python3 tools/branchless-fixed-solve.py -q
# 5$

./original/branchless '5$'
# correct! you really know your numbers …

python3 tools/branchless-fixed-solve.py --check
```

---

## 1. Premier regard

```text
ELF64 static, e_shnum=0 (comme le sibling)
sha256: 38506bba3d1bf8b145bdb7176db43d13806d38ea53d870e14ac29d3111963022
# sibling buggy : 1f914ca2ff5dd284320e6c7a1a235ed023c9dc518da3beb874827499ed560bda
```

Strings / usage identiques : `branchless <password>`.

---

## 2. Diff vs branchless (bug)

Dans le test de primalité branchless, après `mov rax, rdi` :

| Version | Instruction | Effet |
|---|---|---|
| [branchless](../68692748aadb6eeafb398fe3/) (buggy) | `idiv rax` | `n % n` → reste **toujours 0** |
| **branchless-fixed** | `idiv rcx` | `n % divisor` correct |

Le reste du CFG (fib + flags + `imul`/`sete`/`jmp`) est le même esprit.

---

## 3. Prédicat (inchangé côté joueur)

```text
L = strlen(password)
S = Σ password[i]
OK ⇔ L ∈ Fib ∧ S ∈ Fib ∧ is_prime(L) ∧ is_prime(S)
```

Fib ∩ premiers (à partir de 2) : 2, 3, 5, 13, 89, …

---

## 4. Vérification

```bash
./original/branchless '5$'
# correct! you really know your numbers (˶˃ ᵕ ˂˶)
```

Les 26 paires ASCII imprimables avec L=2 et S=89 (`$5`, `4%`, `9 `, …) passent aussi ici.

---

## 5. Notes

- Write-up détaillé du prédicat / CFG : voir le sibling **branchless**.
- Fin de la série toasterbirb asm listée (flags → … → branchless-fixed).
