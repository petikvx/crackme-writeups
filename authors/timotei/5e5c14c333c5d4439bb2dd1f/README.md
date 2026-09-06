# timotei-crackme-01

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5e5c14c333c5d4439bb2dd1f) · id `5e5c14c333c5d4439bb2dd1f`


Crackme ELF64 Linux, asm statique, non strippé.
Auteur : timotei (crackmes.one). Analyse statique + reconstruction des checks.

Dossier : `authors/timotei/5e5c14c333c5d4439bb2dd1f/` — [série](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`timotei-crackme-01`](original/timotei-crackme-01) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`timotei-crackme-01-solve.py`](tools/timotei-crackme-01-solve.py) | solveur PIN + FNV-1 (section 6) |
| [`timotei-crackme-01-idapro.asm`](analysis/timotei-crackme-01-idapro.asm) | listing IDA (section 8) |
| [`timotei-crackme-01.c`](tools/timotei-crackme-01.c) | Hex-Rays 9.4 (section 8) |
| [`timotei-crackme-01-nasm.asm`](tools/timotei-crackme-01-nasm.asm) | source reconstruit NASM (section 9) |
| [`timotei-crackme-01-fasm.asm`](tools/timotei-crackme-01-fasm.asm) | source reconstruit FASM (section 9) |

Réponses acceptées :

| Input | Valeur | Rôle |
|---|---|---|
| PIN | `777` | checksum valide (3 chiffres) |
| PIN | `1509` | checksum valide (4 chiffres) |
| Réponse 2 | `+HCU` | unique match du hash 32 bits |

Le PIN n’est **pas unique**. `777` et `1509` sont deux solutions du même prédicat. `+HCU` est unique parmi les chaînes imprimables de 4 octets.

---

## 1. Premier regard

```
file timotei-crackme-01
# ELF 64-bit LSB executable, x86-64, statically linked, not stripped

readelf -h  → Entry point 0x401000
readelf -s  → labels encore présents
strings -a -t x
```

Chaînes utiles (section `.data` à `0x402000`) :

| VA | Label | Texte |
|---|---|---|
| `0x402000` | `Credit` | `._:timotei crackme#1:_...thanks GrbavaCigla for beta testing!` |
| `0x40203e` | `message` | `.:knock,knock...your pin please...: ` |
| `0x402063` | `message2` | `.:Where did +Fravia taught us? : ` |
| `0x402085` | `message2_help` | `No need to patch or bruteforce, explore the web...` |
| `0x4020b9` | `good` | `.:Good, that's all for history lesson today:-)` |
| `0x4020e8` | `buffer` | PIN (10 octets, pré-rempli de zéros) |
| `0x40214c` | `buffer2` | 2ᵉ réponse (10 octets) |
| `0x4021b0` | `dummy` | drain du reste de la ligne |

Fichier source encore dans la table des symboles : `timo#1_final.asm`.
Labels de code : `_start`, `_garbage`, `go_on`, `nextbyte`, `goodway`, `out`.

Il n’y a **aucun import** (pas de libc, pas d’IAT). Toute l’I/O passe par `syscall` (`0F 05`).

Convention Linux x64 :

```
rax = numéro de syscall
rdi = arg1
rsi = arg2
rdx = arg3
syscall
```

Numéros utilisés ici :

| rax | Nom | Équivalent Windows |
|---|---|---|
| 0 | `read` | `ReadFile(GetStdHandle(-10), ...)` |
| 1 | `write` | `WriteFile(GetStdHandle(-11), ...)` |
| 60 (`0x3c`) | `exit` | `ExitProcess` |

---

## 2. Flow global

```
_start
    write(stdout, message, 0x24)          ; "knock,knock...your pin please"
    read (stdin,  buffer,  10)
    si le dernier octet lu n'est pas '\n' :
        lire 1 octet à la fois dans dummy jusqu'au '\n'     ; _garbage
    strlen(buffer)                        ; repnz scasb jusqu'au 0
    si longueur <= 3 : exit
    CHECK PIN  ── fail → exit
    write(stdout, message2, 0x21)         ; "Where did +Fravia taught us?"
    read (stdin,  buffer2, 10)
    drain éventuel                        ; _garbage2
    CHECK FNV-1 32 bits sur 4 octets ── fail → exit
    write(stdout, good, 0x2f)
    exit(0)
```

Deux inputs, deux prédicats indépendants. Le PIN ouvre la 2ᵉ question. La 2ᵉ réponse débloque le message final.

Le premier `write` n’a **pas** de `\n` final. En pipe, il faut envoyer les deux lignes en deux `write()` séparés, sinon le premier `read(10)` avale PIN + réponse d’un coup.

---

## 3. Comment le PIN est vérifié

Listing (intel) à partir de `_garbage_end` :

```
40105d  mov  edi, 0x4020e8      ; buffer
401062  sub  ecx, ecx
401064  sub  al,  al            ; chercher le 0
401066  not  ecx                ; ecx = 0xFFFFFFFF
401068  cld
401069  repnz scasb             ; strlen classique
40106b  not  ecx
40106d  dec  ecx                ; ecx = strlen
40106f  mov  eax, ecx
401071  cmp  eax, 3
401074  jle  out                ; trop court → exit

40107a  dec  eax                ; eax = strlen - 1
40107c  xor  ebx, ebx
40107e  mov  edx, 0x539         ; 1337
401083  mov  ecx, 0x4020e8
401088  mov  esi, ecx           ; esi = &buffer[0]

40108a  __:
40108a  mov  bl, [ecx+1]        ; octet suivant
40108e  add  edx, ebx
401090  inc  ecx
401092  dec  eax
401094  jne  __

401096  add  edx, edx           ; edx *= 2
401098  mov  eax, edx
40109a  xor  edx, edx
40109c  mov  ecx, 0x11          ; 17
4010a1  div  ecx                ; edx = reste
4010a3  add  dl, 0x30           ; reste + '0'
4010a6  mov  al, [esi]          ; 1er caractère du PIN
4010a9  sub  dl, al
4010ab  test dl, dl
4010ad  je   go_on              ; égalité → PIN accepté
4010af  jmp  out
```

En clair :

