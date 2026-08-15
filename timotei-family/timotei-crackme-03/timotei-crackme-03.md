# timotei-crackme-03

Crackme ELF64 Linux, asm statique, **strippé**, mix `int 0x80` / `syscall`.
Auteur : timotei (crackmes.one). Analyse statique + reconstruction du check.

Dossier : `timotei-family/timotei-crackme-03/` — [série](../README.md) · [repo](../../README.md).

| Fichier | Rôle |
|---|---|
| `timotei-crackme-03` | binaire d’origine |
| [`timotei-crackme-03.md`](timotei-crackme-03.md) | ce write-up |
| [`timotei-crackme-03-solve.py`](timotei-crackme-03-solve.py) | solveur add + `cmps` (section 6) |
| [`timotei-crackme-03-idapro.asm`](timotei-crackme-03-idapro.asm) | listing IDA (section 8) |
| [`timotei-crackme-03-idapro.c`](timotei-crackme-03-idapro.c) | Hex-Rays 9.4 (section 8) |
| [`timotei-crackme-03.c`](timotei-crackme-03.c) | équivalent C à la main (section 8) |
| [`timotei-crackme-03-nasm.asm`](timotei-crackme-03-nasm.asm) | source reconstruit NASM (section 9) |
| [`timotei-crackme-03-fasm.asm`](timotei-crackme-03-fasm.asm) | source reconstruit FASM (section 9) |

Réponse acceptée :

| Input | Valeur | Rôle |
|---|---|---|
| stdin | `Defeat COVID!` | 13 octets ; le `!` est à la fois le 13ᵉ caractère et la clé |

Le `!` final n’est pas décoratif : c’est `buf[12]`, d’où le programme tire le décalage. Sans lui (`Defeat COVID`) le check échoue. Un suffixe après le `!` est ignoré (`Defeat COVID!xxx` passe).

---

## 1. Premier regard

```
file timotei-crackme-03
# ELF 64-bit LSB executable, x86-64, statically linked, stripped

readelf -h  → Entry point 0x401000
readelf -S  → .text 0x188 @ 0x401000, .data 0xE9 @ 0x402000, .bss 0x64 @ 0x4020EC
nm          → no symbols
strings -a -t x
```

Chaînes utiles :

| VA | Label reconstruit | Texte | Référencé ? |
|---|---|---|---|
| `0x402000` | `Credit` | `._:timotei crackme#3:_:.\0` | jamais |
| `0x402019` | `hint` | `Defeat COVID\0` | **jamais** (hint pour le reverser) |
| `0x402026` | `secret` | 14 octets `35 56 57…12 00` | `repz cmpsb` |
| `0x402034` | `cls` | `\x1b[2J` | clear screen |
| `0x402038` | `blink` | `\x1b[5;37;1m\0` | blanc clignotant |
| `0x402042` | `reset` | `\x1b[0;0;0m\0` | reset attributs |
| `0x40204b`…`0x402060` | `cur1`–`cur4` | `\x1b[n;10H` | curseur col. 10 |
| `0x402067` | `stars` | 40 `*` + `\n` | cadre |
| `0x402090` | `warn` | `*.warning - self destruction activated.*\n` | ligne 2 |
| `0x4020b9` | `prompt` | `*.enter abort code: ` | ligne 3 |
| `0x4020cd` | `good` | `*.Code accepted.Take care!*\n` | succès |
| `0x4020EC` | `buffer` | BSS, 100 octets | `read` |

DIE : « Unknown ». Même famille FASM paginée 4K. Premier `.bss` de la série : le buffer n’est plus du zéro en PROGBITS.

Hashes : MD5 `a5669e5ecfe2cf00ca64336160820325`, SHA256 `de8a8557ae64f4c54a2f9d68c337766339cfa45e3955a33545c43ea34f877ea9`.

Gimmick annoncé dans le README de la série : **`int 0x80` dans un ELF64**. L’auteur mélange les deux ABI.

| Instruction | ABI | rax/eax | args |
|---|---|---|---|
| `int 0x80` | i386 | 4 = `write` | ebx=fd, ecx=buf, edx=len |
| `syscall` | x64 | 1 = `write` | rdi=fd, rsi=buf, rdx=len |
| `syscall` | x64 | 0 = `read` | rdi=0, rsi=buffer, rdx=100 |
| `int 0x80` | i386 | 1 = `exit` | ebx=status |

