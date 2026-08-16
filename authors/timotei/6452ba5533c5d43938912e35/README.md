# timotei-crackme-06

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6452ba5533c5d43938912e35) · id `6452ba5533c5d43938912e35`


Crackme **PE32 console**, MASM32, keyfile. Cousin du #05 (même IAT, même UI), autre prédicat.
Auteur : timotei (crackmes.one). Analyse statique sous Linux ; exec = Wine ou VirtualBox.

Dossier : `authors/timotei/6452ba5533c5d43938912e35/` — [série](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`timotei-crackme-06.exe`](original/timotei-crackme-06.exe) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`timotei-crackme-06-solve.py`](tools/timotei-crackme-06-solve.py) | keyfile + Wine (section 6) |
| [`timotei-crackme-06-idapro.asm`](analysis/timotei-crackme-06-idapro.asm) | listing IDA (section 8) |
| [`timotei-crackme-06-idapro.c`](analysis/timotei-crackme-06-idapro.c) | Hex-Rays 9.4 (section 8) |
| [`timotei-crackme-06.c`](tools/timotei-crackme-06.c) | prédicat C (section 8) |
| [`timotei-crackme-06-fasm.asm`](tools/timotei-crackme-06-fasm.asm) | reconstruction FASM PE (section 9) |

Réponse acceptée (famille) :

| Input | Valeur | Rôle |
|---|---|---|
| fichier `timotei.crackme#6.enjoy!` | **13 octets** (`0x0D`) | keyfile, chemin relatif |
| contrainte | `A - B + C >= 12345678` (signé), `(A-B+C) & 0xFF == buf[12]`, `buf[10] == '6'` | 3 dwords LE + 1 octet |
| exemple ASCII | `0000000000600` | 13 caractères, tout printable |

---

## 1. Premier regard

```
file timotei-crackme-06.exe
# PE32 executable (console) Intel 80386, 3 sections

diec → Microsoft Linker 5.12, MASM 6.14, masm32
```

Même gabarit que le #05 (2,5 Ko, `.text` / `.rdata` / `.data`, `kernel32` + `msvcrt`). Seul le check change.

| VA | Texte |
|---|---|
| `0x403000` | `timotei.crackme#6.enjoy!` |
| `0x403071` | `.:keyfile:.accepted:.` |
| `0x40308C` | `Press any key to continue ...` |

Hashes : MD5 `2581df5b9022722ed494be8637d656aa`, SHA256 `7e6da2c5799c001e41087ca7a3e109dd530e486617de6c66e9f23dcc1fa41453`.

---

## 2. Flow global

Identique au #05 jusqu’au `ReadFile(buffer, 0x50)` : `CreateFileA` `GENERIC_READ` / `OPEN_EXISTING`, fail → `ExitProcess(0)`.

```
nread_byte -= 0x0D
si != 0 : exit                         ; exactement 13 octets

edx = 0
edx += dword[buf+0]                    ; A
edx -= dword[buf+4]                    ; B
edx += dword[buf+8]                    ; C
si edx <  0x00BC614E : exit            ; jl signé, 12345678
si dl  != buf[12]      : exit
si buf[10] != 0x36     : exit          ; '6'

print accepted + « Press any key »
```

`0x00BC614E` = **12 345 678**.

---

## 3. Le check, octet par octet

```
401048  sub  BYTE PTR [nread], 0Dh
40104f  jne  fail
401051  mov  eax, buffer
401056  add  edx, [eax]
401058  sub  edx, [eax+4]
40105b  add  edx, [eax+8]
40105e  cmp  edx, 0BC614Eh
401064  jl   fail
401066  cmp  dl, [eax+0Ch]
401069  jne  fail
40106b  cmp  byte [eax+0Ah], 36h
40106f  jne  fail
```

Les 13 octets :

```
 0  1  2  3   4  5  6  7   8  9 10 11  12
|-- dword A --|-- dword B --|-- dword C --| X
                              ^
                              doit être '6'
```

`A`, `B`, `C` sont little-endian. `edx` est 32 bits (wrap). `jl` est **signé** : il faut `edx` dans `[12345678 , 0x7FFFFFFF]`. Un wrap négatif (`edx >= 0x80000000`) échoue.

`buf[10]` est le 3ᵉ octet de `C` (bits 16–23).

`puts` / waitkey : comme le #05 (`strlen` `0x01010101`, `_kbhit` / `_getch`). Pas dans le prédicat.

---

## 4. Deux keyfiles valides

### ASCII : `0000000000600`

```
00000000 00000000 0060 0
A = B = 0x30303030
C = 0x30363030          ; octets 30 30 36 30 → index 10 = '6'
A-B+C = 0x30363030 = 808857648  >= 12345678
dl = 0x30 = buf[12] = '0'
```

### Numérique : A = 12345678, B = 0, C = `00 00 36 00`

```
4e 61 bc 00  00 00 00 00  00 00 36 00  4e
edx = 0x00F2614E
dl = 0x4E = dernier octet
```

Le solveur écrit le premier.

---

## 5. Vérification (Wine)

