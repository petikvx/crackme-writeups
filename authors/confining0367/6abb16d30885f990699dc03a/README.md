# confining0367's Key

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6abb16d30885f990699dc03a) · id `6abb16d30885f990699dc03a`

PE64 console **C++**, MSVC 19.51 / linker 14.51, **build Debug** (`MSVCP140D.dll`, `ucrtbased.dll`, PDB `Key.pdb`).  
Cinq portes XOR + un serial `X-X-X`. Famille : [`../README.md`](../README.md).

| Fichier | Rôle |
|---|---|
| [`original/Key.exe`](original/Key.exe) | binaire (Debug, 790 528 octets) |
| [`tools/key-solve.py`](tools/key-solve.py) | keygen / `-q` / `--check` |

## Réponse

| | |
|---|---|
| **Username** (exemple) | `petik` |
| **Serial** | `AgZ->_:-1` |
| OK | `Access granted. Well done.` |
| KO | `Access denied at length.` / `one.` / `two.` / `three.` / `something but don't know where.` |

```bash
python3 tools/key-solve.py -q --user petik
# AgZ->_:-1
python3 tools/key-solve.py --user petik --check
```

Le binaire d’origine est un **Debug** MSVC : Wine sans `MSVCP140D.dll` / `VCRUNTIME140D.dll` / `ucrtbased.dll` refuse de charger l’image (`c0000135`). `--check` valide l’oracle des cinq étages (identique au code) et tente Wine seulement si le CRT debug est là.

---

## 1. Premier regard

```text
Key.exe: PE32+ executable for MS Windows 6.00 (console), x86-64, 10 sections
sha256  d112c3a4aa74d316d1656e0cd6a02754c7ab16ec4694da53d63bb1cf9445b79d
size    790528
DIE     Microsoft Visual C/C++ 19.51 [C++], Visual Studio 2026, Debug (codeview)
PDB     C:\Users\fern\source\repos\Key\x64\Debug\Key.pdb
```

```bash
file original/Key.exe
diec original/Key.exe
strings -n 5 original/Key.exe
```

Messages utiles, tous en clair dans `.rdata` :

```text
   THE VAULT :: crackme v1
Username:
Serial (X-X-X):
Access granted. Well done.
Access denied at
Not in front of others, I'm shy.
RE-VERSE-ME
HaHaHa
length / one / two / three / something but don't know where.
```

Imports KERNEL32 : `IsDebuggerPresent`, `CheckRemoteDebuggerPresent`, `GetThreadContext` (anti-debug).  
Le reste est le CRT debug (`MSVCP140D`, `VCRUNTIME140D`, `VCRUNTIME140_1D`, `ucrtbased`).

Chaque fonction « métier » passe par un **thunk JMC** de 5 octets (`jmp sub_…` vers `0x140052xxx`) : build `/JMC` (Just My Code). Les adresses ci-dessous sont celles des **vraies** fonctions, après le saut.

---

## 2. Flow

`sub_14005AE80` (boucle infinie, `__noreturn`) :

1. `system("cls")`, bandeau `THE VAULT :: crackme v1`.
2. **`sub_14005A440`** : si debugger → `Not in front of others, I'm shy.` puis `pause`, et on recommence.
3. `cin >> username`, `cin >> serial` (`std::string`, blanc = fin de token).
4. **`sub_14007C4C0`** : copie user/serial, découpe le serial sur les **deux premiers** `'-'`.
5. Pour `stage` dans `{1,2,3,4,5}` : **`sub_14005DCC0(stage, ctx)`**. Premier retour non nul → `Access denied at <nom>.` (`sub_1400577B0`).
6. Les cinq à 0 → `Access granted. Well done.` puis `pause`, et on recommence.

Objet `ctx` (offsets MSVC `std::string` = 40 octets) :

| off | champ |
|---|---|
| `+0` | username |
| `+0x28` | serial entier |
| `+0x50` | PART1 (avant le 1er tiret) |
| `+0x78` | PART2 |
| `+0xA0` | PART3 |
| `+0xC8` | `state` (DWORD, init 0) |
| `+0xCC` | parse OK (deux tirets trouvés) |

Noms d’échec (`sub_1400577B0`) : `1→length`, `2→one`, `3→two`, `4→three`, `5→something but don't know where.`

---

## 3. Comment on trouve le serial

Ancrage : MCP IDA (`open_database` sur `original/Key.exe`) → xrefs vers `Access granted` / `Username:` → `sub_14005AE80`, puis les callees. Dump C complet inutile : le check tient dans cinq petites fonctions.

### 3.1 Anti-debug — `sub_14005A440`

```c
if (IsDebuggerPresent()) return 1;
CheckRemoteDebuggerPresent(GetCurrentProcess(), &flag);
if (flag) return 1;
GetThreadContext(..., CONTEXT_DEBUG_REGISTERS);
return Dr0 || Dr1 || Dr2 || Dr3;
```

