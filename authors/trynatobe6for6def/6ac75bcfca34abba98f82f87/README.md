# TrynaToBe6for6Def's My Second Crackme (Easy + Flag)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ac75bcfca34abba98f82f87) · id `6ac75bcfca34abba98f82f87`

PE64 **MinGW-w64** console C/C++. Description : *Find the correct password. No patching.*  
Suite de [My First Crackme](../6ac65258cdee6e086a17364d/) (`H3llo_Crackme`, XOR `0x2A`) : ici le XOR « naïf » ne suffit plus (d’où le password).

| Fichier | Rôle |
|---|---|
| [`original/My_Second_Crackme.exe`](original/My_Second_Crackme.exe) | binaire |
| [`tools/my-second-crackme-solve.py`](tools/my-second-crackme-solve.py) | password / `--check` |

## Réponse

| | |
|---|---|
| **Password** | `Xor_N0t_3nough` |
| **Flag** | `CMO{Xor_N0t_3nough}` |
| OK | `Yeaaaaa!!! Discord : imrate` puis `Flag : CMO{Xor_N0t_3nough}` |
| KO | `Not today...` |

```bash
python3 tools/my-second-crackme-solve.py -q
# Xor_N0t_3nough
printf '%s\n' Xor_N0t_3nough | WINEDEBUG=-all wine original/My_Second_Crackme.exe
python3 tools/my-second-crackme-solve.py --check
```

---

## 1. Premier regard

```text
My_Second_Crackme.exe: PE32+ executable (console) x86-64, MinGW-w64
sha256  054660ab159328d64e821ccd4988aedfc4545f973519b04debb161abdbfab87f
md5     d3a9fb5836aedc3ad158c417856d18d7
size    14336
ImageBase 0x140000000  EP start 0x1400013d0
```

```bash
strings -n 5 original/My_Second_Crackme.exe
```

Chaînes utiles (identiques au premier) :

```text
enter the password :
Yeaaaaa!!! Discord : imrate
Flag : CMO{%s}
Not today...
```

Imports CRT : `fgets`, `strlen`, `strncmp` (présent dans l’IAT, **non utilisé** par le check), `strcspn`, `getchar`, `puts`, `fflush`.  
Pas de packing, pas d’anti-debug, pas de blob ASCII XOR évident comme `FFEuiXKIAGO` du #1.

`.data` RVA `0x4000` (fichier `0x3000`) commence par `37 13 00 00` → **`dword_140004000 = 0x1337`**.

---

## 2. Flow

`start` (`0x1400013d0`) → CRT MinGW `sub_140001020` → « main » utilisateur **`sub_140001440`**.

1. `sub_140001860()` — init des `.ctors` MinGW (sans rapport avec le seed).
2. Prompt `enter the password : ` via `sub_140001FF0` (printf) + `fflush`.
3. `fgets(buf, 64, stdin)` puis `buf[strcspn(buf, "\r\n")] = 0`.
4. `strlen(buf) == 14` **obligatoire**, sinon `Not today...`.
5. Check SSE 8 octets (`cmp rax, 56252CAB5D734876h`) **et** 6 XOR scalaires sur `buf[0..6]`.
6. OK : `puts("Yeaaaaa!!! Discord : imrate")` puis `printf("Flag : CMO{%s}\n", buf)`.
7. KO : `puts("Not today...")`.
8. `getchar()` puis `return 0`.

Le flag est le password entre accolades `CMO{…}` (soumission site : `CMO{Xor_N0t_3nough}`).

---

## 3. Comment on trouve le password

### 3.1 Ancrage IDA (Hex-Rays)

MCP `ida` sur `original/My_Second_Crackme.exe` (base ensuite sous `analysis/My_Second_Crackme.exe.i64`, gitignorée).

Le pseudo de `sub_140001440` est un **monstre SSE** (`_mm_unpacklo_epi32`, `packuswb`, shuffles) mélangé à des `imul` du type `-1029531031 * dword_140004000 - 740551042`. Hex-Rays fusionne mal les `packuswb` et les masques : on lit l’**asm**.

```asm
; sub_140001440 — après strcspn
1400014AE:  mov     edi, cs:dword_140004000   ; seed = 0x1337
            call    strlen
            cmp     rax, 0Eh
            jnz     loc_fail
            movq    xmm0, qword ptr [buf]     ; p[0..7]
            movq    xmm1, qword ptr [buf+6]   ; p[6..13]
            ; 8×  imul edi, CONST / add CONST  → empilés dans xmm2
            ...
            movq    rax, xmm3
            mov     rcx, 56252CAB5D734876h
            cmp     rax, rcx
            jnz     loc_fail
            ; puis 6 cmp 8-bit (p[i]^p[i+1]^mba == imm)
```

### 3.2 Seed et MBA

`dword_140004000` n’est **jamais écrit** (une seule xref lecture à `0x1400014AE`). C’est une constante `0x1337`.

Chaque octet « magique » est :

```text
((mul * 0x1337 + add) & 0xFFFFFFFF) >> 16  &  0xFF
```