```
len = strlen(buffer)          # le '\n' compte, le 0 de fin non
si len <= 3 : fail

acc = 1337
pour i = 1 .. len-1 :         # tout sauf le 1er octet
    acc += buffer[i]          # y compris le '\n'

acc = acc * 2
reste = acc % 17
buffer[0] doit être égal à (reste + 0x30)
```

Conséquences :

1. `0x539 = 1337` est le **seed**, pas le PIN. `1337` lui-même échoue (voir plus bas).
2. Le prédicat ne fixe que le **premier caractère** en fonction de la somme des suivants. Il y a donc **beaucoup** de PIN valides.
3. Le `\n` (valeur 10) entre dans la somme dès que l’utilisateur valide avec Entrée. Il faut le compter, sinon les calculs sont faux.

### Reconstruction du prédicat

Soit `c0, c1, …, c_{n-2}, 10` le buffer (`10` = `'\n'`).

```
(1337 + c1 + c2 + … + c_{n-2} + 10) * 2  ≡  (c0 - 0x30)   (mod 17)
```

`c0` doit être un chiffre affichable : le reste doit donc être dans `0..9` (pas `10..16`, sinon le caractère attendu serait `:` `;` `<` `=` `>` `?` `@`).

On ne « devine » pas un secret unique. On **énumère** les PIN numériques courts et on garde ceux qui satisfont l’égalité.

### 3 chiffres + `'\n'` — d’où vient `777`

Buffer : `'7' '7' '7' '\n'`  
`strlen = 4` (passe le `cmp eax, 3`).  
Boucle `strlen-1 = 3` itérations : on additionne `buf[1]`, `buf[2]`, `buf[3]`.

| Étape | Octet | Valeur | acc |
|---|---|---:|---:|
| seed | | | 1337 |
| + `buf[1]` | `'7'` | 55 | 1392 |
| + `buf[2]` | `'7'` | 55 | 1447 |
| + `buf[3]` | `'\n'` | 10 | 1457 |
| `× 2` | | | **2914** |

```
2914 = 17 × 171 + 7
reste = 7
caractère attendu = 7 + 0x30 = 0x37 = '7'
premier caractère réel = '7'
```

Égalité → `je go_on`. `777` est un PIN valide.

Parmi les 3 chiffres, la famille ressemble à une suite de pas 9 (`129 138 147 … 777 786 … 996`). `777` sort tout seul à l’œil dans cette liste, c’est pour ça qu’on le retient comme exemple court.

### 4 chiffres + `'\n'` — d’où vient `1509`

Buffer : `'1' '5' '0' '9' '\n'`  
`strlen = 5`. Boucle de 4 : `buf[1..4]`.

| Étape | Octet | Valeur | acc |
|---|---|---:|---:|
| seed | | | 1337 |
| + `buf[1]` | `'5'` | 53 | 1390 |
| + `buf[2]` | `'0'` | 48 | 1438 |
| + `buf[3]` | `'9'` | 57 | 1495 |
| + `buf[4]` | `'\n'` | 10 | 1505 |
| `× 2` | | | **3010** |

```
3010 = 17 × 177 + 1
reste = 1
caractère attendu = 1 + 0x30 = 0x31 = '1'
premier caractère réel = '1'
```

Égalité → PIN valide.

`1509` apparaît dans l’énumération des 9000 PIN à 4 chiffres (537 solutions). Rien de magique dans ce nombre précis : n’importe quel autre hit (`1059`, `1338`, `1545`…) marche pareil.

### Contre-exemple : pourquoi `1337` échoue

C’est le piège naturel : le seed est `0x539 = 1337`, donc on tente `1337`.

| Étape | Octet | Valeur | acc |
|---|---|---:|---:|
| seed | | | 1337 |
| + `'3'` | 51 | | 1388 |
| + `'3'` | 51 | | 1439 |
| + `'7'` | 55 | | 1494 |
| + `'\n'` | 10 | | 1504 |
| `× 2` | | | **3008** |

```
3008 = 17 × 176 + 16
reste = 16
caractère attendu = 16 + 0x30 = 0x40 = '@'
premier caractère réel = '1'
```

`1 ≠ @` → `jmp out`. Le programme quitte sans afficher la 2ᵉ question.

### Comment retrouver n’importe quel PIN valide

Petit script équivalent au listing :

```python
def pin_ok(s: str) -> bool:
    buf = (s + "\n").encode()
    if len(buf) <= 3:
        return False
    acc = 0x539
    for b in buf[1:]:
        acc += b
    reste = (acc * 2) % 17
    return buf[0] == reste + 0x30
```

- 3 chiffres : 52 solutions, dont `777`
- 4 chiffres : 537 solutions, dont `1509`
- 5 chiffres : 5352 solutions

Le crackme ne demande pas *le* PIN, il demande *un* PIN qui vérifie le checksum.

---

## 4. Comment `+HCU` a été trouvé

Une fois le PIN accepté, le programme pose :

```
.:Where did +Fravia taught us? :
```

et lit 10 octets dans `buffer2` (`0x40214c`).

### Le leurre

```
401111  mov  esi, 0x402085      ; message2_help
401116  mov  esi, 0x40214c      ; écrasé tout de suite par buffer2
```

`message2_help` (« No need to patch or bruteforce, explore the web... ») n’est **jamais affiché**. Le premier `mov` est un hint pour le reverser : ne pas patcher le `jne`, aller chercher la réponse sur le web (histoire +Fravia). Puis `esi` est remplacé par l’input.

### L’algo, octet par octet

```
40111b  mov  ecx, 4             ; exactement 4 octets, pas strlen
401120  mov  eax, 0x811c9dc5
401125  mov  edi, 0x01000193
40112a  xor  ebx, ebx

40112c  nextbyte:
40112c  mul  edi                ; eax = eax * 0x01000193  (32 bits bas)
40112e  mov  bl, [esi]
401131  xor  eax, ebx
401133  inc  esi
401135  dec  ecx
401137  jne  nextbyte

401139  cmp  eax, 0x86cfdcf8
40113e  jne  out                ; mauvais hash → exit silencieux
401140  mov  esi, 0x4020b9      ; &good
401147  write(stdout, esi, 0x2f)
```

Trois constantes à reconnaître :