Wine sans debugger : les trois tests sont faux, on arrive au prompt.

### 3.2 Parse `X-X-X` — `sub_14007C4C0`

`find('-')` puis `find('-', pos+1)`. Si les deux existent :

```text
PART1 = serial[0 : d0]
PART2 = serial[d0+1 : d1]
PART3 = serial[d1+1 : ]
parse_ok = 1
```

Sinon PART1/2/3 restent vides. `RE-VERSE-ME` se découpe en `RE` / `VERSE` / `ME` (leurre du prompt).

### 3.3 Dispatcher — `sub_14005DCC0`

```c
switch (stage) {
  case 1: return sub_1400571D0(ctx);  // length
  case 2: return sub_140057000(ctx);  // one
  case 3: return sub_140057390(ctx);  // two
  case 4: return sub_140057270(ctx);  // three
  case 5: return sub_140057130(ctx);  // flag XOR
}
return 1;  // fail
```

Retour **non nul = échec**. Chaque succès fait `state ^= constante`.

### 3.4 Étape 1 — longueur du username (`0x1400571D0`)

```asm
call    sub_1400524C4          ; std::string::size (username, +0)
cmp     rax, 4
jb      fail
cmp     rax, 10h
jbe     ok
fail:   mov eax, 1
ok:     xor dword [ctx+0C8h], 6
        xor eax, eax
```

`4 ≤ len(user) ≤ 16`. Succès : `state ^= 6`.

### 3.5 Étape 2 — checksum PART1 (`0x140057000`)

Boucle sur PART1 (`ctx+0x50`) :

```asm
; i = 0 .. size(PART1)-1
movzx   eax, byte [PART1[i]]
inc     rcx                    ; rcx = i+1
imul    rax, rcx               ; (i+1) * c
add     [sum], eax
; puis
call    size(username)
imul    eax, 25h               ; * 37
add     eax, 64h               ; + 100
and     eax, 0FFh
and     ecx, 0FFh              ; sum
cmp     eax, ecx
jz      xor_ok
```

Donc :

```text
(sum_i (i+1) * PART1[i])  & 0xff  ==  (37 * len(user) + 100) & 0xff
```

Succès : `state ^= 0x2D`.

Pour `petik` (`len=5`) : cible `(37*5 + 100) & 0xff = 285 & 0xff = 29`.

`AgZ` :

| i | char | `(i+1)*ord` | acc |
|---|---|---|---|
| 0 | `A` (65) | 65 | 65 |
| 1 | `g` (103) | 206 | 271 |
| 2 | `Z` (90) | 270 | 541 |

`541 & 0xff = 29`. Autres PART1 valides pour `petik` : `AjX`, `iZ`, `An`, …

Le solveur cherche d’abord un triplet `Axx` alnum (même famille que `AAg` / `AB6` / `ACO`).

### 3.6 Étape 3 — PART2 XOR `0x36` (`0x140057390`)

```asm
mov     [buf+0], 8
mov     [buf+1], 69h          ; 105
mov     [buf+2], 0Ch
; for j = 0..2 : push_back(buf[j] ^ 36h)
call    operator==            ; PART2 == decoded
jnz     xor_ok                ; non-zéro = égalité MSVC
```

| octet | XOR `0x36` | ASCII |
|---|---|---|
| 8 | `0x3E` | `>` |
| 105 (`0x69`) | `0x5F` | `_` |
| 12 | `0x3A` | `:` |

PART2 attendu : **`>_:`**. Succès : `state ^= 0xF6`.

Le leurre `RE-VERSE-ME` a PART2 = `VERSE` → `Access denied at two.`

### 3.7 Étape 4 — PART3, rotate + XOR `0x11` (`0x140057270`)

`sub_140057AA0(c, n)` est un **rotate left 8 bits** :

```c
return (c >> ((8 - (n & 7)) & 7)) | (c << (n & 7));
```

Le for sur PART3 (`ctx+0xA0`) :

```asm
; i = 0
jmp     header
inc:    inc i
header: cmp i, size(PART3)
        jnb fail_empty          ; i >= n → fail (n==0)
        rol = rol8(PART3[i], i)
        xor al, 11h
        cmp al, [unk_140108000 + i]
        jz  success
        mov eax, 1
        jmp ret
success:
        xor dword [ctx+0C8h], 0D2h
        xor eax, eax
        jmp ret
        jmp inc                 ; mort (après le return)
fail_empty:
        mov eax, 1
```

**Piège Hex-Rays** : le pseudo ne montre que `i = 0` (premier caractère). C’est fidèle au **runtime** : le `return 0` est **dans** le `for`, donc un seul octet est testé. Le `jmp inc` à `0x140057339` est du code mort `/Od`.

