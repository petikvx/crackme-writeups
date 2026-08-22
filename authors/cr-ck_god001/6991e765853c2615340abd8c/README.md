# Cr@ck_God001's Crackme

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6991e765853c2615340abd8c) · id `6991e765853c2615340abd8c`

Crackme **PE32+ GUI** x86-64 (**MSVC** / VS2022), dialogue « Crack Me ».  
Auteur site : **Cr@ck_God001**.

Dossier : `authors/cr-ck_god001/6991e765853c2615340abd8c/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/CrackMe.001_1.exe`](original/CrackMe.001_1.exe) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`tools/crackme001-solve.py`](tools/crackme001-solve.py) | 4 entiers attendus |

## Réponse

Quatre champs numériques (chacun ≥ 4 caractères), puis **Register** → MessageBox **Success**.

| Control ID | Rôle | Entier | Saisie (≥ 4 chars) |
|---|---|---|---|
| `0x79` (121) | A | 1024 | **`1024`** |
| `0x7A` (122) | C | 2048 | **`2048`** |
| `0x7B` (123) | D | 512 | **`0512`** |
| `0x7C` (124) | B | 8192 | **`8192`** |

Ordre d’IDs croissants (tab typique) : **`1024` `2048` `0512` `8192`**.

```bash
python3 tools/crackme001-solve.py -q
# 1024 2048 0512 8192
```

Sous Wine / Windows : ouvrir l’exe, remplir les 4 edits, cliquer **Register**.

---

## 1. Premier regard

```text
file original/CrackMe.001_1.exe
# PE32+ executable (GUI) x86-64
```

PDB : `...\Project2\x64\Release\CrackMe.001.pdb`.  
UI : `Crack Me`, `Register`, `Registration Result` / `Success` / `Failed`.

Hashes :  
MD5 `ddaa5c9730e62975e1826551725fe7a5` · SHA-256 `2c14b5c5734e5ec8f77eaaa6250e471d5eeda8a1a00784f1854f7b76ad314953`.

Site : difficulty **1.8** · quality **2.9** · *« !st crackme »*.

---

## 2. Flow

`WM_COMMAND` sur le bouton Register (`ID ≈ 0x6F`) appelle la validation `@ 0x140001210` :

1. `GetDlgItemTextW` sur les IDs **`0x79`, `0x7C`, `0x7A`, `0x7B`** (longueur retournée ≥ 4).
2. Conversion `stoi` (base 10) → quatre entiers.
3. Comparaisons flottantes via **`pow`** + constantes `.rdata`, puis `cmp ebx, 0x200`.

---

## 3. Prédicat

Constantes double :

| VA | Valeur |
|---|---|
| `0x1400034c0` | `0.125` |
| `0x1400034c8` | `0.25` |
| `0x1400034d0` | `0.5` |
| `0x1400034d8` | `4.0` |
| `0x1400034e0` | `8.0` |

```text
A (ID 0x79) == pow(8, 4) * 0.25  == 1024
C (ID 0x7A) == pow(8, 4) * 0.5   == 2048
B (ID 0x7C) == pow(4, 8) * 0.125 == 8192
D (ID 0x7B) == 512                (== 0x200)
```

Si les quatre tests passent → MessageBox **Success**, sinon **Failed**.

---

## 4. Vérification

Preuve principale : **statique** (objdump + recalcul `pow`).

```bash
python3 tools/crackme001-solve.py --check
# OK
```

GUI Wine : remplir `1024`, `2048`, `0512`, `8192` (ordre tab) puis Register.

> `GetDlgItemTextW` exige **≥ 4** caractères : `512` seul est refusé → **`0512`** (`stoi` → 512).  
> Commentaire site *« 2018 … »* : coquille probable pour **2048**.

---

## Notes

- Challenge intro GUI : pas d’anti-debug.
- Un commentaire évoque un patch `75→74` près du MessageBox ; inutile si les bonnes valeurs sont saisies.
- `chmod` N/A (PE) ; lancer via `wine original/CrackMe.001_1.exe`.