Les `write` ANSI (clear, curseur, couleurs) passent par `int 0x80`. Les gros `write` (cadre, warning, prompt, succès) et le `read` passent par `syscall`. L’`exit` est le `sys_exit` 32 bits (`eax=1`), pas le 64 bits (`eax=60`).

Sur un noyau Linux x64 actuel, `int 0x80` reste implémenté (table i386). Ça marche.

---

## 2. Flow global

```
_start
    int80 write(cls)                    ; \x1b[2J
    int80 write(cur1)                   ; [1;10H
    syscall write(stars, 0x29)          ; 40 étoiles
    int80 write(cur4)                   ; [4;10H
    syscall write(stars, 0x29)
    int80 write(blink)                  ; [5;37;1m
    int80 write(cur2)                   ; [2;10H
    syscall write(warn, 0x29)           ; self destruction
    int80 write(reset)
    int80 write(cur3)                   ; [3;10H
    syscall write(prompt, 0x14)         ; enter abort code
    syscall read(buffer, 100)
    CHECK  ── fail → exit
    int80 write(cls)
    syscall write(good, 0x1C)
    exit(0)                             ; int80 eax=1
```

Un input, un prédicat. L’UI est du bruit ANSI : le check ne lit que le buffer.

Sans `\n` dans les 100 octets lus, la boucle `add` ne s’arrête jamais et sort du BSS → hang / SIGSEGV. Il faut valider avec Entrée (ou envoyer un `0x0A`).

---

## 3. Comment le code d’abort est vérifié

Listing à partir du `read` :

```
401106  mov  eax, 0
40110b  mov  edi, 0
401110  mov  esi, 0x4020EC          ; buffer (BSS)
401115  mov  edx, 0x64
40111a  syscall                     ; read(0, buffer, 100)

40111c  xor  ebx, ebx
40111e  mov  ecx, 0x4020EC
401123  mov  dl, [ecx+0xC]          ; buf[12]
401127  sub  dl, 0x30               ; clé = buf[12] - '0'
40112a  check:
40112a  mov  bl, [ecx]
40112d  cmp  bl, 0x0A
401130  je   compare                ; stop avant le '\n'
401132  add  [ecx], dl              ; buf[i] += clé
401135  inc  ecx
401137  jmp  check

401139  compare:
401139  mov  esi, 0x4020EC
40113e  mov  edi, 0x402026          ; secret
401143  mov  ecx, 0x0E              ; 14
401148  repz cmpsb
40114a  test ecx, ecx
40114c  jne  out                    ; ecx != 0 → fail
40114e  … write(cls) + write(good)
```

En clair :

```
clé = buffer[12] - ord('0')          # même si ce n'est pas un chiffre
pour i = 0, 1, … jusqu'au premier '\n' exclu :
    buffer[i] = (buffer[i] + clé) & 0xFF

repz cmpsb des 14 premiers octets contre secret
succès  ssi  ecx == 0 à la sortie
```

`secret` à `0x402026` :

```
35 56 57 56 52 65 11 34 40 47 3A 35 12 00
```

Ajoute 15 (`0x0F`) aux 13 premiers :

```
44 65 66 65 61 74 20 43 4F 56 49 44 21
D  e  f  e  a  t     C  O  V  I  D  !
```

`Defeat COVID!` − 15 = `secret[0..12]`. Le hint en clair à `0x402019` est la même phrase **sans** le `!`.

### Pourquoi le `!` est la clé

`buf[12]` est le 13ᵉ caractère. Pour `Defeat COVID!` c’est `!` = `0x21`.

```
clé = 0x21 - 0x30 = -15 = 0xF1
```

Chaque octet est **diminué de 15**. On retrouve exactement `secret[0..12]`.

Cohérence interne : le 13ᵉ octet transformé doit valoir `secret[12] = 0x12`.

```
buf[12] + (buf[12] - 0x30)  ==  0x12
2 * buf[12]                 ==  0x42          (mod 256)
buf[12]                     ==  0x21  ou  0xA1
```

`0x21` = `'!'` → mot de passe imprimable `Defeat COVID!`.  
`0xA1` → une autre entrée de 13 octets non imprimables, mathématiquement valide, clairement pas l’intention.

### Le piège du `repz cmpsb`

`secret` fait 14 octets, le dernier est `0x00`. Après `Defeat COVID!\n` :

| i | après add | secret | |
|---|---|---|---|
| 0..12 | match | match | |
| 13 | `'\n'` `0x0A` | `0x00` | **mismatch** |

