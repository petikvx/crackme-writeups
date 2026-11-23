# DonCris's Santa's Network Admin Portal (S.N.A.P.)

| | |
|---|---|
| **ID** | [`69554b1024bfc29298329f00`](https://crackmes.one/crackme/69554b1024bfc29298329f00) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | DonCris |
| **Plateforme** | Windows PE64 console, C++ MinGW-w64 (GCC 14.2), statique, symboles non strippés |
| **SHA-256** | `cd16e655b7709d3e52a1a88ed38f6e895df7ca5bbfd7691a308d389c1b74d7e5` |

| Fichier | Rôle |
|---|---|
| `original/elf_portal.exe` | binaire d'origine (non modifié) |
| `tools/snap-solve.py` | keygen + `--check` (Wine) |

## Réponse

Keygen username → « Elf ID Code » (entier décimal 32 bits non signé).

| Username | Elf ID Code |
|---|---|
| `petik` | `524947593` |

```bash
python3 tools/snap-solve.py            # petik -> 524947593
python3 tools/snap-solve.py -q petik   # serial seul
python3 tools/snap-solve.py --check    # preuve OK + KO sous xvfb-run wine
```

## Premier regard

- `file` : PE32+ console x86-64 ; DIE : MinGW GCC 14.2. Les symboles C++ sont présents (`main`, `generate_elf_id`, `rotate_right`, `SNOWFLAKE_MASK`).
- `strings` : `[AUTH] Enter Elf Username:`, `[ERROR] Username too short`, `[AUTH] Enter Elf ID Code:`, `[ACCESS GRANTED] Welcome, Elf`, `[ACCESS DENIED] Invalid credentials.`

## Flow

1. `print_intro` (bannière ASCII), `GetCurrentProcess` + `CheckRemoteDebuggerPresent`.
2. `getline(cin)` du username ; si `len <= 2` → « Username too short ».
3. `cin >> unsigned` pour l'ID ; échec de parsing → erreur.
4. `h = generate_elf_id(username)` ; si un debugger est détecté, `h = ~h`.
5. `Sleep(1500)` puis `h == ID saisi` → GRANTED, sinon DENIED.

## Comment on trouve

Ancrage : `objdump -d -M intel original/elf_portal.exe`, les symboles donnent directement `main` (VA `0x1400018d1`) et `generate_elf_id` (`0x1400016e8`). Le test final est en `0x140001a9b` : `cmp [rbp-4], eax` (hash calculé vs ID lu en `[rbp-0x44]`).

Corps de `generate_elf_id` (`0x140001714`…`0x1400017b0`), commenté :

```asm
mov  DWORD PTR [rbp-4], 0xcafebabe   ; h = seed (chaîne vide -> retourne 0 directement)
; pour chaque octet c du nom :
xor  [rbp-4], eax                    ; h ^= c
; mul 0x25 / shr 8 / ... / shl 3 / sub : réduction de force de c % 7
;   q = c/7 ; r = c - (q<<3 - q) = c - 7q
lea  edx,[rax+1]  ; call rotate_right ; h = ror32(h, r+1)   (rotate_right = ror edx,cl)
add  [rbp-4], 0x5aa55aa5             ; h += SNOWFLAKE_MASK (0x5aa55aa5 en .rdata)
shl  eax,4 ; xor [rbp-4], eax        ; h ^= h << 4
...
xor  [rbp-4], 0xdeadbeef             ; fin : h ^= 0xdeadbeef
```

Pièges : le `c % 7` est compilé en multiplication magique (`mul 0x25`, `shr`, `shl 3`, `sub`) et non en `div` ; la rotation est de `r+1` (1..7), pas `r`. Anti-debug : si `CheckRemoteDebuggerPresent` renvoie vrai, le hash est inversé (`not`), donc un serial calculé sous debugger serait faux hors debugger — ne pas s'en servir.

Exemple `petik` : seed `0xcafebabe`, puis pour `p,e,t,i,k` : xor, ror(c%7+1), +0x5aa55aa5, `^= h<<4` ; après le xor final `0xdeadbeef` : **524947593** (calculé par le solveur).

## Vérification

```
$ python3 tools/snap-solve.py --check
[OK] serial=524947593 -> GRANTED
[KO] serial=524947594 -> DENIED
```

Lancé contre `original/elf_portal.exe` via `xvfb-run -a wine`, username `petik`.

## Notes

- Pas de GDB ni de debug live : reverse 100 % statique (`objdump`) + preuve Wine.
- Username de 3 caractères minimum ; l'ID est lu en `unsigned` (0..4294967295).
