# Sallos — EscapeFromMatrix

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6883d23c8fac2855fe6fb09e) · id `6883d23c8fac2855fe6fb09e`

Crackme **PE32 GUI** (MASM32), dialog Win32 thématique *Matrix*.  
Auteur site : **[Sallos](https://crackmes.one/user/Sallos)**.

Dossier : `authors/sallos/6883d23c8fac2855fe6fb09e/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/escapematrix.exe`](original/escapematrix.exe) | binaire d’origine (5 120 o) |
| [`analysis/escapematrix.exe.i64.c`](analysis/escapematrix.exe.i64.c) | Hex-Rays (`decc`) |
| [`analysis/escapematrix.exe.asm`](analysis/escapematrix.exe.asm) | listing IDA (`decasm`) |
| [`tools/escape-from-matrix-solve.py`](tools/escape-from-matrix-solve.py) | solveur `-q` / `--check` / `--wine` |
| [`tools/escape-from-matrix-wine-check.c`](tools/escape-from-matrix-wine-check.c) | harness UI Wine (mingw32) |

## Réponse

Pas de username — un seul champ password (edit **1004**), validation via **« You take the RED pill »** (bouton **1003**).

| | |
|---|---|
| **Password** | **`Your mind makes it real`** |

Citation Matrix (Morpheus), **23** caractères. Seuls les **20** premiers sont chiffrés/comparés ; le check exige ensuite `len == 23` pour le vrai succès.

```bash
python3 tools/escape-from-matrix-solve.py -q
# Your mind makes it real

python3 tools/escape-from-matrix-solve.py --check
# predicate: OK / OK

python3 tools/escape-from-matrix-solve.py --check --wine
# MSGBOX caption=Welcome to the real world.
# wine: OK
```

**Succès live** : MessageBox titre **`Welcome to the real world.`** puis fermeture du dialog.

**Piège** : un mauvais password (ou le préfixe tronqué à 20 chars) affiche quand même les statics  
*« I didn't say it would be easy, Neo. »* / *« I just said it would be the truth. »* — c’est le branchement `check != 0` (**decoy**), pas l’évasion.

---

## 1. Premier regard

```text
file original/escapematrix.exe
# PE32 executable for MS Windows 4.00 (GUI), Intel i386, 4 sections

diec : Linker Microsoft 5.12 · Compiler MASM 6.14 · Tool MASM32
size  : 5120 bytes
sha256: faa6a550b98dd15b81cd0bfe5bf9b9e545ac6a2c791f07bba97ba7c7b4d87425
md5   : 721963c3a5c01f3433ea1c0f6ccc0e33
```

IAT : `DialogBoxParamA`, `GetDlgItemTextA`, `MessageBoxA`, `SetDlgItemTextA`, `CreateFontIndirectA`, …  
Chaînes UI en clair dans `.rsrc` (UTF-16) ; messages de fin **XOR-chiffrés** dans `.data`.

Dialog **101** (`0x65`) « Escape from Matrix » :

| ID | Contrôle |
|---|---|
| 1001 | static « Knock, knock, Neo. » |
| 1002 | bouton BLUE pill (about MessageBox) |
| 1003 | bouton RED pill (**check**) |
| 1004 | edit password |
| 1005 | static bannière (cachée → `ShowWindow` au « succès » decoy) |

```bash
bash -ic 'decc original/escapematrix.exe'
bash -ic 'decasm original/escapematrix.exe'
# → analysis/escapematrix.exe.i64.c / .asm
```

---

## 2. Flow

```text
start
  → DialogBoxParamA(template 0x65, DialogFunc)
WM_INITDIALOG (0x110)
  → RtlZeroMemory(String, 64)
  → police lfHeight=-16
  → GlobalAlloc : hMem   = 0x53E24B7D
                 dword_403170 = 0x1AFB0261
WM_COMMAND (0x111), HIWORD=0
  1002 BLUE → MessageBox XOR « The Matrix has you... »
  1003 RED  → GetDlgItemTextA(1004) → sub_401349
                return 0  → MessageBox « Welcome to the real world. » → EndDialog
                return ≠0 → SetDlgItemText decoy « easy / truth » (reste ouvert)
```

Avant le check, la pile reçoit `0x17AF4F72` et `0x16EE4E13` ; `ebx` est dérivé en `0x13228F73` (clé XOR rolling).

---

## 3. Prédicat (`sub_401349`)

Clé : **`0x13228F73`** (octets LE `73 8F 22 13`), **rechargée à chaque bloc de 4**.

Pour chaque bloc `p0..p3` :

```text
edx = 0
for i in 0..3:
    edx = (edx << 8) | (p[i] ^ key_bytes[i])   # packing big-endian
edx ^= expected[counter]
# match (ZF) → counter++ ; sinon return 1 (decoy)
```

| counter | `expected` | source |
|---|---|---|
| 0 | `0x2AE05761` | `dword_403000` |
| 1 | `0x53E24B7D` | `*hMem` |
| 2 | `0x17AF4F72` | dword poussé (`*edi`) |
| 3 | `0x18EA5133` | `dword_40309D` |
| 4 | `0x1AFB0261` | `*dword_403170` |

Après 5 matchs (20 octets), `counter == 5` :

- si **`length == 0x17` (23)** → **`return 0`** → MessageBox succès ;
- sinon fall-through (ex. password 20 chars zero-paddé) → `return 1` → decoy.

Inversion des 5 DWORDs → préfixe :

```text
Your mind makes it r
```

+ 3 caractères quelconques pour atteindre len 23 — la citation naturelle :

```text
Your mind makes it real
```

(`rXYZ` marche aussi tant que le préfixe 20 et la longueur tiennent.)

### XOR des chaînes (`sub_40131C`)

Même clé `0x13228F73`, rolling + reload. Exemples déchiffrés :

| VA | Texte |
|---|---|
| Caption about | `The Matrix has you...` |
| Succès MessageBox | `Welcome to the real world.` |
| Decoy title | `I didn't say it would be easy, Neo.` |
| Decoy banner | `I just said it would be the truth.` |

---

## 4. Vérification

```bash
python3 tools/escape-from-matrix-solve.py --check
# predicate: OK
# OK

# Live Wine (DISPLAY ou xvfb-run) + harness mingw :
python3 tools/escape-from-matrix-solve.py --check --wine
# MSGBOX caption=Welcome to the real world.
# wine: OK
```

Harness : [`tools/escape-from-matrix-wine-check.c`](tools/escape-from-matrix-wine-check.c)  
(`i686-w64-mingw32-gcc … -luser32`) — `CreateProcess` du crackme, `SetDlgItemText` + `BM_CLICK` RED, capture MessageBox.

Contrôles manuels observés :

| Password | Résultat |
|---|---|
| `wrong…` | decoy dialog *easy / truth* |
| `Your mind makes it r` (20) | decoy |
| **`Your mind makes it real`** (23) | **MessageBox Welcome…** |
| `Your mind makes it rXYZ` (23) | MessageBox Welcome… (suffixe libre) |

---

## 5. Notes

- Pas de serial lié au user : password fixe (thème Matrix).
- Le retour « inversé » du check est le vrai piège pédagogique : **≠0 = decoy sympathique**, **0 = évasion**.
- BLUE pill = lore MessageBox uniquement (pas de check).
- x32dbg MCP : non attaché pendant cette session ; reverse statique + Wine UI.
