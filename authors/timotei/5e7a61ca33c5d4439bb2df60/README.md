# timotei-crackme-02

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5e7a61ca33c5d4439bb2df60) · id `5e7a61ca33c5d4439bb2df60`


Crackme ELF64 Linux, asm statique, **strippé**.
Auteur : timotei (crackmes.one). Analyse statique + reconstruction du jump calculé.

Dossier : `authors/timotei/5e7a61ca33c5d4439bb2df60/` — [série](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`timotei-crackme-02`](original/timotei-crackme-02) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`timotei-crackme-02-solve.py`](tools/timotei-crackme-02-solve.py) | solveur pack ROL8 + jump (section 6) |
| [`timotei-crackme-02-idapro.asm`](analysis/timotei-crackme-02-idapro.asm) | listing IDA (section 8) |
| [`timotei-crackme-02-idapro.c`](analysis/timotei-crackme-02-idapro.c) | Hex-Rays 9.4 (section 8) |
| [`timotei-crackme-02.c`](tools/timotei-crackme-02.c) | équivalent C à la main (section 8) |
| [`timotei-crackme-02-nasm.asm`](tools/timotei-crackme-02-nasm.asm) | source reconstruit NASM (section 9) |
| [`timotei-crackme-02-fasm.asm`](tools/timotei-crackme-02-fasm.asm) | source reconstruit FASM (section 9) |

Réponses acceptées (famille, pas un secret unique) :

| Input | Valeur | Rôle |
|---|---|---|
| `argv[1]` | `31337!!P` | 8 octets, `s[0]=='3'` et `s[7]=='P'` |
| `argv[1]` | `3AAAAAAP` | même contrainte, milieu libre |
| `argv[1]` | `A3AAAAAAP` | 9 octets : `s[-8]=='3'` et `s[-1]=='P'` |

Le mot de passe n’est **pas unique**. Toute chaîne de longueur ≥ 8 avec `s[-8] == '3'` et `s[-1] == 'P'` atterrit sur le `write` de succès. Pas de prompt : le check lit `argv[1]`, pas stdin.

---

## 1. Premier regard

```
file timotei-crackme-02
# ELF 64-bit LSB executable, x86-64, statically linked, stripped

readelf -h  → Entry point 0x401000
readelf -S  → .text 0x73 octets @ 0x401000, .data 0x125 octets @ 0x402000
nm          → no symbols
strings -a -t x
```

Chaînes utiles (section `.data` à `0x402000`) :

| VA | Label reconstruit | Texte | Référencé ? |
|---|---|---|---|
| `0x402000` | `Credit` | `._:timotei crackme#2:_:.\0` | jamais |
| `0x402019` | `greetz` | `:.greetz fly out to jeffli6789 & BinaryNewbie..\0` | jamais |
| `0x402049` | `good` | `_.:pass accepted:._\n` | `write` de succès, 0x2F octets |

Pas de prompt, pas de `read`. Lancer le binaire sans argument ou en lui pipant stdin ne fait **rien** : `argc != 2` → `exit(0)` silencieux.

```
./timotei-crackme-02            # silence
./timotei-crackme-02 31337!!P   # _.:pass accepted:._
```

DIE : « Unknown ». Même famille que le #01 : asm à la main, 3 `PT_LOAD` paginés 4K (header `0x400000` R, code `0x401000` RX, data `0x402000` RW), syscalls bruts (`0F 05`). Ici les labels ont été strippés.

Hashes : MD5 `3ee57072020f7b5666b4a9fad51269f8`, SHA256 `e851d0c3426f6cc558fd0adab5a7bab84eab69603ee21b418dadceaa210c16de`.

Convention Linux x64, `_start` sans libc : `[rsp] = argc`, `[rsp+8] = argv[0]`, `[rsp+16] = argv[1]`.

Numéros utilisés :

| rax | Nom |
|---|---|
| 1 | `write` |
| 60 (`0x3c`) | `exit` |

Aucun `read`. Un seul input : `argv[1]`.

---

## 2. Flow global

