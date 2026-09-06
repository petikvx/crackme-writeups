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

## 4. Debug GDB (pas à pas)

Même contrainte d’en-tête ELF que le sibling : GDB refuse souvent `original/branchless` tant que `e_shoff` / `e_shstrndx` sont incohérents avec `e_shnum=0`.

### 4.1 Copie patchée pour GDB

```bash
cp original/branchless /tmp/branchless-fixed.gdb
python3 - <<'PY'
from pathlib import Path
import struct
b = bytearray(Path('/tmp/branchless-fixed.gdb').read_bytes())
struct.pack_into('<Q', b, 0x28, 0)
struct.pack_into('<H', b, 0x3a, 0)
struct.pack_into('<H', b, 0x3c, 0)
struct.pack_into('<H', b, 0x3e, 0)
Path('/tmp/branchless-fixed.gdb').write_bytes(b)
PY
gdb -q /tmp/branchless-fixed.gdb
```

Preuve live toujours sur **`./original/branchless`**.

### 4.2 Diff live : `idiv rcx` vs `idiv rax`

```text
(gdb) starti 5$
(gdb) break *0x40123c
(gdb) continue
(gdb) x/6i 0x401237
```

```text
mov  eax, edi
xor  rdx, rdx
idiv rcx          ; ← FIXED (diviseur dans rcx)
mov  rax, rdx     ; reste
…
```

Comparer avec le sibling buggy (`idiv rax` au même offset fichier). Sous GDB ici :

```text
(gdb) print $rdi   # n testé
(gdb) print $rcx   # diviseur courant de la boucle is_prime
(gdb) stepi        # idiv rcx
(gdb) print $rdx   # vrai n % div
```

Si tu rejoues le **buggy** au même BP, `$rdx` tombe à `0` dès que le diviseur vaut `n`.

### 4.3 Reste du debug

Identique au write-up [branchless](../68692748aadb6eeafb398fe3/) §4 : select `argc==2` via `sete`/`imul`/`jmp rax`, puis fib + flags + primality. Password de smoke-test : **`5$`**.

```text
(gdb) run 5$
# correct! you really know your numbers …
```

---

## 5. Vérification

```bash
./original/branchless '5$'
# correct! you really know your numbers (˶˃ ᵕ ˂˶)
```

Les 26 paires ASCII imprimables avec L=2 et S=89 (`$5`, `4%`, `9 `, …) passent aussi ici.

---

## 6. Notes

- Write-up détaillé du prédicat / CFG : voir le sibling **branchless**.
- Fin de la série toasterbirb asm listée (flags → … → branchless-fixed).
