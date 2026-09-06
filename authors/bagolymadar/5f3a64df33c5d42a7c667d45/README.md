# bagolymadar — virtual.1 (Linux)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5f3a64df33c5d42a7c667d45) · id `5f3a64df33c5d42a7c667d45`

ELF64 PIE : keygen **username → serial** via **mini-VM** (`vmstart` / bytecode @ `0x4108`).  
Auteur : [bagolymadar](https://crackmes.one/user/bagolymadar).

| Fichier | Rôle |
|---|---|
| [`virtual.1`](original/virtual.1) | binaire |
| [`virtual1-solve.py`](tools/virtual1-solve.py) | keygen + `--check` |

## Réponse

| User | Serial |
|---|---|
| **`petik`** | **`0514-1628AED2A7B93BA1`** |

```bash
python3 tools/virtual1-solve.py -q
# 0514-1628AED2A7B93BA1
python3 tools/virtual1-solve.py --check
# Yep, you got it!
```

---

## 1. Premier regard

```text
ELF 64-bit LSB pie executable, x86-64, dynamically linked, not stripped
sha256: 11d27395c11bc12595e219116746fbaf89a2cc825321f4db99fea82f17273c09
symbols: vmstart, goodboy, badboy, prettymenu ; source hint vmloop.s
```

---

## 2. Flow

```text
printmenu / banner
Username: / Serial:
vmstart(user, serial) == 1 → Yep / Nope
```

Le VM a ~30 opcodes (mov, cmp, call/ret, rol, hex-digit parse, …).  
Serial **exactement 21** caractères.

---

## 3. Prédicat / format serial

```text
LL BB - HHHHHHHHHHHHHHHH   (sans espaces ; LL/BB hex majuscules)
```

| Champ | Signification |
|---|---|
| `LL` | `strlen(user)` |
| `BB` | `(Σ popcount8(user[i])) & 0xff` |
| `H…` (16 hex) | hash 64-bit : seed `0xb7e151628aed2a6a`, pour chaque char : `rol` par popcount, éventuellement `not` si popcount impair, `xor` sur le low byte |

---


## Debug GDB (pas à pas)

ELF64 **PIE**, non strippé. Entry file `0x1240`. Live : base `0x555555554000`, `main` → `0x555555555130`, `vmstart` → `0x5555555557f0`, `goodboy` file `0x17e0`.

```bash
export DEBUGINFOD_URLS=
gdb -nx -q ./original/virtual.1
(gdb) set debuginfod enabled off
(gdb) break main
(gdb) break vmstart
(gdb) break goodboy
(gdb) run < <(printf '1\npetik\n0514-1628AED2A7B93BA1\n0\n')
# PC main = base+0x1130 ; puis vmstart = base+0x17f0
(gdb) info proc mappings
(gdb) disassemble vmstart
```

Offsets fichier : `main 0x1130`, `vmstart 0x17f0`, `goodboy 0x17e0`, bytecode mentionné `@0x4108` dans le write-up.

`solution_summary` : `petik`→`0514-1628AED2A7B93BA1` (VM len+popcount+rol/xor).

## 4. Vérification

```bash
printf 'petik\n0514-1628AED2A7B93BA1\n' | ./original/virtual.1
# Yep, you got it!
```

---

## 5. Notes

- Le décor `prettymenu` (sin / login / date) est cosmétique.
- Opcode `0x94` = **AND reg, imm64** (pas un mov).
