# X3eRo0 — Eat Sleep Trace Repeat

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/61efb6a633c5d413767ca678) · id `61efb6a633c5d413767ca678`

Pas de binaire : uniquement une **trace d’instructions** x86-64 (~4,5 Mo).  
Auteur : [X3eRo0](https://crackmes.one/user/X3eRo0).

Dossier : `authors/x3ero0/61efb6a633c5d413767ca678/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`trace.txt`](original/trace.txt) | log instruction-only (base `0x401000`) |
| [`eat-sleep-trace-solve.py`](tools/eat-sleep-trace-solve.py) | reconstruit la table + compte les scans |

## Réponse

| | |
|---|---|
| Flag | **`zh3r0{d1d_y0u_enjoyed_r3v3rs1ng_w1th0ut_b1n4ry_?}`** |

```bash
python3 tools/eat-sleep-trace-solve.py -q
# zh3r0{d1d_y0u_enjoyed_r3v3rs1ng_w1th0ut_b1n4ry_?}
```

---

## 1. Premier regard

```text
ASCII text · ~181 888 lignes · sha256 c081e1188e01ff7d…
format : 0x401xxx : <mnemonic...>
```

Pas d’ELF, pas de registre / mémoire dumpée — seulement le flux de mnemonics exécutés. Le « reverse without binary » est littéral.

---

## 2. Flow (lu dans la trace)

```text
0x401000  call Main
Main:
  write(welcome)
  read(stdin → g_Input, 0x64)
  seed xorshift = 0x41424344
  for i in 0..0x7ff:
      table[i] = low8(xorshift64star())
  for each input byte b:
      idx = LookupFromInput(b)   # scan table until table[i]==b
      store idx
  write("correct") / exit
```

`LookupFromInput` (`0x401106`) : boucle `mov al, [rdx+0x402008]` / `inc rdx` / `cmp al, bl` jusqu’à match, retourne l’index.

---

## 3. Prédicat / recovery

1. **Table** — xorshift64* classique, seed `0x41424344`, mul `0x2545f4914f6cdd1d` :

```python
x ^= x >> 12
x ^= (x << 25) & mask64
x ^= x >> 27
state = x
byte = (x * 0x2545F4914F6CDD1D) & 0xFF
```

Important : le state est mis à jour **avant** le `mul` (comme dans le shellcode).

2. **Password** — dans la trace, compter combien de fois on voit  
   `0x401110 : mov al, byte ptr [rdx+0x402008]`  
   entre deux `0x4010bd : call 0x401106`.  
   Ce compte = index+1 dans la table → caractère = `table[count-1]`.

Le buffer fait 100 octets (CRLF + null padding) ; le flag utile s’arrête au `}`.

---

## 4. Vérification

```bash
python3 tools/eat-sleep-trace-solve.py --check
# OK zh3r0{d1d_y0u_enjoyed_r3v3rs1ng_w1th0ut_b1n4ry_?}
```

(Pas de binaire live à nourrir — la preuve est la reconstruction déterministe depuis `trace.txt`.)

---

## 5. Notes

- On peut aussi réassembler un shellcode depuis la trace (Keystone) puis IDA — utile pour nommer les routines, pas nécessaire pour le flag.
- Piège xorshift : oublier de sauver `state` avant le `mul` → mauvaise table.
- x32dbg / Wine : N/A (pas de PE / pas d’ELF).
