# FentCat's Assembler Crackme

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/68fce1922d267f28f69b783a) · id `68fce1922d267f28f69b783a`

Crackme **PE32** Windows console, asm (symbols COFF / `src/main.asm`), toolchain type MinGW / MASM.  
Auteur site : **FentCat**.

Dossier : `authors/fentcat/68fce1922d267f28f69b783a/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/crackme.exe`](original/crackme.exe) | binaire d’origine |
| [`tools/assembler-crackme-solve.py`](tools/assembler-crackme-solve.py) | extrait / vérifie le password |
| [`analysis/crackme.exe.i64.c`](analysis/crackme.exe.i64.c) | Hex-Rays (`decc`) |
| [`README.md`](README.md) | ce write-up |

## Réponse

| Input | Valeur |
|---|---|
| Password | **`@CBEDGFI`** (8 caractères) |

Pas de username.

```bash
python3 tools/assembler-crackme-solve.py -q
# @CBEDGFI

python3 tools/assembler-crackme-solve.py --check
# OK
```

Live (Wine + console / PTY — `ReadConsoleA` veut un `\r` / `\r\n`) :

```bash
# via le solveur (PTY) ou à la main sous wineconsole
wineconsole original/crackme.exe
# Enter password → @CBEDGFI  →  Welcome :O
```

---

## 1. Premier regard

```text
file original/crackme.exe
# PE32 executable for MS Windows 4.00 (console), Intel i386, 6 sections
# DIE : Compiler MinGW
```

Hashes :  
MD5 `d984f4a4bbb82a815f0c16f55335db9a` · SHA-256 `104f850cf4e7d3f6bc09d286fcbe651795c632a79ebbc2242ea8be08cd8b8e41`.

Banner / messages (`.data`) :

| VA | Contenu |
|---|---|
| `0x402000` | `AdvancedCrackMe v2.0` |
| `0x402015` | `Enter password ` |
| `0x402025` | `Welcome :O` |
| `0x402030` | `Authentication Failed` |
| `0x402046` | `Hint: The password transforms mysteriously` |
| `0x402071` | `Warning: System integrity check running...` |
| `0x4021db` | **`@CBEDGFI`** ← cible réelle (`encoded_data`) |

Leurres visibles dans les strings / labels : `Debugger detected!`, `Checksum verification failed!`, `fake_pass1`…`fake_pass3`, `xor_mask`, `shift_keys`, décode XOR/ADD mort.

I/O Win32 : `GetStdHandle` / `ReadConsoleA` / `WriteConsoleA` / `ExitProcess`.

---

## 2. Flow

```text
_start:
  fake_anti_debug()          ; écrit juste 0x12345678 en BSS — no-op
  GetStdHandle(STD_OUTPUT / STD_INPUT)
  print title, hint1, hint2
  fake_checksum()            ; cmpsb entre decoys — résultat ignoré
  print "Enter password "
  ReadConsoleA(buffer@0x4020d9, 0x100) → bytes_read
  if bytes_read ∉ {9, 10}:   ; 8 chars + \r  ou  \r\n
      → fail
  buffer[8] = 0
  if validate_password():    ; cmp 8 octets vs encoded_data
      → "Welcome :O"
  else:
      fake_validation_1/2()  ; encore des leurres ; succès → fail quand même
      → "Authentication Failed"
  ExitProcess(0)
```

---

## 3. Prédicat

`validate_password` (`0x4010b8`) :

```text
esi = buffer      @ 0x4020d9
edi = encoded_data @ 0x4021db
ecx = 8
loop: lodsb / cmp [edi] ; jne fail_path
→ eax = 1

fail_path (jamais utilisé pour le succès) :
  pour i in 0..7: temp[i] = (buffer[i] ^ 2) + 5
  eax = 0
```

Donc le password est **littéralement** les 8 octets en clair à `0x4021db` :

```text
@CBEDGFI
```

Les appels `fake_*` et le message « transforms mysteriously » poussent vers un faux décodage ; le chemin gagnant ne transforme rien.

Contrainte de longueur : `ReadConsoleA` doit renvoyer **9** ou **10** (`8 + \\r` ou `8 + \\r\\n`). Sous Wine, un pipe nu sans PTY rate souvent le compteur → passer par un PTY / `wineconsole` (comme le `--check` du solveur).

---

## 4. Vérification

```bash
python3 tools/assembler-crackme-solve.py -q          # → @CBEDGFI
python3 tools/assembler-crackme-solve.py --check     # → OK (Wine + PTY)
python3 tools/assembler-crackme-solve.py --check 'wrongpwd'
# FAIL
```

Décompilation : `bash -ic 'decc original/crackme.exe'` → [`analysis/crackme.exe.i64.c`](analysis/crackme.exe.i64.c).

---

## 5. Notes

- Challenge « AdvancedCrackMe v2.0 » surtout pédagogique : beaucoup de bruit, prédicat = `memcmp` 8 octets.
- `fake_anti_debug` / `fake_checksum` ne branchent jamais sur un abort malgré les strings associées.
- Si `fake_validation_1` ou `_2` « réussit » (password = un fake), le `_start` traite ça comme **échec** (`jne fail`) — seuls les 8 bons octets ouvrent `Welcome :O`.
- Pas de keygen / HWID / username.
