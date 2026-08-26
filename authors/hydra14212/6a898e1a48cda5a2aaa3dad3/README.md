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

1. **Pas de formule offline `(C,T,epoch) → KEY`** : le bloc attendu dépend d’entropie timing (QPC/RDTSC) ; mêmes C/T affichés ≠ même expected block (prouvé dans le write-up skalvin).
2. Solution pratique publiée : **`ReadProcessMemory`** sur le processus enfant `hv*.exe`, lire 16 octets à `CHALLENGE_copy + 8`.
3. Wine sur ce serveur : pas de bannière / prompt utiles (stub + guardian / anti-debug).

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

- Machine **Windows** admin : `analysis/skalvin-writeup/hydra_win.py` (ou réimplémenter le scan RPM).
- Offline long : unpack inner, rejouer AES/VM sous Unicorn avec RDTSC/QPC gelés (piste skalvin).
- Puis `status: solved` + solveur repo + preuve live.

## Référence

Write-up public : [skalvin — HydraVault Solved](https://crackmes.one/solution/6a8c6dd8585e8875bcbebd00) (archive password `crackmes.one`), copies sous `analysis/skalvin-writeup/`.