Pourtant ça passe. `REPE CMPSB` :

1. si `ecx == 0`, sortir
2. comparer, `ecx--`
3. si inégal **ou** `ecx == 0`, sortir

Un mismatch sur le **dernier** octet : on décrémente `ecx` de 1 à 0, **puis** on voit ZF=0 et on sort. `ecx` vaut 0. `test ecx, ecx` / `jne out` ne saute pas.

Le 14ᵉ octet n’est **pas** exigé. Le `0x00` final de `secret` est du padding. D’où :

- `Defeat COVID!\n` → succès (mismatch inoffensif sur le `\n`)
- `Defeat COVID!xxx\n` → succès (seuls 14 octets sont comparés, les 13 premiers suffisent)
- `Defeat COVID\n` → fail (`buf[12]` est le `\n`, clé pourrie)

Sans `\n`, la boucle `add` dépasse le BSS. `printf 'Defeat COVID!'` sans newline **hang**.

---

## 4. L’UI ne cache rien

Le cadre clignotant est uniquement cosmétique. Les `write` `int 0x80` de 4 / 7 / 9 / 10 octets envoient des séquences ANSI, parfois avec leur `0` final (`blink` et `reset` : on voit un octet nul dans un hexdump du stdout). Rien de tout ça n’entre dans `buffer`.

`Credit` et `hint` ne sont jamais écrits. `hint` est le cadeau : la phrase est déjà dans le `.data`, il manque juste le `!` que le check impose via `buf[12]`.

---

## 5. Vérification sur le binaire

```
$ printf 'Defeat COVID!\n' | ./timotei-crackme-03
… ANSI …
*.Code accepted.Take care!*
$ printf 'Defeat COVID\n' | ./timotei-crackme-03
# prompt seulement, pas de good
$ printf 'Defeat COVID!xxx\n' | ./timotei-crackme-03
*.Code accepted.Take care!*
```

Le terminal montre un mini-cadre (étoiles en lignes 1 et 4, warning clignotant en ligne 2, prompt en ligne 3). En pipe, tout s’enchaîne, puis un dernier `\x1b[2J` efface et affiche le succès.

---

## 6. Solveur Python

Fichier : `timotei-crackme-03-solve.py`.

```bash
python3 timotei-crackme-03-solve.py
```

| Fonction | Rôle |
|---|---|
| `key_of(buf)` | `buf[12] - 0x30` (`0x401123`) |
| `transform(buf)` | `add` jusqu’au `\n` exclu |
| `cmps_ecx_left(got)` | `ecx` restant après `repz cmpsb` |
| `pass_ok(pw)` | `ecx == 0` |
| `invert_first13(key)` | inverse les 13 premiers octets |
| `run_binary(pw)` | stdin + timeout (boucle si pas de `\n`) |

Cœur :

```python
TARGET = bytes.fromhex("355657565265113440473a351200")

def transform(buf: bytes) -> bytes:
    out = bytearray(buf)
    k = (buf[12] - 0x30) & 0xFF
    for i, b in enumerate(out):
        if b == 0x0A:
            break
        out[i] = (b + k) & 0xFF
    return bytes(out)
```

`TARGET[:13] + 15` == `b'Defeat COVID!'`.

---

## 7. Récap des adresses

| VA | Quoi |
|---|---|
| `0x401000` | `_start` — `int 0x80` write cls |
| `0x401106` | `read` x64 dans le BSS |
| `0x401123` | `mov dl, [ecx+0xC]` — clé |
| `0x40112a` | boucle `add` jusqu’au `\n` |
| `0x401148` | `repz cmpsb` ecx=14 |
| `0x40114a` | `test ecx, ecx` / `jne out` |
| `0x40114e` | succès — cls + `good` |
| `0x40117f` | `out` — `int 0x80` exit |
| `0x402019` | hint `Defeat COVID` (mort) |
| `0x402026` | `secret` |
| `0x4020EC` | `buffer` BSS |

Contrairement au #01, un mauvais code s’annonce : pas de message d’échec, mais pas de `good` non plus, et `exit 0` dans tous les cas. Un hang veut dire « pas de `\\n` », pas « mauvais mot de passe ».

---

## 8. Dumps IDA Pro (asm + Hex-Rays)

Fichiers ajoutés :

