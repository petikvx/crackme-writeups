# Hydra14212's HydraVault

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a898e1a48cda5a2aaa3dad3) · id `6a898e1a48cda5a2aaa3dad3`

PE64 Windows « loader armor » : stub → PE enfant, dual VM, AES custom, clés **time-scoped ~30 s**.  
Auteur : [Hydra14212](https://crackmes.one/user/Hydra14212). Diff site **3.7**.

Dossier : `authors/hydra14212/6a898e1a48cda5a2aaa3dad3/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/HydraVault.exe`](original/HydraVault.exe) | stub d’origine |
| [`analysis/hv_inner.exe`](analysis/hv_inner.exe) | PE enfant extrait |
| [`analysis/NOTES.md`](analysis/NOTES.md) | notes techniques |
| [`analysis/skalvin-writeup/`](analysis/skalvin-writeup/) | write-up + PoC publics ([skalvin](https://crackmes.one/user/skalvin)) |
| [`tools/hydra-vault-solve.py`](tools/hydra-vault-solve.py) | keygen live Windows (RPM + SendInput) |
| [`tools/hydra_dump_type.py`](tools/hydra_dump_type.py) | dump manuel + variantes A/B/C/D |

## Réponse

Pas de formule offline `(CHALLENGE, TOKEN, epoch) → KEY` : l’entropie timing (QPC/RDTSC) entre dans le bloc attendu.  
**Keygen live** : lire 16 octets en RAM juste après une copie du `CHALLENGE`, les taper comme KEY.

```text
KEY = ReadProcessMemory( addr(CHALLENGE_copy) + 8 , 16 )
```

```bash
# Windows Admin, console du vault visible
set HYDRA_VAULT_NO_SELFDBG=1
HydraVault.exe
python tools/hydra-vault-solve.py
# saisir CHALLENGE / TOKEN / EPOCH affichés → auto-type KEY
```

Ou vault déjà au prompt KEY (`fail=0`) :

```bash
python tools/hydra_dump_type.py <CHALLENGE16hex> A
```

**Variante A** = raw `+8` (gagnante). **B** (bswap last4) produit le message vault  
`So close! Check the last 4 bytes...` — piège / mauvaise endianness.

Preuve : screenshots [poc.png](analysis/skalvin-writeup/poc.png) / [PoC-2.png](analysis/skalvin-writeup/PoC-2.png)  
(`ACCESS GRANTED - VAULT OPEN`). Méthode alignée sur la [solution skalvin](https://crackmes.one/solution/6a8c6dd8585e8875bcbebd00).

---

## 1. Premier regard

```text
HydraVault.exe : PE32+ console x86-64, stripped
sha256  c382f6656864f0d738e92af6a41dfdc7034bb63deaa5527a1be784abc29d11f5
```

`.data` ≈ payload chiffré (3 passes `0x33/0x22/0x11`) → drop `%TEMP%\hvXXXXXXXX.exe`.

Wine / Linux : pas de session jouable fiable → solveur **Windows-only**.

---

## 2. Flow

```text
HydraVault.exe (stub MinGW)
  └─ déchiffre payload → hv*.exe
       ├─ anti-debug (self-debug, PEB, NtQuery, RDTSC, blacklist outils…)
       ├─ mint CHALLENGE + TOKEN (splitmix64 + timing)
       ├─ expected_block (16 o) sur la stack, à CHALLENGE_copy+8
       ├─ dual VM + AES-128 custom (S-box std, packing LE custom)
       └─ compare : transform(user_KEY) == expected_block
            OK → ACCESS GRANTED - VAULT OPEN
            KO → DENIED + rotation lanes (après 12 fails → LOCKED)
```

Env utiles : `HYDRA_VAULT_NO_SELFDBG=1`, `HYDRA_VAULT_DEBUG=1`.  
**Ne pas** attacher x64dbg sur `hv*` (tue le process). Dump RPM sans debugger.

Honeypots : exports / strings `VerifyLicenseKey`, `ACCESS GRANTED` en clair ≠ win réel.

---

## 3. Prédicat / faille

Le verdict SSE compare le bloc attendu (caché) au KEY transformé.  
Ce bloc vit dans la **même frame** qu’une copie du `CHALLENGE` affiché →  
`VirtualQueryEx` + scan du marker hex → lire `+8..+24`.

Les valeurs affichées (C/T/epoch) sont des **sorties** du PRNG, pas des entrées suffisantes pour un keygen offline (prouvé empiriquement : même C/T, entropie différente → KEY différente).

---

## 4. Vérification

| | |
|---|---|
| Plateforme | Windows Admin |
| Outil | `tools/hydra-vault-solve.py` |
| Résultat | `ACCESS GRANTED - VAULT OPEN` |
| Screens | `analysis/skalvin-writeup/poc.png`, `PoC-2.png` |

Session locale antérieure (2026-08-26) : dump OK mais envoi variante **B** → message « last 4 bytes ». Corrigé : défaut **A**.

---

## 5. Notes

- Crédit méthode / PoC : [skalvin](https://crackmes.one/user/skalvin) — archive sous `analysis/skalvin-writeup/` (ATTRIBUTION.md).
- AES custom + VM HVM1 documentés dans le write-up skalvin ; non re-implémentés offline (inutiles une fois le dump live).
