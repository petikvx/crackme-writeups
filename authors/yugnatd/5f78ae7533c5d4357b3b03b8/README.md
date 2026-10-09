# YugnatD's WarGames

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5f78ae7533c5d4357b3b03b8) · id `5f78ae7533c5d4357b3b03b8`

ELF64 console **statique**, C, GCC 9.3 (Ubuntu). Diff. site **2.8**, qualité **4.4**.  
Usage annoncé : `./WarGames pass`.

| Fichier | Rôle |
|---|---|
| [`original/WarGames`](original/WarGames) | binaire (non strippé, `main` @ `0x401d35`) |
| [`tools/wargames-solve.py`](tools/wargames-solve.py) | password / `--check` / `--table` |

## Réponse

| | |
|---|---|
| **Password** | `dont play` (9 octets, **espace** au milieu) |
| Flag site | `CMO{dont play}` |
| OK | `Congratulation !!!` |
| KO | `Wrong Password !!!` |
| Usage | `Use ./WarGames pass` |

```bash
python3 tools/wargames-solve.py -q
# dont play
./original/WarGames 'dont play'
# Congratulation !!!
python3 tools/wargames-solve.py --check
```

Référence film : *WarGames* (1983) — « Shall we play a game ? » → **don’t play**. Le seed `1983` est l’année du film.

---

## 1. Premier regard

```text
WarGames: ELF 64-bit LSB executable, x86-64, statically linked, not stripped
BuildID  9a0e6dfa0e34cb42a1d5524f94d26424fff8625e
GCC      (Ubuntu 9.3.0-10ubuntu2) 9.3.0
sha256   e5260ec02b1da62ce9efb017937536356d42e22a91d3cb2b0fa9a941d459f889
size     872624  (~852 KiB : libc statique, pas de crypto lourde)
```

```bash
file original/WarGames
nm original/WarGames | grep ' T main'
strings -n 4 original/WarGames | grep -iE 'pass|wrong|congrat|use '
```

Messages visibles tout de suite :

```text
Use ./WarGames pass
Wrong Password !!!
Congratulation !!!
```

`strings` remonte aussi le fragment **`gssw#tpcH`**. Ce n’est **pas** le password : c’est l’immediate little-endian `0x6370742377737367` (`gssw#tpc`) collé à l’opcode suivant `48 89 45 ef` (`mov [rbp-0x11], rax` commence par `0x48` = `'H'`). Le 9ᵉ octet du blob est ailleurs (`mov byte [rbp-0x9], 0x7a` → `'z'`).

`main` @ `0x401d35`. Pas d’anti-debug. Le volume du fichier vient de `--static`, pas d’une VM.

---

## 2. Flow

1. `argc != 2` → `Use ./WarGames pass`, exit 0.
2. `strlen(argv[1]) != 9` → `Wrong Password !!!`, exit 0.
3. Copie du blob 9 octets `gssw#tpcz` sur la pile.
4. `srandom(1983)` puis boucle `i = 0..8` :
   - `blob[i] -= (rand() % 5) + 1`
   - si `blob[i] != argv[1][i]` → flag d’échec, **break** (les lettres suivantes ne sont plus décodées).
5. Flag ≠ 0 → `Wrong Password !!!` ; sinon → `Congratulation !!!`.
6. Toujours `return 0` (le verdict est le texte, pas le code de sortie).

---

## 3. Comment on trouve le password

### 3.1 Ancrage

```bash
objdump -d -M intel --start-address=0x401d35 --stop-address=0x401eab original/WarGames
```

Hex-Rays (`main`) dit la même chose : longueur 9, `qmemcpy(…, "gssw#tpcz", 9)`, `_srandom(1983)`, boucle `v7[i] -= (int)rand() % 5 + 1`.

### 3.2 Immediate + 9ᵉ octet

```asm
401d86:  cmp    rax, 0x9                 ; strlen == 9
401da2:  movabs rax, 0x6370742377737367  ; "gssw#tpc" LE
401dac:  mov    QWORD PTR [rbp-0x11], rax
401db0:  mov    BYTE PTR [rbp-0x9], 0x7a ; 'z'  → blob = "gssw#tpcz"
401dc2:  mov    edi, 0x7bf               ; 1983
401dc7:  call   410630 <__srandom>
```

Décodage LE du `movabs` :

```text
67 73 73 77 23 74 70 63  =  g s s w # t p c
                      + 7a = z
```

Offset fichier du `movabs` : VMA `0x401da2` − base `0x400000` = `0x1da2`.  
Le `'z'` est à `0x1db0` (`c6 45 f7 7a`).

### 3.3 `rand() % 5` en force reduction GCC

Pas d’`idiv` : magic `0x66666667` (division signée par 5), puis `+ 1` :

