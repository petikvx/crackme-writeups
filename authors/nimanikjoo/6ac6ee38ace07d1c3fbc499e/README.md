# NimaNikjoo's nightmare CrackMe

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ac6ee38ace07d1c3fbc499e) · id `6ac6ee38ace07d1c3fbc499e`

PE64 **Go** console, **garble** (pclntab / noms / littéraux). Diff. site **5.0** (250 pts), quality **4.0**.  
Description : *Find Password or Patch the File to capture the Flag*.

| Fichier | Rôle |
|---|---|
| [`original/nightmare.exe`](original/nightmare.exe) | binaire d’origine |
| [`tools/nightmare-solve.py`](tools/nightmare-solve.py) | password / flag / `--check` |
| [`analysis/nightmare.exe.i64`](analysis/nightmare.exe.i64) | base IDA (gitignorée) |

## Réponse

| | |
|---|---|
| **Password** | `G0_VM_15_H4RD_4S_H3LL_2026!` |
| **Flag** | `CTF{G0_VM_15_H4RD_4S_H3LL_2026!}` |
| OK | `Access granted!` puis `Flag: CTF{G0_VM_15_H4RD_4S_H3LL_2026!}` |
| KO | `Wrong password.` |

Login **fixe** (pas un keygen name→serial). Le flag est le password enveloppé dans `CTF{…}`.

```bash
python tools/nightmare-solve.py
# password G0_VM_15_H4RD_4S_H3LL_2026!
# flag     CTF{G0_VM_15_H4RD_4S_H3LL_2026!}
python tools/nightmare-solve.py -q
# CTF{G0_VM_15_H4RD_4S_H3LL_2026!}
python tools/nightmare-solve.py --check
```

Preuve native (Windows, stdin) :

```text
Enter password: Access granted!
Flag: CTF{G0_VM_15_H4RD_4S_H3LL_2026!}
```

---

## 1. Premier regard

```text
nightmare.exe  PE32+ console x86-64  Go (garble)
sha256  8b964f769eb1c2bb3c54d9bb0fdf52dec7062b6f4edba392cfe2ae5eb69270c5
md5     67c7c81de77e4c00c63b1fc3ce484bcd
size    4888064  (~4.66 MiB)
ImageBase IDA  0x140000000
```

`GoReSym` / `go version -m` : pclntab **effacé**. Les symboles Go (y compris `main.main`) sont **garbled**. Les chaînes utiles (`Enter password:`, `Access granted!`, `Flag:`, `Wrong password.`, le flag lui-même) ne sont **pas** en clair : littéraux chiffrés, déchiffrés à l’impression via `WriteConsoleW` (UTF-16).

Un `strings` large remonte du runtime Go (`crypto/sha256`, `os.Stdin`, …) et des constantes « décoratives » (`0xDEADBEEF`, `0xC0DEC0DE…`) collées dans le builder de bytecode. Ce n’est **pas** le password.

---

## 2. Flow

`main` = `sub_1402E5960` (IDA, ImageBase `0x140000000`) :

1. Prompt `Enter password:` (`sub_1402E6DA0`) + lecture stdin Go.
2. Builder de bytecode `sub_1402E5720` (PUSH d’immediates + opcodes).
3. Interpréteur `sub_1402E4460` : pile u64, opcode 12 = SHA-256(`password || LE64(x)`), 8 premiers octets en LE.
4. Opcode 20 → succès : `sub_1402E72E0` (`Access granted!`) puis `sub_1402E7520` (`Flag: …`, 39 chars UTF-16).
5. Opcode 21 → `sub_1402E7760` (`Wrong password.`).

SHA-256 runtime Go : `New` `0x1402E8D40` / `Write` `0x1402E8E20` / `Sum` `0x1402E90C0`.

---

## 3. Comment on trouve le password / le flag

### 3.1 Ancrage IDA (MCP `ida`)

Base ouverte sur `original/nightmare.exe`, puis déplacée sous `analysis/`. Hex-Rays se trompe souvent sur les **slices Go** (ptr/len internés) : le listing asm autour de `0x1402E4CA5`–`0x1402E4D64` (dispatch opcode 12) fait foi.

`main` construit un programme VM **linéaire** (pas un maze). Le builder pousse une série d’opcodes + immediates u64.

### 3.2 Table d’opcodes (`sub_1402E4460`)

| op | Nom | Effet |
|---|---|---|
| 0 | NOP | — |
| 1 | PUSH | imm64 |
| 2 | POP | — |
| 3 | DUP | — |
| 4 | ADD | u64 |
| 5 | SUB | u64 |
| 6 | XOR | u64 |
| 7 | AND | — |
| 8 | OR | — |
| 9 | SHL | — |
| 10 | SHR | — |
| 11 | ROL64 | `rol(pop, pop)` |
| 12 | HASH | `SHA256(password \|\| LE64(pop))[:8]` → uint64 LE |
| 13 | CMPEQ | pousse 0/1 |
| 14 | JMP | rel32 |
| 15 | JZ | — |
| 16 | JNZ | — |
| 17 | LOADBYTE | `password[idx]` |
| 18 | STORE_REG | — |
| 19 | LOAD_REG | — |
| 20 | SUCCESS | print flag |
| 21 | FAIL | `Wrong password.` |
| 22 | TIMING | si elapsed > 500 ms → FAIL (anti-debug) |
| 24 | MIX4 | 4 mots (absent de **ce** bytecode) |

### 3.3 Bytecode réellement émis

