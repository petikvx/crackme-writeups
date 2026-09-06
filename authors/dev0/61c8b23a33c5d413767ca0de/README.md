# dev0 — x64_crackme_keygen

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/61c8b23a33c5d413767ca0de) · id `61c8b23a33c5d413767ca0de`

ELF64 **statique**, non strippé : keygen name → serial.  
Auteur : [dev0](https://crackmes.one/user/dev0).

Dossier : `authors/dev0/61c8b23a33c5d413767ca0de/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`crack`](original/crack) | binaire (~8,9 Ko) |
| [`x64-keygen-solve.py`](tools/x64-keygen-solve.py) | keygen + `--check` live |

## Réponse

| User | Serial |
|---|---|
| **`petik`** | **`1952`** (`0x7a0`) |

```bash
python3 tools/x64-keygen-solve.py -q
# 1952
python3 tools/x64-keygen-solve.py --check
# … Correct! / OK
```

---

## 1. Premier regard

```text
ELF 64-bit LSB executable, x86-64, statically linked, not stripped
sha256: d188bf3a2b64faf7d30bee73ff83d3b57d9661250161b0cbc680fa4a2fb0a440
strings: Enter your name: / Enter your serial: / Correct! / Incorrect!
         /proc/ + maps
```

Syscalls manuels (pas de libc) ; HWID soft via `/proc/self/maps`.

---

## 2. Flow

```text
write "Enter your name:"  → read name  (len < 20)
write "Enter your serial:" → read serial string → atoi
open/read /proc/<pid>/maps
  parse 1re ligne → adresse de base affichée "401000…"
  xor_key = Σ ASCII des digits d’adresse avant le '-'  (= sum("401000") = 0x185)
serial_calc = 0
for each name byte c:
    edx = (edx & ~0xff) | c
    edx ^= xor_key
    serial_calc += edx
cmp serial_calc, atoi(serial) → Correct! / Incorrect!
```

Sur ce binaire le mapping fixe commence à `0x401000` → clé **toujours `0x185`**.

---

## 3. Keygen

```python
XOR_KEY = 0x185
eax = edx = 0
for c in name:
    edx = (edx & 0xffffff00) + ord(c)
    edx ^= XOR_KEY
    eax = (eax + edx) & 0xffffffff
# petik → 1952
```

Astuce / bypass : un name qui commence par `\\0` donne serial `0` (boucle sur longueur effective 0) — le write-up documente le vrai prédicat.

---

## Debug GDB (pas à pas)

ELF64 **statique**, symbole `crack`. Keygen via `/proc/self/maps` → XOR **`0x185`**.

```bash
gdb -q ./original/crack
(gdb) break *crack+284          # syscall open sur /proc/.../maps
(gdb) run
# saisir petik (Entrée), attendre le 2e prompt, puis 1952
```

Piège stdin : ne pas coller name+serial d’un coup — le solveur temporise.

```text
(gdb) # après open/read maps : la clé dérivée des digits d’adresse vaut 0x185
(gdb) # (sum ASCII de "401000") ; puis name[i] XOR clé → serial
```

Session simple hors stepper :

```bash
python3 tools/x64-keygen-solve.py --user petik --check
# Correct! / OK
```

## 4. Vérification

**Attention stdin** : un seul `printf 'petik\\n1952\\n' | ./crack` peut faire manger name+serial dans le **premier** `read` → `Incorrect!`.  
Il faut deux écritures espacées (comme le solveur `--check`) ou un terminal interactif.

```bash
python3 tools/x64-keygen-solve.py --user petik --check
# Enter your name: Enter your serial: Correct!
```

---

## 5. Notes

- ELF Linux → gdb / objdump ; x64dbg N/A.
- Clé dérivée des maps : portable en théorie si rebase, ici image fixe `0x401000`.
