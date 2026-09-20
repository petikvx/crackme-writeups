# vetementsvmnts's Tricky challenge or is it ?

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aac1a61dbb3353b753968c0) · id `6aac1a61dbb3353b753968c0`

ELF64 console **C**, strippé + `ptrace`. Diff. site **1.2**.  
Famille : [`../README.md`](../README.md).

| Fichier | Rôle |
|---|---|
| [`original/hard_crackme`](original/hard_crackme) | binaire |
| [`tools/tricky-challenge-solve.py`](tools/tricky-challenge-solve.py) | password / `--check` |

## Réponse

| | |
|---|---|
| **Password** | `supersecret123` |
| OK | `Access Granted! You are a master.` |
| KO | `Access Denied. Try again.` |
| Anti-debug | `Debugger detected! Get outta here.` (`ptrace` → `exit(1)`) |

```bash
python3 tools/tricky-challenge-solve.py -q
# supersecret123
printf '%s\n' supersecret123 | ./original/hard_crackme
# ou :
python3 tools/tricky-challenge-solve.py --check
```

---

## 1. Premier regard

```text
hard_crackme: ELF 64-bit LSB pie executable, x86-64, dynamically linked, stripped
sha256  200b94ef46a2f18d92e772995cb43b706bd09b3af778889e09024be93b1c3ca4
size    ~14 KiB
```

```bash
strings -n 4 original/hard_crackme
objdump -d -M intel original/hard_crackme | less
```

Messages visibles :

```text
Debugger detected! Get outta here.
Enter the secret password:
%49s
Access Granted! You are a master.
Access Denied. Try again.
```

Aussi des fragments bizarres du type `& %0'&06` / `06'0!dgf` : ce sont les **octets chiffrés** du password (avant XOR), pas le clair.

Imports : `ptrace`, `printf`, `scanf`, **`strcmp`**, `puts`, `exit`.  
Même famille toolchain que [My First](../6aa8ec52cab6678aefe9dda5/) / [KeygenMe](../6aa94afadbb3353b7539687a/).  
**Homonyme** : [a bit of a challenge](../6aaad62d48cda5a2aaa3de08/) s’appelle aussi `hard_crackme` — **autre** SHA-256.

---

## 2. Flow

1. Sous-fonction anti-debug : `ptrace(PTRACE_TRACEME, …)` ; si `-1` → message + `exit(1)`.
2. `printf("Enter the secret password: ")` → `scanf("%49s", input)`.
3. Construction d’un buffer 14 octets via 2× `movabs` sur la pile (string encodée).
4. Boucle : `out[i] = enc[i] XOR 0x55` pour `i = 0 .. 13`, puis NUL.
5. `strcmp(input, out)` → Granted / Denied.

---

## 3. Comment on trouve le password

### 3.1 Ancrage `ptrace`

```asm
1189:  ; helper anti-debug
11a6:  call   ptrace@plt
11ab:  cmp    rax, 0xffffffffffffffff
11af:  jne    ok
11b1:  lea    rdi, "Debugger detected! …"
11bb:  call   puts
11c5:  call   exit@plt          ; exit(1)
```

Sous GDB / déjà tracé : le binaire meurt avant le prompt. Le `--check` lance **sans** debugger.

### 3.2 Stack string encodée (2× `movabs`)

Après le `scanf` :

```asm
1209:  movabs rax, 0x3630262730252026
1213:  mov    QWORD PTR [rbp-0x4e], rax   ; enc[0..7]
1217:  movabs rax, 0x6667642130273630
1221:  mov    QWORD PTR [rbp-0x48], rax   ; écrit à +6 → chevauchement
1225:  mov    DWORD PTR [rbp-0x8], 0xe    ; longueur = 14
```

Disposition mémoire (14 octets utiles) :

```text
offset pile :  -0x4e              -0x48
octets      :  [0 1 2 3 4 5 6 7][0 1 2 3 4 5 6 7]  (2e movabs)
résultat    :  q1[0..5] + q2[0..7]   (q2 écrase q1[6..7])
```

En little-endian :

```python
import struct
q1 = struct.pack("<Q", 0x3630262730252026)  # b"& %0'&06"
q2 = struct.pack("<Q", 0x6667642130273630)  # b"06'0!dgf"
enc = q1[:6] + q2                           # 14 octets
# enc == b"& %0'&06'0!dgf"
```

### 3.3 XOR `0x55`

```asm
1235:  movzx  eax, BYTE PTR [rbp+rax*1-0x4e]  ; enc[i]
123f:  xor    eax, 0x55
1249:  mov    BYTE PTR [rbp+rax*1-0x80], dl   ; clear[i]
… jusqu’à i < 14, puis clear[14] = 0
1271:  call   strcmp@plt   ; input vs clear
```

Décodage :

```text
enc XOR 0x55  →  s u p e r s e c r e t 1 2 3
                 supersecret123
```

| `enc` | `^0x55` | char |
|---|---|---|
| `26 20 25 30 27 26` | `73 75 70 65 72 73` | `supers` |
| `30 36 27 30 21 64 67 66` | `65 63 72 65 74 31 32 33` | `ecret123` |

### 3.4 Pseudo-code

```python
import struct
enc = struct.pack("<Q", 0x3630262730252026)[:6] + struct.pack("<Q", 0x6667642130273630)
assert len(enc) == 14
password = bytes(b ^ 0x55 for b in enc).decode()  # "supersecret123"
```

### 3.5 Piège `strings`

`strings` montre `& %0'&06` / `06'0!dgf` (encodé) et **pas** `supersecret123`.  
Il faut lire les `movabs` + la boucle `xor …, 0x55`, pas chercher une C-string claire.

---

## 4. Vérification

```text
$ printf 'supersecret123\n' | ./original/hard_crackme
Enter the secret password: Access Granted! You are a master.

$ printf 'wrong\n' | ./original/hard_crackme
Enter the secret password: Access Denied. Try again.
```

```bash
python3 tools/tricky-challenge-solve.py --check
# … Access Granted / OK
```

---

## 5. Notes

- Password **fixe** (pas de keygen name→serial).
- Reverse 100 % statique ; GDB inutile pour la formule (et gênant à cause de `ptrace`).
- Suite plus costaude dans la famille : [a bit of a challenge](../6aaad62d48cda5a2aaa3de08/) (sigil 24 hex).
