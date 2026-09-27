# timemachine (qnix)

| | |
|---|---|
| **ID** | [`5ab77f5333c5d40ad448c0f6`](https://crackmes.one/crackme/5ab77f5333c5d40ad448c0f6) |
| **Auteur** | qnix, miroir [crackmes.de](https://crackmes.one/user/crackmes.de) |
| **Plateforme** | Linux ELF32, GCC 4.8, stripé, lié à la libc |
| **Type** | mot de passe fixe (12 octets) |
| **SHA-256 (`qvm32.gz`)** | `ed37faafe1ff196731a4adc6fd3811724ec54d8ea85bfe13867b3bd392eec2b4` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/qvm32.gz` | ELF gzippé tel que livré (ZIP crackmes.one : mot de passe `crackmes.one`) |
| `analysis/qvm32` | `gzip -dc` de l’original, binaire lancé |
| `tools/timemachine-solve.py` | affiche le mot de passe ; `--check` relance l’ELF |

## Réponse

Mot de passe, 12 caractères, sans retour à la ligne obligatoire :

```text
iWasteMyTime
```

```bash
python3 tools/timemachine-solve.py
python3 tools/timemachine-solve.py --check
gzip -dc original/qvm32.gz > analysis/qvm32 && chmod +x analysis/qvm32
printf 'iWasteMyTime' | ./analysis/qvm32
```

Sortie : `ENTER PASS :WIN`. Le processus quitte avec le statut **255** (`exit(-1)` côté VM) même quand le message est `WIN`. Un mauvais mot de passe affiche `FAILED` et quitte 0.

## Premier regard

```text
original/qvm32.gz : gzip, nom interne qvm32, ~56 Kio une fois décompressé
ELF 32-bit LSB executable, Intel 80386, dynamically linked, stripped
interpréteur /lib/ld-linux.so.2
entry 0x8048470
```

`strings` sur l’ELF ne montre que la libc, plus trois messages collés dans `.data` :

```text
FAILED\n
WIN\n
ENTER PASS :
```

Imports utiles : `read`, `write`, `malloc`, `rand`, `exit`, `free`. Pas de `strcmp`.

Le binaire tourne en natif sur un userland i386 (ou via le chargeur 32 bits du système). `printf 'test\n' | ./analysis/qvm32` affiche `ENTER PASS :FAILED`.

## Flow

`main` est une seule fonction, `0x8048570`, environ 46 Kio. Presque tout ce volume est un **incrément de compteur écrit bit à bit** (and / not / xor / shl) : l’identité `pc = pc + 1`, dilatée pour noyer le désassemblage. En dessous, c’est un interpréteur de bytecode.

| Adresse | Rôle |
|---|---|
| `0x8054130` | image VM (bytecode + messages + buffer du mot de passe) |
| `0x8055504` | PC |
| `0x80554f0` | registres dword indexés par un octet |
| `0x8054222` | buffer lu par `read` (12 octets) |
| `0x80489b0` | `pc = pc + 1` (forme MBA), puis fetch |
| `0x8048d59` | lit l’opcode `mem[pc]` |

Le fetch (`0x8048d54`) :

```text
pc = pc + 1
op = mem[pc]
si op == 0xEE → quitte la VM (free + ret)
sinon arbre de comparaisons : 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0xAA, 0xBB, 0xDD, …
```

Les octets `0x00` en tête d’image sont donc sautés un par un jusqu’au vrai programme, vers l’offset `0x130`.

Handlers reconnaissables une fois le MBA retiré :

| Opcode | Effet |
|---|---|
| `0x55` `0xE2` … | enchaîne vers `read` : `read(fd, image+off, n)` avec `n = 12`, buffer `0x8054222` |
| `0x88` | `write` — prompt `ENTER PASS :`, puis `FAILED\n` ou `WIN\n` |
| `0x33 0xAB dst src` | `reg[dst] = reg[src]` |
| `0x33 0xBB dst imm…` | charge un immédiat dans un registre |
| `0x66 0xAB a b` | si `reg[a] == reg[b]` alors drapeau `0x8055508 = 0xF1`, sinon branche d’échec |
| `0xE0` | `exit(imm8)` |

`rand` sert à une petite boucle au démarrage (`compteur < rand() % 100`), pas au mot de passe.

## Comment on trouve le mot de passe

### Ancrage

`objdump -d -M intel` sur `analysis/qvm32`. Les seuls `call` vers la PLT sont malloc, rand, read (`0x804a184`), write (`0x804c5b6`), exit, free. Autour de `read`, le code recharge un octet de l’image `0x8054130` et passe `fd` / `buf` / `n` sur la pile : c’est un opcode de la VM, pas un `read` en clair dans `main`.

Le compare utile est à **`0x804adc9`** :

```asm
movzx eax, byte ptr [ebp-0x42]
mov   eax, dword ptr [eax*4+0x80554f0]    ; reg[a]
movzx ecx, byte ptr [ebp-0x43]
cmp   eax, dword ptr [ecx*4+0x80554f0]    ; reg[b]
jne   0x804f03d                           ; échec
mov   dword ptr [0x8055508], 0xF1
```

### Ce que GDB montre

Avec `AAAAAAAAAAAA` (12 octets, la taille demandée par `read`) :

```text
READ  fd=0 buf=0x8054222 n=12  eax=12
CMP   reg[0]=0x52  reg[1]=0x7a
→ FAILED
```

`reg[1]` reste `0x7a` si on change le mot de passe. `reg[0]` suit le **premier** octet seulement (`A` → `0x52`, `B` → `0x51`, les 11 autres `A`→`B` ne bougent pas). La VM applique une substitution (le flot `dd` / `cc` / `aa` / `33` entre le `read` et le `66`) puis compare à une constante. Même schéma pour l’octet suivant, qui atterrit dans `reg[2]` face à `reg[3] == 0x60`, et ainsi de suite. Douze compares, un par caractère. Tant que le compare courant échoue, la VM écrit `FAILED` et n’examine pas la suite.

La substitution n’est pas un simple `const - c` sur tout l’octet (ça colle sur `A`/`B`, pas sur `0x00` ou `0x19`). Inutile de la réduire : chaque position a une image bijective, donc une seule valeur fait coller le compare. On la trouve en figeant le préfixe déjà bon et en balayant l’octet courant jusqu’à ce que `cmp` à `0x804adc9` soit égal — en GDB, ou en rejouant l’interpréteur depuis l’état d’après `read` (Unicorn, snapshot des registres et de `0x8054120`).

| Pos | Octet | Caractère | Compare |
|---|---|---|---|
| 0 | `0x69` | `i` | `reg0 == 0x7a` |
| 1 | `0x57` | `W` | suivant égal |
| 2 | `0x61` | `a` | |
| 3 | `0x73` | `s` | |
| 4 | `0x74` | `t` | |
| 5 | `0x65` | `e` | |
| 6 | `0x4d` | `M` | |
| 7 | `0x79` | `y` | |
| 8 | `0x54` | `T` | |
| 9 | `0x69` | `i` | |
| 10 | `0x6d` | `m` | |
| 11 | `0x65` | `e` | dernier `cmp` égal, puis `write` de `WIN` |

Le mot de passe est le commentaire du crackme : **iWasteMyTime**.

## Debug GDB (pas à pas)

ELF32, donc un GDB du système qui sait déboguer l’i386. `debuginfod` coupé, sinon il pose une question et mange stdin.

```bash
gzip -dc original/qvm32.gz > analysis/qvm32 && chmod +x analysis/qvm32
printf 'AAAAAAAAAAAA' > /tmp/in.txt
gdb -q -nx analysis/qvm32
```

```gdb
set pagination off
set debuginfod enabled off
set confirm off
break *0x804a184
commands
printf "READ fd=%d buf=%#x n=%d\n", *(int*)$esp, *(unsigned*)($esp+4), *(unsigned*)($esp+8)
cont
end
break *0x804a189
commands
printf "read a retourné %d\n", $eax
x/12bx 0x8054222
cont
end
break *0x804adc9
commands
printf "CMP reg[%u]=%#x reg[%u]=%#x\n", *(unsigned char*)($ebp-0x42), $eax, *(unsigned char*)($ebp-0x43), *(unsigned*)(*(unsigned char*)($ebp-0x43)*4+0x80554f0)
cont
end
break *0x804c5b6
commands
printf "WRITE n=%d\n", *(unsigned*)($esp+8)
x/s *(unsigned*)($esp+4)
cont
end
run < /tmp/in.txt
```

On voit `n=12`, le buffer `0x8054222`, un seul `CMP` `0x52` contre `0x7a`, puis `WRITE` de `FAILED`. Même script avec `iWasteMyTime` : douze `CMP` égaux, puis `WIN`.

Le PC VM est le dword `0x8055504`. L’opcode fetch est `0x8048d59` (`movzx eax, byte ptr [eax+0x8054130]`). Y poser un breakpoint avant le `read` noie le log : les zéros d’en-tête et le MBA font un fetch par octet.

## Vérification

OK :

```bash
printf 'iWasteMyTime' | ./analysis/qvm32
# ENTER PASS :WIN
# exit 255
```

KO :

```bash
printf 'iWasteMyTimE' | ./analysis/qvm32
# ENTER PASS :FAILED
# exit 0

printf 'test\n' | ./analysis/qvm32
# ENTER PASS :FAILED
```

`python3 tools/timemachine-solve.py --check` décompresse `original/qvm32.gz` et exige `WIN` dans la sortie.

## Notes

- Le volume de `.text` n’est pas une VM dont chaque instruction native est le bytecode : le bytecode est dans `.data` (`0x8054130`), et `.text` est l’interpréteur avec `pc+1` obfusqué.
- `0xEE` dans l’image (juste après le prompt) est l’opcode d’arrêt, pas la fin de la chaîne `ENTER PASS :`.
- x64dbg ne s’applique pas (ELF Linux). Le MCP `ida` ouvre le binaire ; Hex-Rays sur `main` entier ne sert à rien, le MBA casse le pseudo. Le désassemblage ciblé (`objdump` / Capstone) suffit.
- Pas de keygen par nom : un seul mot de passe.