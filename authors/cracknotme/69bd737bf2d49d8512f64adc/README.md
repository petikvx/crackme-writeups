# CrackNotMe's Turbine Control KeyGenMe

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/69bd737bf2d49d8512f64adc) · id `69bd737bf2d49d8512f64adc`

Crackme **PE32+ console** x86-64 (MSVC VS 2026 / toolset 19.50), strings XOR-chiffrées (`i ^ enc[i] ^ 0x5a`).  
Auteur site : **CrackNotMe** · PDB `CrackMeByPwn.pdb` · tagline `Pwn.by` / MechaSys.

Dossier : `authors/cracknotme/69bd737bf2d49d8512f64adc/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/TurbineControl.exe`](original/TurbineControl.exe) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`tools/turbine-solve.py`](tools/turbine-solve.py) | keygen / check / smoke Wine |
| [`analysis/wine-success-summary.txt`](analysis/wine-success-summary.txt) | preuve Wine (HWID fixé `AAAAA`) |

## Réponse

| Input | Valeur |
|---|---|
| Hardware ID | **`TCU-XXXXX`** (5 chars A–Z / 0–9, **aléatoire** à chaque run) |
| Calibration License Key | **`XXXX-YYYY-ZZZZ-WWWW`** dérivé du HWID (4 blocs) |

Exemple (HWID de démo `AAAAA`, anti-debug clean) :

| Bloc | Valeur | Rôle |
|---|---|---|
| W1 | `<<<<` | dérivé HWID |
| W2 | `S~Fp` | S-box chaînée |
| W3 | `0iAU` | produit 5040 + somme 150 |
| W4 | `4658` | `poly31 % 10000` |

```bash
python3 tools/turbine-solve.py --hwid AAAAA -q
# <<<<-S~Fp-0iAU-4658

python3 tools/turbine-solve.py --check '<<<<-S~Fp-0iAU-4658' --hwid AAAAA
# OK

# Preuve live (patch temporaire HWID=AAAAA sous Wine) :
python3 tools/turbine-solve.py --run
```

Message succès : *Calibration Unlocked! Full diagnostic access granted.*

Preuve : [wine-success-summary.txt](analysis/wine-success-summary.txt).

En pratique : lancer le binaire, lire `TCU-…..`, keygen avec `--hwid`, coller la clé **dans le même run**.

---

## 1. Premier regard

```text
file original/TurbineControl.exe
# PE32+ executable (console) x86-64, for MS Windows
```

```text
diec : Microsoft Visual C/C++ (19.50) / VS 2026
imports notables : Beep, Sleep, GetTickCount, SetConsoleTitleA, rdtsc (inline)
```

Banner (strings déchiffrées au runtime) :

```text
TurbineControl_Diag v2.4  |  Industrial Calibration Suite
(C) 2026 Pwn.by Industrial Solutions
[SYS] Hardware ID resolved: TCU-XXXXX
Enter Calibration License Key (XXXX-YYYY-ZZZZ-WWWW):
```

Hashes :  
MD5 `a01704e032bc04847564ef2941d2adc9` · SHA-256 `35a347e5218dbf82cff0499b9c1ad724bc979feb4e4dbf08e1688a4e9e5bea73`.

---

## 2. Flow

```text
banner XOR-déchiffrée + Sleeps « PLC / turbine / sensors »
HWID = 5 chars base36 (A-Z0-9) : srand(rdtsc ^ GetTickCount ^ …) ; rand()%36
afficher TCU-<HWID>
lire clé (19 chars, tirets aux positions 4, 9, 14) → 4 groupes de 4
animation « Verifying license block 1..4 »
si clé ∈ {TCAL-DIAG-MSTR-2024, ADMN-ROOT-PASS-9999} → honey (Beep) / faux chemin
sinon validate(HWID, W1, W2, W3, W4) :
  anti-debug PEB.BeingDebugged → xor_const ∈ {0x1f, 0x2a}
  anti NtGlobalFlag & 0x70 → addend ∈ {0, 3}
  timing rdtsc (opaque / anti-step)
  W1 ∧ W2 ∧ W3 ∧ W4  → OK / FAIL
```

---

## 3. Format & honeypots

Parse (`0x140007448`) : longueur `0x13`, `key[4]==key[9]==key[14]=='-'`, copie de 4×4 octets.

Deux clés **blacklist** (XOR `0x37` dans `.rdata`) :

```text
TCAL-DIAG-MSTR-2024
ADMN-ROOT-PASS-9999
```

Les matcher envoie vers un chemin « Beep » (leurre) — **pas** le succès Calibration Unlocked.

---

## 4. Bloc 1 — dérivé HWID

Pour `i ∈ {0,1,2,3}` (anti = `0x1f` si pas de debugger) :

```c
v = ((hwid[i] + 3) ^ hwid[4] ^ anti) % 93;   // 0x5d
c = v + 0x21;                                  // '!'
if (c >= '-') c++;                             // saute le tiret
// W1[i] == c
```

Charset : ASCII printable **sans** `-`.

---

## 5. Bloc 2 — S-box chaînée

Table `@ 0x140089940` (256 octets, caractères imprimables).

```c
s = (sum(W1) + nt_anti) & 0xff;   // nt_anti = 0 au run propre
out[0] = SBOX[s];
out[1] = SBOX[(out[0] + s) & 0xff];
out[2] = SBOX[(out[1] + s) & 0xff];
out[3] = SBOX[(out[2] + s) & 0xff];
// W2 == out
```

---

## 6. Bloc 3 — produit / somme (+ opaque FP)

Prédicat opaque : `7·t² + 11·t + 3 > 0` avec `t = (double)(rdtsc & 0xff)` → **toujours** la branche principale.

```c
W3[0] * W3[1] == 0x13b0;   // 5040
W3[2] + W3[3] == 0x96;     // 150
```

Le keygen prend le groupe thématique **`0iAU`** (`'0'*'i'==5040`, `'A'+'U'==150`). D’autres couples marchent (`FH…`, `8Z…`, …) via `--g3`.

---

## 7. Bloc 4 — hash decimal

```c
h = 0;
for (b in W1 || W2 || W3)
    h = h * 31 + b;          // uint32
sprintf(W4, "%04u", h % 10000);
```

---

## 8. Vérification

```bash
python3 tools/turbine-solve.py --run
# … [OK] Calibration Unlocked! …
```

Extrait [wine-success-summary.txt](analysis/wine-success-summary.txt) :

```text
[SYS] Hardware ID resolved: TCU-AAAAA
…
[OK] Calibration Unlocked! Full diagnostic access granted.
[OK] Turbine parameter tuning is now available.
```

(`--run` patch **temporairement** le générateur HWID → `AAAAA` pour une preuve non interactive ; le binaire dans `original/` reste intact.)

---

## 9. Notes

- Ce n’est **pas** un HWID machine (volume / CPUID) : pure entropie `rdtsc` + `rand`.
- Debugger visible : `BeingDebugged` change le xor du bloc 1 (`0x2a` au lieu de `0x1f`) → keygen « clean » invalide.
- Strings UI absentes en clair : déchiffrement `plain[i] = i ^ enc[i] ^ 0x5a` (et variante SIMD équivalente).
- Cousin thématique du [Chocolate Factory](../69b4768cf2d49d8512f649ff/) (4 ateliers / 4 blocs), mais ici le secret dépend du HWID de session.
