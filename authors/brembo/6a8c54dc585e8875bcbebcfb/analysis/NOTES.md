# Notes reverse — license-cli

## Unpack

```bash
upx -d -o analysis/license-cli.unpacked.exe original/license-cli.exe
# Go build ID / module : license-cli ; go1.27.0
# Source path résiduel : C:/Users/user/Documents/Default Project/license-cli/main.go
```

## Symboles `main.*` (pclntab, fo = ftab+funcOff)

| Fonction | VA (image 0x140001000 + entryOff) |
|---|---|
| `main.fail` | `0x1400bd1e0` |
| `main.checkSelfHash` | `0x1400bd300` |
| `main.runAllChecks` | `0x1400bece0` |
| `main.validKey` | `0x1400bed40` |
| `main.main` | `0x1400bee80` |
| `crypto/sha256.Sum256` | `0x1400a99c0` |

`main.decryptPayload` apparaît dans les chaînes pclntab mais **pas** comme fonction séparée (inlined dans `main`).

## Flow `main`

```text
runAllChecks()
hideFromDebugger() ; erasePEHeader() ; initTextRegion()
print banner / "License key: "
ReadString
runAllChecks() again
validKey(input) ?
  false → "[X] Invalid key. Try again." ; loop
  true  → "[OK] License is valid."
          XOR decrypt 0x1d bytes @ 0x1400d673a with key
          print "  Payload: " + plaintext
          "  Exiting."
```

## Constante `validKey`

```text
112c2addd0d1ce1638bf9fb4b9377af3577066ee19e2f508b3fdffd5655a0465
```

`validKey` : `sha256.Sum256(key)` → hex minuscule 64 → `runtime.memequal` vs cette constante.

## `expectedExeHash` / self-hash

- Variable `main.expectedExeHash` pointe sur **64 × `'A'`** (pas sur le hash license).
- `checkSelfHash` fait `strings.Trim(expected, "A")` → **chaîne vide** → **check entièrement skip**.
- Donc le self-hash est un placeholder désactivé ; la constante `112c2add…` sert **uniquement** au license check.

## Ciphertext payload

```text
2f263520213749223c282933242a455b452521252621242247232f263d
```

(29 octets ASCII `/&5 !7I"<()3$*E[E%!%&!$"G#/&=`, juste avant `[X] Invalid key…`)

## Tentatives préimage

Session 2026-08-26 :
- rockyou (~14.3M) ; rockyou×rules ; L≤4 printable XOR ; digits L≤8 ; dict ; spoilers : miss  

Session 2026-09-12 (H100 / hashcat 6.2.6, ~12 GH/s) :
- rockyou + best64 : miss  
- alnum `?l?d?u` L=5..7 : miss (L=8 ETA ~5 h, stoppé)  
- lowercase L=8..9 : miss  
- printable `?a` L=5..6 : miss  
- rockyou + `\n` (hex-wordlist) : miss (`TrimSpace` confirmé après `ReadString`)  
- L=4 printable-contraint XOR (23M) : miss  
- `validKey` confirmé : `Sum256` → hex → `memequal` vs `112c2add…`  

## Wine

`xvfb-run wine` : timeout / exit — surtout `checkToolWindows` (titres x64dbg/IDA/…) + timing.

## Session x64dbg (2026-08-26)

ImageBase ASLR exemple : `0x7FF7A7E70000` (Desktop `license-cli.exe` UPX).

| Élément | VA live (= IB + RVA) |
|---|---|
| UPX stub entry | `IB + 0x2335740` |
| JMP OEP UPX | `…59A7` → `IB + 0x80a20` |
| `main.fail` | `IB + 0xBD1E0` |
| `main.hideFromDebugger` | `IB + 0xBE720` |
| `main.erasePEHeader` | `IB + 0xBE7C0` |
| `main.initTextRegion` | `IB + 0xBE900` |
| `main.runAllChecks` | `IB + 0xBECE0` |
| `main.validKey` | `IB + 0xBED40` |
| `main.main` | `IB + 0xBEE80` |
| inject ReadString | `IB + 0xBF054` |
| force success (`jne`→`jmp`) | `IB + 0xBF090` |
| decrypt setup | `IB + 0xBF15F` |

**Piège UPX** : un BP logiciel sur OEP (`IB+0x80a20`) est **écrasé** par le unpack. Breaker sur le `jmp` final du stub (`…59A7`) ou HW BP **après** unpack.

**Patches live qui passent le flow** (après OEP) :

1. `runAllChecks+0xE` → `48 83 C4 10 5D C3` (epilogue immédiat)  
2. `fail` / `hideFromDebugger` / `erasePEHeader` / `initTextRegion` → `C3`  
3. `call validKey` → `B0 01 90 90 90` ; `jne success` → `EB 58`  
4. Inject clé : `mov rax, <buf>; mov ebx, len` à la place de `ReadString`+`TrimSpace`

**Preuve dynamique** : clé injectée `petik` → plaintext XOR dumpé `@rsp+0x2B` =

```text
_CAIJG,VUCYVPC.+ QHNVDPK,SJRT
```

(identique au solveur offline avec la même clé — confirme le prédicat XOR, **pas** une clé valide SHA-256).

Attention : les offsets `objdump -t` sont des **offsets de section `.text`**, RVA = offset + `0x1000`.
