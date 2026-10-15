# 23x41's 0x8A7 — Batcave Access Terminal

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a597d2a0b25d281a656896b) · id `6a597d2a0b25d281a656896b`

Crackme **ELF64 x86-64**, C, non strippé (+ `debug_info`), **non-PIE** (`EXEC`), **sans canary**. Overflow trivial → **ret2win** direct sur `open_batcave`.
Auteur : [23x41](https://crackmes.one/user/23x41). 4ᵉ épisode de la série **0x8A7** après [Secure Vault](../6a59d79ba27dfa335e4c8597/), [DPRK Loyalty Evaluation](../6a5995410b25d281a656896f/) et [Maze](../6a597d7f0691b3daf2a3f2a0/).

Dossier : `authors/23x41/6a597d2a0b25d281a656896b/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`batcave`](original/batcave) | binaire d'origine |
| [`README.md`](README.md) | ce write-up |
| [`batcave-solve.py`](tools/batcave-solve.py) | overflow + ret2win |

## Réponse

| | |
|---|---|
| **Flag** | `FLAG{0x8A7_R3T2W1N_N0_PR0T3CT10N5}` |
| Mot de passe (leurre) | `N1ghtw1ng_R3turns` — `strncmp` OK **mais** jamais relié à `open_batcave` |

```bash
python3 tools/batcave-solve.py -q
python3 tools/batcave-solve.py --check
```

---

## 1. Premier regard

```text
file original/batcave
# ELF 64-bit LSB executable, x86-64, dynamically linked, not stripped

sha256: c58b2d78b6af9ebc78399b8f90362b6a468824456ca71ac461561f08dae00daf
```

| Protection | État |
|---|---|
| PIE | **non** (`ET_EXEC`, adresses fixes `0x40….`) |
| Canary | **non** (pas de `__stack_chk_fail` dans les symboles) |
| NX | n/a — pas besoin de shellcode, le binaire contient déjà la fonction gagnante |

| Symbole | Adresse |
|---|---|
| `open_batcave` | `0x401186` |
| `check_password` | `0x4011d8` |
| `main` | `0x40127d` |

`strings` donne tout de suite le flag et le mot de passe en clair — comme pour [Maze](../6a597d7f0691b3daf2a3f2a0/), le but n'est **pas** de lire le mot de passe mais de voir qu'il ne mène nulle part sans un overflow.

---

## 2. Flow

```text
main
  banner Wayne Enterprises
  check_password()
  "[LOG] Session ended."

check_password
  printf("Enter the Batcave access code: ")
  read(0, buf, 0x200)        ; buf @ rbp-0x50 — lecture jusqu'à 512 octets dans un buffer de 0x50
  strncmp(buf, "N1ghtw1ng_R3turns", 17)
    OK  → "Correct code -- but Alfred says that's not how you get in tonight."
    KO  → "Access Denied. The Batcave remains sealed."
  ; jamais open_batcave, même en cas de succès

open_batcave
  BATCOMPUTER / victory
  puts(FLAG)
  system("/bin/sh")
```

---

## 3. Comment on trouve le ret2win

### Ancrage

`objdump -d -M intel original/batcave` sur `check_password` (`0x4011d8`) :

```asm
401203: lea    rax,[rbp-0x50]
401207: mov    edx,0x200          ; read() jusqu'à 0x200 octets
40120c: mov    rsi,rax
40120f: mov    edi,0x0
401214: call   401070 <read@plt>  ; buf @ rbp-0x50, taille demandée >> taille du buffer
```

Le buffer fait `0x50` octets mais `read` en accepte **0x200** (512) : overflow massif de la pile, **sans canary** et **sans PIE**. `open_batcave` (`0x401186`) a une adresse fixe, codée en dur dans le binaire : pas besoin de leak, juste écraser l'adresse de retour.

### Calcul de l'offset

Frame de `check_password` :

| Offset depuis `buf` (`rbp-0x50`) | Contenu |
|---|---|
| `0x00…0x4f` | buffer (notre payload) |
| `0x50` | saved `rbp` |
| `0x58` | **adresse de retour** |

```python
payload = b"A" * 0x58 + p64(0x401186)   # 0x58 = 0x50 (buffer) + 0x8 (saved rbp)
```

`check_password` fait `leave; ret` : `leave` restaure `rbp` depuis `[rbp]` puis `rsp = rbp+8` ; `ret` dépile l'adresse à `rsp`, donc bien l'octet `0x58` depuis le début du buffer.

### Assemblage de la réponse

```text
0x58 × 'A'  (padding : buffer + saved rbp, valeur peu importe)
+ p64(0x401186)  (adresse de open_batcave, little-endian)
= 96 octets au total
```

Le programme répond d'abord "Access Denied" (puisque le contenu lu ≠ `N1ghtw1ng_R3turns`), **puis** exécute quand même `open_batcave` au `ret` suivant — preuve que le chemin normal (mot de passe correct) et le ret2win sont deux chemins totalement indépendants.

---

## Debug GDB (pas à pas)

ELF **non-PIE**, **sans canary**, non strippé (+ `debug_info`) : les adresses `0x40….` du write-up sont directement les adresses runtime.

### 4.1 Cartographie

```bash
gdb -q original/batcave
(gdb) info address check_password   # 0x4011d8
(gdb) info address open_batcave     # 0x401186
(gdb) disassemble check_password
```

Confirme le `read(0, rbp-0x50, 0x200)` à `check_password+43` et le `ret` final à `check_password+164`.

### 4.2 Vérifier le détournement du flux

```bash
gdb -q original/batcave
(gdb) break *0x4011d8
(gdb) run < payload.bin      # payload = 0x58 x 'A' + p64(0x401186)
(gdb) break open_batcave
(gdb) continue
(gdb) info frame
(gdb) x/2gx $rbp
```

Sortie observée :

```text
Breakpoint 2, open_batcave () at batcave_gate.c:17
Saved registers:
 rbp at 0x7fffffffd708, rip at 0x7fffffffd710
0x7fffffffd708: 0x4141414141414141   0x00007fffffffd7c0
```

`open_batcave` est bien atteint sans jamais être appelé par `call` : son breakpoint se déclenche directement après le `ret` de `check_password`, et la pile montre nos `0x41` (`A`) à l'emplacement du saved `rbp`, juste avant l'adresse de retour écrasée. Pas de PIE (adresses stables entre les runs) ; pas de garde canary à contourner.

---

## 5. Vérification

```bash
$ python3 tools/batcave-solve.py --check
[...]
CHECK: OK
```

Sortie complète (cas OK, i.e. exploitation) :

```text
=========================================
   WAYNE ENTERPRISES SECURITY -- 0x8A7
        BATCAVE ACCESS TERMINAL
=========================================
Enter the Batcave access code: Access Denied. The Batcave remains sealed.

[BATCOMPUTER]: Access Granted. The Batcave doors slide open...
You find the Dark Knight's terminal waiting for you.
FLAG{0x8A7_R3T2W1N_N0_PR0T3CT10N5}
```

Cas KO / edge (buffer trop court, pas d'écrasement de l'adresse de retour) :

```bash
$ printf 'wrong\n' | ./original/batcave
# "Enter the Batcave access code: Access Denied. The Batcave remains sealed."
# puis "[LOG] Session ended." — jamais open_batcave sans overflow complet.
```

Même en envoyant le **vrai** mot de passe `N1ghtw1ng_R3turns\n` (sans overflow), on obtient "Correct code -- but Alfred says that's not how you get in tonight." suivi de "[LOG] Session ended." : le flag n'est **jamais** affiché par ce chemin, confirmant que c'est un pur leurre.

---

## 6. Notes

- Pas de PIE, pas de canary, `GNU_STACK` marqué `RWE` (pile exécutable) — mais totalement inutile ici puisque `open_batcave` existe déjà en clair dans le binaire : classique **ret2win**, pas de ROP chain ni de shellcode nécessaires.
- Le mot de passe `N1ghtw1ng_R3turns` est une fausse piste volontaire (cf. `strncmp` jamais suivi d'un appel à `open_batcave`), même schéma pédagogique que [Maze](../6a597d7f0691b3daf2a3f2a0/) avec son `Wh4t_Am_1`.
- Pas de leak nécessaire ici (contrairement à [Vault](../6a597d5e055757d3df60fd58/)) : adresses fixes + pas de canary = overflow direct.
