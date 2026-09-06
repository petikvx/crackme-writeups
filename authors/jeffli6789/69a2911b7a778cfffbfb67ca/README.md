# jeffli6789's Crackmes.one RE CTF 2026 — wallpaper

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/69a2911b7a778cfffbfb67ca) · id `69a2911b7a778cfffbfb67ca`

Crackme **ELF64** Linux, **asm** (syscalls), **statique**, **strippé**, **912 octets**.  
Auteur site : **jeffli6789** (challenge CTF : *sar*).

Dossier : `authors/jeffli6789/69a2911b7a778cfffbfb67ca/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/wallpaper`](original/wallpaper) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`tools/wallpaper-solve.py`](tools/wallpaper-solve.py) | check / MITM / `--run` |
| [`analysis/ok.txt`](analysis/ok.txt) | run live → `good job…` |

## Réponse

Plusieurs chemins valides. Un password accepté :

| Input | Valeur |
|---|---|
| Password (37× `{0,1,2,3}`) | **`1001223210123010301233322110103321001`** |
| Flag | **`CMO{1001223210123010301233322110103321001}`** |

```bash
python3 tools/wallpaper-solve.py -q
# 1001223210123010301233322110103321001
# CMO{1001223210123010301233322110103321001}

printf '1001223210123010301233322110103321001\n' | ./original/wallpaper
# enter password
# good job, validate with CMO{your_input}
```

---

## 1. Premier regard

```text
file original/wallpaper
# ELF 64-bit LSB executable, x86-64, statically linked, stripped
# size 912
```

Messages :

```text
enter password
good job, validate with CMO{your_input}
wrong password
```

Charset imposé (bit-test `0xf000000000400`) : **`0` `1` `2` `3`** (+ `\n`).  
Longueur utile : **37** caractères (compteur jusqu’au bit 37 de `0x2000000000`).

Description site : *« I used to have a nice wallpaper… Multiple valid solutions exist. »*

Hashes :  
MD5 `af440ff9e876c87b2612458c15ca437a` · SHA-256 `7526418ecada66780062b7f6ca7205c4540d6e2800fc994a4d02f75ae4b2b673`.

---

## 2. Modèle

État : registre `rax`, seed **`0xb6fd071e9c8a3425`**.

Pour chaque caractère `d ∈ {0,1,2,3}` :

1. Trouver `attempt ∈ 0..15` tel que le nibble `attempt` de `rax` (via `ror` de `4*attempt`) soit **0**.
2. Bit-test du « wallpaper » **`WALL = 0x3bb97ffd7ffd6eec`** à l’index `4*attempt + d` (doit être 1).
3. Transformer `rax` : rotations + masque selon `d`  
   (`0→0xf0`, `1→0xfc`, `2→0x10`, `3→0x04`), avec `rcx = 4*attempt` au début du bloc.

Après 37 pas :  

```text
rax ^= 0x0123456789abcdef
rax ^= 0x1111111111111111
rax ^= 0xeeeeeeeeeeeeeeee
rax == 0  ?
```

`WALL` vu comme grille **16×4** (ligne = nibble nul courant, colonne = chiffre) — d’où « wallpaper ».

---

## 3. Résolution

Branche ≈ 2–3 choix / pas → trop large pour un DFS naïf.

**Meet-in-the-middle** : forward 18 pas + backward 19 depuis la cible (transforme inverse + vérif `find_rot`), intersection des états `rax`.

```bash
python3 tools/wallpaper-solve.py --solve   # quelques minutes
python3 tools/wallpaper-solve.py --check "$PW"
```

---

## Debug GDB (pas à pas)

ELF64 **statique / stripped**, 912 octets, pas de PIE. Entry `0x400078`. Tout le check tient dans `.text` — idéal pour stepper.

### 4.1 Entrée : prompt + charset

```bash
gdb -q ./original/wallpaper
(gdb) starti
(gdb) x/30i $rip
```

| Adresse | Rôle |
|---|---|
| `0x400095` | `write` `"enter password"` |
| `0x4000ac` | `read(0, buf@0x400297, 0x26)` |
| `0x4000c7` | `bt` charset `0xf000000000400` — seuls `0..3` |
| `0x4000dd` | seed `rax = 0xb6fd071e9c8a3425` |
| `0x4000f4` | boucle 37 pas (`bt rdi, 0x2000000000`) |
| `0x400137` | `WALL = 0x3bb97ffd7ffd6eec` + `bt` |
| `0x4001d9` | xors finaux + `test rax, rax` |
| `0x400205` / `0x400226` | succès / `"wrong password"` |

### 4.2 Valider le charset

```text
(gdb) break *0x4000d5
(gdb) run < <(printf '9\n')
# jae → wrong (bit test fail)
(gdb) run < <(printf '0\n')
# continue vers la boucle d’état (puis échoue sur longueur / WALL)
```

### 4.3 Observer un pas d’état

```text
(gdb) break *0x4000fe          # charge digit
(gdb) run < <(printf '1001223210123010301233322110103321001\n')
(gdb) print/x $rax             # état courant
(gdb) print/d $rdi             # index 0..36
(gdb) print/c $dl              # digit
(gdb) break *0x40014f          # après bt WALL
(gdb) continue
(gdb) # jae = mur (bit 0) → fail ; sinon transform selon d
```

Pour comprendre « wallpaper » : à chaque pas, GDB montre `rcx` (ligne = nibble nul) et `d` (colonne) avant le `bt` sur `WALL`.

### 4.4 Check final

```text
(gdb) break *0x400200
(gdb) continue
(gdb) print/x $rax             # 0 si password OK
(gdb) stepi
# ZF → good job / sinon wrong
```

Session complète hors step-by-step :

```bash
printf '1001223210123010301233322110103321001\n' | ./original/wallpaper
# good job, validate with CMO{your_input}
```

Le MITM du solveur évite de DFS sous GDB (branchement 2–3× / pas).

---

## 4. Vérification

```bash
printf '1001223210123010301233322110103321001\n' | ./original/wallpaper
```

Preuve : [`analysis/ok.txt`](analysis/ok.txt).

---

## Notes

- Plusieurs solutions ; le préfixe `1001223210123010301…` apparaît aussi en spoiler commentaire.
- Binaire pédagogique CTF : tout le check tient dans ~400 octets de `.text`.
