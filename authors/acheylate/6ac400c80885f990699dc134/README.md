# acheylate's Password Check With State Machine

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ac400c80885f990699dc134) · id `6ac400c80885f990699dc134`

ELF64 **Rust** PIE, **non strippé**. Diff. site **3.0**. Description : *Find the correct password* (argv, machine à états, **pas de patch**).

Jumeaux de la même famille (immediates LE, pas une C-string) : [`Find the password`](../6aac1a0c585e8875bcbec009/) / [Windows](../6aac22ff48cda5a2aaa3de2d/) (`HVUHADN`).

| Fichier | Rôle |
|---|---|
| [`original/crackme-state`](original/crackme-state) | binaire |
| [`tools/state-machine-solve.py`](tools/state-machine-solve.py) | password / `--check` |
| [`analysis/process_bytes.pseudoc`](analysis/process_bytes.pseudoc) | Hex-Rays de `process_bytes` |

## Réponse

| | |
|---|---|
| **Password** | `S7HVH.` |
| OK | `Correct!` |
| KO | `Wrong!` |

```bash
python3 tools/state-machine-solve.py
# S7HVH.  # packed LE 0x2e4856483753
python3 tools/state-machine-solve.py -q
# S7HVH.
./original/crackme-state 'S7HVH.'
# Correct!
python3 tools/state-machine-solve.py --check
```

Le password est **fixe** (pas un keygen name→serial). Il passe en **`argv[1]`**, pas sur stdin.

---

## 1. Premier regard

```text
crackme-state: ELF 64-bit LSB pie executable, x86-64, dynamically linked, not stripped
sha256  fcc728aa9afbe8d05cf58cf45aa52d3cf0583f6a46b432160bf81a8df19d78f4
size    448584
rustc   8bab26f4f68e0e26f0bb7960be334d5b520ea452  (release, no inlining — dit l’auteur)
```

```bash
strings -n 6 original/crackme-state | grep -E 'Correct|Wrong|Enter|password'
nm original/crackme-state | grep crackme_state
```

Messages de verdict seulement :

```text
Correct!
Wrong!
```

Aucun prompt `Enter the password`. Les symboles du crate tiennent en deux fonctions utiles :

| Symbole | VMA |
|---|---|
| `crackme_state::process_bytes::<core::str::iter::Bytes>` | `0x13ef0` |
| `crackme_state::main` | `0x14120` |

`strings` ne montre **pas** `S7HVH.` comme C-string. L’auteur le dit : *the password is not stored as a plain sequence of bytes or a readable string*.

---

## 2. Flow

`crackme_state::main` (Hex-Rays) :

1. `std::env::args()` puis deux `Iterator::next` : on jette `argv[0]`, on garde `argv[1]`.
2. Pas d’argument → slice vide (équivalent `Wrong!`).
3. `state = 0` (octet sur la pile).
4. `process_bytes(ptr, ptr+len, &state)` sur les **octets UTF-8** de `argv[1]`.
5. `state == 6` → `_print("Correct!\n")` ; sinon `"Wrong!\n"`.

```asm
; VMA 0x14210 — init + appel + verdict
14210:  mov    BYTE PTR [rsp], 0x0          ; state = 0
14214:  add    r15, rbx                     ; end = begin + len
14220:  call   13ef0                        ; process_bytes
14225:  xor    eax, eax
14227:  cmp    BYTE PTR [rsp], 0x6          ; accept == 6
1422b:  sete   al
1422e:  lea    rcx, [rip+Correct!]          ; 0x75e0 "Correct!\n"
14235:  lea    rdi, [rip+Wrong!]            ; 0x75e9 "Wrong!\n"
1423c:  cmove  rdi, rcx
```

Pas d’anti-debug, pas de lecture stdin.

---

## 3. Comment on trouve le password

### 3.1 Ancrage

```bash
objdump -d -M intel --start-address=0x13ef0 --stop-address=0x14042 original/crackme-state
```

Ou MCP `ida` : Hex-Rays de `0x13ef0` / `0x14120` (extrait dans [`analysis/process_bytes.pseudoc`](analysis/process_bytes.pseudoc)).

L’auteur indique aussi la méthode **cross-ref** : xrefs vers `Correct!` → `main` → unique `call process_bytes`.

### 3.2 Packed immediate

Au tout début de `process_bytes`, LLVM charge la table d’octets attendus dans un registre :

```asm
13efc:  movabs r8, 0x2e4856483753     ; 6 octets utiles, LE
13f06:  lea    ecx, [rax*8+0x0]       ; ecx = state * 8
13f0d:  mov    r9, r8
13f10:  shr    r9, cl                 ; expected = packed >> (8*state)
13f13:  lea    ecx, [rax+0x1]         ; next = state + 1
13f16:  cmp    BYTE PTR [rdi], r9b    ; input[i] == expected ?
13f1d:  mov    r10d, 0x7              ; fail
13f23:  cmove  r10d, r9d              ; match → state+1
13f27:  mov    BYTE PTR [rdx], r10b
13f2a:  not    r10b
13f2d:  test   r10b, 0x6
13f31:  je     ret                    ; stop si new_state ∈ {6, 7}
```