| Constante | Valeur | Identité |
|---|---|---|
| `0x811c9dc5` | 2166136261 | FNV-1 32-bit **offset basis** |
| `0x01000193` | 16777619 | FNV-1 32-bit **prime** |
| `0x86cfdcf8` | — | hash cible |

Ordre des opérations : `mul` **puis** `xor`. C’est **FNV-1**, pas FNV-1a (FNV-1a xor puis mul).

```
h = 0x811c9dc5
pour chacun des 4 premiers octets de buffer2 :
    h = (h * 0x01000193) & 0xFFFFFFFF
    h = h XOR octet
h doit valoir 0x86cfdcf8
```

Seuls les **4 premiers octets** comptent. Si on tape `+HCU\n`, le `\n` est le 5ᵉ octet : il est lu mais jamais hashé.

### Piste sémantique (sans brute)

La question parle de **+Fravia**. +Fravia est le reverseur derrière searchlores, et l’école qu’il animait s’appelait **+HCU** (*High Cracking University*). Quatre caractères, pile la taille du hash.

On teste le candidat évident :

```
'+' = 0x2b
'H' = 0x48
'C' = 0x43
'U' = 0x55
```

| i | octet | `h * prime` (32 bits) | XOR | nouveau `h` |
|---|---|---|---|---|
| 0 | `+` `0x2b` | `0x811c9dc5 * 0x01000193 = 0x050c5d1f` | `^ 0x2b` | `0x050c5d34` |
| 1 | `H` `0x48` | `0x050c5d34 * 0x01000193 = 0x2676b8dc` | `^ 0x48` | `0x2676b894` |
| 2 | `C` `0x43` | `0x2676b894 * 0x01000193 = 0x20e490fc` | `^ 0x43` | `0x20e490bf` |
| 3 | `U` `0x55` | `0x20e490bf * 0x01000193 = 0x86cfdcad` | `^ 0x55` | **`0x86cfdcf8`** |

`0x86cfdcf8` == cible. Match exact.

Autres candidats liés à Fravia (`+ORC`, `seek`, `lore`, `HCU+`, `HCU\n`…) ne matchent pas.

### Confirmation par inversion (unicité)

On n’a pas besoin de 96⁴ tests. Le dernier `xor` s’inverse :

```
h3 * prime  XOR  d  ==  0x86cfdcf8
d = (h3 * prime) XOR 0x86cfdcf8
```

On énumère les 3 premiers octets imprimables, on calcule `d`, on garde `d` s’il est imprimable. **Un seul** hit : `b'+HCU'`.

Donc `+HCU` n’est pas « un » mot de passe parmi d’autres : c’est le seul mot imprimable de 4 octets qui produit ce hash.

---

## Debug GDB (pas à pas)

Binaire **non strippé** → les labels (`_start`, `go_on`, `nextbyte`, `goodway`, `out`) sont utilisables directement. Pas de PIE.

### Lancer

```bash
gdb -q ./original/timotei-crackme-01
(gdb) info functions
(gdb) break _start
(gdb) run
# ou, pour un run non interactif :
(gdb) run < <(printf '777\n+HCU\n')
```

Astuce pipe : le 1er `write` n’a **pas** de `\n`. Envoyer PIN et `+HCU` en **deux lignes** (`printf '777\n+HCU\n'`), sinon le 1er `read(10)` avale les deux d’un coup.

### Check PIN (jusqu’à `go_on`)

| Adresse / label | Rôle |
|---|---|
| `0x40105d` | strlen sur `buffer` `@0x4020e8` |
| `0x40108a` | boucle `acc += buf[i]` (seed `0x539`) |
| `0x4010a1` | `div ecx` (`ecx=17`) → reste dans `dl` |
| `0x4010ab` | `test dl, dl` après `sub dl, al` |
| `go_on` (`0x4010b4`) | PIN OK → 2ᵉ prompt |

```text
(gdb) break *0x4010ab
(gdb) run < <(printf '777\n+HCU\n')
(gdb) print/x $rax & 0xff     # 1er char PIN ('7')
(gdb) print/x $rdx & 0xff     # doit être 0 si OK
(gdb) x/4cb 0x4020e8          # '7''7''7''\n'
(gdb) break go_on
(gdb) continue
```

Avec un mauvais PIN, `test dl` échoue → `jmp out` (`0x401158`) : **exit 0 silencieux** (pas de message d’erreur).

### Check FNV-1 (`+HCU`)

| Adresse / label | Rôle |
|---|---|
| `nextbyte` (`0x40112c`) | `mul` prime + `xor` octet |
| `0x401139` | `cmp eax, 0x86CFDCF8` |
| `goodway` (`0x401147`) | write du succès |

```text
(gdb) break *0x401139
(gdb) continue
(gdb) print/x $eax            # 0x86cfdcf8 si +HCU
(gdb) break goodway
(gdb) continue
(gdb) x/s 0x4020b9            # ".:Good, that's all…"
```

Pour **retrouver** `+HCU` sans le spoiler : breaker sur `0x401139`, tester des candidats 4 chars, lire `$eax` jusqu’au match cible.

### Symbols utiles

```text
(gdb) break go_on
(gdb) break goodway
(gdb) break out
(gdb) disassemble nextbyte
```

---

## 5. Vérification sur le binaire

```
.:knock,knock...your pin please...: 777
.:Where did +Fravia taught us? : +HCU
.:Good, that's all for history lesson today:-)
```

Idem avec `1509` puis `+HCU`. Les deux combinaisons sortent le message `good` et `exit 0`.

`1337` + `+HCU` : le process meurt après le PIN, la 2ᵉ question n’apparaît jamais.

`1509` + `HCU+` : la 2ᵉ question s’affiche, le hash échoue, pas de `good`.

Pour tester en pipe (deux writes, sinon le premier `read(10)` mange les deux lignes) :

```bash
python3 timotei-crackme-01-solve.py
```

Le script ci-dessous fait déjà ces deux writes via `run_binary`. Variante minimale :

```bash
python3 -c "
import subprocess, time
p = subprocess.Popen(['./timotei-crackme-01'], stdin=subprocess.PIPE)
p.stdin.write(b'777\n');  p.stdin.flush(); time.sleep(0.05)
p.stdin.write(b'+HCU\n'); p.stdin.flush(); p.stdin.close()
p.wait()
"
```

---

## 6. Solveur Python

