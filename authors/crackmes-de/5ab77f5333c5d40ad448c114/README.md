# crackme2 (immortal_one)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5333c5d40ad448c114) · id `5ab77f5333c5d40ad448c114`  
> Import crackmes.de — auteur **immortal_one** (`dean@chaddean.freeserve.co.uk`).

PE32 GUI assembler (9673 octets), packé maison (ROR + XOR `0xB3` + XOR dword `0x36AD87`). Dialog `[CRACKME2] (c) Immortal_One` : **Name** + **Serial**, boutons **CHECK** / **ABOUT**. L’énoncé demande un **keygen**, pas un patch.

| Fichier | Rôle |
|---|---|
| [`original/Crackme2.exe`](original/Crackme2.exe) | PE32 GUI packé (ne pas patcher) |
| [`original/Crackme2.zip`](original/Crackme2.zip) | archive auteur |
| [`analysis/Crackme2.unpacked.exe`](analysis/Crackme2.unpacked.exe) | `.text` XOR-déchiffré (preuve GUI Win moderne) |
| [`tools/crackme2-solve.py`](tools/crackme2-solve.py) | keygen + `--check` GUI |

## Réponse

| Champ | Valeur |
|---|---|
| Name | **`petik`** (l’edit force **`PETIK`**, `ES_UPPERCASE`) |
| Serial | **`372E`** (exactement 4 caractères) |

```bash
python tools/crackme2-solve.py -q --user petik
# 372E
python tools/crackme2-solve.py --check
# predicat: OK  petik → 372E
# gui: Very good now code a keygen
# check: OK
```

OK : static STATUS → `Very good now code a keygen`  
KO longueur ≠ 4 : `?`  
KO serial faux : `Try Again`

Le packer d’origine cherche `kernel32` aux bases XP (`0x77F00000` / `0x77E00000` / `0x77E60000`) : `original/Crackme2.exe` ne montre pas de dialog sur un Windows ASLR actuel. La preuve live utilise l’unpacké.

---

## 1. Premier regard

```text
Crackme2.exe: PE32 GUI Intel 80386, ImageBase 0x400000, EP RVA 0x1000
sha256  4b5442b079cbe54bd167c710aa359fee5ca21fd0ab459d40e3e0bf7e9af89fee
md5     900ed58865c538620676bee61daf983d
size    9673
```

Imports : `CreateDialogParamA`, `GetDlgItemTextA`, `SendDlgItemMessageA`, `MessageBoxA`, `GetModuleHandleA`, `InitCommonControls`.

Strings `.data` :

- `Very good now code a keygen` / `Try Again` / `?`
- alphabet **`123456789ABCDEFG`**
- règles ABOUT (keygen, pas de patch)

Dialog (`.rsrc`) : classe `DLGCLASS`, titre `[CRACKME2] (c) Immortal_One`.

| ID | Contrôle |
|---|---|
| `0x3E9` (1001) | edit Name (`ES_UPPERCASE`) |
| `0x3EA` (1002) | edit Serial |
| `0x3ED` (1005) | static STATUS (`WM_SETTEXT`) |
| `0x3EE` (1006) | CHECK |
| `0x3EF` (1007) | ABOUT → MessageBox règles |

x32dbg MCP : pas de cible. Reverse **statique** IDA (MCP `ida`).

---

## 2. Flow (après unpack)

`start` `@ 0x401000` : `GetModuleHandleA(0)` + `InitCommonControls` + `RegisterClassExA` + `CreateDialogParamA(1000, DialogFunc @ 0x401100)` + boucle `GetMessageA`.

`DialogFunc` `@ 0x401100` :

1. `WM_INITDIALOG` (0x110) → icône, `WM_SETICON`.
2. `WM_COMMAND` `0x3EF` ABOUT → `MessageBoxA` règles.
3. `WM_COMMAND` `0x3EE` CHECK → `GetDlgItemTextA` name (`0x3E9`, max `0x19`) et serial (`0x3EA`) ; si `eax != 4` → STATUS `?` ; sinon mix + compare 4 octets.
4. `WM_CLOSE` / id `0x2711` → `DestroyWindow` / `PostQuitMessage`.

Le check est brouillé par des `jmp $+3` (`EB 01 XX`, souvent `XX=68`) : sauter l’octet poubelle et relire.

---

## 3. Comment on trouve le prédicat

### Unpack (3 couches dans `.rsrc`)

EP clair :

```text
401000  mov dx, 0E108h
401004  mov ecx, 391CC111h
40100A  mov ebx, 9DA29A36h
40100F  std
401010  mov edi, 404BD8h
401015  jmp edi
```

