# Mazzotti's Getting started keygen

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a3ce36d39dd6183d62b9dfe) · id `6a3ce36d39dd6183d62b9dfe`

Crackme **ELF64 x86-64 PIE**, C++ (libstdc++), **strippé**. Keygen name→clé par XOR avec une table fixe.
Auteur : [Mazzotti](https://crackmes.one/user/Mazzotti). 3ᵉ épisode résolu de la famille [mazzotti](../README.md), après [Getting started patch-me](../6a6ef28bdf981859694943d5/) et [Cortisol level low keygen](../6a400d20a4b247348ae806cf/).

Dossier : `authors/mazzotti/6a3ce36d39dd6183d62b9dfe/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`getting_started_keygen`](original/getting_started_keygen) | binaire d'origine |
| [`README.md`](README.md) | ce write-up |
| [`getting-started-keygen-solve.py`](tools/getting-started-keygen-solve.py) | keygen (name → clé) |

## Réponse

| Nom | Clé |
|---|---|
| **`petik`** | **`746`** |
| `Mazzotti` | `1052` |

```bash
python3 tools/getting-started-keygen-solve.py petik --check
python3 tools/getting-started-keygen-solve.py petik -q
```

---

## 1. Premier regard

```text
file original/getting_started_keygen
# ELF 64-bit LSB pie executable, x86-64, dynamically linked, stripped

sha256: f610c9b35528a23b8f881271112d65db96717464b3a51150ab76f97e015545a1
```

```text
$ echo | ./original/getting_started_keygen
Enter a string of characters (no spaces): 
Enter correct number (no spaces): 
Bro, what are you trying to do?
```

Deux prompts distincts : un **nom** (contraint en longueur) puis un **nombre**. Message d'erreur dédié à la contrainte de longueur ≠ message d'erreur de la mauvaise clé (`Send help pls.`) → deux contrôles séparés.

---

## 2. Flow

```text
main  (0x11f0)
  cin >> s                        ; lit un mot sans espace
  if s.size()-5 > 5 : "Bro, what are you trying to do?"; exit(1)
                                   ; (size()-5 <=5 en unsigned <=> taille dans [5,10])
  cin >> n                        ; lit un entier
  key = hash(s)                   ; @ 0x14b0
  if key == n : "OMG! You did it! :3"
  else        : "Send help pls."
```

---

## 3. Comment on trouve la formule

### Ancrage

Pas de symboles (`stripped`). `objdump -d -M intel` sur la seule fonction métier hors runtime C++ (appelée juste après la lecture de `n`, à `main+0xd1` / `0x12c1`) :

```asm
; hash(string& s) @ 0x14b0
14b4: mov    rsi,QWORD PTR [rdi+0x8]      ; rsi = s.size()
14b8: test   rsi,rsi
14bb: je     14f0                          ; chaîne vide -> 0
14bd: mov    r8,QWORD PTR [rdi]            ; r8 = s.data()
14c4: lea    rdi,[rip+0x2b55]              # 0x4020 -- table
14d0: movsx  edx,BYTE PTR [r8+rax*1]       ; edx = s[i]
14d5: xor    edx,DWORD PTR [rdi+rax*4]     ; edx ^= table[i]
14dc: add    ecx,edx                       ; ecx += (s[i] XOR table[i])
14de: cmp    rsi,rax
14e1: jne    14d0                           ; boucle i = 0..len-1
14e3: mov    eax,ecx                        ; retourne ecx
```

### Décodage de la table

```bash
$ objdump -s --start-address=0x4020 --stop-address=0x4050 original/getting_started_keygen
4020 04000000 4f000000 81000000 ab000000
4030 fe000000 7b000000 e0000000 cc000000
4040 46000000 35000000 ee000000 00000000
```

4 octets par entrée (`int32` little-endian) → `table = [4, 79, 129, 171, 254, 123, 224, 204, 70, 53, 238]` (11 entrées, index max utilisable 9 puisque `len(s) ≤ 10`).

### Assemblage

```python
key = Σ ( ord(s[i]) XOR table[i] )   pour i = 0..len(s)-1
```

Exemple `petik` (5 caractères, table[0..4] = `[4, 79, 129, 171, 254]`) :

| i | `s[i]` | `ord` | `table[i]` | XOR |
|---|---|---|---|---|
| 0 | p | 0x70 (112) | 4 | 0x74 = 116 |
| 1 | e | 0x65 (101) | 79 | 0x2a = 42 |
| 2 | t | 0x74 (116) | 129 | 0xf5 = 245 |
| 3 | i | 0x69 (105) | 171 | 0xc2 = 194 |
| 4 | k | 0x6b (107) | 254 | 0x95 = 149 |

`key = 116 + 42 + 245 + 194 + 149 = 746`. Vérifié directement sur le binaire (`printf 'petik\n746\n' | ./original/getting_started_keygen` → `OMG! You did it! :3`), sans besoin de GDB.

### Piège

Aucun piège de force brute à faire : la borne `size()-5 <= 5` (unsigned) peut surprendre à la première lecture — elle encode en réalité `5 <= size() <= 10` (tout `size() < 5` ferait sous-flot et donnerait une grande valeur unsigned, donc rejeté aussi).

---

## 4. Vérification

```bash
$ python3 tools/getting-started-keygen-solve.py petik --check
CHECK: OK
[+] nom : petik
[+] cle : 746
----- sortie du programme -----
Enter a string of characters (no spaces): 
Enter correct number (no spaces): 
OMG! You did it! :3
--------------------------------
```

Cas KO (clé fausse) :

```bash
$ printf 'petik\n745\n' | ./original/getting_started_keygen
# ... Send help pls.
```

Cas KO (nom trop court, < 5 caractères) :

```bash
$ printf 'abc\n0\n' | ./original/getting_started_keygen
# ... Bro, what are you trying to do?
```

---

## 5. Notes

- Pas de GDB nécessaire : binaire petit, désassemblage statique suffisant, vérifié directement par exécution.
- Table XOR fixe dans `.data`, pas de dérivation runtime — un simple `objdump -s` suffit, pas besoin de IDA/MCP.
- `petik` (5 lettres) respecte la contrainte `[5,10]` sans ajustement nécessaire.