Fichier : `timotei-crackme-01-solve.py` (à côté du binaire).

```bash
python3 timotei-crackme-01-solve.py
```

Il reconstitue les deux checks, énumère les PIN, inverse le FNV-1, puis lance le binaire.

| Fonction | Rôle |
|---|---|
| `pin_ok(pin)` | prédicat exact du `je go_on` (`0x4010ad`) |
| `pin_trace(pin)` | affiche la somme, le `×2`, le modulo 17 et le caractère attendu |
| `fnv1_32(data)` | FNV-1 32 bits (`mul` puis `xor`), 4 octets |
| `fnv1_trace(data)` | mêmes étapes que `nextbyte` à `0x40112c` |
| `brute_fnv_printable()` | inverse le dernier XOR, 96³ tests, un hit : `b'+HCU'` |
| `run_binary(pin, ans)` | deux `write` séparés + `flush`, sinon `read(10)` avale les deux lignes |

Cœur des deux prédicats :

```python
def pin_ok(pin: str) -> bool:
    buf = (pin + "\n").encode()
    if len(buf) <= 3:
        return False
    acc = 0x539
    for b in buf[1:]:
        acc += b
    return buf[0] == (acc * 2) % 17 + 0x30

def fnv1_32(data: bytes) -> int:
    h = 0x811C9DC5
    for b in data:
        h = (h * 0x01000193) & 0xFFFFFFFF
        h ^= b
    return h  # cible == 0x86CFDCF8
```

Script complet :

```python
#!/usr/bin/env python3
"""Solveur timotei-crackme-01 — PIN checksum + FNV-1 32 bits."""

from __future__ import annotations

import string
import subprocess
import time
from pathlib import Path

BINARY = Path(__file__).resolve().parent / "timotei-crackme-01"

# --- check 1 : PIN ----------------------------------------------------------
# acc = 0x539
# for b in buffer[1:strlen]: acc += b          # le '\n' compte
# (acc * 2) % 17 + 0x30  ==  buffer[0]


def pin_ok(pin: str) -> bool:
    buf = (pin + "\n").encode("ascii", errors="strict")
    if len(buf) <= 3:
        return False
    acc = 0x539
    for b in buf[1:]:
        acc = (acc + b) & 0xFFFFFFFF
    reste = (acc * 2) % 17
    return buf[0] == reste + 0x30


def pin_trace(pin: str) -> None:
    buf = (pin + "\n").encode("ascii")
    print(f"\n===== PIN {pin!r}  buffer={buf!r}  strlen={len(buf)} =====")
    if len(buf) <= 3:
        print("FAIL: trop court")
        return
    acc = 0x539
    print(f"edx seed = {acc} (0x{acc:x})")
    for i, b in enumerate(buf[1:], start=1):
        acc += b
        ch = chr(b) if 32 <= b < 127 else repr(chr(b))
        print(f"  + buf[{i}] = {b:3d} {ch!r:6}  -> edx={acc}")
    doubled = acc * 2
    reste = doubled % 17
    attendu = reste + 0x30
    print(f"edx*2 = {doubled}")
    print(f"{doubled} % 17 = {reste}")
    print(f"attendu 1er char = {reste} + 0x30 = {attendu} {chr(attendu)!r}")
    print(f"1er char réel     = {buf[0]} {chr(buf[0])!r}")
    print("OK" if buf[0] == attendu else "FAIL")


# --- check 2 : FNV-1 32 bits sur 4 octets -----------------------------------
OFFSET = 0x811C9DC5
PRIME = 0x01000193
TARGET = 0x86CFDCF8


def fnv1_32(data: bytes) -> int:
    h = OFFSET
    for b in data:
        h = (h * PRIME) & 0xFFFFFFFF
        h ^= b
    return h


def fnv1_trace(data: bytes) -> None:
    print(f"\n===== FNV-1 {data!r} =====")
    print(f"offset = 0x{OFFSET:08x} ({OFFSET})")
    print(f"prime  = 0x{PRIME:08x} ({PRIME})")
    print(f"target = 0x{TARGET:08x}")
    h = OFFSET
    for i, b in enumerate(data):
        prod = (h * PRIME) & 0xFFFFFFFF
        h2 = prod ^ b
        print(f"byte[{i}] {b:#04x} {chr(b)!r}")
        print(f"  mul  0x{h:08x} * 0x{PRIME:08x} = 0x{prod:08x}")
        print(f"  xor  0x{prod:08x} ^ 0x{b:02x}     = 0x{h2:08x}")
        h = h2
    print("match" if h == TARGET else "NO MATCH", hex(h))


def brute_fnv_printable() -> list[bytes]:
    """Inverse le dernier XOR : 96^3 tests au lieu de 96^4."""
    alphabet = (string.ascii_letters + string.digits + string.punctuation + " \n").encode(
        "ascii"
    )
    found: list[bytes] = []
    for a in alphabet:
        ha = ((OFFSET * PRIME) & 0xFFFFFFFF) ^ a
        for b in alphabet:
            hb = ((ha * PRIME) & 0xFFFFFFFF) ^ b
            for c in alphabet:
                hc = ((hb * PRIME) & 0xFFFFFFFF) ^ c
                d = ((hc * PRIME) & 0xFFFFFFFF) ^ TARGET
                if d < 256 and d in alphabet:
                    found.append(bytes([a, b, c, d]))
    return found


def run_binary(pin: str, answer: str) -> None:
    """Deux writes séparés : sinon read(10) avale les deux lignes."""
    if not BINARY.is_file():
        print(f"(binaire introuvable: {BINARY})")
        return
    p = subprocess.Popen(
        [str(BINARY)],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    assert p.stdin is not None and p.stdout is not None
    p.stdin.write((pin + "\n").encode())
    p.stdin.flush()
    time.sleep(0.05)
    p.stdin.write((answer + "\n").encode())
    p.stdin.flush()
    p.stdin.close()
    out = p.stdout.read()
    print(f"\n=== live pin={pin!r} ans={answer!r} exit={p.wait()} ===")
    print(out)


def main() -> None:
    print("=== PIN 3 chiffres ===")
    pins3 = [f"{n}" for n in range(100, 1000) if pin_ok(f"{n}")]
    print(pins3)
    print("777?", "777" in pins3)

    print("\n=== PIN 4 chiffres ===")
    pins4 = [f"{n}" for n in range(1000, 10000) if pin_ok(f"{n}")]
    print(len(pins4), "hits, first 40:", pins4[:40])
    print("1509?", "1509" in pins4)
    print("1337?", "1337" in pins4)

    for p in ("777", "1509", "1059", "1337"):
        pin_trace(p)

    print("\n=== FNV-1 candidats ===")
    for c in (b"+HCU", b"HCU+", b"+ORC", b"seek", b"lore", b"HCU\n"):
        print(f"{c!r:16} {fnv1_32(c):08x}  {fnv1_32(c) == TARGET}")

    fnv1_trace(b"+HCU")

    print("\n=== brute imprimable (dernier octet inversé) ===")
    hits = brute_fnv_printable()
    print("hits:", hits)

    run_binary("777", "+HCU")
    run_binary("1509", "+HCU")


if __name__ == "__main__":
    main()
```