```
_start
    si argc != 2 : exit                         ; cmp byte [rsp], 2
    strlen(argv[1])                             ; repnz scasb
    si longueur <= 3 : exit
    rbx = 0
    pour chaque octet de argv[1] :
        bl = octet
        rol rbx, 8
    rbx += 0xAFDC
    di = bx                                     ; 16 bits bas
    rax = 0x40103F                              ; adresse du movabs lui-même
    jmp rax+rdi                                 ; jump calculé
    ── si di == 0x0F on atterrit ici ──
    write(stdout, good, 0x2F)
    exit(0)
```

Un input, un prédicat, mais le prédicat n’est **pas** un `cmp`/`je`. C’est un `jmp rax` dont la cible dépend du mot de passe. Atterrir 1 octet à côté = autre instruction, souvent `SIGSEGV`.

Les 200 zéros après `good` sont un reliquat de template (les deux buffers de 100 octets du #01). Rien ne les lit. `Credit` et `greetz` non plus.

---

## 3. Comment le mot de passe est vérifié

Listing (intel) depuis `_start` :

```
401000  cmp  byte [rsp], 2
401004  jne  out                    ; argc != 2 → exit silencieux
401006  mov  rdi, [rsp+0x10]        ; argv[1]
40100b  sub  ecx, ecx
40100d  sub  al, al
40100f  not  ecx
401011  cld
401012  repnz scasb                 ; strlen
401014  not  ecx
401016  dec  ecx                    ; ecx = strlen
401018  cmp  ecx, 3
40101b  jle  out                    ; trop court → exit

40101d  sub  rbx, rbx
401020  sub  rdi, rdi
401023  mov  rax, [rsp+0x10]

401028  pack:
401028  mov  bl, [rax]
40102a  rol  rbx, 8
40102e  inc  rax
401031  dec  ecx
401033  jne  pack

401035  add  rbx, 0xAFDC
40103c  mov  di, bx                 ; rdi était 0 → rdi = low 16
40103f  here:
40103f  movabs rax, 0x40103F        ; adresse de CETTE instruction (10 o)
401049  add  rax, rdi
40104c  jmp  rax

40104e  goodway:
40104e  mov  eax, 1                 ; sys_write
401053  mov  edi, 1
401058  movabs rsi, 0x402049        ; good
401062  mov  edx, 0x2F
401067  syscall
401069  out:
401069  mov  eax, 60
40106e  xor  rdi, rdi
401071  syscall
```

Le code RX n’est mappé que jusqu’à `0x401073`. `rdi` est un u16, donc le jump va de `0x40103F` à `0x41103E`. Seule la plage `di ∈ [0, 0x34]` reste dans la page exécutable. Tout le reste → `SIGSEGV`.

Pour tomber pile sur `goodway` :

```
0x40103F + di == 0x40104E
di == 0x0F
```

`0x0F` n’est pas magique : c’est `sizeof(movabs)+sizeof(add)+sizeof(jmp)` = 10+3+2 = 15.

```
(pack + 0xAFDC) & 0xFFFF == 0x000F
pack & 0xFFFF == 0x5033
```

`0x5033` en little-endian = `'3' 'P'`. Il faut que les 16 bits bas du registre packé valent `0x5033` **après** la dernière rotation.

### Pourquoi une longueur < 8 est impossible

`rol rbx, 8` se fait **après** chaque `mov bl`. Après `n` itérations, l’octet de poids faible de `rbx` est :

- `n < 8` : toujours `0` (rien n’a encore fait le tour des 64 bits)
- `n ≥ 8` : l’octet qui était en tête (bits 56–63) juste avant le dernier `rol`, c’est-à-dire `password[n-8]`

Et les bits 8–15 reçoivent **toujours** le dernier caractère (`password[n-1]`), poussé d’un cran par le `rol` final.

Donc :

| Longueur | low 16 de `rbx` | Peut valoir `0x5033` ? |
|---|---|---|
| 4..7 | `dernier << 8` (fini par `00`) | non |
| ≥ 8 | `password[-1] << 8 \| password[-8]` | oui, ssi `-1 == 'P'` et `-8 == '3'` |

D’où la forme fermée :

```
len(s) >= 8  et  s[-1] == 'P'  et  s[-8] == '3'
```

`31337!!P` : 8 octets, `s[0]=='3'`, `s[7]=='P'`. Le milieu (`1337!!`) est décoratif.

`A3AAAAAAP` : 9 octets, `s[1]=='3'`, `s[8]=='P'`. Marche pareil.

### Trace de `31337!!P`

| i | octet | `rbx` après `rol` | low 16 |
|---|---|---|---|
| 0 | `'3'` `0x33` | `0x0000000000003300` | `0x3300` |
| 1 | `'1'` `0x31` | `0x0000000000333100` | `0x3100` |
| … | | | |
| 6 | `'!'` `0x21` | `0x3331333337212100` | `0x2100` |
| 7 | `'P'` `0x50` | `0x3133333721215033` | **`0x5033`** |

Le `'3'` initial a tourné 8 fois et est revenu dans l’octet bas. `'P'` s’est arrêté dans l’octet suivant.

```
0x5033 + 0xAFDC = 0x1000F
di = 0x000F
jmp 0x40103F + 0x0F = 0x40104E   → goodway
```

### Contre-exemple : `1337` et les PINs du #01

`argc==2` passe, `strlen("1337")==4 > 3` donc on entre dans la boucle. Mais 4 < 8 → low 16 = `'7'<<8 = 0x3700`.

```
0x3700 + 0xAFDC = 0xE6DC
jmp 0x40103F + 0xE6DC = 0x40F71B    → page non mappée → SIGSEGV
```

Le seed `0xAFDC` n’est **pas** un mot de passe. C’est le biais qui transforme `0x5033` en offset `0x0F`.

---

## 4. Les autres atterrissages

`di` petit (0..0x34) reste dans le `.text`. Un seul de ces offsets écrit `pass accepted`. Les autres valent le détour, ce sont des pièges naturels quand on brute.

| `s[-8]` | `s[-1]` | `di` | Cible | Effet |
|---|---|---|---|---|
| `'3'` `0x33` | `'P'` | `0x0F` | `0x40104E` | **write + exit 0** |
| `'$'` `0x24` | `'P'` | `0x00` | `0x40103F` | re-exécute `movabs`/`add`/`jmp` → **boucle infinie** |
| `'N'` `0x4E` | `'P'` | `0x2A` | `0x401069` | `out` : **exit 0 silencieux** |
| `'A'` `0x41` | `'P'` | `0x1D` | `0x40105C` | milieu du `movabs rsi` → **SIGSEGV** |
| autre / `len<8` | | ≥ `0x35` | hors `.text` | **SIGSEGV** |

`NaaaaaaP` est vicieux : le process « réussit » (`exit 0`) sans rien afficher. Lire le code de retour ne suffit pas, comme au #01 — ici en pire, parce qu’un mauvais jump peut aussi renvoyer 0.

`di == 0` (`$!@#$%^P`) : `rdi` reste 0, on saute sur le `movabs rax, 0x40103F` lui-même, `add rax, 0`, `jmp rax` → même adresse. `timeout` pour s’en sortir.

Décoder le `.text` à partir de chaque offset possible (ndisasm) ne sort aucun autre chemin qui fasse `eax=1 / edi=1 / rsi=good / rdx=0x2F / syscall`. Le write n’est atteint que par `di == 0x0F`.

---

## 5. Vérification sur le binaire

```
$ ./timotei-crackme-02 31337!!P
_.:pass accepted:._
$ ./timotei-crackme-02 3AAAAAAP
_.:pass accepted:._
$ ./timotei-crackme-02 A3AAAAAAP
_.:pass accepted:._
$ ./timotei-crackme-02            # argc==1
$ ./timotei-crackme-02 31337!!P extra   # argc==3
$ ./timotei-crackme-02 AAAAAAAP   # SIGSEGV
$ ./timotei-crackme-02 NaaaaaaP   # silence, exit 0
```

Le `write` envoie 47 octets (`0x2F`) : les 20 octets de `good` (`_.:pass accepted:._\n`) puis 27 zéros. Sur un terminal on ne voit que la ligne.

---

## 6. Solveur Python

Fichier : `timotei-crackme-02-solve.py` (à côté du binaire).

```bash
python3 timotei-crackme-02-solve.py
```

Il reconstitue le pack, vérifie que la forme fermée (`s[-8]=='3'` ∧ `s[-1]=='P'`) est équivalente à `di==0x0F`, trace quelques candidats, puis lance le binaire (argv, pas stdin).

| Fonction | Rôle |
|---|---|
| `pack_rol8(pw)` | boucle exacte de `0x401028` |
| `di_of(pw)` | `(pack + 0xAFDC) & 0xFFFF` |
| `pass_ok(pw)` | `di == 0x0F` et `len > 3` |
| `pass_ok_shortcut(pw)` | `len>=8 and pw[-8]=='3' and pw[-1]=='P'` |
| `pack_trace(pw)` | rbx / low16 / cible du `jmp` à chaque octet |
| `run_binary(pw)` | `Popen([bin, pw])`, timeout 1 s pour la boucle `di==0` |

Cœur :

```python
def pack_rol8(password: bytes) -> int:
    rbx = 0
    for b in password:
        rbx = (rbx & ~0xFF) | b
        rbx = ((rbx << 8) | (rbx >> 56)) & 0xFFFFFFFFFFFFFFFF
    return rbx

def pass_ok(password: bytes) -> bool:
    if len(password) <= 3:
        return False
    return (pack_rol8(password) + 0xAFDC) & 0xFFFF == 0x0F
```

Script complet : [`timotei-crackme-02-solve.py`](tools/timotei-crackme-02-solve.py).

---

## 7. Récap des adresses

| VA | Quoi |
|---|---|
| `0x401000` | `_start` — `cmp byte [rsp], 2` |
| `0x401028` | `pack` — `mov bl` / `rol rbx, 8` |
| `0x401035` | `add rbx, 0xAFDC` |
| `0x40103F` | `here` — `movabs rax, 0x40103F` (ancre du jump) |
| `0x40104C` | `jmp rax` |
| `0x40104E` | `goodway` — `write` du succès |
| `0x401069` | `out` — `exit(0)` (aussi atterri par `di==0x2A`) |
| `0x402000` | `Credit` (mort) |
| `0x402019` | `greetz` (mort) |
| `0x402049` | `good` |

Contrairement au #01, un mauvais input ne se tait pas toujours : la plupart des chaînes `SIGSEGV`. L’échec « propre » n’arrive que pour `argc!=2`, `len<=3`, ou le piège `di==0x2A`.

---

## 8. Dumps IDA Pro (asm + Hex-Rays)

Fichiers ajoutés :

| Fichier | Origine |
|---|---|
| [`timotei-crackme-02-idapro.asm`](analysis/timotei-crackme-02-idapro.asm) | listing IDA (Intel) |
| [`timotei-crackme-02-idapro.c`](analysis/timotei-crackme-02-idapro.c) | Hex-Rays 9.4 (une seule fonction : `start`) |
| [`timotei-crackme-02.c`](tools/timotei-crackme-02.c) | C à la main, juste le prédicat |

Hashes IDA = ceux de `diec` : MD5 `3EE57072020F7B5666B4A9FAD51269F8`, SHA256 `E851D0C3…16DE`.

Binaire strippé : pas de labels auteur. IDA a posé `start`, `loc_401028` (pack), `loc_40103F` (ancre), `loc_401069` (`out`). Les syscalls sont annotés `sys_write` / `sys_exit`. Constantes visibles : `0AFDCh`, `2Fh`.

### Ce que Hex-Rays a bien reconstruit

Le pack ROL8 est lisible :

```c
LOBYTE(v11) = *v13;
v11 = __ROL8__(v11, 8);
++v13;
```

`argc == 2` apparaît comme `(_BYTE)retaddr == 2` : Hex-Rays prend `[rsp]` pour l’adresse de retour d’un `start` C, alors que c’est `argc` au `_start` nu. L’octet comparé est le bon.

Le jump calculé survit, une fois `20516` remis en hexa :

```c
LOWORD(v12) = v11 - 20516;   // 20516 = 0x5024
return ((...)((char *)&loc_40103F + v12))(...);
```

`add rbx, 0xAFDC` puis `mov di, bx` : `0xAFDC ≡ -0x5024 (mod 2^16)`, donc `LOWORD(rbx - 20516) == (rbx + 0xAFDC) & 0xFFFF`. Le `di` est juste. Hex-Rays a transformé le `jmp rax` en appel de fonction (tail call).

### Pièges dans ces dumps

1. **« Compiler : GNU C++ »** — faux. Asm à la main, DIE « Unknown ». En-tête MASM `.686p` / `.model flat` : artefact 32 bits sur un ELF64.

2. **`goodway` a disparu du C.** Après `jmp rax`, le `sys_write` de `0x40104E` n’est plus dans le graphe. Hex-Rays s’arrête au jump / `sys_exit`. Si on ne lit que le `.c`, on ne voit jamais `_.:pass accepted:._`. Le listing a le `write` juste sous le `jmp rax`, sans label.

3. **`[rsp+arg_8]`.** IDA a fabriqué un frame : `arg_8 = qword ptr 10h`. `mov rdi, [rsp+arg_8]` est bien `[rsp+0x10] = argv[1]`. Le nom ment, l’adresse non.

4. **`buf db '…', 0Ah, 0` puis 200 `db 0`.** IDA a mis un `0` dans le label `buf` (21 octets) et dumpé le padding octet par octet. Le `write` envoie `0x2F` octets, `0` compris. `Credit` / `greetz` sont bien là, jamais référencés — Hex-Rays ne les montre pas.

5. **Les autres atterrissages n’existent pas en C.** Boucle `di==0`, `exit` silencieux `di==0x2A`, `SIGSEGV` : uniquement dans le listing / ndisasm.

En pratique : le `.asm` IDA pour l’ancre `loc_40103F` et le `jmp rax`, le `.c` pour le `ROL8`, et le C à la main (ou le listing) dès que Hex-Rays avale le `write` de succès.

### C à la main

Fichier : [`timotei-crackme-02.c`](tools/timotei-crackme-02.c). Le prédicat seulement — le binaire ne compare pas `di` à `0x0F`, il saute.

```c
rbx = 0;
for (i = 0; i < n; i++) {
    rbx = (rbx & ~0xFFull) | p[i];
    rbx = (rbx << 8) | (rbx >> 56);
}
di = (uint16_t)(rbx + 0xAFDC);
if (di == 0x0F)
    syscall(SYS_write, 1, good, 0x2F);
```

---

## 9. Source reconstruit (NASM + FASM)

Ce n’est **pas** le fichier auteur. Le source a disparu (et les symboles avec). On a reconstruit depuis `objdump` / le dump `.data`. Même verdict qu’au #01 : dialecte d’origine très probablement **FASM** (ELF `executable` d’un seul fichier, 3 `PT_LOAD` paginés, pas de `.comment` gcc).

### 9.1 Fichiers

| Fichier | Assembleur | Binaire de test | Résultat |
|---|---|---|---|
| [`timotei-crackme-02-nasm.asm`](tools/timotei-crackme-02-nasm.asm) | NASM 2.16.01 | `timotei-crackme-02-nasm.bin` | **`.text` et `.data` identiques** à l’octet près, EP `0x401000` |
| [`timotei-crackme-02-fasm.asm`](tools/timotei-crackme-02-fasm.asm) | FASM 1.73.32 | `timotei-crackme-02-fasm.bin` (584 o) | même comportement ; ELF tassé, pas de section headers |

### 9.2 Compiler

```bash
nasm -f elf64 -o timotei-crackme-02-nasm.o timotei-crackme-02-nasm.asm
ld -nostdlib -static -no-pie \
   -o timotei-crackme-02-nasm.bin timotei-crackme-02-nasm.o

# FASM 1.73.32 (binaire officiel, pas besoin de sudo)
# https://flatassembler.net/fasm-1.73.32.tgz  →  fasm/fasm.x64
fasm.x64 timotei-crackme-02-fasm.asm timotei-crackme-02-fasm.bin
# ou : sudo apt install fasm
```

`-no-pie` est obligatoire pour NASM+ld : sinon les `movabs` 64 bits et l’ancre `0x40103F` cassent.

```bash
./timotei-crackme-02-nasm.bin '31337!!P'
```

### 9.3 Vérification live

| argv[1] | Original | NASM | FASM |
|---|---|---|---|
| `31337!!P` | `pass accepted` | `pass accepted` | `pass accepted` |
| `3AAAAAAP` | `pass accepted` | `pass accepted` | `pass accepted` |
| `A3AAAAAAP` | `pass accepted` | `pass accepted` | `pass accepted` |
| `AAAAAAAP` | SIGSEGV | SIGSEGV | SIGSEGV |
| `NaaaaaaP` | silence, 0 | silence, 0 | silence, 0 |
| `$!@#$%^P` | boucle | boucle | boucle |

Le `.text` NASM (115 octets) et le `.data` (293 octets, VA `0x402000`) sont un dump octet pour octet de l’original. `objdump -d` est superposable.

### 9.4 Data — layout exact

Reconstruit depuis le binaire (`file off 0x2000`, VA `0x402000`, taille `0x125`).

| Label | VA | Taille | Contenu | Écrit |
|---|---|---:|---|---|
| `Credit` | `0x402000` | 25 | `._:timotei crackme#2:_:.\0` | jamais |
| `greetz` | `0x402019` | 48 | `:.greetz fly out to jeffli6789 & BinaryNewbie..\0` | jamais |
| `good` | `0x402049` | 20 + 200 zéros | `_.:pass accepted:._\n` puis padding | 47 (`0x2F`) |

```nasm
Credit          db '._:timotei crackme#2:_:.', 0
greetz          db ':.greetz fly out to jeffli6789 & BinaryNewbie..', 0
good            db '_.:pass accepted:._', 10
                times 200 db 0          ; FASM : db 200 dup 0
```

PROGBITS, pas BSS. Le `0` de fin de `good` est le premier octet du padding : on n’écrit **pas** `db …, 10, 0` sous peine de décaler de 1 (`.data` passerait à `0x126`).

### 9.5 Encodings recopiés

| Source | Encodage original | Pourquoi |
|---|---|---|
| `cmp byte [rsp], 2` | `80 3c 24 02` | argc sur 8 bits seulement |
| `sub ecx, ecx` / `sub al, al` | `29 c9` / `28 c0` | pas `xor` |
| `sub rbx, rbx` / `sub rdi, rdi` | `48 29 db` / `48 29 ff` | idem |
| `mov rax, here` | `48 b8 …` movabs 10 o | la taille **est** l’offset `0x0F` |
| `mov rsi, good` | `48 be …` movabs 10 o | pas `lea rsi, [rel good]` |

Piège FASM : `mov rax, here` est encodé `48 C7 C0 imm32` (7 octets) dès que l’adresse tient dans un imm32 signé — c’est le cas une fois le ELF tassé (`here ≈ 0x4000EF`). `di == 0x0F` atterrit alors 3 octets trop loin, dans le `mov eax, 1`, et le succès ne s’affiche jamais. Le source force le movabs :

```fasm
here:
        db      48h, 0B8h
        dq      here
```

Même chose pour `mov rsi, good` (`48h, 0BEh` + `dq good`), pour garder les `jne`/`jle` à la même distance que l’original (`75 63` / `7E 4C`).
| `xor rdi, rdi` (exit) | `48 31 ff` | le seul `xor` du listing |

NASM : `DEFAULT ABS` + `mov rax, strict qword here` pour forcer le movabs 10 octets. Si cette instruction rétrécit, `di==0x0F` n’atterrit plus sur `goodway`.

### 9.6 Différences reconstruction ↔ original

| | Original (2020) | NASM 2.16 | FASM 1.73 |
|---|---|---|---|
| Taille | 8768 | 9320 | 584 |
| EP | `0x401000` | `0x401000` | `~0x4000B0` |
| Data VA | `0x402000` | `0x402000` | collée après le code |
| Section headers | oui (`.text` `.data`, **pas** de symtab) | oui + symtab | **non** |
| Label de sortie | (strippé) | `out` | `_out` (`out` = instruction FASM) |
| Listing `objdump -d` | référence | **identique** | objdump ne voit pas de `.text` |

FASM 1.73 tasse le ELF. Un `org 401000h` casse le `p_vaddr` comme au #01. On laisse FASM packer : même algo, autre image. L’ancre du jump n’est plus `0x40103F` : elle vaut `here`, calculée à l’assemblage, donc `di==0x0F` continue de tomber sur `goodway`.
