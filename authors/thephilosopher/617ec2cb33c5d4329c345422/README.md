# ThePhilosopher — The Matrix

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/617ec2cb33c5d4329c345422) · id `617ec2cb33c5d4329c345422`

ELF64 statique, non strippé : **multi-étages** (credentials → 2 clés → racines d’un cubique).  
Auteur : [ThePhilosopher](https://crackmes.one/user/ThePhilosopher).

Dossier : `authors/thephilosopher/617ec2cb33c5d4329c345422/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`thematrix`](original/thematrix) | binaire (~10 Ko) |
| [`the-matrix-solve.py`](tools/the-matrix-solve.py) | réponses + `--check` live |

## Réponse

| Étape | Entrée |
|---|---|
| Username | **`admin`** |
| Password | **`password`** |
| Opening key | **`}}}}}}}iQH`** |
| Middlegame key | **`EEEEEEcgox`** |
| Endgame | **`2022`** puis **`2021`** puis **`2020`** |

```bash
python3 tools/the-matrix-solve.py -q
python3 tools/the-matrix-solve.py --check
# … Congradulations, you managed to beat the Matrix!
```

---

## 1. Premier regard

```text
ELF 64-bit LSB executable, x86-64, statically linked, not stripped
sha256: da1608766ea0cf6fec508ade0dd85f72f18bee506695659cf9d8bde52f84ed9f
bannières ASCII + stages The Enterance / Opening / Middlegame / Endgame
```

---

## 2. Flow

```text
The Enterance  → username + password (strcmp-like → score 2+2)
The Opening    → key1, sum(first 10 chars) == 0x46d
The Middlegame → key2 with key1:
                   Σ( ((k1[i]+k2[i]) >> 3) * 4 ) == 0x3d8
The Endgame    → 3 entiers racines de
                   x³ - 6063 x² + 12253322 x - 8254653240 = 0
                 → 2022, 2021, 2020
```

(Typos d’origine : « Enterance », « Congradulations ».)

---

## 3. Prédicats

**Credentials** — chaînes en clair dans le binaire : `admin` / `password`.

**Opening** — `sum(ord(c) for c in key1[:10]) == 0x46d` (1133).  
Exemple : six `}` (0x7d) + `iQH` → `}}}}}}}iQH`.

**Middlegame** — pour chaque couple de bytes :

```text
a = (key1[i] + key2[i]) >> 3
sum += a * 4
# cible 0x3d8 (984)
```

Une solution : `EEEEEEcgox` avec le key1 ci-dessus.

**Endgame** — parsing décimal maison ; les trois racines du cubique (années autour de 2021) dans l’ordre demandé.

---

## Debug GDB (pas à pas)

ELF64 **statique**, **non-PIE**, symbole `_start` @ `0x40118a` (pas de `main`). I/O = syscalls (`read` @ `0x4010a4`, `write` @ `0x401000` / `0x4010b7`). Comparaison credentials maison @ `0x401021` (score `2` par chaîne OK → total `4`).

```bash
gdb -q ./original/thematrix
(gdb) set debuginfod enabled off
(gdb) info file          # Entry point: 0x40118a
(gdb) disassemble _start
(gdb) x/s 0x4022df       # "admin"
(gdb) x/s 0x4022e5       # "password"
```

| VA | Rôle |
|---|---|
| `0x401249` | `cmp rax, 4` — score credentials (user+pass) |
| `0x4012e7` | `cmp rbx, 0x46d` — somme Opening (buf `@0x402bd4`) |
| `0x4013c1` | `cmp r13, 0x3d8` — somme Middlegame (key2 `@0x402c38`) |
| `0x401472` | `cmp r15, 3` — 3 racines Endgame OK |

**Piège stdin** : un `run < answers.txt` d’un bloc échoue souvent (score `rax=2`). Espacer les lignes (FIFO / solveur `--check`) :

```bash
FIFO=$(mktemp -u); mkfifo "$FIFO"
( sleep 0.2; printf 'admin\n'; sleep 0.15; printf 'password\n'
  sleep 0.15; printf '}}}}}}}iQH\n'; sleep 0.15; printf 'EEEEEEcgox\n'
  sleep 0.15; printf '2022\n'; sleep 0.15; printf '2021\n'
  sleep 0.15; printf '2020\n' ) > "$FIFO" &
gdb -q ./original/thematrix
(gdb) break *0x401249
(gdb) break *0x4012e7
(gdb) break *0x4013c1
(gdb) break *0x401472
(gdb) run < $FIFO
# 0x401249 → rax=4  ; 0x4012e7 → rbx=0x46d ; 0x4013c1 → r13=0x3d8
# 0x401472 → r15=3  → "Congradulations, you managed to beat the Matrix!"
```

Hors GDB : `python3 tools/the-matrix-solve.py --check`.

---

## 4. Vérification

Comme pour le keygen dev0 : **ne pas** tout pousser d’un coup dans le pipe — chaque `read` attend sa ligne. Le solveur espace les écritures.

```bash
python3 tools/the-matrix-solve.py --check
# Correct credentials → Correct key → Correct key → Congradulations…
```

Sans les trois entiers de fin : segfault après le bandeau Endgame.

---

## 5. Notes

- La longue string base64-like de l’Opening est du **leurre** (décor) ; le check est la somme 0x46d.
- Famille ThePhilosopher : après [Bruteverse](../634bdec633c5d4425e2cd8ee/) (XOR `.data`).