---

## 7. Récap des adresses

| VA | Quoi |
|---|---|
| `0x401000` | `_start` |
| `0x40104a` | `_garbage` (drain PIN) |
| `0x40105d` | `_garbage_end` / strlen + check PIN |
| `0x40108a` | boucle somme (`__`) |
| `0x4010ad` | `je go_on` — PIN OK |
| `0x4010b4` | `go_on` — 2ᵉ prompt |
| `0x4010fe` | `_garbage2` |
| `0x40112c` | `nextbyte` — FNV-1 |
| `0x401139` | `cmp eax, 0x86cfdcf8` |
| `0x401147` | `goodway` — write du succès |
| `0x401158` | `out` — `exit(0)` même en cas d’échec |
| `0x4020e8` | `buffer` PIN |
| `0x40214c` | `buffer2` réponse Fravia |

Le `exit` est toujours 0. Un PIN / hash faux ne s’annonce pas : le process se tait et quitte. C’est pour ça qu’il faut lire le `cmp`/`je`, pas le code de retour.

---

## 8. Dumps IDA Pro (asm + Hex-Rays)

Fichiers ajoutés :

| Fichier | Origine |
|---|---|
| [`timotei-crackme-01-idapro.asm`](analysis/timotei-crackme-01-idapro.asm) | listing IDA (Intel, labels du binaire) |
| [`timotei-crackme-01.c`](tools/timotei-crackme-01.c) | Hex-Rays 9.4 (une seule fonction : `start`) |

Hashes IDA = ceux de `diec` : MD5 `80D85D8A340F40C02EA40A03BFDAAC23`, SHA256 `93862A67…E1F6`.

IDA a bien repris les symboles (`_start`, `_garbage`, `go_on`, `nextbyte`, `goodway`, `Credit`, `message`, `buffer`…). Les syscalls sont annotés `sys_write` / `sys_read` / `sys_exit`. Le listing asm est plus confortable qu’`objdump` : mêmes adresses, mêmes constantes (`539h`, `11h`, `811C9DC5h`, `1000193h`, `86CFDCF8h`).

### Ce que Hex-Rays a bien reconstruit

Le PIN tombe en C lisible :

```c
if ( -(int)v5 - 2 > 3 )          // strlen > 3
{
    v7 = -(int)v5 - 3;           // strlen - 1
    v9 = 1337;
    v10 = buffer;
    do {
        LOBYTE(v8) = v10[1];
        v9 += v8;
        v10 += 1;
        --v7;
    } while ( v7 != 0 );
    if ( 2 * v9 % 0x11u + 48 == buffer[0] )   // (2*acc % 17) + '0'
        // ... 2e question
}
```

`-(int)v5 - 2` est le `not ecx / dec ecx` du `repne scasb` : `v5` part de `-1`, on consomme `len+1` octets (le `0` compris), il reste `-len-2`, donc `-(v5)-2 == len`.

Le FNV aussi, une fois les constantes remises en hexa :

```c
v17 = -2128831035;               // 0x811C9DC5
do {
    LOBYTE(v18) = *v15;
    v17 = v18 ^ (16777619 * v17); // 16777619 = 0x01000193
    ++v15;
    --v16;
} while ( v16 != 0 );
if ( v17 == -2033197832 )        // 0x86CFDCF8
    sys_write(1u, good, 0x2Fu);
```

`byte ^ (prime * h)` est égal à `(h * prime) ^ byte` : Hex-Rays a juste inversé l’écriture, pas l’algo.

Conversion signée (piège classique Hex-Rays, tout est `int`) :

```
-2128831035 + 2^32 = 0x811C9DC5
-2033197832 + 2^32 = 0x86CFDCF8
```

### Pièges dans ces dumps

1. **« Compiler : GNU C++ »** — faux. Le binaire est de l’asm à la main (`timo#1_final.asm` dans la table des symboles). L’en-tête MASM `.686p` / `.model flat` de l’export est un artefact 32 bits sur un ELF64.

2. **Le hint a disparu du C.** En asm :
   ```
   mov  esi, offset message2_help   ; "No need to patch..."
   mov  esi, offset buffer2         ; écrasé tout de suite
   ```
   Hex-Rays jette le premier `mov` (dead store). Si on ne lit que le `.c`, on ne voit jamais « explore the web ». Toujours garder le listing à côté du décompilé.

3. **`byte_4020E7` / `4202827`.**  
   `cmp byte_4020E7[eax], 0Ah` = `[rax + 0x4020E7]`. `buffer` est à `0x4020E8`, donc c’est `buffer[rax-1]` : le dernier octet du `read`. Hex-Rays a créé une variable sur l’octet *avant* le buffer (le `'\n'` final de `good`). Pareil pour `v11 + 4202827` : `4202827 = 0x40214B = buffer2 - 1`.

4. **`message` / `message2` déclarés `char x = '.'`.** Hex-Rays n’a pris que le premier octet. Les chaînes ne sont pas des C-strings propres (pas de `0` pile après le texte affiché). Les tailles vraies restent celles des `write` : `0x24` et `0x21`. Les `db 0Ah` que IDA colle à la fin de `message` / `message2` **ne sont pas écrits** (off-by-one de label).

5. **`good[46]` vs write `0x2F`.** Le succès écrit 47 octets, newline compris. IDA a sorti le dernier `0Ah` dans `byte_4020E7`.

