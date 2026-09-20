# acheylate's Find the password Windows ver

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aac22ff48cda5a2aaa3de2d) · id `6aac22ff48cda5a2aaa3de2d`

PE64 **Rust** console — jumeau Windows du [Linux](../6aac1a0c585e8875bcbec009/). Diff. site **3.0**.

| Fichier | Rôle |
|---|---|
| [`original/crackme-01.exe`](original/crackme-01.exe) | binaire |
| [`tools/find-password-win-solve.py`](tools/find-password-win-solve.py) | password / `--check` Wine |

## Réponse

| | |
|---|---|
| **Password** | `HVUHADN` |
| OK | `Correct Password` |
| KO | `Incorrect password` |

```bash
python3 tools/find-password-win-solve.py -q
# HVUHADN
printf '%s\n' HVUHADN | wine original/crackme-01.exe
# ou :
python3 tools/find-password-win-solve.py --check
```

Même password que la version Linux (même prédicat).

---

## 1. Premier regard

```text
crackme-01.exe: PE32+ executable (console) x86-64, stripped
sha256  1f8c86a39b5c881e9f3a781d39970b4f10fd9bdd5eec9b2425d866fe20c16c97
size    ~260 KiB
```

```bash
strings -n 4 original/crackme-01.exe | grep -iE 'pass|correct|incorrect|enter'
objdump -d -M intel original/crackme-01.exe | less
# preuve live (serveur sans display) :
xvfb-run -a wine original/crackme-01.exe
```

```text
Enter the password:
Incorrect password
Correct Password
```

Comme sous Linux : **pas** de C-string `HVUHADN`. `strings` peut coller immediates + opcodes (`HVUH3` / `HADN3T`).

---

## 2. Flow

Identique au jumeau ELF :

1. Prompt + lecture stdin (Rust `String`).
2. Longueur == 7.
3. Deux XOR u32 LE chevauchants (`[0..3]` et `[3..6]`).
4. OR des résultats nul → `Correct Password`.

---

## 3. Comment on trouve le password

### 3.1 Ancrage PE

`.text` @ VMA `0x140001000`, file off `0x400`.  
Le check (même forme que Linux) :

```bash
objdump -d -M intel --start-address=0x140001fc0 --stop-address=0x140002000 original/crackme-01.exe
```

```asm
140001fd6:  cmp    r8, 0x7
140001fda:  jne    fail

140001fdc:  mov    ecx, 0x48555648      ; "HVUH" LE
140001fe1:  xor    ecx, DWORD PTR [rsi+rax]

140001fe4:  mov    edx, 0x4e444148      ; "HADN" LE
140001fe9:  xor    edx, DWORD PTR [rsi+rax+0x3]

140001fed:  or     edx, ecx
140001fef:  je     success              ; Correct Password
```

Sur le fichier brut (offset `0x13d6`) :

```text
49 83 f8 07 75 19 b9 48 56 55 48 33 0c 06 ba 48 41 44 4e 33 …
cmp r8,7        mov ecx,HVUH  xor     mov edx,HADN  xor
```

### 3.2 Assemblage (identique au Linux)

```text
index:     0 1 2 3 4 5 6
password:  H V U H A D N
fenêtre1:  H V U H          == 0x48555648
fenêtre2:        H A D N    == 0x4E444148
```

→ **`HVUHADN`**.

### 3.3 Lien avec le write-up Linux

Le chemin de découverte détaillé (piège `strings`, pseudo-code `check()`, cas KO longueur) est dans  
[`../6aac1a0c585e8875bcbec009/README.md`](../6aac1a0c585e8875bcbec009/README.md).  
Ici on ne refait que l’ancrage PE / Wine : **même** immediates, **même** chevauchement.

### 3.4 Pseudo-code

```python
def check(pw: bytes) -> bool:
    if len(pw) != 7:
        return False
    w0 = int.from_bytes(pw[0:4], "little") ^ 0x48555648
    w1 = int.from_bytes(pw[3:7], "little") ^ 0x4E444148
    return (w0 | w1) == 0
# check(b"HVUHADN") is True
```

---

## 4. Vérification

```text
$ printf 'HVUHADN\n' | wine original/crackme-01.exe
Enter the password: Correct Password

$ printf 'HVUHXXX\n' | wine original/crackme-01.exe
Enter the password: Incorrect password
```

```bash
python3 tools/find-password-win-solve.py --check
# … Correct Password / OK
```

Sans display : `xvfb-run -a wine …` (ou le solveur qui appelle déjà `wine`).

---

## 5. Notes

- Mot de passe **fixe**, partagé avec le twin Linux.
- Reverse statique (`strings` + `objdump` PE) ; x64dbg optionnel si MCP actif.
- Diff. site un peu plus haute (3.0) : packaging Windows / Rust, pas un autre prédicat.
