# victormeloasm's Froggate II: Croackpocallypse

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aa471e83b246e477b6c0be7) · id `6aa471e83b246e477b6c0be7`

Crackme **Linux ELF64** PIE, C/C++ massivement obfusqué.  
Auteur : [victormeloasm](https://crackmes.one/user/victormeloasm) · difficulté **6.0 (Insane)**.

Dossier : `authors/victormeloasm/6aa471e83b246e477b6c0be7/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/croackpocalypse`](original/croackpocalypse) | ELF (sans section headers) |
| [`original/README.txt`](original/README.txt) | consignes auteur |
| [`analysis/NOTES.md`](analysis/NOTES.md) | reverse détaillé |
| [`analysis/verify_mask_live.bin`](analysis/verify_mask_live.bin) | masque 128 o (dump runtime) |

## Status

**Pending / parked** — prédicat **compris et prouvé sous GDB** ; **pas de keygen complet** encore.

| Couche | État |
|---|---|
| Prédicat `transform(s)==mask` | OK (GDB) |
| Stage1 ARX (16×u64) | forward + **inverse** Python (`tools/froggate2-solve.py`) |
| Mixers post-stage1 (~400) | TBD (diffusion totale) |
| Serial 256 hex | **inconnu** |

```bash
python3 tools/froggate2-solve.py --mask
python3 tools/froggate2-solve.py --check <256hex>   # gdb oracle
```

## Réponse

*À compléter* — format :

```bash
./croackpocalypse <256-hex-character-serial>
# exit 0 = accepted
```

## Flow (abrégé)

```text
hex_decode(argv[1]) → buf[128]
h1 = hash(buf)           # toujours 0 (feuilles jumelles)
tmp = transform(buf)     # ← cœur du keygen
h2 = hash(tmp)           # toujours 0
verify(tmp, h):  (tmp XOR mask) entièrement nul  ⇔  tmp == mask_live
return !verify
```

Preuve : patcher la sortie de `transform` avec `verify_mask_live.bin` → exit **0**.

## Suite

Voir [`analysis/NOTES.md`](analysis/NOTES.md). Règles auteur : pas de patch / hook / Unicorn pour *résoudre* ; debug + keygen OK.
