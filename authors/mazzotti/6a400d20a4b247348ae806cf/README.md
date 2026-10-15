# Mazzotti's Cortisol level low keygen

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a400d20a4b247348ae806cf) · id `6a400d20a4b247348ae806cf`

Crackme **ELF64 x86-64 PIE**, C++ (libstdc++), **strippé**. Checksum numérique type « clé de contrôle mod 10 » sur un nombre de 11 chiffres.
Auteur : [Mazzotti](https://crackmes.one/user/Mazzotti). 2ᵉ épisode résolu de la famille [mazzotti](../README.md), après [Getting started patch-me](../6a6ef28bdf981859694943d5/).

Dossier : `authors/mazzotti/6a400d20a4b247348ae806cf/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`cortisol_level_low_keygen`](original/cortisol_level_low_keygen) | binaire d'origine |
| [`README.md`](README.md) | ce write-up |
| [`cortisol-solve.py`](tools/cortisol-solve.py) | keygen (clé de contrôle) |

## Réponse

| | |
|---|---|
| **Numéro valide (exemple)** | `12345678903` |
| Autre exemple | `98765432107` |

> **Exception à la convention `petik`** : le binaire parse uniquement des **chiffres** (`cin >> string` suivi d'un contrôle `isdigit` manuel, message d'erreur `Bro, NUMBER!!!` sinon) — impossible d'utiliser un login texte ici. Voir ci-dessous pour un générateur arbitraire.

```bash
python3 tools/cortisol-solve.py 1234567890 --check
python3 tools/cortisol-solve.py 1234567890 -q
```

---

## 1. Premier regard

```text
file original/cortisol_level_low_keygen
# ELF 64-bit LSB pie executable, x86-64, dynamically linked, stripped

sha256: 102cd396a16bb1aced9c4a768dfc93ea7de44509b53e8ee2d8699b33b1f42aca
```

Binaire C++ (symboles `_ZSt3cin`, `_ZSt4cout`, `basic_string`…), **stripped** mais pas obfusqué : les imports PLT suffisent à retrouver le flot.

```text
$ echo "hello" | ./original/cortisol_level_low_keygen
Bro, NUMBER!!!
$ echo "12345678901" | ./original/cortisol_level_low_keygen
What is this? Wrong number?
```

Deux messages d'erreur distincts : un pour "pas un nombre", un pour "nombre refusé" → deux contrôles séparés (format, puis checksum).

---

## 2. Flow

```text
<main>  (0x11d0, pas de symbole mais seule fonction appelée depuis l'entry via __libc_start_main)
  cin >> s                      ; lit une ligne entière dans un std::string
  for each char in s: if !isdigit(c): "Bro, NUMBER!!!"; exit(1)
  ok = check(s)                 ; @ 0x1440
  if ok:  "Ok, Ok you are not that dumb. :3"
  else:   "What is this? Wrong number?"
```

---

## 3. Comment on trouve le checksum

### Ancrage

Pas de symboles (`stripped`), mais `objdump -d -M intel` suffit : l'entry point (`0x12d0`) appelle `__libc_start_main` avec `main` en argument (`0x11d0`). La seule fonction "métier" restante (hors runtime C++) est à `0x1440`.

```asm
; check(string& s) @ 0x1440
1446: cmp    QWORD PTR [rdi+0x8],0xb      ; s.size() == 11 ?
144b: jne    14b9                         ; sinon retourne false

1454: lea    rdi,[rip+0x2bc5]             # 0x4020 -- table de poids
1460: movsx  eax,BYTE PTR [rsi+rdx*1]     ; eax = s[i] (ASCII)
1464: sub    eax,0x30                     ; eax = digit[i]
1467: imul   eax,DWORD PTR [rdi+rdx*4]    ; eax = digit[i] * weights[i]
146b: add    rdx,0x1
146f: add    ecx,eax                      ; ecx += digit[i]*weights[i]
1471: cmp    rdx,0xa
1475: jne    1460                         ; boucle i = 0..9 (10 chiffres)

147a: ; ecx = sum
147c: imul rax, rax, 0x66666667 ; ...   ; division par 10 (trick compilateur)
...
1498: add    eax,0xa
...                                       ; eax = (10 - sum % 10) % 10
14ad: movsx  eax,BYTE PTR [rsi+0xa]       ; s[10] = chiffre de contrôle saisi
14b1: sub    eax,0x30
14b4: cmp    edx,eax                      ; compare à la valeur calculée
14b6: sete   al                           ; retourne vrai si égal
```

### Décodage de la table de poids

```bash
$ objdump -s --start-address=0x4020 --stop-address=0x4050 original/cortisol_level_low_keygen
4020 01000000 03000000 07000000 09000000
4030 01000000 03000000 07000000 09000000
4040 01000000 03000000
```

4 octets par entrée (little-endian, `int32`) → `weights = [1, 3, 7, 9, 1, 3, 7, 9, 1, 3]`.

### Assemblage de la formule

```python
sum_  = Σ digit[i] * weights[i]   pour i = 0..9
clé   = (10 - sum_ % 10) % 10     # complément à 10, borné 0..9
numéro = 10 premiers chiffres + clé
```

Exemple `1234567890` :

```text
1×1 + 2×3 + 3×7 + 4×9 + 5×1 + 6×3 + 7×7 + 8×9 + 9×1 + 0×3
= 1 + 6 + 21 + 36 + 5 + 18 + 49 + 72 + 9 + 0 = 217
217 % 10 = 7  →  clé = 10 - 7 = 3
numéro = 12345678903
```

Vérifié directement sur le binaire (`echo "12345678903" | ./original/cortisol_level_low_keygen` → `Ok, Ok you are not that dumb. :3`), confirmant la lecture statique sans avoir besoin de GDB.

### Piège

Le seul vrai piège ici est le **désassemblage de la division par 10/5 générée par le compilateur** (`imul` + `sar`/`shr` avec constantes magiques `0x66666667` / `0xcccccccd`) : ce n'est pas du chiffrement, juste `sum % 10` optimisé sans instruction `div`. Reconnaître ce pattern évite de perdre du temps à le décoder bit à bit — le vérifier empiriquement (comme ci-dessus) est plus rapide qu'une relecture manuelle complète.

---

## 4. Vérification

```bash
$ python3 tools/cortisol-solve.py 1234567890 --check
CHECK: OK
[+] préfixe : 1234567890
[+] clé     : 3
[+] numéro  : 12345678903
----- sortie du programme -----
Ok, Ok you are not that dumb. :3
--------------------------------
```

Cas KO (préfixe correct, clé fausse) :

```bash
$ echo "12345678900" | ./original/cortisol_level_low_keygen
What is this? Wrong number?
```

Cas KO (format, lettre dans l'entrée) :

```bash
$ echo "1234567890a" | ./original/cortisol_level_low_keygen
Bro, NUMBER!!!
```

---

## 5. Notes

- PIE mais sans canary explicite dans le flot critique observé (le `fs:0x28` vu dans `_Unwind_Resume`/wrapper est le canary standard de la libstdc++, pas lié à notre contrôle).
- Pas de GDB nécessaire : le binaire est petit et le désassemblage statique (`objdump`) suffit à extraire la table de poids et la formule ; vérifié directement en exécutant le binaire avec le numéro calculé.
- Convention `petik` non applicable (entrée strictement numérique) — voir l'exception documentée en tête de ce write-up.
