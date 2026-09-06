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

## 4. Debug GDB (pas à pas)

### 4.1 Problème : GDB refuse le binaire brut

L’ELF a `e_shnum=0` mais `e_shoff` / `e_shstrndx` incohérents → **`file format not recognized`** sous GDB / `objdump`.

Workaround (copie locale, **ne pas** toucher `original/`) :

```bash
cp original/branchless /tmp/branchless.gdb
python3 - <<'PY'
from pathlib import Path
import struct
b = bytearray(Path('/tmp/branchless.gdb').read_bytes())
struct.pack_into('<Q', b, 0x28, 0)  # e_shoff
struct.pack_into('<H', b, 0x3a, 0)  # e_shentsize
struct.pack_into('<H', b, 0x3c, 0)  # e_shnum
struct.pack_into('<H', b, 0x3e, 0)  # e_shstrndx
Path('/tmp/branchless.gdb').write_bytes(b)
PY
gdb -q /tmp/branchless.gdb
```

La preuve live du crackme reste `./original/branchless '5$'` ; la copie ne sert qu’au debug.

### 4.2 Entrée : select branchless sur `argc`

```text
(gdb) starti 5$
(gdb) x/25i $rip
```

```text
mov rax, [rsp]          ; argc
sub rax, 2
sete bl                 ; argc==2 ?
… imul / add …          ; calcule une adresse
jmp rax                 ; → usage  OU  chemin password
```

Avec `starti 5$` tu as `argc=2` → tu enchaînes vers le parse argv.

Sans argument : `starti` puis `continue` → message `usage: branchless <password>`.

### 4.3 Suivre strlen / sum / fib

Après le select OK, le code charge `argv[1]` (`r10`) puis calcule longueur + somme. Breakpoints utiles (autour du corps principal) :

```text
(gdb) break *0x40106b      # zone post-select (ajuste si besoin via x/i)
(gdb) continue
(gdb) x/s *(char**)($rsp+0x10)   # selon frame ; sinon print argv via /proc
```

Plus simple pour **voir L et S** : laisser tourner jusqu’aux tests, ou instrumenter le solveur. En dynamique pur, breaker juste avant les `sete` qui valident « L est fib » / « S est fib » et lire les registres comparés.

### 4.4 Le bug `is_prime` (à observer sous GDB)

Vers `0x40123c` :

```text
(gdb) break *0x40123c
(gdb) run 5$
# parfois le BP ne matche que si is_prime est vraiment atteint
(gdb) x/8i 0x401237
# mov eax, edi
# xor rdx, rdx
# idiv rax          ← buggy : n % n → reste 0 toujours
```

Sous GDB sur **cette** version buggy :

```text
(gdb) print $rdi    # n
(gdb) print $rax    # == n avant idiv
(gdb) stepi         # idiv rax
(gdb) print $rdx    # reste = 0  → « divisible » / logique de primalité cassée
```

Pourtant `5$` **passe** quand même : selon le CFG, le bug n’empêche pas toutes les paires fib∩prime valides (voir write-up / DLC fixed). Le DLC [branchless-fixed](../68c1f30a224c0ec5dcedbeda/) remplace par `idiv rcx`.

### 4.5 Succès

```text
(gdb) run 5$
# correct! you really know your numbers …
```

Ou break sur le `write` de la string succès (cherche `"correct!"` dans `.data` ~`0x402000`).

---

## 5. Vérification

```bash
./original/branchless '5$'
# correct! you really know your numbers (˶˃ ᵕ ˂˶)
```

---

## 6. Notes

- ≠ [branchless branching](../68692679aadb6eeafb398fdf/) (login S-box) malgré le même nom de fichier `branchless`.
- Pas de solution 100 % digits : pour L∈{2,3,5,13}, un sum digit-only ne peut pas tomber sur un fib-premier compatible.
- Suite : `jump`, `branchless-fixed`.