| Fichier | Origine |
|---|---|
| [`timotei-crackme-03-idapro.asm`](timotei-crackme-03-idapro.asm) | listing IDA (Intel) |
| [`timotei-crackme-03-idapro.c`](timotei-crackme-03-idapro.c) | Hex-Rays 9.4 (une seule fonction : `start`) |
| [`timotei-crackme-03.c`](timotei-crackme-03.c) | C à la main, juste le prédicat |

Hashes IDA = ceux de `diec` : MD5 `A5669E5ECFE2CF00CA64336160820325`, SHA256 `DE8A8557…7EA9`.

Strippé : IDA a posé `start`, `loc_40112A` (boucle `add`), `loc_401139` (`cmps`), `loc_40117F` (`out`). Les `int 80h` sont annotés `sys_write` / `sys_exit`, les `syscall` `sys_write` / `sys_read`. `aDefeatCovid` est dans le listing — le hint survit en asm.

### Ce que Hex-Rays a bien reconstruit

La clé et la boucle tombent en C lisible :

```c
v1 = *(_BYTE *)((unsigned int)byte_4020EC + 12) - 48;   // buf[12] - '0'
while ( *(_BYTE *)(unsigned int)v0 != 10 ) {
    *(_BYTE *)(unsigned int)v0 += v1;
    LODWORD(v0) = (_DWORD)v0 + 1;
}
```

`(unsigned int)` / `LODWORD` = les préfixes `67h` (adresses 32 bits). Le `repe cmpsb` devient :

```c
v4 = 14;
do {
    if ( v4 == 0 ) break;
    v5 = *v2++ == *v3++;
    --v4;
} while ( v5 );
if ( (_DWORD)v4 == 0 )
    sys_write(1u, &buf[102], 0x1Cu);
```

`--v4` *puis* test d’égalité : un mismatch sur le dernier octet laisse `v4 == 0`. Hex-Rays **garde le piège** sans le commenter.

### Pièges dans ces dumps

1. **« Compiler : GNU C++ »** — faux. Asm à la main. En-tête MASM `.686p` / `.model flat` : artefact 32 bits.

2. **Le hint a disparu du C.** `aDefeatCovid` est dans le `.asm`, jamais référencé → Hex-Rays ne l’émet pas. `secret` devient `_UNKNOWN unk_402026` : pas de hexa, pas de `Defeat COVID! − 15`. Sans le listing on ne devine pas la phrase.

3. **Chaînes fusionnées.** IDA a collé `cls`+`blink` dans `a2j5371m` (`\x1B[2J\x1B[5;37;1m`) et stars+warn+prompt+good dans un seul `buf[130]`. Les `write` Hex-Rays passent par `&buf[41]`, `&buf[82]`, `&buf[102]`. Les tailles vraies restent celles des `edx` (`4`, `0x29`, `0x14`, `0x1C`).

4. **Les `int 80h` n’ont plus d’arguments en C.** `__asm { int 80h; LINUX - sys_write }` : plus de `ecx` / `edx`. L’UI ANSI (clear, curseur, blink) est illisible dans le décompilé. Le listing les a encore (`offset a2j5371m`, `unk_40204B`…).

5. **`JUMPOUT(0x401188)`.** L’`int 80h` `sys_exit` ne revient pas ; Hex-Rays croit que le flux sort du `.text`. Faux positif.

6. **`byte_4020EC[100]`** est juste (BSS). Le `(unsigned int)byte_4020EC + 12` est `buffer[12]`, pas un autre objet.

En pratique : le `.asm` IDA pour les labels, le hint et les `int 80h` ; le `.c` pour la clé / le `cmps` ; le C à la main dès qu’on veut `secret` en clair.

### C à la main

Fichier : [`timotei-crackme-03.c`](timotei-crackme-03.c). Reproduire le `ecx--` *avant* le test d’égalité, sinon on raterait le piège du dernier octet.

```c
key = buf[12] - 0x30;
for (i = 0; i < 100 && buf[i] != '\n'; i++)
    buf[i] += key;

ecx = 14;
for (i = 0; i < 14; i++) {
    ecx--;
    if (buf[i] != secret[i])
        break;
}
if (ecx == 0)
    write(1, good, 0x1C);
```

---

## 9. Source reconstruit (NASM + FASM)

Pas le fichier auteur. Labels reconstruits. Même verdict que #01 / #02 : FASM d’origine (ELF `executable`, 3 `PT_LOAD` 4K, pas de `.comment` gcc). Ici s’ajoute un vrai `.bss`.

