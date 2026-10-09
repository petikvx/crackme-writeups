# MAS's Type Punning

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/69926c19f752dd83da8782b0) · id `69926c19f752dd83da8782b0`

ELF64 **C++** PIE, GCC 13.3 (Ubuntu), non strippé. Diff. site **2.7** / qualité **2.7**.  
Auteur : [MAS](https://crackmes.one/user/MAS) · même famille de flags que [zW0rM](../6aa8483c48cda5a2aaa3ddc1/) (`Z+{…}` / `z+{…}`).

Dossier : `authors/mas/69926c19f752dd83da8782b0/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/challenge`](original/challenge) | encodeur (`flag.txt` → `encoded_flag.txt`) |
| [`original/encoded_flag.txt`](original/encoded_flag.txt) | blob 68 octets (17 dwords) livré avec le ZIP |
| [`original/type_punning.zip`](original/type_punning.zip) | archive imbriquée du site (`challenge` + le blob) |
| [`analysis/main.pseudoc`](analysis/main.pseudoc) | Hex-Rays de `main` (MCP `ida`) |
| [`tools/type-punning-solve.py`](tools/type-punning-solve.py) | décode / `--check` live |

## Réponse

| | |
|---|---|
| **Flag** | `z+{7yp3_Punn1n9}` |
| Fichier `flag.txt` | les 16 caractères + un `\n` final |
| Seed `srand` | `1771201800` = 2026-02-16 03:30:00 **Asia/Amman** (UTC+3) |
| OK encodeur | exit **0**, réécrit `encoded_flag.txt` |
| KO (fichiers manquants) | exit **1**, aucun message |

```bash
python3 tools/type-punning-solve.py -q
# z+{7yp3_Punn1n9}
python3 tools/type-punning-solve.py --check
```

Le binaire **n’affiche rien** : c’est un encodeur, pas un prompt name/serial. La preuve live rejoue `./challenge` avec `time()` figé (voir § Vérification).

---

## 1. Premier regard

ZIP site → `type_punning.zip` (password `crackmes.one`) → encore un ZIP :

```text
encoded_flag.txt   68 octets
challenge          ELF 64-bit LSB pie, x86-64, dynamically linked, not stripped
```

```text
challenge: ELF64 PIE, GCC 13.3.0, GLIBC 2.34 / libstdc++
sha256  7f032c0e65509d4307137b521b4a03094a80c8a37a4ceb1f0b79b145e0185d03
size    24408
main    VMA 0x24e9  (objdump, non rebasé)
```

```bash
file original/challenge
nm -C original/challenge | grep main
strings -n 6 original/challenge | grep -E 'flag|encoded'
xxd original/encoded_flag.txt
```

Strings utiles (fichier offset `0x3008`) :

```text
flag.txt
encoded_flag.txt
```

Pas de `Correct` / `Access granted` / `CMO{`. `challenge.cpp` est dans les notes de compilation. `main` appelle `time`, `srand`, `rand`, `ifstream` / `ofstream` / `istream::get` / `ostream::write`.

Le blob :

```text
00000000: 70 00 01 00  23 00 01 00  7c 00 01 00  3e 00 01 00
00000010: 71 00 01 00  77 00 01 00  3a 00 01 00  56 00 01 00
00000020: 51 00 01 00  72 00 01 00  6f 00 01 00  64 00 01 00
00000030: 36 00 01 00  6c 00 01 00  38 00 01 00  7e 00 01 00
00000040: 09 00 01 00
```

17 dwords little-endian, tous de la forme `0x000100XX` = `XX 00 01 00`. C’est déjà le titre : **type punning** d’un `int` `0x10000` dont on écrase l’octet de poids faible.

Description site : « Script Time :) ». Commentaire auteur : *Time 16/2/2026 3:30:0 Amman*.

---

## 2. Flow

1. `srand(time(NULL))`.
2. Ouvre `flag.txt` en lecture, `encoded_flag.txt` en écriture (binaire). Si l’un des deux échoue → `return 1`.
3. Alloue 4 octets. Pour **chaque** caractère lu par `istream::get` (y compris le `\n` final) :
   - `*(uint32_t *)buf = 0x10000;`
   - `buf[0] = c ^ (rand() % 10 + 1);`
   - `ostream::write(buf, 4);`
