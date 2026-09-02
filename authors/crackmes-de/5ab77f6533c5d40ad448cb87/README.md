# crackmes.de's tropes_safe_cracker_1 by trope

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6533c5d40ad448cb87) · id `5ab77f6533c5d40ad448cb87`

Crackme **PE32 GUI** MASM32 (Microsoft Linker 5.12). Auteur d’origine : **trope** (2005, crackmes.de). Difficulté annoncée : *Assembler x86* / diff 1.

| Fichier | Rôle |
|---|---|
| [`original/safe.exe`](original/safe.exe) | binaire |
| [`original/safe.zip`](original/safe.zip) | archive site (exe + readme) |
| [`original/_u/readme.txt`](original/_u/readme.txt) | consignes auteur |
| [`analysis/check.asm`](analysis/check.asm) | prédicat `@0x4010D3` |
| [`analysis/safe-autofill.exe`](analysis/safe-autofill.exe) | harness Wine (appelle le check d’origine) |
| [`analysis/ok.txt`](analysis/ok.txt) | preuve exit codes Wine |
| [`tools/safe-cracker1-solve.py`](tools/safe-cracker1-solve.py) | dérive / vérifie la combo |

## Réponse

Combo du coffre (6 chiffres, boutons **1–5** uniquement) :

| | |
|---|---|
| **Combo** | **`435513`** |
| UI | cliquer `4` `3` `5` `5` `1` `3` puis **Open** |
| Succès | MessageBox *Good Job.* / *Yup* |
| Échec | `Beep` (pas de MessageBox) |

Pas de name→serial (pas de champ login) — `petik` N/A.

```bash
python3 tools/safe-cracker1-solve.py -q
# 435513

python3 tools/safe-cracker1-solve.py --check
# combo=435513 predicate=OK pe=OK
```

---

## Premier regard

```text
PE32 executable (GUI) Intel 80386, for MS Windows
Linker: Microsoft Linker 5.12.8078 · Compiler: MASM 6.14 / MASM32
```

| | |
|---|---|
| SHA-256 (`safe.exe`) | `451fc29defd38f55ac2af06867908c8c08dae307247668af550c6c62bb6fa38b` |
| SHA-256 (`safe.zip`) | `bc55f9713d5b8dafbbe64c22063cad08b806748056c21e2bd65b0b39cc73ee55` |
| Dialog | ressource `#101` — titre *The Safe* · Tahoma · boutons `1`…`5` + *Open* |
| Strings | `1234567890`, `Good Job.`, `Yup` |

Readme auteur : *No patching, too easy. Just find out the combo to the "safe".*

---

## Flow

1. `WinMain` : `GetModuleHandleA` → `DialogBoxParamA(hInst, 0x65, …, DlgProc)`.
2. `DlgProc` (`0x401028`) filtre `WM_COMMAND` (`0x111`) :
   - IDs `0x3E9`…`0x3ED` → append ASCII `'1'`…`'5'` dans le buffer `0x403000` (`lstrlenA` + `mov [buf+len], digit`).
   - ID `0x3EE` (*Open*) → `call check` @ `0x4010D3` puis `ExitProcess`.
3. `WM_CLOSE` → `EndDialog`.

---

## Prédicat

Extrait : [`analysis/check.asm`](analysis/check.asm).

1. `lstrlenA(0x403000) == 6` sinon return silencieux.
2. `esi = 0x403000` (saisie), `edi = 0x4030FF` → chaîne **`1234567890`**.
3. Six comparaisons (toute mismatch pose un flag `byte [0x403109] = 1`, sans early-exit) :

| Input | Attendu | Détail |
|---|---|---|
| `[0]` | `ref[4]+2-3` = **`'4'`** | `add bl,2` / `sub bl,3` sur `'5'` |
| `[2]` | `ref[4]` = **`'5'`** | |
| `[1]` | `ref[2]` = **`'3'`** | |
| `[4]` | `ref[0]` = **`'1'`** | |
| `[5]` | `ref[2]` = **`'3'`** | |
| `[3]` | `ref[4]` = **`'5'`** | |

4. Si flag == 0 → `MessageBoxA(NULL, "Good Job.", "Yup", 0)` ; sinon `Beep(100, 1000)`.

Donc combo = **`435513`**.

---

## Vérification

Solveur (prédicat + présence PE) :

```bash
python3 tools/safe-cracker1-solve.py --check
```

Preuve live Wine sur le **check d’origine** (harness `analysis/safe-autofill.exe` : stub d’entrée écrit la combo dans `0x403000`, appelle `0x4010D3` ; MessageBox/Beep remplacés par `ExitProcess` pour un code retour scriptable — le corps des `cmp` n’est pas touché) :

```bash
WINEDEBUG=-all wine analysis/safe-autofill.exe ; echo $?
# 435513 → 66 (0x42) ; mauvaise combo → 238 (0xEE)
```

Voir [`analysis/ok.txt`](analysis/ok.txt).

GUI manuelle : `wine original/safe.exe` → combo ci-dessus → *Good Job.*

---

## Notes

- Pas de keygen name→serial ; coffre à combinaison fixe.
- Les `+2/-3` sur le premier digit sont du bruit (équivalent `-1` sur `'5'`).
- Consignes : pas de patch du binaire d’origine pour « gagner » — le harness d’analyse est hors `original/`.