1. **ROR** `@ 0x404BD8` : anti-TF (`pushf` / `test ah,1` / `jnz $`), delta `call/pop`, `esi = 0x404D27`, `ecx = 0x7C9`, `ror al, 0BBh` (donc ROR 3) in-place.
2. **XOR `0xB3`** sur `0x5C9` octets à `0x404E69` (`lea edi, [ebp+40111Fh]`, `ebx = 5C9h`).
3. Stub écrit 7 dwords chiffrés en `0x401000`, puis **XOR dword `0x36AD87`**, `ecx = 0x180` (tout `.text` raw, 0x600 octets), `call start`.

Reconstruction fichier (offset `.text` `0x400`) → [`analysis/Crackme2.unpacked.exe`](analysis/Crackme2.unpacked.exe).

Le loader cherche aussi `VirtualProtect` / `GetModuleHandleA` via un `kernel32` à base XP : inutile une fois `.text` XOR-déchiffré.

### Mix 16-bit + alphabet 16 glyphes

Après `GetDlgItemTextA` name / serial, le serial doit faire **4** caractères. Le name est la somme 16-bit de tous les octets (l’edit a déjà mis les lettres en majuscules) :

```text
bx = 0
for c in name: bx += c          ; add bx, ax  (al = c)
bx += 0x324
push ebx
ax = bx << 10                   ; 16-bit  (shl ax, 0Ah)
bx = bx << 2                    ; shl bx, 22h  → count & 31 = 2
bx += ax
pop eax
bx += ax                        ; + sum16 d’origine
imul ebx, 19h                   ; * 25, 32-bit ; on ne reprend que bh/bl
```

Encodage nibble → `ALPHA = "123456789ABCDEFG"` @ `0x403028` :

| Pos | Source | Glyphe |
|---|---|---|
| 0 | `(bh >> 4) & 0xF` | `ALPHA[…]` |
| 1 | `bh & 0xF` | `ALPHA[…]` |
| 2 | `(bl >> 7) & 0xF` | seulement **`1`** ou **`2`** |
| 3 | `bl & 0xF` | `ALPHA[…]` |

Compare **dword LE** des 4 chars générés (`[ebp-0xA7]`) avec les 4 chars du serial (`[ebp-0x52]`).

Les bits 4–6 de `bl` ne sont pas encodés : le 3ᵉ caractère n’utilise que le bit 7.

### `petik` → `372E`

L’edit convertit `petik` → **`PETIK`**.

```text
P E T I K  =  50 45 54 49 4B
sum16      =  0x17D
+ 0x324    =  0x4A1
<<10       =  0x8400
<<2        =  0x1284
+          =  0x9684
+ 0x4A1    =  0x9B25
* 25       =  0xF269D   →  bh=0x26  bl=0x9D

(bh>>4)=2 → '3'
bh&0xF =6 → '7'
bl>>7  =1 → '2'
bl&0xF =D → 'E'
                372E
```

---

## 4. Prédicat consolidé

```python
ALPHA = "123456789ABCDEFG"

def keygen(name: str) -> str:
    name = name.upper()
    s = (sum(name.encode("latin1")) + 0x324) & 0xFFFF
    bx = (s + ((s << 2) & 0xFFFF) + ((s << 10) & 0xFFFF)) & 0xFFFF
    ebx = (bx * 25) & 0xFFFFFFFF
    bh, bl = (ebx >> 8) & 0xFF, ebx & 0xFF
    return (
        ALPHA[(bh >> 4) & 0xF]
        + ALPHA[bh & 0xF]
        + ALPHA[(bl >> 7) & 0xF]
        + ALPHA[bl & 0xF]
    )
```

---

## 5. Vérification

```text
python tools/crackme2-solve.py --check --user petik
predicat: OK  petik → 372E
gui: Very good now code a keygen
check: OK
```

| Name | Serial | STATUS |
|---|---|---|
| `petik` / `PETIK` | `372E` | Very good now code a keygen |
| `petik` | `XXXX` | Try Again |
| `petik` | `AAA` (len 3) | `?` |

`--check` lance [`analysis/Crackme2.unpacked.exe`](analysis/Crackme2.unpacked.exe) (le packé original ne passe pas le resolve `kernel32` XP). Remplissage des edits : `WM_CHAR` (Python 64-bit / `GetDlgItemTextA` PE32).

---

## 6. Notes

- Anti-debug packer : trap flag (`jnz $`), SIDT / patch `0xCF` — ignoré en unpack statique.
- `jmp $+3` (`EB 01 68`) dans le check : IDA avale un `push imm32` fantôme si on ne saute pas l’octet.
- Ce n’est pas un serial hex « libre » : charset 16 glyphes **sans `0`**, 3ᵉ char ∈ `{1,2}`.
- ABOUT (`0x3EF`) affiche le texte règles ; le STATUS n’est pas une MessageBox.
