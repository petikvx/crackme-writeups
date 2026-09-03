# mars1 (mars)

> [crackmes.one](https://crackmes.one/crackme/5ab77f6233c5d40ad448c967) · Keygen GUI MASM32 — jump calculé + XOR `NO!`→`yes`.

| Fichier | Rôle |
|---|---|
| [`original/_u/mars1.exe`](original/_u/mars1.exe) | challenge PE32 GUI |
| [`analysis/mars1.exe.i64.c`](analysis/mars1.exe.i64.c) | Hex-Rays (`decc`) |
| [`tools/mars1-solve.py`](tools/mars1-solve.py) | keygen |

## Réponse

| Name | Serial (4 octets LE) |
|---|---|
| **`petik`** | **`\x12S4i`** (hex `12533469`) |

```bash
python3 tools/mars1-solve.py -q --hex
python3 tools/mars1-solve.py --user petik
python3 tools/mars1-solve.py --check
```

Le premier caractère du serial n’est **pas** imprimable (`0x12`) : le remplir via keygen / `SetWindowTextA`, pas au clavier « propre ».

## Premier regard

```text
PE32 GUI · MASM32 · DialogBox « Crackme »
strings : crackme1 by MARS · And the result is : NO!
```

## Flow

1. Dialog init : name=`MARS`, appel Generate.
2. Bouton **Generate** (ID `402`) → `sub_401197`.
3. Copie clipboard (403) / quit (404).

## Prédicat

```text
len(name) ≤ 8
len(serial) > 1
GetTickCount(name→serial) ≤ 16   # champs déjà remplis
diff = *(u32*)name - *(u32*)serial
require  0x401248 < diff < 0x4012AF
push diff ; ret                  # jump dans le « trampoline »
```

Seul atterrissage utile : **`0x40125E`** (`mov [0x401240], eax` — `.text` est **writable**). Les autres stores du trampoline tapent `.rdata`/`.rsrc` → AV → SEH `@0x4012B1` avec `edi=0` → MessageBox encore **NO!**.

Ensuite :

```asm
; edi = 0x40125E
add edi, 0x1217D9
xor dword [«NO!»], edi   ; → «yes»
MessageBoxA(..., text=«yes», caption=«And the result is : yes»)
```

Donc :

```text
serial_dword = name_dword - 0x40125E
petik → «peti» = 0x69746570 → serial = 0x69345312 → bytes 12 53 34 69
```

## Vérification

Wine + helper `SetWindowTextA` / `BM_CLICK` Generate :

```text
popup caption='And the result is : yes'
  static='yes'
```

## Notes

- Ce n’est **pas** un simple strcmp : le « bon » serial est une adresse de gadget.
- Timing `GetTickCount` : inutile si name+serial sont posés avant le clic.
- `decc original/_u/mars1.exe` → `analysis/mars1.exe.i64.c`.