C’est le même extrait que `rand()` glibc (`1103515245 * seed + 12345`) pour **un** des six checks scalaires ; les autres `mul`/`add` sont des MBA qui, seed fixé, se réduisent à un octet.

| rôle | `mul` | `add` | octet |
|---|---|---|---|
| k0 (eax) | `C2A29A69` | `D3DC167E` | `0x41` `'A'` |
| k1 (r11) | `8D6072DD` | `961BAFAD` | `0x5A` `'Z'` |
| k2 (ecx) | `CFDDDF21` | `CD1DCF18` | `0x58` `'X'` |
| k3 (edx) | `0FFA0F0D` | `AF5AAD71` | `0x31` `'1'` |
| k4 (r8) | `EF1C5E89` | `20DA7756` | `0xF6` |
| k5 (r9) | `5AD7FE55` | `AFE533D7` | `0x2D` `'-'` |
| k6 (r10) | `C8333031` | `69ACC4C4` | `0x3F` `'?'` |
| k7 (esi) | `6BFE3E19` | `391EB2E2` | `0x59` `'Y'` |
| kA | `D3DC57F9` | `C21F1C8A` | `0xFD` |
| kB | `9B355305` | `3EAD62FB` | `0x4B` `'K'` |
| kC | `EBA1483D` | `0DAA96F5` | `0xAD` |
| kD (LCG) | `41C64E6D` | `00003039` | `0x6D` `'m'` |
| kE | `EE067F11` | `D6651C2C` | `0x38` `'8'` |
| kF | `807DBCB5` | `A70427DF` | `0x09` |

Les 8 `k[i]` sont packés (`psrld 10h` + masque `xmmword_140003090` = `FF000000` × 4 + `packuswb` × 2) en qword LE **`0x593F2DF631585A41`** (`AZX1\xf6-?Y`).

### 3.3 Linéarisation SSE

Le mélange (`punpcklbw` de `p[6..13]`, `pshufhw`/`pshufd`/`pshuflw`, blend `xmmword_1400030A0` = `00` puis 15 × `FF`, `psrlw xmm0, 8`, `pxor` avec `k`) est **affine** sur GF(2) : XOR d’octets du password avec `k`.

Sonde : password tout-nul → résultat = `k` ; un seul `p[i]=1` donne la colonne :

| résultat `R[0..7]` (cible `76 48 73 5D AB 2C 25 56`) | XOR |
|---|---|
| `R0` | `k0 ^ p[0] ^ p[1]` |
| `R1` | `k1 ^ p[11] ^ p[12]` |
| `R2` | `k2 ^ p[6] ^ p[7]` |
| `R3` | `k3 ^ p[7] ^ p[8]` |
| `R4` | `k4 ^ p[8] ^ p[9]` |
| `R5` | `k5 ^ p[9] ^ p[10]` |
| `R6` | `k6 ^ p[10] ^ p[11]` |
| `R7` | `k7 ^ p[12] ^ p[13]` |

`p[2..5]` n’entrent **pas** dans le qword SSE — uniquement dans les 6 checks 8-bit qui suivent.

### 3.4 Checks scalaires (asm)

```asm
; p[5]^p[4]^kA == 83h
imul    edx, edi, 0D3DC57F9h
add     edx, 0C21F1C8Ah
shr     edx, 10h
xor     r8b, al          ; al = p[4], r8b = p[5]
xor     r8b, dl
cmp     r8b, 83h

; p[6]^p[5]^kB == 0Fh
; p[4]^p[3]^kC == 0BCh
; p[0]^kD     == 35h      ← détermine p[0]
; p[3]^p[2]^kE == 15h
; p[1]^p[2]^kF == 14h
```

Donc :

```text
p[0]           = kD ^ 0x35
p[4] ^ p[5]    = kA ^ 0x83
p[6] ^ p[5]    = kB ^ 0x0F
p[4] ^ p[3]    = kC ^ 0xBC
p[3] ^ p[2]    = kE ^ 0x15
p[1] ^ p[2]    = kF ^ 0x14
```

### 3.5 Chaîne (exemple)

Cible SSE LE : `76 48 73 5D AB 2C 25 56`.

| i | formule | octet | ASCII |
|---|---|---|---|
| 0 | `kD ^ 0x35` | `6d ^ 35 = 58` | `X` |
| 1 | `k0 ^ p0 ^ R0` | `41 ^ 58 ^ 76 = 6f` | `o` |
| 2 | `kF ^ p1 ^ 0x14` | `09 ^ 6f ^ 14 = 72` | `r` |
| 3 | `kE ^ p2 ^ 0x15` | `38 ^ 72 ^ 15 = 5f` | `_` |
| 4 | `kC ^ p3 ^ 0xBC` | `ad ^ 5f ^ bc = 4e` | `N` |
| 5 | `kA ^ p4 ^ 0x83` | `fd ^ 4e ^ 83 = 30` | `0` |
| 6 | `kB ^ p5 ^ 0x0F` | `4b ^ 30 ^ 0f = 74` | `t` |
| 7 | `k2 ^ p6 ^ R2` | `58 ^ 74 ^ 73 = 5f` | `_` |
| 8 | `k3 ^ p7 ^ R3` | `31 ^ 5f ^ 5d = 33` | `3` |
| 9 | `k4 ^ p8 ^ R4` | `f6 ^ 33 ^ ab = 6e` | `n` |
| 10 | `k5 ^ p9 ^ R5` | `2d ^ 6e ^ 2c = 6f` | `o` |
| 11 | `k6 ^ p10 ^ R6` | `3f ^ 6f ^ 25 = 75` | `u` |
| 12 | `k1 ^ p11 ^ R1` | `5a ^ 75 ^ 48 = 67` | `g` |
| 13 | `k7 ^ p12 ^ R7` | `59 ^ 67 ^ 56 = 68` | `h` |

