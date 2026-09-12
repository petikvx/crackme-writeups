# Notes — Oops! All sarr

## Surface

- `sar.exe <code>` → GUI class `OopsAllSARsClass`
- PE64, imports KERNEL32 minimales + résolution dynamique
- Bloc chiffré : `VirtualProtect(0x140050eb0, 0x7110, RWX)` puis decrypt + `FlushInstructionCache`

## Decryptor (correct)

Seed `eax = 0x73617272` (`"sarr"`) — **indépendant** du `<code>` :

```text
edx = eax
edx = SAR32(edx, 3)       # oublié dans la 1re passe de notes
eax = (eax << 5) ^ edx
eax ^= 0x9D
buf[rcx] ^= al
```

Implémenté dans `tools/oops-sarr-solve.py --decrypt`.

## Solution

| | |
|---|---|
| code | `sarr_pls_obfuscate_saarrr_123` |
| flag | `FLAG{sarr_this_thing_is_2_insane_}` |
| titre OK | `SAAAR DO NOT REDEEM WHY DID YOU REDEEM IT` |

Preuve : `analysis/wine-verify-spoiler.log` (`WINEDEBUG=+relay` + Xvfb).
