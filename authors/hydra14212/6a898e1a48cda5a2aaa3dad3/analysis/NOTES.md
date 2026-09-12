# Notes — HydraVault

## Binary

```text
PE32+ console x86-64, stripped
sha256: c382f6656864f0d738e92af6a41dfdc7034bb63deaa5527a1be784abc29d11f5
```

## Solution (live Windows)

`KEY = RPM(CHALLENGE_copy + 8, 16)` — variante **A** (raw).

- `tools/hydra-vault-solve.py` — auto launch + scan + SendInput  
- `tools/hydra_dump_type.py <CHALLENGE> A` — vault déjà au prompt  

Variante **B** (bswap last4) → message vault `So close! Check the last 4 bytes...`.

Pas de formule offline : entropie timing dans le bloc attendu.

## Réf.

Write-up / PoC : `skalvin-writeup/` ([skalvin](https://crackmes.one/user/skalvin)).
