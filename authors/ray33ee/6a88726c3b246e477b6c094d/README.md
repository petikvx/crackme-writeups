# ray33ee's obscurio - 1

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a88726c3b246e477b6c094d) · id `6a88726c3b246e477b6c094d`

Crackme **Windows** PE64 console + bytecode `program.bin`.  
Auteur : [ray33ee](https://crackmes.one/user/ray33ee). Série **obscurio** (#1 — le plus facile de la série VM). Diff site **4.2**.

Dossier : `authors/ray33ee/6a88726c3b246e477b6c094d/` — [série](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/crackus.exe`](original/crackus.exe) | host VM (MinGW) |
| [`original/program.bin`](original/program.bin) | bytecode (13111 instructions × qword) |
| [`tools/obscurio1-solve.py`](tools/obscurio1-solve.py) | password + `--recover` (oracle) + `--check` Wine |
| [`tools/vm_run1.c`](tools/vm_run1.c) | interpréteur C fidèle au host |
| [`tools/oracle_steps.c`](tools/oracle_steps.c) | compteur de steps (oracle rapide) |
| [`analysis/crackus.exe.i64.c`](analysis/crackus.exe.i64.c) | decc Hex-Rays du host |
| [`analysis/wine-verify.log`](analysis/wine-verify.log) | preuve live |

## Réponse

Password **fixe** (pas de username) :

| | |
|---|---|
| **Password** | **`r4y_0b5Curi0_I729`** |

```bash
python3 tools/obscurio1-solve.py -q
# r4y_0b5Curi0_I729

# retrouver depuis zero (oracle VM, ~quelques secondes avec oracle_steps) :
python3 tools/obscurio1-solve.py --recover

cd original
printf 'r4y_0b5Curi0_I729\n' | WINEDEBUG=-all wine crackus.exe
# Please enter password: well done!
```

`cwd` doit contenir `program.bin` (sinon `fopen: No such file`).

---

## 1. Premier regard

```text
crackus.exe  : PE32+ console x86-64 (GCC 13.1 MinGW)
program.bin  : data LE, 104888 bytes = 13111 × (opcode u32 + imm u32)
sha256 crackus   78e57601954380985d539ef126b973b4e32f7c64a05be86a9f4f57f4448175d6
sha256 program   e5699551367488e9ccf9cc66bfeadc4fb3bb79a6218a2ae4cc8815f0a0fe82fc
```

Prompts : `Please enter password:` → `well done!` / `incorrect`.  
Même *idée* de host VM que [obscurio - 3](../6a9ae805cab6678aefe9dcb2/), mais **pas le même binaire** (SHA différent) et **pas le même jeu d’opcodes** / packing.

Le password **n’apparaît pas** en clair dans l’exe ni dans `program.bin` (`strings` ne donne rien d’utile). Les messages de succès / échec sont construits sur le heap par la VM.

Décompilation host : `bash -ic 'decc original/crackus.exe'` → `analysis/crackus.exe.i64.c`.

---

## 2. Flow

```text
crackus.exe
  fread(program.bin) par qwords  →  tableau d’instructions (lo=opcode, hi=imm)
  VM stack exécute le bytecode
  PRINT "Please enter password: "
  READ password (heap base 100 : [len][chars…])
  prédicat VM (char-par-char, early-out)
  PRINT "well done!"  ou  "incorrect"
```

---

## 3. Comment retrouver le password (sans spoiler)

### 3.1 Reverse du host → interpréteur

Le cœur utile est `sub_1400018A0` dans le dump Hex-Rays. Points clés :

1. **Packing** : chaque instruction est un `uint64` = `(opcode:u32) | (imm:u32 << 32)`. Contrairement à obscurio-3, il n’y a **pas** d’encoding variable « opcode seul / opcode+imm » : toujours une paire.
2. **Décodage d’immediates** (identique en esprit à #3) : `PUSH` (op `4`) passe par un fold XOR + multiplications ; `JZ`/`CALL` et slots locaux ont leurs tables `T0`/`T1`.
3. **Opcodes #1** (différents de #3) :

| Op | Rôle |
|---|---|
| `4` | PUSH imm décodé |
| `0` / `1` | LOAD / STORE local (`fp+1+slot`) |
| `2` / `3` | LOAD / STORE arg (`fp-slot-2`) |
| `5` | push vers call-stack |
| `0x14` | JZ |
| `0x28` / `0x29` / `0x2A` | CALL / RET / ENTER |
| `0x64` / `0x65` | AND / OR |
| `0x68` / `0x69` | SHL / SHR |
| `0x96` | NOT |
| `0xC8` / `0xCA` / `0xC9` / `0xCB` | dup/rot stack |
| `0x1F5` / `0x1F6` | HLOAD / HSTORE |
| `0x1F7` / `0x1F8` | PRINT str / READ (len @ `HP[base]`, chars @ `HP[base+1…]`) |

Reproduire ça en C (`tools/vm_run1.c`) suffit pour exécuter `program.bin` **sans Wine** et observer le prédicat.

```bash
gcc -O2 -o tools/vm_run1 tools/vm_run1.c
printf 'test\n' | ./tools/vm_run1          # → incorrect
printf 'r4y_0b5Curi0_I729\n' | ./tools/vm_run1  # → well done!
```

### 3.2 Le password n’est pas sur le heap

En dumpant les chaînes heap autour du `READ` / des `PRINT`, on ne voit que :

- `Please enter password: ` (base 120)
- l’entrée utilisateur (base 100)

Pas de littéral `r4y_…`. Le check est **calculé** (MBA AND/OR/SHL/SHR/NOT sur chaque caractère), pas un `strcmp` naïf.

### 3.3 Oracle : longueur puis caractère par caractère

L’astuce d’obscurio-1 (volontairement le plus facile de la série) : le prédicat **sort tôt** dès qu’un test échoue. Le nombre de steps VM devient un oracle parfait.

Mesures avec `tools/oracle_steps` (même sémantique, sortie `steps top`) :

| Entrée | Steps | Top stack | Message |
|---|---:|---:|---|
| longueur ≠ 17 | 93080 | 1 | `incorrect` |
| 17 × `X` (tout faux) | 96886 | 1 | `incorrect` |
| `r` + 16 × `X` | 101530 | 1 | `incorrect` |
| `r4` + 15 × `X` | 106174 | 1 | `incorrect` |
| … | +4644 / bon char | 1 | … |
| `r4y_0b5Curi0_I729` | **172871** | **0** | `well done!` |

Donc :

1. **Longueur** : tester `len = 0..N` → seul `17` dépasse 93080 steps.
2. **Caractères** : pour la position `i`, essayer le charset (`[A-Za-z0-9_-]` suffit) ; le bon caractère est celui qui atteint  
   `96886 + (i+1)×4644` steps (et pour le dernier : `top == 0`).
3. En ~17 × |charset| runs VM (C ≈ millisecondes / run) on reconstruit **`r4y_0b5Curi0_I729`**.

```bash
gcc -O2 -o tools/oracle_steps tools/oracle_steps.c
python3 tools/obscurio1-solve.py --recover
#   [00] 'r' steps=101530 → r????????????????
#   [01] '4' steps=106174 → r4???????????????
#   …
#   [16] '9' steps=172871 → r4y_0b5Curi0_I729
# r4y_0b5Curi0_I729
```

Le thème du password (`ray` / `obscurio` en leetspeak + suffixe) est un bonus de confirmation, pas la méthode.

### 3.4 Pourquoi ça marche

Chaque caractère est vérifié dans une boucle / bloc MBA coûteux (~4644 opcodes). Un mismatch saute directement vers le chemin `incorrect` ; un match enchaîne sur le caractère suivant. D’où le staircase de steps. Obscurio-3 retire ce genre de fuite (poly + fillers + MBA final sans early-out aussi généreux).

---

## 4. Vérification

```text
r4y_0b5Curi0_I729 → well done! (exit 0)
wrong             → incorrect   (exit 1)
```

```bash
python3 tools/obscurio1-solve.py --check
# Please enter password: well done!
# OK (exit=0)
```

Log : [`analysis/wine-verify.log`](analysis/wine-verify.log).

---

## 5. Notes

- Spoilers publics crackmes.one donnaient déjà la chaîne ; ici le chemin documenté est **indépendant** (host → VM → oracle steps).
- Ne pas réutiliser tel quel les tools d’obscurio-3 (`extract_params`, opcodes `0xC6` NAND, packing variable) : le dialecte #1 casse dessus (`unk op 104`, etc.).
- Patcher le host / forcer le `well done!` marche techniquement (l’auteur le tolère à contrecœur) ; la soluce « propre » est l’oracle ou l’extraction du prédicat MBA.
- Suite plus dure : [obscurio - 2](../) / [obscurio - 3](../6a9ae805cab6678aefe9dcb2/) (même famille, VM divergente, keygen username→password).