6. **Warnings `variable is possibly undefined`** sur le drain `_garbage` : faux positifs. `edi`/`rsi`/`edx` sont bien posés avant la boucle.

En pratique : le `.asm` IDA pour suivre les labels et les constantes hexa, le `.c` pour lire le PIN et le FNV d’un coup d’œil, et le listing (ou le `.asm`) dès que Hex-Rays signe les constantes ou efface un `mov` mort.

---

## 9. Source reconstruit (NASM + FASM)

Ce n’est **pas** le fichier auteur. Le source a disparu ; on a reconstruit depuis `objdump` / la table des symboles / le dump `.data`. Les deux dialectes sont fournis. Le plus proche de l’origine est **FASM**.

### 9.1 Pourquoi de l’asm, et pourquoi FASM

Pas du C (même si Hex-Rays sort du pseudo-C) :

- symbole `FILE` = `timo#1_final.asm`
- pas de `.comment` gcc, pas d’`INTERP`, pas de libc, pas de `main`
- point d’entrée `_start`, syscalls bruts (`0f 05`)
- idiomes asm : `repnz scasb` + `not ecx`, dead store `mov esi, message2_help`, préfixes `67h` (adresses 32 bits dans un ELF64)
- DIE : « Unknown », aucun compilateur C

Pourquoi FASM plutôt que NASM comme dialecte d’origine :

- un seul fichier → ELF exécutable (`format ELF64 executable 3`), sans étape `ld`
- layout original : 3 `PT_LOAD` paginés (header `0x400000` R, code `0x401000` RX, data `0x402000` RW) — le style classique FASM « ELF executable » des années 2010
- la scène crackme Linux de l’époque (2020) est très FASM
- NASM + `ld` **peut** reproduire le même listing (et le fait, ci-dessous), mais ça implique un `.o` + link, alors que l’auteur n’a laissé qu’un nom de fichier `.asm`

### 9.2 Fichiers

| Fichier | Assembleur | Binaire de test | Résultat |
|---|---|---|---|
| [`timotei-crackme-01-nasm.asm`](tools/timotei-crackme-01-nasm.asm) | NASM 2.16.01 | `timotei-crackme-01-nasm.bin` (9792 o) | **101/101 mnémoniques identiques** à l’original, EP `0x401000` |
| [`timotei-crackme-01-fasm.asm`](tools/timotei-crackme-01-fasm.asm) | FASM 1.73.32 | `timotei-crackme-01-fasm.bin` (955 o) | même comportement ; ELF tassé, pas de section headers |

`timotei-crackme-01-idapro.asm` (IDA) n’est **pas** un source compilable : export listing + en-tête MASM 32 bits fantôme.

### 9.3 Compiler

```bash
# NASM (déjà installé ici)
nasm -f elf64 -o timotei-crackme-01-nasm.o timotei-crackme-01-nasm.asm
ld -nostdlib -static -no-pie \
   -o timotei-crackme-01-nasm.bin timotei-crackme-01-nasm.o

# FASM — soit le paquet, soit le binaire officiel
sudo apt install fasm
# ou : https://flatassembler.net/  → fasm.x64
fasm timotei-crackme-01-fasm.asm timotei-crackme-01-fasm.bin
```

`-no-pie` est obligatoire pour NASM+ld : sinon le linker moderne sort un PIE et les `mov esi, label` 32 bits cassent.

Lancer (deux writes séparés, sinon le premier `read(10)` avale PIN + réponse) :

```bash
python3 -c "
import subprocess, time
p = subprocess.Popen(['./timotei-crackme-01-nasm.bin'], stdin=subprocess.PIPE)
p.stdin.write(b'777\n');  p.stdin.flush(); time.sleep(0.05)
p.stdin.write(b'+HCU\n'); p.stdin.flush(); p.stdin.close()
p.wait()
"
```

Même chose avec `timotei-crackme-01-fasm.bin`. Le solveur (`run_binary`) parle au binaire **d’origine** ; pour tester une reconstruction, changer `BINARY` ou lancer comme ci-dessus.

### 9.4 Vérification live

| PIN | Réponse | Original | NASM | FASM |
|---|---|---|---|---|
| `777` | `+HCU` | `good` | `good` | `good` |
| `1509` | `+HCU` | `good` | `good` | `good` |
| `1337` | `+HCU` | stop après le PIN | stop | stop |

Message de succès (les trois) :

```
.:knock,knock...your pin please...: .:Where did +Fravia taught us? : .:Good, that's all for history lesson today:-)
```

### 9.5 Data — layout exact du `.data` original

Reconstruit octet pour octet depuis le binaire (`file off 0x2000`, VA `0x402000`, taille `0x1b1`). Les `write` n’envoient pas toujours toute la chaîne.

| Label | VA | Taille | Contenu | Écrit |
|---|---|---:|---|---|
| `Credit` | `0x402000` | 62 | `._:timotei crackme#1:_...thanks GrbavaCigla for beta testing!\0` | jamais |
| `message` | `0x40203e` | 37 | `.:knock,knock...your pin please...: \n` | 36 (`0x24`), sans le `\n` |
| `message2` | `0x402063` | 34 | `.:Where did +Fravia taught us? : \n` | 33 (`0x21`), sans le `\n` |
| `message2_help` | `0x402085` | 52 | `No need to patch or bruteforce, explore the web...\0\n` | jamais (dead store) |
| `good` | `0x4020b9` | 47 | `.:Good, that's all for history lesson today:-)\n` | 47 (`0x2f`), `\n` compris |
| `buffer` | `0x4020e8` | 100 | zéros | PIN |
| `buffer2` | `0x40214c` | 100 | zéros | 2ᵉ réponse |
| `dummy` | `0x4021b0` | 1 | `00` | drain 1 octet |

En source ça donne :

```nasm
Credit          db '._:timotei crackme#1:_...thanks GrbavaCigla for beta testing!', 0
message         db '.:knock,knock...your pin please...: ', 10
message2        db '.:Where did +Fravia taught us? : ', 10
message2_help   db 'No need to patch or bruteforce, explore the web...', 0, 10
good            db ".:Good, that's all for history lesson today:-)", 10
buffer          times 100 db 0          ; FASM : db 100 dup 0
buffer2         times 100 db 0
dummy           db 0
```

