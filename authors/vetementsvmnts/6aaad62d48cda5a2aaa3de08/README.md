# vetementsvmnts's a bit of a challenge

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aaad62d48cda5a2aaa3de08) · id `6aaad62d48cda5a2aaa3de08`

ELF64 console **C**, strippé + `ptrace`. Name → **sigil** 24 hex.  
Famille : [`../README.md`](../README.md) (suite de [My First](../6aa8ec52cab6678aefe9dda5/) / [Tricky](../6aac1a61dbb3353b753968c0/) / [KeygenMe](../6aa94afadbb3353b7539687a/)).

| Fichier | Rôle |
|---|---|
| [`original/hard_crackme`](original/hard_crackme) | binaire |
| [`analysis/hard_crackme.i64.c`](analysis/hard_crackme.i64.c) | Hex-Rays (`decc`) |
| [`tools/sigil-challenge-solve.py`](tools/sigil-challenge-solve.py) | keygen / `--check` |

## Réponse

| | |
|---|---|
| **Name** (exemple) | `petik` |
| **Sigil** | `dcff517e5eec15be2746a614` |
| Format | 24 hex = `%08x%08x%08x` (3× u32) |
| OK | `the pact is sealed. well done, sigil-smith.` |
| KO | `the spirits reject you.` |
| Anti-debug | `the spirits sense a watcher...` (`ptrace`) |

```bash
python3 tools/sigil-challenge-solve.py -q --name petik
# dcff517e5eec15be2746a614
printf '%s\n%s\n' petik dcff517e5eec15be2746a614 | ./original/hard_crackme
# ou :
python3 tools/sigil-challenge-solve.py --name petik --check
```

---

## 1. Premier regard

```text
hard_crackme: ELF 64-bit LSB pie executable, x86-64, dynamically linked, stripped
sha256  f3df05a4efd4ee17f0c3e2b70ff13e82dc841dfe3c4aae287ef33b7b24f58685
size    ~14 KiB
```

```bash
strings -n 4 original/hard_crackme
bash -ic 'decc original/hard_crackme'   # → analysis/hard_crackme.i64.c
objdump -d -M intel original/hard_crackme | less
```

Banner / contraintes déjà en clair dans les strings :

```text
=== sigil forging ritual v2.0 ===
weave a name (5-32 chars) and bind it with a 24-hex sigil.
name: / sigil:
%08x%08x%08x
the pact is sealed. well done, sigil-smith.
the spirits reject you.
the spirits sense a watcher...
```

Imports : `ptrace`, `fgets`, `strlen`, `snprintf`, `puts`.  
**Aucun** password littéral : contrairement à My First, il faut **keygen** le sigil.

Piège de naming : Tricky s’appelle aussi `hard_crackme` sur le disque — **autre** SHA-256 / autre ID.

---

## 2. Flow

1. `ptrace(PTRACE_TRACEME, 0, 1, 0) == -1` → watcher + exit 1.
2. `fgets` name (buf 64) ; coupe `\n` ; `strlen` ∈ **[5, 32]** ; chaque octet `c` vérifie `(c - 0x20) ≤ 0x5e` (printable ASCII).
3. `fgets` sigil ; `strlen == 24` sinon message « exactly 24 hex ».
4. Absorption du name → 3 registres u32 → `snprintf(..., "%08x%08x%08x", …)`.
5. Comparaison des 24 octets (XOR puis OR / SIMD) avec l’entrée.
6. OR total nul → pact sealed ; sinon → spirits reject.

---

## 3. Comment on trouve la formule

### 3.1 Ancrage

Binaire **strippé** → Hex-Rays (`decc`) + croisement `objdump`.  
Corps = début de `.text` ~`0x10c0` (PIE ; VMA `objdump` sans rebase).

Anti-debug tout de suite :

```asm
10d8:  call   ptrace@plt
10dd:  cmp    rax, 0xffffffffffffffff
10e1:  je     watcher          ; "the spirits sense a watcher..."
```

Longueur du sigil :

```asm
1231:  cmp    rax, 0x18        ; 24
1235:  jne    bad_len
```

### 3.2 Constantes dans le code (pas besoin de « inventer » l’algo)

Init de la boucle :

```asm
1266:  mov    edx, 0x811c9dc5   ; h  = FNV-1a offset
126b:  mov    r9d, 0x9e3779b9   ; a  = golden ratio
1271:  mov    r8d, 0xcbf29ce4   ; b
125d:  mov    esi, 0x1          ; pos = 1
125b:  xor    edi, edi          ; idx = 0
```

Dans la boucle (un tour = un caractère) :

```asm
1280:  movzx  eax, BYTE PTR [rbp]   ; c
128c:  imul   ecx, esi              ; prod = pos * c
128f:  add    rsi, 0x1              ; pos++
128a:  xor    edx, eax              ; h ^= c
1293:  imul   edx, edx, 0x1000193   ; h *= FNV prime
1299:  add    ecx, r8d              ; prod += b
129c:  rol    ecx, 0x7              ; b = ROL(prod, 7)
12a2:  mov    ecx, edi
12a4:  add    edi, 0x3              ; idx += 3
12a7:  and    ecx, 0xf              ; shift = idx & 0xF  (avant +3 : valeur courante)
12aa:  shl    eax, cl               ; c << shift
12ac:  xor    eax, r9d
12af:  rol    eax, 0xd              ; a = ROL(a ^ (c<<shift), 13)
```