```bash
cd authors/timotei/6452ba5533c5d43938912e35
python3 timotei-crackme-06-solve.py
wine timotei-crackme-06.exe
```

```
.:keyfile:.accepted:.
Press any key to continue ...
```

Sans fichier / 12 octets / `buf[10] != '6'` : silence. Même règle de cwd que le #05 (chemin relatif). VirtualBox : copier `.exe` + keyfile dans le même dossier de la VM. Détail Wine/VBox : [§10 du #05](../timotei-crackme-05/timotei-crackme-05.md#10-lancer-le-exe-depuis-linux).

---

## 6. Solveur Python

[`timotei-crackme-06-solve.py`](tools/timotei-crackme-06-solve.py) — reconstitue `A-B+C`, écrit le keyfile, lance Wine si présent.

```bash
python3 timotei-crackme-06-solve.py
```

| Fonction | Rôle |
|---|---|
| `dwords` / `edx_of` | `A`, `B`, `C` LE puis `A-B+C` 32 bits |
| `key_ok` | taille + `jl` signé + `dl` + `buf[10]=='6'` |
| `make_numeric` | variante 12345678 |
| `write_keyfile` | `timotei.crackme#6.enjoy!` |
| `run_wine` | exec dans ce cwd |

---

## 7. Récap des adresses

| VA | Quoi |
|---|---|
| `0x401000` | `start` — CreateFileA |
| `0x401048` | `sub byte [nread], 0Dh` |
| `0x401056` | `add/sub/add` des 3 dwords |
| `0x40105E` | `cmp edx, 0BC614Eh` / `jl` |
| `0x401066` | `cmp dl, [eax+0Ch]` |
| `0x40106B` | `cmp [eax+0Ah], 36h` |
| `0x401071` | prints succès |
| `0x40109E` | fail / exit |
| `0x403000` | nom du keyfile |
| `0x403019` | buffer |

---

## 8. Dumps IDA Pro (asm + Hex-Rays)

| Fichier | Origine |
|---|---|
| [`timotei-crackme-06-idapro.asm`](analysis/timotei-crackme-06-idapro.asm) | listing IDA |
| [`timotei-crackme-06-idapro.c`](analysis/timotei-crackme-06-idapro.c) | Hex-Rays 9.4 |
| [`timotei-crackme-06.c`](tools/timotei-crackme-06.c) | C à la main, juste le prédicat |

Hashes IDA = `diec` : MD5 `2581DF5B9022722ED494BE8637D656AA`, SHA256 `7E6DA2C5…1453`.

### Ça correspond

Le listing a le même graphe qu’`objdump` : `sub …, 0Dh`, `add/sub/add` des 3 dwords, `cmp edx, 0BC614Eh` / `jl`, `cmp dl, [eax+0Ch]`, `cmp [eax+0Ah], 36h`.

Hex-Rays écrit le prédicat d’un coup, et convertit les constantes :

```c
v1 = dword_403019[2] + dword_403019[0] - dword_403019[1];
if ( v1 >= 12345678
  && (_BYTE)v1 == LOBYTE(dword_403019[3])
  && BYTE2(dword_403019[2]) == 54 )
```

| Hex-Rays | Listing |
|---|---|
| `dword[0] - dword[1] + dword[2]` (ordre réécrit `C+A-B`) | `A - B + C` |
| `12345678` | `0BC614Eh` |
| `LOBYTE(dword[3])` | `buf[12]` (seul octet valide de ce « dword ») |
| `BYTE2(dword[2]) == 54` | `buf[10] == '6'` |
| `LOBYTE(nread) - 13` | `sub byte [nread], 0Dh` |

### Pièges

1. **« Compiler : Visual C++ »** — faux. DIE : MASM32 6.14. Même artefact qu’au #05.

2. **`sub NumberOfBytesRead, 0Dh`** dans le `.asm` sans taille. Encodage réel : `sub byte` (`80 2D`). Hex-Rays `LOBYTE` est juste.

3. **`dword_403019[20]`**. Le buffer 80 octets est vu comme 20 dwords. `dword[3]` commence à `buf+12` : dans un keyfile de 13 octets il n’y a qu’**un** octet là (puis des zéros du `.data`). `LOBYTE` sauve le coup.

4. **`BYTE2(x)`** = bits 16–23 = 3ᵉ octet LE = `buf[10]`. `54` = `0x36` = `'6'`.

5. **`v1 >= 12345678`**. Hex-Rays a promu le `jl` en comparaison signée `int` : correct.

### C à la main

```c
edx = A - B + C;                 /* wrap 32 bits */
if ((int32_t)edx < 12345678) fail;
if ((uint8_t)edx != buf[12]) fail;
if (buf[10] != '6') fail;
```

---

## 9. Reconstruction FASM

Original = MASM32. Fichier : [`timotei-crackme-06-fasm.asm`](tools/timotei-crackme-06-fasm.asm) → `timotei-crackme-06-fasm.bin` (PE console).

```bash
fasm.x64 timotei-crackme-06-fasm.asm timotei-crackme-06-fasm.bin
wine timotei-crackme-06-fasm.bin
```
