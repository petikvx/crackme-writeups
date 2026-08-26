# Notes — HydraVault (parked)

## Binary

```text
PE32+ console x86-64, stripped (external PDB)
sha256: c382f6656864f0d738e92af6a41dfdc7034bb63deaa5527a1be784abc29d11f5
sections: .text ~0x33d0 ; .data ~0x37ef0 (payload chiffré) ; TLS ; …
```

`.data` file off `0x3800` : premiers octets nuls, puis blob haute entropie (≈8 bits/octet) → payload packé.

## Live Linux

```bash
HYDRA_VAULT_NO_SELFDBG=1 HYDRA_VAULT_DEBUG=1 xvfb-run -a wine original/HydraVault.exe
# → pas de prompt CHALLENGE exploitable ici (timeout / silence)
```

## Solution connue (Windows)

Voir `skalvin-writeup/` + `tools/hydra_dump_type.py`.

**Session 2026-08-26** : dump `CHALLENGE+8` reproductible, mais le vault répond toujours
`So close! Check the last 4 bytes...` → **12/16 octets corrects**, last4 faux
(A raw, B bswap, C AES_dec(0x2F1F0), D graft : miss). Inner extrait : `hv_inner.exe`.
x64dbg attach sur `hv*` = mort. Parked sur ce point.

## Crypto (d’après write-up skalvin)

- AES-128 custom @ `sub_140024600`, S-box `0x140030aa0`
- Master key exemple write-up : `d32206f962abbf8bdb6903af8b095614` @ `0x140030be0` (inner)
- Splitmix64 + lanes XOR/SBOX
- VM « HVM1 » magic `0x48564D3231`

Adresses = image **inner** dumpée, pas le stub.

## Hex-Rays stub

`analysis/HydraVault.exe.i64.c` — décompil du **loader** (très bruité) ; peu utile pour le prédicat final.
