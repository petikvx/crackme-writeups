# crackmes.de's brainkiller_keygenme by mouradprat4re

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3a3`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3a3) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (« BrainKiller KeyGenMe By Mouradpr/AT4RE ») |
| **Plateforme** | Windows PE32 GUI (dialogue), MinGW gcc 3.4.5 |
| **SHA-256 (zip)** | `6fa66a2438eb06784c460813ac5249278692ebc8e17bd4ceb3aefac5ddf64f82` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/BrainKiller_KeyGenMe.zip` | archive d'origine (non modifiée) |
| `analysis/extract/BrainKiller KeyGenMe.exe` | exe extrait du zip (copie de travail) |
| `tools/brainkiller-solve.py` | keygen + `--check` (réplique du prédicat) |
| `tools/live-check-harness.c` | petit harnais Win32 (mingw) pour piloter le dialogue sous Wine |

## Réponse

Pas de username : seul un serial de 18 caractères `AAA-BBBB-CCCC-DDDD` est testé (donc `petik` n'intervient pas).

| Serial | Résultat |
|---|---|
| `341-0008-9640-0525` | `Registered to : Professional Version` |

```bash
python3 tools/brainkiller-solve.py            # serial aléatoire valide
python3 tools/brainkiller-solve.py -q --seed 1
python3 tools/brainkiller-solve.py --check 341-0008-9640-0525
```

Règles : `AAA` = permutation de `{1,3,4}` ; chiffres de `BBBB` de somme 8 ; `CCCC` de somme 19 ; `DDDD` de somme 12.

## Premier regard

```bash
unzip original/BrainKiller_KeyGenMe.zip -d analysis/extract
file analysis/extract/*          # PE32 GUI Intel i386
diec analysis/extract/*          # MinGW gcc-3.4.5, pas de packer
strings -n 5 analysis/extract/*  # "Bad Boy", "Error", "Registered to : Professional/Lite/Standard Version"
```

Imports utiles : `DialogBoxParamA`, `GetDlgItemTextA`, `SetDlgItemTextA`, `MessageBoxA`. Les trois niveaux d'enregistrement (Lite / Standard / Professional) suggèrent un score à plusieurs paliers.

## Flow

`main` (0x401150) → `DialogBoxParamA` avec la DlgProc **0x4012f0**.
- `WM_COMMAND` (0x111) sur le bouton `0x3ea` : lit le champ `0x3e9` (max 20 car.) via `GetDlgItemTextA`.
- Échec → `MessageBoxA("Bad Boy", "Error")` ; succès → `SetDlgItemTextA(0x3e8, "Registered to : … Version")`.

## Comment on trouve le prédicat

Ancrage : `objdump -d -M intel --no-show-raw-insn` sur la DlgProc `0x4012f0` (pas besoin d'IDA, la fonction est courte).

1. **Longueur** — `GetDlgItemTextA` renvoie dans `eax`, comparé à `0x12` (`cmp eax,0x12 / jne bad`) : le serial fait **18** caractères.
2. **Conversion** — boucle `ebx = 0..0x11` : chaque caractère est copié seul dans un buffer d'1 octet suivi de NUL, puis passé à la fonction `0x401ca8` (import `atoi` de msvcrt) ; résultat stocké dans `v[ebx]` (`[ebp+ebx*4-0x518]`). Un caractère non numérique donne 0.
3. **Trois sommes** (indices déduits des offsets `-0x518 + 4*i`) :
   ```
   v4+v5+v6+v7     == 8     (cmp edx,0x8)
   v9+v10+v11+v12  == 0x13  (cmp eax,0x13)
   v14+v15+v16+v17 == 0xc   (cmp ecx,0xc)
   ```
4. **Tirets** — `cmp BYTE PTR [ebp-0x115],0x2d` (idx 3), `-0x110` (idx 8), `-0x10b` (idx 13) : séparateurs `-`.
5. **Trois premiers chiffres distincts** — `v0 != v1`, `v1 != v2`, `v2 != v0`.
6. **Polynôme (partie FPU)** — pour chacun de `x = v0, v1, v2` :
   ```
   pow(x,3) ; pow(x,2) * float[0x403078] ; lea edx,[x+x*8] ; lea edx,[x+edx*2]   ; 19x
   résultat = x^3 - 8*x^2 + 19*x - float[0x40307c]   ; comparé à 0 (fucompp/sahf/sete)
   ```
   Les floats en `.rdata` : `0x403078 = 8.0`, `0x40307c = 12.0` (lus avec Python `struct.unpack('<ff', …)`).
   Le prédicat est donc `x³ − 8x² + 19x − 12 = 0`, soit `(x−1)(x−3)(x−4)` : racines **1, 3, 4**.
   `lea edx,[x+x*8]` = 9x puis `x + 2·9x` = 19x : réduction de force classique de gcc (`x*19`).
7. **Compteur de racines** `n` (dword `[ebp-0x520]`) :
   | n | message (adresse de la chaîne) |
   |---|---|
   | 0 | Bad Boy |
   | 1 | `0x403035` → Lite Version |
   | 2 | `0x403054` → Standard Version |
   | 3 | `0x403010` → **Professional Version** |

Assemblage : les trois premiers chiffres distincts doivent être tous racines → permutation de 1,3,4 (ex. `341`) ; puis trois groupes de 4 chiffres aux sommes 8 / 19 / 12 (ex. `0008`, `9640`, `0525`).
Piège : le serial est lu comme 3 + 1 + 4 + 1 + 4 + 1 + 4 caractères (le premier groupe n'a que 3 chiffres, les dashes sont en 3, 8, 13).

## Vérification

Pas de screenshot possible (pas de capture d'écran dispo sur le serveur Xvfb) : vérification via un harnais Win32 (`tools/live-check-harness.c`, compilé `i686-w64-mingw32-gcc`) qui fait `WM_SETTEXT` sur `0x3e9`, `WM_COMMAND 0x3ea`, puis relit `0x3e8` :

```bash
wine "analysis/extract/BrainKiller KeyGenMe.exe" &
xvfb-run -a wine h.exe 341-0008-9640-0525
# 341-0008-9640-0525 -> [Registered to : Professional Version]
```

KO : `431-4400-9955-3333` (sommes fausses) → fenêtre `Error` / « Bad Boy » (détectée avec `FindWindowA("Error")`).

## Notes

- Aucun GDB/x64dbg utilisé : reverse 100 % statique + preuve Wine.
- Il existe aussi des serials « Lite » / « Standard » : par ex. premier groupe avec seulement 1 ou 2 racines distinctes (`135`, `134`).
- Le chiffre `0` ou une lettre comptent pareil (atoi) pour les sommes ; le keygen produit des chiffres propres.