(`objdump` montre le `and ecx,0xf` sur **edi** avant l’add — Hex-Rays écrivait `LOBYTE(prod)=idx` ; le shift utile est bien `idx & 0xF`.)

Avalanche (extrait) :

```asm
12ba:  xor    edx, 0xdeadbeef
12d2:  imul   ecx, ecx, 0x7feb352d  ; M1
12df:  imul   ecx, ecx, 0x846ca68b  ; M2
…
1325:  xor    eax, 0xcafebabe
…
135c:  call   snprintf@plt            ; "%08x%08x%08x"
```

| Immediate | Rôle |
|---|---|
| `0x811C9DC5` / `0x01000193` | FNV-1a offset / prime |
| `0x9E3779B9` / `0xCBF29CE4` | accumulateurs `a` / `b` |
| `0xDEADBEEF` / `0xCAFEBABE` | xor d’avalanche |
| `0x7FEB352D` / `0x846CA68B` | multiplications Murmur-like |

### 3.3 Pseudo-code consolidé

```python
def u32(x): return x & 0xFFFFFFFF
def rol32(x, n):
    x = u32(x); n &= 31
    return u32((x << n) | (x >> (32 - n)))

def mix(x, M1=0x7FEB352D, M2=0x846CA68B):
    t = u32(M1 * (x ^ (x >> 16)))
    t = u32(M2 * ((t >> 15) ^ t))
    return u32((t >> 16) ^ t)

def sigil_for(name: str) -> str:
    h, a, b = 0x811C9DC5, 0x9E3779B9, 0xCBF29CE4
    pos, idx = 1, 0
    for c in name.encode("latin-1"):
        prod = u32(pos * c); pos += 1
        h = u32(0x01000193 * (c ^ h))
        b = rol32(b + prod, 7)
        a = rol32(a ^ u32(c << (idx & 0xF)), 13)
        idx = u32(idx + 3)
    w0 = mix(u32(h ^ 0xDEADBEEF))
    w1 = mix(u32(w0 ^ b))
    w2 = mix(u32(w1 ^ a ^ 0xCAFEBABE))
    return f"{u32(w2^w0):08x}{u32(w2^w0^w1):08x}{w2:08x}"
```

### 3.4 Exemple `petik` (étapes)

Init : `h=0x811c9dc5`, `a=0x9e3779b9`, `b=0xcbf29ce4`.

| `c` | `pos*c` | `shift` | `h` | `a` | `b` |
|---|---|---|---|---|---|
| `p` | 112 | 0 | `0xf50c43ef` | `0xef3933c6` | `0xf94eaa65` |
| `e` | 202 | 3 | `0x4c4e523e` | `0x261ddde7` | `0xa75597fc` |
| `t` | 348 | 6 | `0x694b8a7e` | `0xb81ce4c3` | `0xaaccac53` |
| `i` | 420 | 9 | `0xd8ea6235` | `0x86d87703` | `0x6656fbd5` |
| `k` | 535 | 12 | `0xd6f8d9fa` | `0xd8e070db` | `0x2b7ef633` |

Après avalanche :

| Mot | Valeur |
|---|---|
| `w0` | `0xfbb9f76a` |
| `w1` | `0x821344c0` |
| `w2` | `0x2746a614` |
| `w2^w0` | `0xdcff517e` |
| `w2^w0^w1` | `0x5eec15be` |

→ sigil **`dcff517e5eec15be2746a614`**.

---

## 4. Vérification

```text
$ printf '%s\n%s\n' petik dcff517e5eec15be2746a614 | ./original/hard_crackme
=== sigil forging ritual v2.0 ===
weave a name (5-32 chars) and bind it with a 24-hex sigil.
name: sigil: the pact is sealed. well done, sigil-smith.

$ printf '%s\n%s\n' petik 000000000000000000000000 | ./original/hard_crackme
… the spirits reject you.
```

```bash
python3 tools/sigil-challenge-solve.py --name petik --check
# … pact is sealed / OK
```

Sous debugger (`ptrace` déjà pris) : `the spirits sense a watcher...`. Le solveur `--check` lance le binaire **sans** GDB.

---

## 5. Notes

- Keygen déterministe name→24 hex ; exemple **`petik`**.
- Reverse : `strings` (contraintes) → `decc` (formule) → `objdump` (constantes / `ROL` / `imul`) → preuve live.
- GDB **non** utilisé pour dériver la formule (pas de section Debug GDB) ; utile seulement pour l’anti-`ptrace`.
- Ne pas confondre avec [Tricky](../6aac1a61dbb3353b753968c0/) (même nom de fichier `hard_crackme`, password XOR `supersecret123`).