```text
22                          ; timing gate
PUSH  0xA5A5A5A5A5A5A5A5
PUSH  0x5A5A5A5A5A5A5A5A
XOR
PUSH  0xC0DEC0DEC0DEC0DE
ADD
PUSH  13
ROL
HASH 12                     ; h = SHA256(pw || LE64(x))[:8] LE
PUSH  0x1337133713371337
XOR
PUSH  0xDEADBEEF
ADD
PUSH  19
ROL
PUSH  0xE00CF2F3BFC67B27    ; cible
CMPEQ
JNZ   +1
FAIL
SUCCESS
```

Les immediates sont dans le PE (LE) : le solveur `--check` les cherche.

### 3.4 Prédicat (côté clair)

```text
x = ROL64( (0xA5A5A5A5A5A5A5A5 ^ 0x5A5A5A5A5A5A5A5A)
           + 0xC0DEC0DEC0DEC0DE , 13 )
  = 0xD81BD81BD81BB81B

h_attendu = (ROR64(0xE00CF2F3BFC67B27, 19) - 0xDEADBEEF)
            ^ 0x1337133713371337
          = 0xDC53EF37AC87AA3E
          = octets LE  3e aa 87 ac 37 ef 53 dc

SHA256(password || LE64(x))[:8]  ==  3eaa87ac37ef53dc
```

`x` ne dépend **pas** du password : c’est un sel constant. Le password est le préimage SHA-256 des 8 premiers octets. 27 caractères → brute force absurde.

Opcode **17** (LOADBYTE) existe dans la VM mais **n’est pas utilisé** ici : on ne peut pas extraire le password caractère par caractère depuis le bytecode.

### 3.5 Dump live du flag (x64dbg) puis preuve SHA-256

Le site autorise **Find Password or Patch**. Chemin patch utilisé pour **lire** le flag (pas pour « gagner » sans le comprendre) :

- Image x64dbg `nightmare.exe` base `0x7FF6E4DB0000` (delta vs IDA = base − `0x140000000`).
- Après l’appel prompt (`call` IDA `0x1402E5A08` → live `0x7FF6E5095A08`), JMP vers le chemin succès **après** le `JZ` de la VM : live `0x7FF6E5095C8C`.
- `WriteConsoleW` : d’abord `Access granted!`, ensuite 39 wchar `Flag: CTF{G0_VM_15_H4RD_4S_H3LL_2026!}`.

Vérif hors debugger : `SHA256(b"G0_VM_15_H4RD_4S_H3LL_2026!" + le64(x))[:8]` = `3eaa87ac37ef53dc`. C’est **le** password du prédicat.

Piège : un `xor eax,eax ; xor ebx,ebx ; ret` sur le `read` stdin Go casse l’ABI (len/ptr) → `FatalExit`. Mieux : JMP après le prompt, ou laisser le read et patcher le verdict.

---

## 4. Prédicat consolidé

```python
x = rol64(((0xA5A5A5A5A5A5A5A5 ^ 0x5A5A5A5A5A5A5A5A) + 0xC0DEC0DEC0DEC0DE) & MASK, 13)
h = int.from_bytes(sha256(password.encode("ascii") + pack("<Q", x)).digest()[:8], "little")
y = rol64((h ^ 0x1337133713371337) + 0xDEADBEEF, 19)
ok = (y == 0xE00CF2F3BFC67B27)
```

Implémenté dans [`tools/nightmare-solve.py`](tools/nightmare-solve.py).

---

## 5. Debug x64dbg (pas à pas)

MCP `x64dbg` **actif** sur `nightmare.exe` pendant le reverse (après restart, PID ~1852).

1. `GetDebugState` : module `nightmare.exe`, PE64, paused.
2. Break sur `kernel32.WriteConsoleW` pour voir les littéraux déchiffrés (UTF-16).
3. Opcode **22** : si on *step* trop longtemps dans la VM, elapsed > 500 ms → FAIL **même avec le bon password**. La preuve du password se fait **hors debugger** (stdin natif).
4. Patch JMP `0x7FF6E5095A0D` → `0x7FF6E5095C8C` : dump du flag sans satisfaire le hash (chemin « patch » prévu par l’auteur).
5. ABI Go : `AX`/`BX`/`CX`/`DI` portent les slices ; un ret forcé à 0/0 sur un `read` n’est pas un skip inoffensif.

Le debug live **complète** le dump du flag. Le solveur + run natif **prouvent** le prédicat.

---

## 6. Vérification

```text
python tools/nightmare-solve.py --check
# G0_VM_15_H4RD_4S_H3LL_2026!
# CTF{G0_VM_15_H4RD_4S_H3LL_2026!}
# OK
```

| Input | Sortie |
|---|---|
| `G0_VM_15_H4RD_4S_H3LL_2026!` | `Access granted!` / `Flag: CTF{G0_VM_15_H4RD_4S_H3LL_2026!}` |
| `wrong` | `Wrong password.` |

Run : `ProcessStartInfo` + stdin UTF-8, working directory = `original/`. Sous debugger, opcode 22 peut faire échouer un password correct.

---

## 7. Notes

- **Garble** : pas de pclntab, pas de C-string du flag, Hex-Rays peu fiable sur les slices.
- **Anti-debug timing** (opcode 22, 500 ms) : step trop lent → FAIL.
- **Deux chemins** prévus : retrouver le password **ou** patcher vers opcode 20 / le `JZ` succès.
- Opcode 17 (index password) n’est pas câblé dans **ce** programme VM.
- Un brute 5 caractères `[a-z0-9]` (hypothèse trop courte) ne match pas : le secret fait **27** chars.
- Ne pas patcher `original/nightmare.exe` ; dumps IDA dans `analysis/`.