→ **`Xor_N0t_3nough`**.

### 3.6 Pièges

- Hex-Rays : le check SSE tient en une expression `_mm_*` illisible ; l’asm + une sonde linéaire (14 passwords unitaires) donne le système XOR.
- `sub_140001860` n’initialise pas le seed.
- `strncmp` dans l’IAT n’est pas le prédicat (contrairement au `strcmp` du #1).
- `strings` ne montre **pas** le password ; les `k[i]` ASCII `AZX1-?Y` collés ne passent pas au prompt.
- Longueur ≠ 14 → fail immédiat, avant SSE.

---

## 4. Pseudo-code

```python
SEED = 0x1337  # dword_140004000
TARGET = bytes.fromhex("7648735DAB2C2556")  # LE 0x56252CAB5D734876

def mba(mul, add):
    return ((mul * SEED + add) & 0xFFFFFFFF) >> 16 & 0xFF

k = [mba(m, a) for m, a in [
    (0xC2A29A69, 0xD3DC167E), (0x8D6072DD, 0x961BAFAD),
    (0xCFDDDF21, 0xCD1DCF18), (0x0FFA0F0D, 0xAF5AAD71),
    (0xEF1C5E89, 0x20DA7756), (0x5AD7FE55, 0xAFE533D7),
    (0xC8333031, 0x69ACC4C4), (0x6BFE3E19, 0x391EB2E2),
]]
p = [0] * 14
p[0]  = mba(0x41C64E6D, 0x3039) ^ 0x35
p[1]  = k[0] ^ p[0] ^ TARGET[0]
p[2]  = mba(0x807DBCB5, 0xA70427DF) ^ p[1] ^ 0x14
p[3]  = mba(0xEE067F11, 0xD6651C2C) ^ p[2] ^ 0x15
p[4]  = mba(0xEBA1483D, 0x0DAA96F5) ^ p[3] ^ 0xBC
p[5]  = mba(0xD3DC57F9, 0xC21F1C8A) ^ p[4] ^ 0x83
p[6]  = mba(0x9B355305, 0x3EAD62FB) ^ p[5] ^ 0x0F
p[7]  = k[2] ^ p[6] ^ TARGET[2]
p[8]  = k[3] ^ p[7] ^ TARGET[3]
p[9]  = k[4] ^ p[8] ^ TARGET[4]
p[10] = k[5] ^ p[9] ^ TARGET[5]
p[11] = k[6] ^ p[10] ^ TARGET[6]
p[12] = k[1] ^ p[11] ^ TARGET[1]
p[13] = k[7] ^ p[12] ^ TARGET[7]
password = bytes(p).decode()          # Xor_N0t_3nough
flag = f"CMO{{{password}}}"           # CMO{Xor_N0t_3nough}
```

---

## 5. Vérification

```text
$ printf '%s\n' Xor_N0t_3nough | WINEDEBUG=-all wine original/My_Second_Crackme.exe
enter the password : Yeaaaaa!!! Discord : imrate
Flag : CMO{Xor_N0t_3nough}

$ printf '%s\n' H3llo_Crackme | WINEDEBUG=-all wine original/My_Second_Crackme.exe
enter the password : Not today...

$ printf '%s\n' Xor_N0t_3noug | WINEDEBUG=-all wine original/My_Second_Crackme.exe
enter the password : Not today...

$ python3 tools/my-second-crackme-solve.py --check
Yeaaaaa!!! Discord : imrate
Flag : CMO{Xor_N0t_3nough}
OK
```

Cas KO utiles : password du #1 (`H3llo_Crackme`), longueur 13 (`Xor_N0t_3noug`), ciphertext `AZX1` des `k[i]`.

---

## 6. Notes

- Consigne site *No patching* : decode / keygen, pas de patch dans `original/`.
- Discord cité : `imrate`.
- Wine console suffit (UCRT via `api-ms-win-crt-*`) ; pas besoin des DLL MinGW `libstdc++` / `libgcc` à côté de l’exe.
- x64dbg MCP injoignable pendant le reverse ; preuve = IDA + reconstruction XOR + Wine.
- Jumeau : [My First Crackme](../6ac65258cdee6e086a17364d/) — XOR unique `0x2A` sur 13 octets.
