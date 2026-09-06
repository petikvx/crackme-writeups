# pipedown's I need to be honest

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/69cd43df49fa49a2a2602312) · id `69cd43df49fa49a2a2602312`

Crackme **ELF64** Linux, **asm** (syscalls), **statique**, **non strippé**.  
Auteur site : **pipedown**.

Dossier : `authors/pipedown/69cd43df49fa49a2a2602312/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/ineedtobehonest`](original/ineedtobehonest) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`tools/ineedtobehonest-solve.py`](tools/ineedtobehonest-solve.py) | password + XOR flags / `--run` |
| [`analysis/ok.txt`](analysis/ok.txt) | run live (password + 3 flags) |

## Réponse

| Input | Valeur |
|---|---|
| Password | **`SecurePass_2k26_X64_Reverse`** |
| Flag 1 | `<FLAG>CRYPTO_KEY_ALPHA_2026</FLAG>` |
| Flag 2 | `<FLAG>REVERSE_ENGINEERING_CHALLENGE</FLAG>` |
| Flag 3 | `<FLAG>MEMORY_HIDDEN_GAMMA_X64</FLAG>` |

```bash
python3 tools/ineedtobehonest-solve.py -q
# SecurePass_2k26_X64_Reverse

python3 tools/ineedtobehonest-solve.py --flags

printf 'SecurePass_2k26_X64_Reverse\n' | ./original/ineedtobehonest
# [+] PASSWORD VERIFIED!
# <FLAG>CRYPTO_KEY_ALPHA_2026</FLAG>
# …
```

---

## 1. Premier regard

```text
file original/ineedtobehonest
# ELF 64-bit LSB executable, x86-64, statically linked, not stripped
```

Source symbole : `ineedtobehonest.asm`. I/O 100 % **syscalls** (`read`/`write`/`exit`).

Banner :

```text
REVERSE ENGINEERING CHALLENGE v3.14159
[*] This binary contains 3 hidden flags
[>] Enter password:
```

`strings` laisse déjà fuiter le password **et** les trois plaintexts — d’où le titre (*be honest*).

Hashes :  
MD5 `2afbf73c8d2ceea3e74939ee60af66b9` · SHA-256 `ef2711822d6491a8ff9a8cb4eb536cb47ad46ea16752ecf5e2067f299b38601e`.

Site : difficulty **1.6** · quality **4.5** · labels string encryption / XOR.

---

## 2. Password

Symbole `actual_password` @ **`0x4011a3`**, longueur **`0x1b`** (27) :

```text
SecurePass_2k26_X64_Reverse
```

`password_verify_loop` : compare octet à octet `input_buffer` ↔ `actual_password`, accumule la somme dans `r8`.

`verify_checksum` : `r8` doit égaler `password_checksum` @ `0x4011be` = **`0x9be`** (= somme ASCII du password).

(Les `nop` après le `cmp` de longueur ne bloquent rien.)

---

## 3. Flags (XOR)

`xor_decrypt(rsi=src, rdi=dst, rcx=len)` avec clé dans **`eax`/`bl`** :

| Flag | Encrypted VA | Len | Clé |
|---|---|---|---|
| 1 | `flag1_encrypted` `0x4011f0` | `0x22` | **`0x47`** |
| 2 | `flag2_encrypted` `0x40123c` | `0x2a` | **`0x5a`** |
| 3 | `flag3_encrypted` `0x40128a` | `0x24` | **`0x6c`** |

Les plaintexts sont **aussi** stockés juste à côté (`flagN_plaintext`) — inutile de XOR pour « tricher », mais le chemin honnête passe par le decrypt après le password.

---

## Debug GDB (pas à pas)

ELF64 **statique**, **non strippé** — idéal pour GDB (`break password_verify_loop`, etc.).

```bash
gdb -q ./original/ineedtobehonest
(gdb) info variables actual_password password_checksum flag1_
(gdb) x/s &actual_password
# SecurePass_2k26_X64_Reverse
(gdb) x/hx &password_checksum
# 0x09be
```

| Symbole / VA | Rôle |
|---|---|
| `_start` `0x4000b0` | banner + `read` → `input_buffer` `@0x4012c8` |
| `password_verify_loop` | cmp octet / accumule somme dans `r8` |
| `verify_checksum` | `r8 == 0x9be` |
| `xor_decrypt` | flags avec clés `0x47` / `0x5a` / `0x6c` |

### Vérifier le password sous GDB

```text
(gdb) break password_verify_loop
(gdb) run < <(printf 'SecurePass_2k26_X64_Reverse\n')
(gdb) # à chaque tour : print/c $al  vs  expected
(gdb) break verify_checksum
(gdb) continue
(gdb) print/x $r8               # 0x9be si password exact
```

Mauvais password → branche fail (flags non décryptés sur le chemin d’échec).

### XOR flags (chemin honnête)

```text
(gdb) break xor_decrypt
(gdb) commands
> silent
> printf "xor key=0x%02x len=%d\n", $eax & 0xff, (int)$rcx
> continue
> end
(gdb) continue
# trois hits : 0x47, 0x5a, 0x6c
(gdb) x/s &decrypted_flag1
```

Comparer avec `x/s &flag1_plaintext` — mêmes strings, d’où le titre.

---

## 4. Vérification

```bash
python3 tools/ineedtobehonest-solve.py --check SecurePass_2k26_X64_Reverse
# OK

printf 'SecurePass_2k26_X64_Reverse\n' | ./original/ineedtobehonest
```

Preuve : [`analysis/ok.txt`](analysis/ok.txt).

---

## Notes

- Challenge débutant : labels non strippés, password + flags en clair dans `.data`.
- Le « besoin d’être honnête » : résister à la tentation de ne lire que `strings`.
- `chmod +x original/ineedtobehonest` si besoin après ZIP.
