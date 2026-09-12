# tenzo_aoki's Tenzo Crack ME Beta

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aa09754dbb3353b753967e4) · id `6aa09754dbb3353b753967e4`

Crackme **PE64 console** (MSVC), licence fixe sous **obfuscateur maison** (CFF / state-machine, junk, anti-debug).  
Auteur : [tenzo_aoki](https://crackmes.one/user/tenzo_aoki) — *« The obfuscator is still heavily under-work so it can be decoded pretty easily I think! »*.

Dossier : `authors/tenzo_aoki/6aa09754dbb3353b753967e4/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`Crackme_Tenzo.exe`](original/Crackme_Tenzo.exe) | binaire d’origine |
| [`Crackme_Tenzo.exe.i64.c`](original/Crackme_Tenzo.exe.i64.c) | dump Hex-Rays (`decc`) |
| [`tenzo-crackme-solve.py`](tools/tenzo-crackme-solve.py) | clé + `--check` Wine |

## Réponse

| | |
|---|---|
| **License key** | `T3nz0-VM-2026-V1rtu4l-Unl0ck3d!!` |
| Longueur | 32 (`T3nz0` · `VM` · `2026` · `V1rtu4l` · `Unl0ck3d!!`) |

```bash
python3 tools/tenzo-crackme-solve.py -q
python3 tools/tenzo-crackme-solve.py --check
# → Enter License Key: Correct Key! Access Granted.
```

---

## 1. Premier regard

```text
file original/Crackme_Tenzo.exe
# PE32+ executable for MS Windows 6.00 (console), x86-64

diec → MSVC / VS 2026 linker, sections .text .rdata .data .pdata …

sha256: 70f450e4a51b9d26d6f1d4031c3ed484ffa74b02263392ab2e6cff7b51caf2c2
```

Live (Wine) :

```text
Enter License Key: <input>
Wrong Key! Access Denied.     # mauvaise clé
Correct Key! Access Granted.  # bonne clé
```

Les chaînes UI ne sont **pas** en clair dans le PE (chiffrement XOR / runtime) — visibles une fois déchiffrées à l’exécution.

| Difficulté / qualité (site) | 3.0 / 3.5 |
| Labels | Anti-debug, IsDebuggerPresent, string encryption, XOR, VM/CFF, spaghetti, dispatcher |

---

## 2. Flow

```text
main  (CFF / dispatcher massif)
  anti-debug (IsDebuggerPresent, PEB, hash .text, fenêtres outils…)
  iostream << "Enter License Key: "
  iostream >> std::string key
  sub_140001000(&key)   → bool
    OK  → "Correct Key! Access Granted."
    KO  → "Wrong Key! Access Denied."
```

`main` et `sub_140001000` sont aplatis en **machine d’états** (opcodes numériques + `goto` / prédicats opaques). Hex-Rays produit des milliers de lignes peu lisibles ; le prédicat utile tient dans le booléen final `return v132 & 1` de `sub_140001000`.

Helpers iostream :

| RVA | Rôle |
|---|---|
| `sub_1400114A0` | `operator<<` (affiche le prompt) |
| `sub_1400117B0` | `operator>>` (lit la clé dans `std::string`) |
| `sub_140001000` | validation licence |

Anti-debug notable : `sub_140012040` calcule un hash type **Murmur**/mix sur `.text` (intégrité) ; `IsDebuggerPresent` / PEB / scan de fenêtres debugger.

---

## 3. Prédicat

La clé acceptée est une **constante** (pas de keygen name→serial) :

```text
T3nz0-VM-2026-V1rtu4l-Unl0ck3d!!
```

Format leetspeak / marketing VM (`T3nz0`, `V1rtu4l`, `Unl0ck3d`, année `2026`).  
Sous l’obfuscation, la vérif se comporte comme une **comparaison** (ou hash one-shot) de cette chaîne — les write-ups publics parlent de *brute-force* une fois le format / charset cernés.

Approches pratiques :

1. **Dynamique** : BP après `operator>>`, dump du buffer ; BP / trace dans `sub_140001000` sur les cmp de caractères / blocs.
2. **Statique** : déplier le CFF jusqu’aux branches succès/échec (long).
3. **Communauté** : la clé apparaît aussi en spoiler sur la page crackmes.one (vérifiée ici sous Wine).

Pas de username — uniquement la license key.

---

## 4. Debug x64dbg (notes)

Binaire déjà chargé en session : `Crackme_Tenzo.exe` @ image base typique `0x7FF6…`.

- PEB : `BeingDebugged=0`, `NtGlobalFlag&=~0x70` avant de laisser courir (sinon chemins anti-debug).
- Préférer BP sur `kernelbase!WriteFile` / `WriteConsoleW` pour voir les strings déchiffrées au moment du prompt / du message OK/KO.
- `sub_140001000` = image_base + `0x1000` : entrée de la validation ; retour `AL` = succès.

Le live **complète** la preuve Wine / solveur ; il ne remplace pas `--check`.

---

## 5. Vérification

```bash
printf '%s\n' 'T3nz0-VM-2026-V1rtu4l-Unl0ck3d!!' | WINEDEBUG=-all wine original/Crackme_Tenzo.exe
# Enter License Key: Correct Key! Access Granted.

python3 tools/tenzo-crackme-solve.py --check
```

---

## 6. Notes

- Ce n’est **pas** un keygen paramétrique : une seule clé.
- L’obfuscateur (CFF + junk + chiffrement de strings) est le vrai challenge pédagogique ; la clé elle-même est courte et « parlante ».
- Patcher l’anti-debug pour analyser est OK pour le reverse ; la preuve livrée reste la clé + binaire d’origine sous Wine.