```asm
401dd9:  call   410d80 <rand>
401de3:  imul   rax, rax, 0x66666667
401dea:  shr    rax, 0x20
401df0:  sar    edx, 1            ; q = rand / 5
401dfb:  shl    eax, 0x2
401dfe:  add    eax, edx          ; q * 5
401e00:  sub    ecx, eax          ; rand % 5
401e04:  lea    eax, [rdx+0x1]    ; (rand % 5) + 1   ← delta ∈ {1,2,3,4,5}
401e1d:  sub    edx, eax          ; blob[i] -= delta
401e53:  cmp    dl, al            ; vs argv[1][i]
```

Le binaire **décode** le blob en place puis compare : le password est `enc[i] - ((rand() % 5) + 1)`.

`rand` = générateur **TYPE_3** glibc (`DEG=31`, `SEP=3`), seed 1983, 10×31 pas de warm-up. Même séquence que `ctypes` `libc.so.6` sur cette machine, et que le libc **statique** du crackme.

### 3.4 Table pour `dont play`

| i | `enc[i]` | `rand()` | `(r%5)+1` | `pw[i]` |
|---|---|---|---|---|
| 0 | `g` (103) | 322084512 | 3 | `d` |
| 1 | `s` (115) | 1307613328 | 4 | `o` |
| 2 | `s` (115) | 1354801484 | 5 | `n` |
| 3 | `w` (119) | 546092182 | 3 | `t` |
| 4 | `#` (35) | 333117377 | 3 | ` ` (espace) |
| 5 | `t` (116) | 797283643 | 4 | `p` |
| 6 | `p` (112) | 1890877338 | 4 | `l` |
| 7 | `c` (99) | 1084207026 | 2 | `a` |
| 8 | `z` (122) | 1654229205 | 1 | `y` |

```python
# glibc TYPE_3, seed 1983 — équivalent du solveur
enc = b"gssw#tpcz"
# après srandom(1983), 9 appels à rand() :
pw = bytes(enc[i] - ((r[i] % 5) + 1) for i in range(9))
# b'dont play'
```

### 3.5 Pièges

- `strings` → `gssw#tpcH` : 8 lettres du blob + opcode `0x48`. Le 9ᵉ caractère utile est `'z'` (`0x7a`), pas `'H'`.
- Le 5ᵉ caractère du password est un **espace** (`'#' - 3 = 32`). `dontplay` / `dont_play` / `Dont play` échouent (casse + charset).
- Le binaire est statique : `nm` est noyé sous glibc (`check_match`, `key` BSS, …). Le prédicat est uniquement dans `main`.
- Exit code toujours 0 : le `--check` matche le texte.

---

## 4. Prédicat consolidé

```
argc == 2
strlen(argv[1]) == 9
srandom(1983)
blob = "gssw#tpcz"
pour i = 0 .. 8 :
    blob[i] -= (rand() % 5) + 1
    si blob[i] != argv[1][i] → fail (break)
fail → "Wrong Password !!!"
ok   → "Congratulation !!!"
```

---

## 5. Debug GDB (pas à pas)

ELF64 **non-PIE** (`EXEC`, base `0x400000`) : les VMA `objdump` sont les adresses live.

```bash
export DEBUGINFOD_URLS=
gdb -nx -q ./original/WarGames
(gdb) set pagination off
(gdb) set debuginfod enabled off
(gdb) break *0x401dc7          ; call __srandom, edi = seed
(gdb) break *0x401dde          ; juste après call rand
(gdb) break *0x401e70          ; après la boucle, [rbp-0x28] = failflag
(gdb) run dont\ play
```

Observations :

```text
0x401dc7  edi = 1983 = 0x7bf
1er rand  eax = 322084512    (eax % 5) + 1 = 3     → 'g' - 3 = 'd'
2e  rand  eax = 1307613328                         → 's' - 4 = 'o'
…
0x401e70  *(int*)(rbp-0x28) = 0   ; i = 9
          x/9cb $rbp-0x11  →  'd' 'o' 'n' 't' ' ' 'p' 'l' 'a' 'y'
```

Sans l’espace (`run dontplay`) : `strlen != 9` → jump `0x401d8c` (`Wrong Password !!!`) avant `srandom`.

---

## 6. Vérification

```bash
./original/WarGames 'dont play'
# Congratulation !!!

./original/WarGames 'dont pla'     # 8 octets
# Wrong Password !!!

./original/WarGames 'Dont play'    # casse
# Wrong Password !!!

./original/WarGames 'dont playX'   # 10 octets
# Wrong Password !!!

./original/WarGames
# Use ./WarGames pass

python3 tools/wargames-solve.py --check
# Congratulation !!!
# OK
```

---

## 7. Notes

- Gros fichier ≠ obfuscation : glibc 2.31 statique (Ubuntu 20.04 / GCC 9.3).
- Le libc **hôte** `srandom`/`rand` TYPE_3 donne la même suite que le libc lié dans le crackme (vérifié GDB + `ctypes`).
- Solveur : réimplémentation Python du TYPE_3 (`tools/wargames-solve.py`), pas d’appel libc — reproductible hors Linux.
- x64dbg / x32dbg : inutiles (ELF Linux).
- Pas de patch : le password en argv suffit.