Table `.data` `unk_140108000` (fichier `0xb5e00`) :

```text
20 79 d9 80 c8 00 00 …
```

Si le for allait au bout, `c[i] = ror8(table[i] ^ 0x11, i)` donnerait `1 4 2 2` puis `0x9d`. En pratique **seul `table[0] = 0x20` compte** :

```text
rol8(c, 0) ^ 0x11 == 0x20  →  c == 0x31  →  '1'
```

PART3 non vide commençant par **`1`**. Succès : `state ^= 0xD2`.

### 3.8 Étape 5 — le XOR global (`0x140057130`)

```c
if (serial == "RE-VERSE-ME")
    cout << "HaHaHa";
return state != 15;
```

`HaHaHa` est inatteignable avec les étapes 1–4 (PART2 devrait être à la fois `VERSE` et `>_:`).

`state` part de 0. Les quatre XOR de succès :

```text
0 ^ 6 ^ 0x2D ^ 0xF6 ^ 0xD2 = 0x0F = 15
```

Si une étape a été sautée, `state != 15` → `Access denied at something but don't know where.`

### 3.9 Assemblage `petik`

```text
user     petik          len 5  (étape 1)
cible    (37*5+100)&255 = 29
PART1    AgZ            score 29
PART2    >_:
PART3    1
serial   AgZ->_:-1
```

`cin >>` : pas d’espace dans le serial. Les deux tirets du format collent PART2 (`>_:`) entre PART1 et PART3.

---

## 4. Prédicat consolidé

```python
def rol8(x, n):
    n &= 7
    return ((x << n) | (x >> ((8 - n) & 7))) & 0xFF

def ok(user, serial):
    if not (4 <= len(user) <= 16):
        return False
    d0 = serial.find("-")
    d1 = serial.find("-", d0 + 1)
    p1, p2, p3 = serial[:d0], serial[d0+1:d1], serial[d1+1:]
    if sum((i + 1) * ord(c) for i, c in enumerate(p1)) & 0xFF != (37 * len(user) + 100) & 0xFF:
        return False
    if p2 != bytes((8 ^ 0x36, 105 ^ 0x36, 12 ^ 0x36)).decode():
        return False
    if not p3 or (rol8(ord(p3[0]), 0) ^ 0x11) != 0x20:
        return False
    return (0 ^ 6 ^ 0x2D ^ 0xF6 ^ 0xD2) == 15
```

Keygen : n’importe quel PART1 sans `'-'` de checksum `target(user)`, puis `f"{p1}->_:-1"`.

---

## 5. Vérification

```bash
python3 tools/key-solve.py -q --user petik
# AgZ->_:-1

python3 tools/key-solve.py --check
# petik -> AgZ->_:-1  (ok)
# oracle: OK (granted) + KO length/two/RE-VERSE-ME
# Wine: skip (build Debug — MSVCP140D / ucrtbased absents)
```

| Cas | Entrée | Attendu |
|---|---|---|
| OK | `petik` / `AgZ->_:-1` | granted (`state==15`) |
| OK | `test` / `AAg->_:-1` | granted (len 4, cible 248) |
| OK | `crackme` / `AB6->_:-1` | granted (len 7, cible 103) |
| KO length | `abc` | `Access denied at length.` |
| KO two | `petik` / `AgZ-VERSE-1` | `Access denied at two.` |
| KO leurre | `petik` / `RE-VERSE-ME` | `Access denied at two.` (`VERSE` ≠ `>_:`) |

Wine live : coller `MSVCP140D.dll`, `VCRUNTIME140D.dll`, `VCRUNTIME140_1D.dll`, `ucrtbased.dll` (dossier `VC\Redist\MSVC\…\debug_nonredist\x64`, **non redistribuable**) à côté de `Key.exe`, puis :

```bash
printf 'petik\nAgZ->_:-1\n\n' | wine original/Key.exe
```

(`system("pause")` consomme une ligne vide après le serial.)

---

## 6. Notes

- Premier projet de l’auteur (page crackmes.one) : XOR partout, pas de crypto lourde.
- Build **Debug** : image ~770 KiB, thunks JMC, `0xCCCCCCCC` sur la stack, PDB `fern\source\repos\Key`.
- `RE-VERSE-ME` / `HaHaHa` : honeypot aligné sur le prompt `X-X-X`.
- Table PART3 5 octets (`20 79 d9 80 c8`) : intention probable `1422` + un octet non ASCII ; le `return` dans le `for` ne garde que `'1'`.
- x64dbg MCP injoignable sur cette session ; reverse 100 % IDA headless + formule. Pas de session GDB (PE).
- Base IDA `analysis/Key.exe.i64` (gitignorée).
