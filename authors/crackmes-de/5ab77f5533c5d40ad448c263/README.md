# crackmes.de's gloops_crackme by haiklr

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c263`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c263) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (auteur réel : haiklr) |
| **Plateforme** | Windows PE32 GUI, MASM32, x86 |
| **Difficulté** | 2.0 |
| **SHA-256 (zip site)** | `3326fce5a460ed05c52e33c6af47f05645341f1a7e846e052481e8750a904c5e` |
| **SHA-256 (exe)** | `374b55d34149636c722c09a4d71e36be398fcf629662e3b49e4f1803971dc78b` |

Pas de saisie : le crackme lit un **keyfile** `gl00ps.nas` construit octet par octet en mémoire.
Readme auteur : *« chercher du côté de la perfection »* (nombre parfait).

## Fichiers

| Chemin | Contenu |
|---|---|
| `original/gloops-crkme.zip` | archive crackmes.one (mdp `crackmes.one`) |
| `original/gloops crkme.exe` | PE MASM32 (extrait) |
| `original/gl00ps.nas` | keyfile solution (12 octets) |
| `tools/gloops-crackme-solve.py` | générateur + `--check` |
| `tools/gl00ps.nas` | copie du keyfile |

## Réponse

Keyfile `gl00ps.nas` (12 octets) :

```
00 22 0f 0c 02 23 06 12 19 00 c0 1f
```

soit `[0, 34, 15, 12, 2, 35, 6, 18, 25, 0, 192, 31]`.

MessageBox : **« GLOOPS CRACKME - GOOD BOY »** / corps *« Bravo ! Vous avez trouvé ! »* (titre reconstruit en mémoire).

## Premier regard

- DIE : MASM32 / Microsoft Linker 5.12 ; PE GUI 4 Ko.
- Imports : `CreateFileA`, `ReadFile`, `CloseHandle`, `MessageBoxA`, `ExitProcess`.
- Chaînes absentes en clair : filename `gl00ps.nas`, titres et messages sont assemblés via `mov bl` / `add` / `sub` dans `.data`.

## Flux

1. `GetModuleHandleA(NULL)` puis construction de `"gl00ps.nas\0"` @ `0x403000`.
2. `CreateFileA` (GENERIC_READ) + `ReadFile` de **12** octets → buffer `0x4030c4`.
3. Si le fichier manque → bad boy (*« Le prochain coup sera le bon ! »*).
4. Sinon enchaînement de prédicats ; succès → MessageBox good boy.

## Prédicats

Soit `buf[0..11]` les 12 octets lus.

1. **Bornes** : pour `i = 0..8`, `buf[i] < 0x32`.
2. **Triplets** (pas de 3, `edx ∈ {0,3,6}`) avec `a,b,c = buf[edx..edx+2]` :
   - `a + b + c == 0x31` (49)
   - `10·a + 5·b + 2·c == 200`
3. `buf[9] == 0`.
4. **Nombre parfait** : le DWORD LE @ `buf[10]` (octets 10–11 + zéros BSS) doit être dans `[0x200, 0x2000]` et égal à la somme de ses diviseurs propres → **8128** (`0x1FC0`).
5. `8128 XOR DWORD_LE(buf[6..9]) == 0x190DC6` → `DWORD = 0x191206` → octets `06 12 19 00`.
6. `buf[0]·buf[1]·buf[2] == 0` (au moins un zéro dans le 1er triplet).
7. `buf[5] + DWORD_LE(buf[6..9]) == 0x191229` → `buf[5] = 35`.

Les solutions des triplets `(a,b,c)` sont : `(0,34,15)`, `(3,26,20)`, `(6,18,25)`, `(9,10,30)`, `(12,2,35)`.
Le DWORD force le 3ᵉ triplet à `(6,18,25)` ; `buf[5]=35` force le 2ᵉ à `(12,2,35)` ; le produit nul force le 1ᵉʳ à `(0,34,15)`.

## Preuve

```bash
python3 tools/gloops-crackme-solve.py --out original/gl00ps.nas
cd original && xvfb-run -a wine "gloops crkme.exe"
# xwininfo : titre "GLOOPS CRACKME - GOOD BOY"
```

`tools/gloops-crackme-solve.py --check` → `OK`.