4. Ferme les flux, `return 0`.

Aucun checker, aucun prompt : l’auteur a lancé l’encodeur une fois (à 03:30 Amman) et a livré le blob.

---

## 3. Comment on trouve le flag

### 3.1 Ancrage

```bash
objdump -d -M intel --no-show-raw-insn original/challenge
# <main> à 0x24e9
```

Pseudo Hex-Rays (MCP `ida`, dump [`analysis/main.pseudoc`](analysis/main.pseudoc)) :

```c
v3 = time(NULL);
srand(v3);
// ifstream flag.txt  /  ofstream encoded_flag.txt
for (i = (char *)operator new(4); ; ostream::write(out, i, 4)) {
    if (!istream::get(in, &c))
        break;
    *(_DWORD *)i = 0x10000;
    *i = c ^ (rand() % 10 + 1);
}
```

Le `% 10` GCC n’apparaît pas comme `idiv` dans l’asm : c’est la multiplication magique signée `0x66666667` (division par 10) puis `+ 1`.

```asm
2635:  mov    DWORD PTR [rax], 0x10000   ; type pun : 00 00 01 00 LE
263b:  call   rand@plt
2645:  imul   rax, rax, 0x66666667       ; rand / 10 (signed)
...
266b:  add    eax, 0x1                   ; (rand % 10) + 1  ∈ [1, 10]
2677:  xor    edx, eax                   ; c ^ key
2680:  mov    BYTE PTR [rax], dl         ; écrase l’octet 0 du dword
2695:  mov    edx, 0x4
269b:  call   ostream::write             ; 4 octets
```

### 3.2 Type punning

`0x10000` little-endian = `00 00 01 00`. Écrire un octet à `buf[0]` ne touche **pas** les trois autres :

```text
avant  :  00 00 01 00     uint32 = 0x00010000
après  :  XX 00 01 00     uint32 = 0x00010000 | XX
```

D’où le motif du blob. Inversion d’un dword :

```python
key = rand() % 10 + 1          # 1..10
plain = (dword & 0xFF) ^ key
```

Sans la seed, 10 possibilités par octet (17 octets → 10¹⁷, trop pour un brute naïf). Le LCG glibc est déterministe une fois `srand` connu.

### 3.3 Seed = `time()` à Amman

`time(NULL)` = secondes Unix UTC. Le hint site donne l’horloge **locale** de l’auteur :

```text
2026-02-16 03:30:00  Asia/Amman
```

La Jordanie est en UTC+3 toute l’année (plus de DST depuis 2022) :

```text
03:30 Amman  =  00:30 UTC  =  unix 1771201800
```

Vérification Python :

```python
from datetime import datetime
from zoneinfo import ZoneInfo
int(datetime(2026, 2, 16, 3, 30, 0, tzinfo=ZoneInfo("Asia/Amman")).timestamp())
# 1771201800
```

`ctypes.CDLL("libc.so.6").srand` / `.rand` rejoue **le même** `rand()` que le binaire (glibc TYPE_3).

### 3.4 Décodage octet par octet (`petik` n’entre pas en jeu)

Pas de username : le flag est une constante. Table pour `seed = 1771201800` :

| i | dword LE | `enc` | `rand()%10+1` | XOR | char |
|---|---|---|---|---|---|
| 0 | `70 00 01 00` | `0x70` | 10 | `0x7a` | `z` |
| 1 | `23 00 01 00` | `0x23` | 8 | `0x2b` | `+` |
| 2 | `7c 00 01 00` | `0x7c` | 7 | `0x7b` | `{` |
| 3 | `3e 00 01 00` | `0x3e` | 9 | `0x37` | `7` |
| 4 | `71 00 01 00` | `0x71` | 8 | `0x79` | `y` |
| 5 | `77 00 01 00` | `0x77` | 7 | `0x70` | `p` |
| 6 | `3a 00 01 00` | `0x3a` | 9 | `0x33` | `3` |
| 7 | `56 00 01 00` | `0x56` | 9 | `0x5f` | `_` |
| 8 | `51 00 01 00` | `0x51` | 1 | `0x50` | `P` |
| 9 | `72 00 01 00` | `0x72` | 7 | `0x75` | `u` |
| 10 | `6f 00 01 00` | `0x6f` | 1 | `0x6e` | `n` |
| 11 | `64 00 01 00` | `0x64` | 10 | `0x6e` | `n` |
| 12 | `36 00 01 00` | `0x36` | 7 | `0x31` | `1` |
| 13 | `6c 00 01 00` | `0x6c` | 2 | `0x6e` | `n` |
| 14 | `38 00 01 00` | `0x38` | 1 | `0x39` | `9` |
| 15 | `7e 00 01 00` | `0x7e` | 3 | `0x7d` | `}` |
| 16 | `09 00 01 00` | `0x09` | 3 | `0x0a` | `\n` |

