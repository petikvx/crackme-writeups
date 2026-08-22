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
