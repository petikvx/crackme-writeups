# toasterbirb — branchless branching

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/68692679aadb6eeafb398fdf) · id `68692679aadb6eeafb398fdf`

Crackme **ELF64** NASM static. Login username→password ; CFG **sans `jcc`** (`cmove` + `jmp rax`).  
Auteur : [toasterbirb](https://crackmes.one/user/toasterbirb).

Dossier : `authors/toasterbirb/68692679aadb6eeafb398fdf/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`branchless`](original/branchless) | binaire d’origine |
| [`branchless-branching-solve.py`](tools/branchless-branching-solve.py) | keygen + `--check` |

## Réponse

| User (8 octets) | Password (16 octets) |
|---|---|
| **`petik`** + `\0\0\0` | **`rn%5ielsrArvz"""`** |
| `toasterb` | `vxqjrj3uf{rmvofj` |

```bash
python3 tools/branchless-branching-solve.py -q
# rn%5ielsrArvz"""

python3 tools/branchless-branching-solve.py --check
# Logged in as petik…
```

`read(username, 8)` puis `read(password, 17)` — pas de `fgets` : en pipe, padding null OK.

---

## 1. Premier regard

```text
ELF 64-bit LSB executable, x86-64, statically linked, stripped
sha256: bb95b3b12705e0a36b6500a1be2a2dda6f5c9b77ffea26678259a36c6a211069
```

```text
username: password: Logged in as / Wrong password! …
S-box: !@$defghijklmn9pqrstuvwxyz012345   (32 octets @ 0x402055)
```

---

## 2. Flow

```text
write "username: "; read 8 → buf_user
write "password: "; read 17 → buf_pass
# phase derive (rdx=0..7), cmove pour boucler
# phase compare (rdx=0..15) : pass[i] ?= out[i]+1
# r12 reste 0 ssi tout match → "Logged in as" + username
```

Les boucles utilisent `cmp` + **`cmove`/`cmovne`** + `jmp rax` — d’où « branchless branching ».

---

## 3. Prédicat

```text
table[32] = "!@$defghijklmn9pqrstuvwxyz012345"

for i in 0..7:
    out[i]   = table[(i*7 + user[i]) & 0x1f]
    out[8+i] = table[(user[i] * out[i]) & 0x1f]

accept ⇔  ∀ i∈[0,16)  password[i] == out[i] + 1
```

---

## 4. Debug GDB (pas à pas)

Static / stripped, entry `0x401000`. Ici GDB ouvre le fichier **sans** patch d’en-tête (contrairement au sibling « branchless » / `e_shnum`).

### 4.1 Suivre les deux `read`

```bash
gdb -q ./original/branchless
(gdb) starti
(gdb) x/30i $rip
```

| Adresse | Syscall |
|---|---|
| `0x401019` | write `"username: "` |
| `0x401034` | `read(0, 0x402078, 8)` |
| `0x40104f` | write `"password: "` |
| `0x40106a` | `read(0, 0x402080, 0x11)` |

```text
(gdb) break *0x40106c          # juste après le 2e read
(gdb) run < <(printf 'petik\0\0\0%s' 'AAAAAAAAAAAAAAA')
(gdb) x/8cb 0x402078           # username
(gdb) x/17cb 0x402080          # password
```

### 4.2 Boucle derive (S-box) — pas de `jcc`

À partir de `0x40109e` environ :

```text
rax = i*7 + user[i]
rax &= 0x1f
cl  = table[rax] @ 0x402055
out[i] = cl
…
```

```text
(gdb) x/32cb 0x402055          # S-box "!@$defghijklmn9pqrstuvwxyz012345"
(gdb) break *0x4010b8          # store out[i]
(gdb) commands
> silent
> printf "i=%d out=%c\n", (int)$rdx, (int)$rcx & 0xff
> continue
> end
(gdb) continue
```

Les boucles avancent via **`cmove` / `cmovne` + `jmp rax`** (adresses de tête/fin de boucle empilées dans le frame local) — d’où « branchless branching ». Sous GDB : `stei` sur un `cmove` et regarde si `rax` bascule entre les deux cibles.

### 4.3 Phase compare (`pass[i] == out[i]+1`)

Dump `out[0..15]` après derive :

```text
(gdb) x/16cb 0x402091
```

Le password attendu est **chaque octet + 1**. Tu peux le reconstruire à la main ou via le solveur, puis rejouer :

```bash
python3 tools/branchless-branching-solve.py --user petik -q
# rn%5ielsrArvz"""

# sous gdb, break sur le message succès (string "Logged in as")
(gdb) find 0x402000, +0x100, 'L','o','g','g'
(gdb) break *<addr_du_write_success>
```

### 4.4 Astuce input

Les `read` ne mettent **pas** de `'\0'` automatiquement si tu tapes au clavier avec moins de 8/16 chars. En pipe, paddé avec `\0` (comme le solveur) pour coller au prédicat sur 8 octets username.

---

## 5. Vérification

```bash
python3 tools/branchless-branching-solve.py --user petik --check
# Logged in as petik → OK
```

---

## 6. Notes

- Binaire fichier nommé `branchless` ; challenge site = **branchless branching** (≠ id `68692748…` « branchless »).
- Suite : `branchless`, `jump`, `branchless-fixed`.
