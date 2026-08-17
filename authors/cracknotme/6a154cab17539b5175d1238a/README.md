# CrackmesForBeginners (CFB) #4 — Custom rotors

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a154cab17539b5175d1238a) · id `6a154cab17539b5175d1238a`

Crackme **PE32+ console** (x86-64), C++ MSVC (VS 2026 / toolset 19.50).  
Auteur site : **CrackNotMe** · tagline `pwn.by` / `pwned.space`.

Dossier : `authors/cracknotme/6a154cab17539b5175d1238a/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/CFB4.exe`](original/CFB4.exe) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`tools/cfb4-solve.py`](tools/cfb4-solve.py) | inversion rotors + password |

## Réponse

| Input | Valeur |
|---|---|
| Activation password | **`rotors_spin_9`** (13 caractères, underscores `_`) |

```bash
python3 tools/cfb4-solve.py -q
# rotors_spin_9
```

```text
r o t o r s _ s p i n _ 9
```

Preuve live (Wine) :

```text
[*] Encrypting input through custom rotors...
   [+] ACCESS GRANTED! Congratulations!
   You have successfully solved CFB4!
```

---

## 1. Premier regard

```text
file original/CFB4.exe
# PE32+ executable (console) x86-64, for MS Windows
```

```text
===================================================
            Crackme #4
           [+] by pwn.by [+]
         --> pwned.space <--
===================================================

[*] Enter activation password (exactly 13 chars):
[+] Password: …
[*] Encrypting input through custom rotors...
   [+] ACCESS GRANTED! …   ou   [-] ACCESS DENIED! Invalid password.
```

Hashes :  
MD5 `654bf8c567823955928da12c9d784739` · SHA-256 `cd0b68303a4eb9c3535cf1bd19fcdf81c3330e07adc7cd9168f34e5342aa0eca`.

Contrainte explicite : **exactement 13 caractères** (sinon message d’erreur + exit).

---

## 2. Flow

```text
banner CFB4
lire password (getline + trim espaces)
si len != 13 → erreur
afficher "[*] Encrypting input through custom rotors..."
  pour i = 0 .. 12 :
    appliquer la chaîne de rotors sur pwd[i] avec état (sum, xor)
    comparer le résultat à EXPECTED[i]
    mettre à jour l’état
si tous OK → ACCESS GRANTED
sinon → ACCESS DENIED
```

### « Custom rotors » — ce que c’est

Le message console **`[*] Encrypting input through custom rotors...`** est imprimé **juste avant** la chaîne de vérifications inline dans le `main` (`~0x1400060ff`).

| Interprétation naïve | Réalité dans CFB4 |
|---|---|
| Machine Enigma (rotors permutant un alphabet) | **Non** |
| Tables de substitution 26 lettres | **Non** |
| Chaîne **ADD / XOR / SUB** 8-bit chaînée + état | **Oui** |

Il n’y a pas de tables en `.rdata` : tout est **inliné** dans le main, une fois par caractère, avec un offset variable `rotor_add[i]`.

---

## 3. Prédicat

### État

| Variable | Init | Mise à jour après chaque char |
|---|---|---|
| `sum_state` | `5` | `sum_state = (sum_state + out) & 0xff` |
| `xor_state` | `0x0d` | `xor_state ^= out` |

### Chaîne par caractère `i` (0..12)

```text
t  = (sum_state + pwd[i]) & 0xff
t ^= 0x3a
t  = (t + 0x13) & 0xff
t ^= 0x7f
t  = (t - xor_state) & 0xff
t ^= 0x5c
t  = (t + rotor_add[i]) & 0xff     # rotor_add[i] = 0x15 + i*(i-1)/2
t ^= 0xa5
# t == EXPECTED[i]
```

`rotor_add` :

| i | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 |
|---|---|---|---|---|---|---|---|---|---|---|----|----|-----|
| add | 0x15 | 0x15 | 0x16 | 0x18 | 0x1b | 0x1f | 0x24 | 0x2a | 0x31 | 0x39 | 0x42 | 0x4c | 0x57 |

Cibles (`EXPECTED`) lues dans le disasm (`cmp …, imm8` successifs) :

```text
c6 b7 2b 6e 9e b7 fa 54 52 3f 35 98 df
```

### Extraits asm (char 0, `~0x14000611f`)

```text
movzx r9d, BYTE PTR [rax]      ; pwd[0]
add   r9b, 0x5                 ; sum_state initial = 5
xor   r9b, 0x3a
add   r9b, 0x13
xor   r9b, 0x7f
sub   r9b, 0xd                 ; xor_state initial
xor   r9b, 0x5c
add   r9b, 0x15                ; rotor_add[0]
xor   r9b, 0xa5
cmp   r9b, 0xc6
sete  cl                       ; flag cumulatif
```

Pour les caractères suivants, le flag de succès est enchaîné via `cmovne` (un seul échec → tout le reste est rejeté).

### Inversion

Chaque étape est bijective en 8-bit → on inverse de la fin vers le début pour chaque position, en mettant à jour l’état avec la **cible** (connue) :

```python
t = e ^ 0xa5
t = (t - rotor_add[i]) & 0xff
t ^= 0x5c
t = (t + xor_state) & 0xff
t ^= 0x7f
t = (t - 0x13) & 0xff
t ^= 0x3a
pwd[i] = (t - sum_state) & 0xff
```

Résultat : **`rotors_spin_9`**.

---

## 4. Vérification

```bash
python3 tools/cfb4-solve.py -q
# rotors_spin_9

python3 tools/cfb4-solve.py --check rotors_spin_9
# OK rotors_spin_9

printf 'rotors_spin_9\n\n' | wine original/CFB4.exe
# … ACCESS GRANTED! …
```

---

## 5. Notes

- **Pas** de mini-VM (CFB #3) ni de maze (CFB #2) : pure arithmétique chaînée.
- Longueur stricte 13 : le solveur / keygen n’a pas d’espace de recherche (1 solution unique pour les cibles données).
- Les « rotors » sont surtout du **flavor text** console ; le vrai modèle est une fonction de hachage progressive `f(pwd[i], état)`.
- `IsDebuggerPresent` est importé (CRT / runtime MSVC) mais **n’est pas** le prédicat password.
- Série CFB : #1 serial hex · #2 maze WASD · #3 mini-VM · **#4 rotors**.