### 9.1 Fichiers

| Fichier | Assembleur | Binaire de test | Résultat |
|---|---|---|---|
| [`timotei-crackme-03-nasm.asm`](timotei-crackme-03-nasm.asm) | NASM 2.16.01 | `timotei-crackme-03-nasm.bin` | **`.text` et `.data` identiques**, BSS `0x4020EC` |
| [`timotei-crackme-03-fasm.asm`](timotei-crackme-03-fasm.asm) | FASM 1.73.32 | `timotei-crackme-03-fasm.bin` (801 o) | même comportement ; ELF tassé |

### 9.2 Compiler

```bash
nasm -f elf64 -o timotei-crackme-03-nasm.o timotei-crackme-03-nasm.asm
ld -nostdlib -static -no-pie \
   -o timotei-crackme-03-nasm.bin timotei-crackme-03-nasm.o

fasm.x64 timotei-crackme-03-fasm.asm timotei-crackme-03-fasm.bin
```

```bash
printf 'Defeat COVID!\n' | ./timotei-crackme-03-nasm.bin
```

### 9.3 Vérification live

| stdin | Original | NASM | FASM |
|---|---|---|---|
| `Defeat COVID!\n` | `Code accepted` | idem | idem |
| `Defeat COVID!xxx\n` | `Code accepted` | idem | idem |
| `Defeat COVID\n` | silence | silence | silence |
| `Defeat COVID!` (pas de `\n`) | hang | hang | hang |

### 9.4 Data — layout exact

`file off 0x2000`, VA `0x402000`, taille `0xE9`. BSS à `0x4020EC` (align 4 : 3 octets de trou après `.data`).

| Label | VA | Taille | Contenu | Écrit |
|---|---|---:|---|---|
| `Credit` | `0x402000` | 25 | `._:timotei crackme#3:_:.\0` | jamais |
| `hint` | `0x402019` | 13 | `Defeat COVID\0` | jamais |
| `secret` | `0x402026` | 14 | `Defeat COVID!` − 15, + `00` | comparé |
| `cls` | `0x402034` | 4 | `\x1b[2J` | 4 |
| `blink` | `0x402038` | 10 | `\x1b[5;37;1m\0` | 10, `0` compris |
| `reset` | `0x402042` | 9 | `\x1b[0;0;0m\0` | 9, `0` compris |
| `cur1`–`cur4` | `0x40204b`… | 7×4 | `\x1b[n;10H` | 7 |
| `stars` | `0x402067` | 41 | 40 `*` + `\n` | 41 (`0x29`) |
| `warn` | `0x402090` | 41 | warning + `\n` | 41 |
| `prompt` | `0x4020b9` | 20 | `*.enter abort code: ` | 20, collé à `good` |
| `good` | `0x4020cd` | 28 | `*.Code accepted.Take care!*\n` | 28 (`0x1C`) |
| `buffer` | `0x4020EC` | 100 | BSS | `read` |

`prompt` n’a pas de `0` final : il est suivi immédiatement de `good` dans le fichier.

### 9.5 Encodings recopiés

| Source | Encodage | Pourquoi |
|---|---|---|
| `int 0x80` | `CD 80` | write ANSI + exit i386 |
| `syscall` | `0F 05` | write longs + read |
| `mov rsi, stars` | `48 BE …` movabs 10 o | pas `lea` |
| `mov dl, [ecx+0xC]` | préfixe `67` | adresse 32 bits |
| `add [ecx], dl` | `67 00 11` | idem |
| `inc ecx` | `FF C1` | pas `41` |
| `repz cmpsb` | `F3 A6` | 14 octets, piège ecx |

FASM : `mov rsi, label` retombe en `48 C7 C6 imm32` (7 o) une fois le ELF tassé. On force `db 48h, 0BEh` / `dq label` comme au #02.

### 9.6 Différences reconstruction ↔ original

| | Original (2020) | NASM 2.16 | FASM 1.73 |
|---|---|---|---|
| Taille | 8776 | 9656 | 801 |
| EP | `0x401000` | `0x401000` | `~0x4000B0` |
| Data VA | `0x402000` | `0x402000` | collée après le code |
| BSS | `0x4020EC` / 100 | identique | `rb 100` après 3 octets d’align |
| Section headers | `.text` `.data` `.bss` | oui + symtab | **non** |
| Listing `objdump -d` | référence | **identique** | pas de `.text` visible |
