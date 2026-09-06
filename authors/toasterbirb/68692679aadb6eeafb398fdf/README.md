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

## 4. Vérification

```bash
python3 tools/branchless-branching-solve.py --user petik --check
# Logged in as petik → OK
```

---

## 5. Notes

- Binaire fichier nommé `branchless` ; challenge site = **branchless branching** (≠ id `68692748…` « branchless »).
- Suite : `branchless`, `jump`, `branchless-fixed`.
