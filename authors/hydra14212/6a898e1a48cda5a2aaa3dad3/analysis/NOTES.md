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

Voir `skalvin-writeup/` :

1. Launch + env `HYDRA_VAULT_NO_SELFDBG=1`
2. Lire CHALLENGE à l’écran
3. `OpenProcess` sur `hv*.exe`
4. Scan mémoire : marker = bytes(CHALLENGE)
5. KEY = 16 octets à `addr+8`
6. `SendInput` de la KEY hex

Verdict : `pcmpeqb` expected vs transform(user) ; win magic `0x13371337`.

## Crypto (d’après write-up skalvin)

- AES-128 custom @ `sub_140024600`, S-box `0x140030aa0`
- Master key exemple write-up : `d32206f962abbf8bdb6903af8b095614` @ `0x140030be0` (inner)
- Splitmix64 + lanes XOR/SBOX
- VM « HVM1 » magic `0x48564D3231`

Adresses = image **inner** dumpée, pas le stub.

## Hex-Rays stub

`analysis/HydraVault.exe.i64.c` — décompil du **loader** (très bruité) ; peu utile pour le prédicat final.