Les buffers sont en **PROGBITS** (zéros dans le fichier), pas en BSS : d’où `db 0` / `times` / `dup`, pas `resb` / `rb`.

### 9.6 Encodings recopiés volontairement

Ce n’est pas de l’asm x64 « propre ». On a gardé ce que le listing fait :

| Source | Encodage original | Pourquoi |
|---|---|---|
| `mov esi, message` | `be 3e 20 40 00` (imm32) | pas `lea rsi, [rel message]` |
| `mov rsi, dummy` | `48 be …` movabs | seul endroit en 64 bits |
| `sub ecx, ecx` / `sub al, al` | `29 c9` / `28 c0` | pas `xor` (`31 c9` / `30 c0`) |
| `mov bl, [ecx+1]` | préfixe `67` | adresse 32 bits |
| `cmp byte [eax+buffer-1], 10` | `67 80 b8 e7 20 40 00 0a` | dernier octet du `read` |
| `cmp byte [dummy], 10` | `80 3c 25 …` (SIB abs) | pas RIP-relative → NASM `DEFAULT ABS` |
| `jmp goodway` juste avant `goodway:` | `eb 00` | saut nul, on le laisse |
| `jle out` / `jmp out` | `0f 8e` / `e9` near | distance > 127 |

NASM : `DEFAULT ABS` + `BITS 64` pour interdire le RIP-relative par défaut des ELF64 modernes.

### 9.7 Différences reconstruction ↔ original

| | Original (2020) | NASM 2.16 | FASM 1.73 |
|---|---|---|---|
| Taille | 9832 | 9792 | 955 |
| EP | `0x401000` | `0x401000` | `~0x4000B0` |
| Data VA | `0x402000` | `0x402000` | collée après le code |
| Section headers | oui (`.text` `.data` `.symtab`) | oui | **non** (ELF executable nu) |
| Label de sortie | `out` | `out` | `_out` (`out` = instruction FASM) |
| `FILE` symbol | `timo#1_final.asm` | nom de l’objet | absent (pas de SHT) |
| Listing `objdump -d` | référence | **identique** | objdump ne voit pas de `.text` |

FASM 1.73 tasse le ELF (code juste après le header). Un `org 401000h` / `org 402000h` **casse** le `p_vaddr` (data mappée ailleurs que les labels → SIGSEGV). On laisse FASM packer : même algo, autre image.

L’original paginé 4K correspond au FASM « ELF executable » plus ancien (3 `PT_LOAD` alignés), pas à un NASM+ld — autre indice en faveur de FASM comme outil auteur.

### 9.8 Source NASM complet

```nasm
; timotei-crackme-01 — reconstruction NASM (pas le .asm auteur, perdu)
; Source d'origine très probablement FASM (ELF "executable" d'un seul fichier,
; symbole FILE = timo#1_final.asm). Cette version NASM reproduit le même
; comportement et les mêmes labels. Les encodings 32 bits (eax/esi/ecx +
; préfixe 67h, movabs rsi, sub au lieu de xor) suivent le listing du binaire.
;
; Compiler :
;   nasm -f elf64 -o timotei-crackme-01-nasm.o timotei-crackme-01-nasm.asm
;   ld -nostdlib -static -no-pie -o timotei-crackme-01-nasm.bin \
;      timotei-crackme-01-nasm.o
;
; Lancer (deux writes, sinon read(10) avale PIN + réponse) :
;   python3 -c "
;   import subprocess,time
;   p=subprocess.Popen(['./timotei-crackme-01-nasm.bin'],stdin=subprocess.PIPE)
;   p.stdin.write(b'777\n'); p.stdin.flush(); time.sleep(0.05)
;   p.stdin.write(b'+HCU\n'); p.stdin.flush(); p.stdin.close(); p.wait()
;   "

BITS 64
DEFAULT ABS                     ; adresses absolues, comme le binaire d'origine
                                ; (pas de RIP-relative / PIE)

global _start

section .text
_start:
        mov     eax, 1                  ; sys_write
        mov     edi, 1                  ; stdout
        mov     esi, message
        mov     edx, 0x24               ; 36 octets, le '\n' final n'est pas écrit
        syscall

        mov     eax, 0                  ; sys_read
        mov     edi, 0                  ; stdin
        mov     esi, buffer
        mov     edx, 10
        syscall
        cmp     byte [eax + buffer - 1], 10
        je      _garbage_end
        mov     edi, 0
        mov     rsi, dummy              ; movabs rsi, imm64 (comme l'original)
        mov     edx, 1
_garbage:
        mov     eax, 0
        syscall                         ; read 1 octet
        cmp     byte [dummy], 10
        je      _garbage_end
        jmp     _garbage

_garbage_end:
        mov     edi, buffer
        sub     ecx, ecx                ; pas xor : encodage 29 C9
        sub     al, al                  ; pas xor : encodage 28 C0
        not     ecx
        cld
        repnz   scasb                   ; strlen jusqu'au 0
        not     ecx
        dec     ecx                     ; ecx = strlen
        mov     eax, ecx
        cmp     eax, 3
        jle     out
        dec     eax                     ; nb d'itérations = strlen-1
        xor     ebx, ebx
        mov     edx, 0x539              ; 1337
        mov     ecx, buffer
        mov     esi, ecx                ; esi = &buffer[0] (1er char)
__:
        mov     bl, [ecx + 1]           ; préfixe 67h (adresse 32 bits)
        add     edx, ebx
        inc     ecx
        dec     eax
        jnz     __
        add     edx, edx                ; * 2
        mov     eax, edx
        xor     edx, edx
        mov     ecx, 17
        div     ecx                     ; edx = reste
        add     dl, 0x30                ; reste + '0'
        mov     al, [esi]
        sub     dl, al
        test    dl, dl
        jz      go_on
        jmp     out

go_on:
        mov     eax, 1
        mov     edi, 1
        mov     esi, message2
        mov     edx, 0x21               ; 33 octets, sans le '\n'
        syscall

        mov     eax, 0
        mov     edi, 0
        mov     esi, buffer2
        mov     edx, 10
        syscall
        cmp     byte [eax + buffer2 - 1], 10
        je      _garbage_end2
        mov     edi, 0
        mov     rsi, dummy
        mov     edx, 1
_garbage2:
        mov     eax, 0
        syscall
        cmp     byte [dummy], 10
        je      _garbage_end2
        jmp     _garbage2

_garbage_end2:
        mov     esi, message2_help      ; hint, dead store (Hex-Rays l'efface)
        mov     esi, buffer2
        mov     ecx, 4
        mov     eax, 0x811C9DC5         ; FNV-1 offset basis
        mov     edi, 0x01000193         ; FNV-1 prime
        xor     ebx, ebx
nextbyte:
        mul     edi                     ; eax = eax * prime
        mov     bl, [esi]
        xor     eax, ebx
        inc     esi
        dec     ecx
        jnz     nextbyte
        cmp     eax, 0x86CFDCF8
        jnz     out
        mov     esi, good
        jmp     goodway                 ; eb 00 dans l'original

goodway:
        mov     eax, 1
        mov     edi, 1
        mov     edx, 0x2F               ; 47 octets, newline compris
        syscall

out:
        mov     eax, 60                 ; sys_exit
        xor     rdi, rdi
        syscall

section .data
Credit:         db '._:timotei crackme#1:_...thanks GrbavaCigla for beta testing!', 0
message:        db '.:knock,knock...your pin please...: ', 10
message2:       db '.:Where did +Fravia taught us? : ', 10
message2_help:  db 'No need to patch or bruteforce, explore the web...', 0, 10
good:           db ".:Good, that's all for history lesson today:-)", 10
buffer:         times 100 db 0
buffer2:        times 100 db 0
dummy:          db 0
```