```text
z + { 7 y p 3 _ P u n n 1 n 9 } \n
```

Le `\n` est le `get()` de fin de ligne de `flag.txt` : le flag utile fait **16** octets.

### 3.5 Pseudo-code

```python
import ctypes
libc = ctypes.CDLL("libc.so.6")
SEED = 1771201800

def decode(blob: bytes) -> bytes:
    libc.srand(SEED)
    out = bytearray()
    for i in range(0, len(blob), 4):
        dword = int.from_bytes(blob[i:i+4], "little")
        assert dword & 0xFFFFFF00 == 0x10000
        key = libc.rand() % 10 + 1
        out.append((dword & 0xFF) ^ key)
    return bytes(out)
```

### 3.6 Pièges

- `strings` sur le blob donne `p#|>qw:VQrod6l8~` : ce sont les octets XOR-és, **pas** le flag.
- Premier caractère sans seed ∈ `q`…`z` seulement (`0x70 ^ {1..10}`) : un brute charset « FLAG{ » / `CMO{` échoue tout de suite.
- `rand() % 10` glibc **≠** LCG POSIX TYPE_0 (`next*1103515245+12345`). Il faut le `rand` de `libc.so.6`.
- Amman UTC+3 : prendre 03:30 **UTC** (unix `1771212600`) produit un autre flux, plaintext illisible.
- Hex-Rays inverse le `for` (le `write` est dans l’incrément) : le `get` est en tête de corps, le type pun ensuite. L’asm à `0x2635` est plus clair.
- Le binaire **écrase** `encoded_flag.txt` du cwd s’il trouve un `flag.txt`. Toujours le relancer dans un répertoire temporaire.

---

## 4. Prédicat consolidé

```text
srand(1771201800)
pour chaque octet c de flag.txt (16 chars + \n) :
    write_le32( 0x10000 | (c ^ (rand()%10+1)) )
```

`flag.txt` = `z+{7yp3_Punn1n9}\n`.

---

## 5. Vérification

Round-trip Python (même `rand` que glibc) + binaire live avec `time()` interposé :

```bash
python3 tools/type-punning-solve.py --check
# z+{7yp3_Punn1n9}
# OK
```

`--check` :

1. décode `original/encoded_flag.txt` → `z+{7yp3_Punn1n9}\n` ;
2. ré-encode avec la seed, compare au blob ;
3. `gcc -shared` un stub `time() = 1771201800`, copie `challenge` + `flag.txt` dans un tmp, `LD_PRELOAD`, `exit 0`, `encoded_flag.txt` identique à l’original.

KO utiles (hors solveur) :

| Cas | Effet |
|---|---|
| pas de `flag.txt` dans le cwd | exit 1, pas de sortie |
| seed UTC 03:30 (`1771212600`) | plaintext ≠ flag (le `\n` final n’apparaît même pas forcément) |
| 16 octets sans `\n` | blob de 64 octets, pas 68 |

---

## 6. Notes

- Même préfixe `z+{` / `Z+{` que [zW0rM](../6aa8483c48cda5a2aaa3ddc1/).
- Pas d’anti-debug, pas de PIE à rebaser pour lire `main` (objdump suffit ; IDA pour le pseudo).
- Pas de session GDB : reverse 100 % statique + `ctypes` / `LD_PRELOAD` pour la preuve.
- Site auto-val : le flag à coller est `z+{7yp3_Punn1n9}` (format auteur, pas un wrapper `CMO{…}`).
