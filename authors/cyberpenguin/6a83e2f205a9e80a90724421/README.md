# Cyberpenguin's What password???

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a83e2f205a9e80a90724421) · id `6a83e2f205a9e80a90724421`

Crackme **ELF64** Linux, **NASM** (non strippé, debug_info).  
Auteur site : **Cyberpenguin**.

Dossier : `authors/cyberpenguin/6a83e2f205a9e80a90724421/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/what_password`](original/what_password) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`tools/what-password-solve.py`](tools/what-password-solve.py) | decode table `pw` / check |
| [`tools/final1.asm`](tools/final1.asm) | recon style auteur (`main` + gcc) |
| [`tools/easyasm.asm`](tools/easyasm.asm) | helpers cours (`read_int` / `print_*`, inutilisés) |
| [`tools/what-password-nasm.asm`](tools/what-password-nasm.asm) | variante autonome `_start` (sans libc) |
| [`analysis/ok.txt`](analysis/ok.txt) | run live → `Correct! You won!` |

## Réponse

| Input | Valeur |
|---|---|
| Password | **`kr@meri$dab3st`** |

```bash
python3 tools/what-password-solve.py -q
# kr@meri$dab3st

python3 tools/what-password-solve.py --check 'kr@meri$dab3st'
# OK

printf 'kr@meri$dab3st\n' | ./original/what_password
# Correct! You won!
```

---

## 1. Premier regard

```text
file original/what_password
# ELF 64-bit LSB executable, x86-64, dynamically linked, with debug_info, not stripped
```

Compilateur / toolchain (strings) : `GCC (Debian 12.2.0…)` + source `final1.asm` / `NASM 2.16.01`.  
I/O via **syscalls** (`read` / `write` / `exit`), pas `scanf` pour le password.

Messages :

```text
Incorrect password!
Correct! You won!
```

Hashes :  
MD5 `9895dc46b2092dcb6e1dfe38ce72ccd4` · SHA-256 `f27ca3167737d987db891fdf33b2fb758db0c9b4240040617f7dc66fa7cccc44`.

Labels site : string encryption / XOR · difficulty **2.0** · quality **4.0**.

---

## 2. Flow

```text
main:
  sys_read(0, input@0x40406c, 0x400)
  r14 = 0          ; index
  r15 = 2          ; addend
loop_1:
  r12b = pw[r14] ^ 0x27
  r12b += r15b
  cmp  r12b, input[r14]
  jne  wrong
  cmp  r12b, 0x0a  ; '\n'
  je   right
  r14++
  r15 += 2
  jmp  loop_1
```

- Table chiffrée : symbole `pw` @ **`0x404028`** (15 octets jusqu’à `wrong_msg`).
- L’entrée utilisateur doit se terminer par `\n` (Enter) : le dernier octet transformé de `pw` vaut `0x0a`.

---

## 3. Prédicat

Pour chaque index `i` :

```text
expect[i] = ((pw[i] XOR 0x27) + (2 + 2*i)) & 0xFF
```

Décodage :

| i | `pw[i]` | `^0x27` | `+ (2+2i)` | char |
|---|---|---|---|---|
| 0 | `4e` | `69` | `6b` | `k` |
| 1 | `49` | `6e` | `72` | `r` |
| 2 | `1d` | `3a` | `40` | `@` |
| … | … | … | … | … |
| 13 | `7f` | `58` | `74` | `t` |
| 14 | `cb` | `ec` | `0a` | `\n` |

→ **`kr@meri$dab3st`**

```bash
python3 tools/what-password-solve.py --decode
# 6b72406d657269246461623373740a b'kr@meri$dab3st\n'
```

---

---

## Debug GDB (pas à pas)

ELF64, **non strippé** (`main`, `loop_1`, `right` / `wrong`). I/O en syscalls.

```bash
gdb -q ./original/what_password
(gdb) break main
(gdb) run < <(printf 'kr@meri$dab3st\n')
(gdb) disassemble loop_1
```

| Symbole | Rôle |
|---|---|
| `main` `0x401150` | `read` → buf `@0x40406c` |
| `loop_1` | `table[i] ^ 0x27 + (2+2*i)` vs input[i] |
| `right` / `wrong` | messages succès / échec |
| table `pw` | `@0x404028` |

```text
(gdb) break *loop_1+27          # cmp r12b, r13b
(gdb) commands
> silent
> printf "i=%d expect=0x%02x got=0x%02x\n", (int)$r14, $r12 & 0xff, $r13 & 0xff
> continue
> end
(gdb) continue
# jusqu’au \n → right
```

Décoder hors GDB : `python3 tools/what-password-solve.py --decode`.

## 4. Vérification

```bash
printf 'kr@meri$dab3st\n' | ./original/what_password
# Correct! You won!
```

Preuve : [`analysis/ok.txt`](analysis/ok.txt).

---

## 5. Reconstruction NASM

Le binaire d’origine vient de **`final1.asm`** + **`easyasm.asm`** (helpers scanf/printf/putchar, **non utilisés** par le check).

### Workflow proche de l’auteur (`main` + gcc)

```bash
cd tools
nasm -f elf64 -o final1.o final1.asm
nasm -f elf64 -o easyasm.o easyasm.asm
gcc -no-pie -o what-password-gcc final1.o easyasm.o
printf 'kr@meri$dab3st\n' | ./what-password-gcc
# Correct! You won!
```

[`final1.asm`](tools/final1.asm) : `DEFAULT ABS`, labels `pw` / `loop_1` / `wrong` / `right`, syscalls comme le listing.  
[`easyasm.asm`](tools/easyasm.asm) : `read_int`, `print_int`, `print_char` (+ formats `%d` / `%d\n`).

### Variante autonome (sans libc)

```bash
nasm -f elf64 -o what-password-nasm.o what-password-nasm.asm
ld -o what-password-nasm what-password-nasm.o
printf 'kr@meri$dab3st\n' | ./what-password-nasm
```

[`what-password-nasm.asm`](tools/what-password-nasm.asm) : `_start` + RIP-relative ; même prédicat.

---

## Notes

- Challenge pédagogique : XOR fixe + addend croissant (`+2` par caractère).
- Le binaire d’origine peut arriver sans bit exécutable après extraction ZIP → `chmod +x original/what_password`.
- Spoiler community (crackmes.one) : même password — confirmé ici par reverse + run.