### 9.9 Source FASM complet

```fasm
; timotei-crackme-01 — reconstruction FASM
; C'est le dialecte le plus proche de l'original : ELF64 "executable"
; d'un seul fichier, symbole FILE = timo#1_final.asm, pas de libc, pas de
; crt. Reconstruction depuis le binaire (listing + table des symboles),
; pas un dump du .asm auteur.
;
; Compiler (produit directement un ELF, pas d'étape ld) :
;   fasm timotei-crackme-01-fasm.asm timotei-crackme-01-fasm.bin
;
; Installer fasm si besoin :
;   sudo apt install fasm
;   # ou https://flatassembler.net/  (fasm + fasm.x64)
;
; Lancer (deux writes, sinon read(10) avale PIN + réponse) :
;   python3 -c "
;   import subprocess,time
;   p=subprocess.Popen(['./timotei-crackme-01-fasm.bin'],stdin=subprocess.PIPE)
;   p.stdin.write(b'777\n'); p.stdin.flush(); time.sleep(0.05)
;   p.stdin.write(b'+HCU\n'); p.stdin.flush(); p.stdin.close(); p.wait()
;   "

format ELF64 executable 3
entry _start

; FASM 1.73 tasse le ELF (code juste après le header, ~0x4000B0).
; L'original 2020 est paginé 4K (EP 0x401000, data 0x402000). Même code.
segment readable executable

_start:
        mov     eax, 1                  ; sys_write
        mov     edi, 1                  ; stdout
        mov     esi, message
        mov     edx, 24h                ; 36 octets, le 10 final n'est pas écrit
        syscall

        mov     eax, 0                  ; sys_read
        mov     edi, 0                  ; stdin
        mov     esi, buffer
        mov     edx, 10
        syscall
        cmp     byte [eax + buffer - 1], 10
        je      _garbage_end
        mov     edi, 0
        mov     rsi, dummy              ; movabs rsi, imm64
        mov     edx, 1
_garbage:
        mov     eax, 0
        syscall
        cmp     byte [dummy], 10
        je      _garbage_end
        jmp     _garbage

_garbage_end:
        mov     edi, buffer
        sub     ecx, ecx
        sub     al, al
        not     ecx
        cld
        repnz   scasb
        not     ecx
        dec     ecx
        mov     eax, ecx
        cmp     eax, 3
        jle     _out                    ; label original : out (mot réservé FASM)
        dec     eax
        xor     ebx, ebx
        mov     edx, 539h               ; 1337
        mov     ecx, buffer
        mov     esi, ecx
__:
        mov     bl, [ecx + 1]
        add     edx, ebx
        inc     ecx
        dec     eax
        jnz     __
        add     edx, edx
        mov     eax, edx
        xor     edx, edx
        mov     ecx, 11h
        div     ecx
        add     dl, 30h
        mov     al, [esi]
        sub     dl, al
        test    dl, dl
        jz      go_on
        jmp     _out

go_on:
        mov     eax, 1
        mov     edi, 1
        mov     esi, message2
        mov     edx, 21h
        syscall

        mov     eax, 0
        mov     edi, 0
        mov     esi, buffer2
        mov     edx, 10
        syscall
        cmp     byte [eax + buffer2 - 1], 10
        je      _garbage_end2
        mov     edi, 0
        mov     rsi, dummy
        mov     edx, 1
_garbage2:
        mov     eax, 0
        syscall
        cmp     byte [dummy], 10
        je      _garbage_end2
        jmp     _garbage2

_garbage_end2:
        mov     esi, message2_help      ; hint, jamais affiché
        mov     esi, buffer2
        mov     ecx, 4
        mov     eax, 811C9DC5h          ; FNV-1 offset basis
        mov     edi, 1000193h           ; FNV-1 prime
        xor     ebx, ebx
nextbyte:
        mul     edi
        mov     bl, [esi]
        xor     eax, ebx
        inc     esi
        dec     ecx
        jnz     nextbyte
        cmp     eax, 86CFDCF8h
        jnz     _out
        mov     esi, good
        jmp     goodway

goodway:
        mov     eax, 1
        mov     edi, 1
        mov     edx, 2Fh
        syscall

_out:
        mov     eax, 3Ch                ; sys_exit
        xor     rdi, rdi
        syscall

segment readable writable

Credit          db '._:timotei crackme#1:_...thanks GrbavaCigla for beta testing!', 0
message         db '.:knock,knock...your pin please...: ', 10
message2        db '.:Where did +Fravia taught us? : ', 10
message2_help   db 'No need to patch or bruteforce, explore the web...', 0, 10
good            db ".:Good, that's all for history lesson today:-)", 10
buffer          db 100 dup 0
buffer2         db 100 dup 0
dummy           db 0
```
