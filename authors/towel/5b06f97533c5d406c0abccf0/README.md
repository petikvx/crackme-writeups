# Towel's Mars Analytica

> [crackmes.one](https://crackmes.one/crackme/5b06f97533c5d406c0abccf0) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | Towel (0xTowel), NorthSec 2018 |
| **Plateforme** | Linux ELF64, C, packé UPX 3.94 |
| **Statut** | **solved** |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/MarsAnalytica` | binaire packé (preuve live) |
| `analysis/MarsAnalytica.unpacked` | `./tools/upx-3.96 -d` |
| `tools/mars-analytica-solve.py` | résout le prédicat des 19 octets |

## Réponse

Citizen Access ID, 19 caractères (`XXXX-XXXX-XXXX-XXXX`) :

**`q4Eo-eyMq-1dd0-leKx`**

```text
[+] ACCESS GRANTED!

**  FLAG-l0rdoFb1Nq4EoeyMq1dd0leKx  **
```

Le flag est `FLAG-l0rdoFb1N` collé à l'ID sans les tirets.

```bash
python3 tools/mars-analytica-solve.py
python3 tools/mars-analytica-solve.py -q
python3 tools/mars-analytica-solve.py --check
printf 'q4Eo-eyMq-1dd0-leKx\n' | ./original/MarsAnalytica
```

## Premier regard

```text
original/MarsAnalytica : ELF64, statique en apparence, pas de section headers
DIE                    : UPX 3.94 (NRV)
```

Unpack avec l'UPX du dépôt (ne pas écraser `original/`) :

```bash
./tools/upx-3.96 -d -o analysis/MarsAnalytica.unpacked original/MarsAnalytica
# 4.1 Mo → 10.8 Mo, ELF64 dynamique, interprète /lib64/ld-linux-x86-64.so.2
# toujours sans section headers. Entrée 0x400900, main 0x400da9.
```

`strings` ne sort presque rien : le bandeau n'est pas une C-string. Les seuls imports libc sont `putchar`, `puts`, `getchar`, `memcpy`, `malloc`, `free`, `fflush`, `exit`, `time`, `srand`, `__stack_chk_fail`. Pas de `strcmp`, pas de `rand`.

Lancé tel quel, le programme affiche l'ASCII art « Mars Analytica / NSEC 2018 », demande `Citizen Access ID:`, et répond :

```text
[!] ACCESS DENIED - Invalid Citizen ID
[-] Session Terminated
```

`main` commence par `time(0)` puis `srand`. `rand` n'est pas importé : la graine ne participe pas au test.

## Flow

`__libc_start_main` reçoit `main` en `0x400da9` (immédiat à `0x40091d`). La fonction réserve `0xba4a8` octets de pile, copie cinq tables depuis la zone `0xe4dc00`, puis ne fait plus que des sauts calculés.

Les tables, copiées par `memcpy` (`0x4008b0`) :

| Destination (rbp) | Source | Taille | Rôle |
|---|---|---|---|
| `-0x2d080` | `0xe4dc00` | `0x253c` (2383 × u32) | permutation A |
| `-0x2ab40` | `0xe50140` | `0x253c` | permutation B |
| `-0x28600` | `0xe52680` | `0x2b5c` (2775 × u32) | permutation C |
| `-0x25aa0` | `0xe551e0` | `0x2b5c` | permutation D |
| `-0x22f40` | `0xe57d40` | `0x56b8` (2775 × u64) | pointeurs de blocs |

Chaque pas du dispatcher :

1. compteur dans `[rbp-0x65f40]`
2. index modulo `0x94f` (2383), via le magic `0x3700c083` et les multiplicateurs `0x7aa` / `0x5a5`
3. second index modulo `0xad7` (2775), magic `0x2f3bafed`, multiplicateurs `0x259` / `0x1d5`
4. `pointeur + déplacement`, puis transfert

Le transfert est obfusqué. À `0x401145` c'est `push rax` / `jmp` sur un `ret` (le `jmp` court saute le `c3` pour y retomber). Plus loin, le même schéma se termine par `jmp 0x401500`. Le bloc d'arrivée ne revient pas au dispatcher par un `call` normal : le dispatcher est le seul fil, et chaque « instruction » de la VM est un petit bloc x86.

Les chaînes du bandeau sont donc émises `putchar` par `putchar`. La saisie aussi est un `getchar` par octet.

## Comment on trouve l'ID

### Ancrage

Le premier `getchar` utile est le PLT `0x4008a0` (slot `0x105e040`). Sous GDB, l'adresse de retour est `0x4030a9`, juste après :

```asm
0040309f  jmp      0x401500
004030a4  call     0x4008a0     ; getchar
004030a9  mov      esi, eax      ; l'octet lu part dans la VM
```

Le `jmp 0x401500` est le dispatcher qui atterrit au milieu du bloc, sur le `call`. La VM enchaîne 19 lectures (l'ID fait 19 octets, tirets compris) puis une série de tests arithmétiques. Il n'y a qu'un chemin qui mène à `ACCESS GRANTED` : chaque test est un `cmp` / saut dont le drapeau doit valoir « égal ».

### Prédicat

Sur les 19 octets `s[0]..s[18]`, tous dans `0x21..0x7e` (`'!'` à `'~'`), le chemin gagnant impose :

```text
(s[13] + s[5]) * s[16]                         == 15049
s[15]*s[3] + s[11]*s[2]                        == 18888
s[18]*s[4] + s[15] - s[12]                     == 5408
s[11]*s[6] + s[3]*s[1]                         == 17872
(s[14] xor s[7]) * s[17]                       == 7200
s[0] + s[2] - s[5] + s[16]                     == 182
s[10]*s[8] + s[9] + s[13]                      == 5630
s[5] - s[3] - s[12]                            == -110
s[7] - s[13]*s[14]                             == -2083
s[16]*s[2] + (s[17] xor s[0])*s[1]             == 9985
((s[10] xor s[9]) - (s[11] + s[18])) xor s[6]  == -199
s[8] - s[4] + s[15]                            == 176
(s[2] + s[4]) xor s[8]                         == 3
s[11] - s[3]                                   == -11
(s[16] - s[17]) * ((s[9] + s[5]) xor s[0])     == 5902
(s[15] - s[7]) xor (s[18] xor s[1])            == 83
(s[14]*s[6]) * ((s[12] - s[10]) xor s[13])     == 16335
```

Le `xor` de la 11e ligne est celui d'un `i32` après la soustraction (pas un xor byte à byte du résultat déjà signé).

`15049 = 101 × 149`. `149` ne tient pas dans un octet du jeu, donc `s[16] = 101` (`e`) et `s[13] + s[5] = 149`. Le reste se propage : plusieurs variables sont fixées dès qu'une voisine l'est (`s[11] = s[3] - 11`, `s[12]` déduit de `s[5]` et `s[3]`, etc.). Le solveur parcourt ce qui reste et ne trouve qu'une solution :

```text
q4Eo-eyMq-1dd0-leKx
```

Les tirets ne sont pas imposés à part : ils sortent des équations, aux indices 4, 9 et 14.

## Debug GDB (pas à pas)

L'ELF unpacké n'a pas de section headers. `gdb` dit `Cannot find section for the entry point` et refuse `run`. On ajoute trois sections (le fichier du dépôt n'est pas modifié) :

```bash
python3 - << 'PY'
import struct
src = "analysis/MarsAnalytica.unpacked"
data = bytearray(open(src, "rb").read())
names = b"\x00.text\x00.data\x00.shstrtab\x00"
shstr = len(data)
data += names
while len(data) % 8:
    data.append(0)
shoff = len(data)

def shdr(name, typ, flags, addr, off, size, align):
    return struct.pack("<IIQQQQIIQQ", name, typ, flags, addr, off, size, 0, 0, align, 0)

data += b"".join([
    shdr(0, 0, 0, 0, 0, 0, 0),
    shdr(1, 1, 6, 0x400000, 0, 0xA5D6E8, 0x1000),       # .text AX
    shdr(7, 1, 3, 0x105DE10, 0xA5DE10, 0x270, 8),       # .data WA
    shdr(13, 3, 0, 0, shstr, len(names), 1),            # .shstrtab
])
struct.pack_into("<Q", data, 40, shoff)          # e_shoff
struct.pack_into("<H", data, 58, 64)             # e_shentsize
struct.pack_into("<H", data, 60, 4)              # e_shnum
struct.pack_into("<H", data, 62, 3)              # e_shstrndx
open("/tmp/MarsAnalytica.elf", "wb").write(data)
PY
chmod +x /tmp/MarsAnalytica.elf
printf 'AB\n' > /tmp/id.txt
```

Puis :

```text
gdb -q -nx /tmp/MarsAnalytica.elf
set pagination off
set debuginfod enabled off
break *0x4008a0
run < /tmp/id.txt
```

`/tmp/id.txt` contient une ligne, par exemple `AB`. Le breakpoint tombe au premier `getchar` :

```text
Breakpoint 1, 0x4008a0
caller = *(long*)$rsp = 0x4030a9
```

`0x4030a4` est `call 0x4008a0`, et `0x40309f` est le `jmp 0x401500` du dispatcher. C'est le seul endroit où l'ID entre dans la VM. Le binaire n'est pas PIE : ces adresses sont stables.

Piège : sans les section headers, `starti` démarre via ld mais un `run` suivant répond `No executable file specified`. Le bandeau, lui, passe par `putchar` (`0x400860`), pas par des chaînes lisibles dans le fichier.

## Vérification

Solveur, une solution, puis le binaire packé :

```bash
python3 tools/mars-analytica-solve.py --check
# ok
printf 'q4Eo-eyMq-1dd0-leKx\n' | ./original/MarsAnalytica
```

```text
[+] ACCESS GRANTED!

**  FLAG-l0rdoFb1Nq4EoeyMq1dd0leKx  **
```

Mauvais ID (`petik`) :

```text
[!] ACCESS DENIED - Invalid Citizen ID
[-] Session Terminated
```

Le programme ne distingue pas « trop court » et « faux » : toute ligne qui ne satisfait pas le prédicat sort par `ACCESS DENIED`.

## Notes

- UPX ne sert qu'à la taille. L'obfuscation est la VM (sauts calculés, tables de 2383 et 2775, blocs éclatés), pas le packer.
- Pas de secret en clair, pas de comparaison de chaîne. Forcer `ACCESS GRANTED` en patchant un saut ne construit pas le flag : le flag est imprimé à partir de l'ID accepté.
- `srand(time(0))` est un leurre : `rand` n'est pas dans les imports, et le même ID marche à chaque lancement.
