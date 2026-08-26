# Hydra14212 — HydraVault *(PARKED)*

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a898e1a48cda5a2aaa3dad3) · id `6a898e1a48cda5a2aaa3dad3`

PE64 Windows « loader armor » : stub custom → PE enfant, dual VM, AES custom, clés **time-scoped ~30 s**.  
Auteur : [Hydra14212](https://crackmes.one/user/Hydra14212). Diff site **3.7**.

**Status : parked** — pas de keygen offline ; preuve live = dump mémoire Windows. Ce serveur (Linux/Wine) n’a pas produit de session jouable.

Dossier : `authors/hydra14212/6a898e1a48cda5a2aaa3dad3/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`HydraVault.exe`](original/HydraVault.exe) | stub d’origine |
| [`NOTES.md`](analysis/NOTES.md) | synthèse reverse |
| [`skalvin-writeup/`](analysis/skalvin-writeup/) | write-up + PoC publics (crackmes.one, [skalvin](https://crackmes.one/user/skalvin)) |

## Objectif

Affiche `CHALLENGE` / `TOKEN` / `epoch` → saisir une **KEY 32 hex** → `ACCESS GRANTED - VAULT OPEN`.

Patcher le jump = hors-sujet (auteur le dit). Keygen « fidèle » ou émulation du chemin crypto.

## Pourquoi parked ici

1. **Pas de formule offline `(C,T,epoch) → KEY`** : entropie timing (QPC/RDTSC).
2. **Dump RPM live OK partiellement** (2026-08-26) : marker `CHALLENGE` → 16 o à `+8` ; le vault répond **`So close! Check the last 4 bytes...`** → **12/16 bons**, les 4 derniers faux. Variantes testées sans win : raw (A), last4-bswap (B), `AES_dec(global 0x2F1F0)` (C), graft last4 global (D).
3. **x64dbg attach** sur `hv*` → anti-debug / mort du process. Dump **sans** debugger (`tools/hydra_dump_type.py`).
4. Wine : pas de session utile.
5. Inner PE extrait : `analysis/hv_inner.exe` (cipher stub 3 passes).

## Architecture (résumé)

```text
HydraVault.exe (MinGW stub)
  └─ déchiffre payload .data (cipher 3 couches 0x33/0x22/0x11)
     └─ drop %TEMP%\hvXXXXXXXX.exe
          ├─ anti-debug (self-debug, PEB, NtQuery, RDTSC, blacklist outils/MCP…)
          ├─ mint CHALLENGE + TOKEN (PRNG splitmix64 + timing)
          ├─ expected_block en stack (caché) à côté d’une copie de CHALLENGE
          ├─ dual VM + AES-128 custom (S-box std, packing LE custom)
          └─ compare SSE user_key_transformed == expected_block
```

Env utiles (trouvés dans le binaire / write-up) :

- `HYDRA_VAULT_NO_SELFDBG=1`
- `HYDRA_VAULT_DEBUG=1`

Honeypots : exports / strings `VerifyLicenseKey`, `ACCESS GRANTED` en clair ≠ win réel.

## Reprendre

1. Comprendre les **4 derniers octets** (layout stack / transform / packing AES custom) — c’est le vrai reste.
2. Windows admin, vault **neuf** `fail=0`, `HYDRA_VAULT_NO_SELFDBG=1`, dump atomique : `tools/hydra_dump_type.py`.
3. Ne pas attacher x64dbg sur `hv*`.
4. `status: solved` + preuve `ACCESS GRANTED` + screenshot.

## Référence

Write-up public : [skalvin — HydraVault Solved](https://crackmes.one/solution/6a8c6dd8585e8875bcbebd00) (archive password `crackmes.one`), copies sous `analysis/skalvin-writeup/`.
