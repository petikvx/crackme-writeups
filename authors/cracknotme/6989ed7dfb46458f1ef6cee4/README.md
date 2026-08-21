# CrackNotMe's Monster CrackMe 1.0 (MCM)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6989ed7dfb46458f1ef6cee4) · id `6989ed7dfb46458f1ef6cee4`

Crackme **PE32+ console** x86-64 (MSVC).  
Auteur site : **CrackNotMe** · « Monster CrackMe 1.0 (MCM) ».

Dossier : `authors/cracknotme/6989ed7dfb46458f1ef6cee4/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/CrackMe.exe`](original/CrackMe.exe) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`tools/mcm-solve.py`](tools/mcm-solve.py) | decode VM / check / brute |
| [`analysis/decode-y5.txt`](analysis/decode-y5.txt) | bytecode décodé pour `y5` |
| [`analysis/wine-denied.txt`](analysis/wine-denied.txt) | Wine : mauvais password → DENIED |

## Réponse

| Input | Valeur |
|---|---|
| Password | **`y5`** |

(Plusieurs préimages de longueur 2 existent pour le prédicat VM ; `y5` est la solution courte « canon ».)

```bash
python3 tools/mcm-solve.py -q
# y5

python3 tools/mcm-solve.py --check y5
# OK

python3 tools/mcm-solve.py --decode y5
```

Message succès (chaîne XOR runtime) : *`[+] UNLOCKED: The Matrix has you.`*  
Échec : *`[-] ACCESS DENIED (Integrity Error / Wrong Password).`*

> **Wine** : le chemin *parent debugge l’enfant* (`CreateProcess` + `WaitForDebugEvent` / `SetThreadContext`) **bloque** souvent sous Wine une fois le password accepté. Le prédicat est vérifié hors-ligne via le solveur (decode → opcodes `F0`/`FF`). Sous Windows natif le flow multi-process est prévu pour marcher.

---

## 1. Premier regard

```text
file original/CrackMe.exe
# PE32+ executable (console) x86-64
# MSVC 19.41 / VS2022
```

Banner runtime (strings chiffrées) :

```text
=== MONSTER CRACKME v1.0 ===
Enter Password:
```

Description auteur : virtualisation d’instructions, maths, interaction multi-process ; patching autorisé.

Hashes :  
MD5 `b3a23f06c8c98663bf8f6a98a247697c` · SHA-256 `ed0bf27ae3f1aca6e776a05fb774c8426f9ddf344120381a51a355fb76a099a6`.

---

## 2. Flow parent / enfant

```text
PARENT
  CreateProcessA(self, DEBUG_ONLY_THIS_PROCESS…)
  WaitForDebugEvent
  sur INT3 enfant :
    si RAX == 0 → SetThreadContext(RAX = 0x9f2d38b17c6a4e5f)
    ajuste RIP si besoin
  ContinueDebugEvent …

CHILD
  anti-debug / constante 0xb3e192f8a4d5c6b7
  mask = child_const XOR parent_forced_rax
  dérive clé depuis password + LCG
  décode blob VM (32 octets) puis exécute
```

Mask effectif (run propre) :

```text
0xb3e192f8a4d5c6b7 ⊕ 0x9f2d38b17c6a4e5f
= e8 88 bf d8 49 aa cc 2c   (little-endian bytes)
```

Les messages UI sont reconstruits par XOR positionnel (ex. `FUN_140003f50` → ACCESS DENIED, `FUN_140003720` → UNLOCKED…).

---

## 3. Dérivation de clé (math)

1. Matrice **high** 4096 valeurs 10-bit, LCG :

```c
u = 0xDEADBEEF;
for (4096 fois)
    u = u * 0x19660D + 0x3C6EF35F;
    high[i] = u & 0x3FF;
```

(`FUN_140004430`)

2. Matrice **low** 4×16 : octets du password (0-paddés jusqu’à 64).

3. Pour chaque `n ∈ [0,64)` :

```c
edx = 0;
for j in 0..3:
    edx += dot(high[row n*4+j], low[row j]);  // 16 termes
    edx &= 0x3FF;
key[n] = (DATA[n*4] - (edx & 0xFF)) & 0xFF;
```

`DATA` = table `.data` @ `0x140034000` (dwords ; on prend l’octet bas de chaque entrée via `n*4`).

---

## 4. Blob VM & opcodes

Blob initialisé dans `FUN_140001000` puis copié vers `DAT_140035310` :

```text
48d9ed8a1dff9a7bb0d1e57c15f7927388e9ddbb2dcfaa4b80e1d5b325c7a243
```

Décodage :

```c
decoded[i] = blob[i] ^ mask[i & 7] ^ key[i];
```

Instructions 11 octets : `op, r1, r2, imm64_le`.

Succès attendu :

| ins | op | imm |
|---|---|---|
| 0 | `0xF0` | `1` |
| 1 | `0xFF` | (halt) |

Pour `y5` :

```text
decoded = f000000100000000000000 ff00…
ins[0] op=0xf0 imm=1
ins[1] op=0xff
```

Voir [`analysis/decode-y5.txt`](analysis/decode-y5.txt).

---

## 5. Résolution

On contraint les octets décodés du premier opcode succès (`F0` + imm `1` + `FF`).  
Brute longueur 2 (alphanum / printable) trouve notamment **`y5`** (et d’autres préimages : `1E`, `MM`, …).

```bash
python3 tools/mcm-solve.py --brute 2
# y5   (premier hit selon charset du solveur)
```

---

## 6. Vérification

```bash
python3 tools/mcm-solve.py --check y5     # OK
python3 tools/mcm-solve.py --check xx     # FAIL

# Wine — mauvais password
printf 'xx\n' | wine original/CrackMe.exe
# → ACCESS DENIED   (analysis/wine-denied.txt)

# Wine — bon password : souvent hang sur le debug API (timeout)
# Windows natif : attendre [+] UNLOCKED: The Matrix has you.
```

---

## 7. Notes

- Ce n’est **pas** de la série CFB ; même auteur, thème « monster » / Matrix.
- L’« Integrity Error » mélange anti-debug / mask parent et mauvais password.
- Patching du trap parent est une voie alternative (autorisée par l’auteur) ; ici on résout le password proprement.
- Ne pas patcher `original/`.