Lecture little-endian de `0x2e4856483753` (6 octets) :

| Shift | Octet | ASCII | État qui l’attend |
|---|---|---|---|
| `>> 0` | `53` | `S` | 0 |
| `>> 8` | `37` | `7` | 1 |
| `>> 16` | `48` | `H` | 2 |
| `>> 24` | `56` | `V` | 3 |
| `>> 32` | `48` | `H` | 4 |
| `>> 40` | `2e` | `.` | 5 |

→ **`S7HVH.`**

Le 6ᵉ octet est aussi comparé en immediate `cmp BYTE PTR [rdi], 0x2e` dans le dernier cran de l’unroll (VMA `0x14037`), quand l’appel a commencé à `state == 0`.

### 3.3 Machine à états

`state` est un `u8` :

| Valeur | Rôle |
|---|---|
| `0..5` | on attend le caractère `packed[state]` |
| `6` | accept (tous les 6 caractères OK, on s’arrête) |
| `7` | reject (mismatch, ou `state` déjà terminal au début d’une itération) |

Transition (une itération du source, avant unroll LLVM) :

```text
if state >= 6:
    state = 7; return
expected = (0x2e4856483753 >> (8 * state)) & 0xff
state = (state + 1) if byte == expected else 7
if state in (6, 7):
    return
```

LLVM **unroll** jusqu’à 6 octets dans un seul `process_bytes` (release, `#[inline(never)]` sur la fonction — d’où le nom visible). Les tests `cmp al, 0x5` / `cmp al, 0x3` / `test al, al` bornent l’unroll selon l’état **d’entrée** de l’appel.

Le `test r10b, 6` après `not` :

```text
(~state & 6) == 0  ⇔  (state & 6) == 6  ⇔  state ∈ {6, 7}
```

Dès qu’on atteint accept ou reject, le reste de l’unroll n’est pas exécuté.

### 3.4 Exemple `S7HVH.`

| i | char | state avant | expected | state après |
|---|---|---|---|---|
| 0 | `S` | 0 | `S` | 1 |
| 1 | `7` | 1 | `7` | 2 |
| 2 | `H` | 2 | `H` | 3 |
| 3 | `V` | 3 | `V` | 4 |
| 4 | `H` | 4 | `H` | 5 |
| 5 | `.` | 5 | `.` | **6** (stop) |

`main` voit `6` → `Correct!`.

`S7HVH` (sans le point) s’arrête à l’état 5 → `Wrong!`.  
Un premier octet faux → état 7 tout de suite.

Un **suffixe** après les 6 bons caractères (`S7HVH.x`) imprime aussi `Correct!` : `process_bytes` return dès l’état 6, sans consommer le reste. C’est le comportement du binaire compilé (arrêt terminal), pas un second password.

### 3.5 Piège `strings`

Offset fichier `0x12efc` (VMA `0x13efc`) :

```text
49 b8 53 37 48 56 48 2e 00 00     movabs r8, 0x2e4856483753
      S  7  H  V  H  .  pad pad
```

`strings -n 4` peut coller `S7HVH` (sans le `.` : `2e` est trop court tout seul, ou collé au padding NUL). Ce n’est **pas** une C-string Rust ; il faut le `movabs` + le shift `state*8`.

Même famille de piège que `HVUH3` / `HADN3T` sur [Find the password](../6aac1a0c585e8875bcbec009/).

### 3.6 Pseudo-code

```python
PACKED = 0x2E4856483753  # LE → b"S7HVH."

def check(argv1: bytes) -> bool:
    state = 0
    for b in argv1:
        if state >= 6:
            return False
        expected = (PACKED >> (8 * state)) & 0xFF
        state = state + 1 if b == expected else 7
        if state in (6, 7):
            break
    return state == 6
# check(b"S7HVH.") is True
```

---

## 4. Vérification

```text
$ ./original/crackme-state 'S7HVH.'
Correct!

$ ./original/crackme-state 'S7HVH'
Wrong!

$ ./original/crackme-state 'HVUHADN'
Wrong!

$ ./original/crackme-state
Wrong!

$ printf 'S7HVH.\n' | ./original/crackme-state
Wrong!
```

```bash
python3 tools/state-machine-solve.py --check
# Correct!
# OK
```

Le solveur recoupe le packed `0x2e4856483753` dans le binaire, simule la machine, puis lance l’ELF.

---

## 5. Notes

- Mot de passe **fixe**, saisi en `argv[1]` (stdin ignoré).
- Release Rust **sans inlining** : le crate reste lisible (`process_bytes` / `main`) au milieu du bruit std/gimli.
- Reverse statique (`nm` + `objdump` + Hex-Rays MCP `ida`) ; GDB inutile.
- Règle auteur : **no patching** — le solveur n’écrit pas dans `original/`.
- Base IDA éventuelle : `analysis/crackme-state.i64` (gitignorée).
