# timotei-crackme-04

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ecb906533c5d449d91ae616) · id `5ecb906533c5d449d91ae616`


Crackme ELF64 Linux, asm statique, **strippé**. Suite directe du #01 : même FNV-1, même scène (+ORC / +HCU).
Auteur : timotei (crackmes.one). Analyse statique + reconstruction.

Dossier : `authors/timotei/5ecb906533c5d449d91ae616/` — [série](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`timotei-crackme-04`](original/timotei-crackme-04) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`timotei-crackme-04-solve.py`](tools/timotei-crackme-04-solve.py) | solveur FNV-1 + patch EP (section 6) |
| [`timotei-crackme-04-idapro.asm`](analysis/timotei-crackme-04-idapro.asm) | listing IDA (section 8) |
| [`timotei-crackme-04-idapro.c`](analysis/timotei-crackme-04-idapro.c) | Hex-Rays 9.4 (section 8) |
| [`timotei-crackme-04.c`](tools/timotei-crackme-04.c) | équivalent C à la main (section 8) |
| [`timotei-crackme-04-nasm.asm`](tools/timotei-crackme-04-nasm.asm) | source reconstruit NASM (section 9) |
| [`timotei-crackme-04-fasm.asm`](tools/timotei-crackme-04-fasm.asm) | source reconstruit FASM (section 9) |

Réponse acceptée :

| Input | Valeur | Rôle |
|---|---|---|
| `argv[1]` | `+ORC` | unique match FNV-1 32 bits, 4 octets imprimables |

Lancer le binaire **tel quel** ne suffit pas : l’entry point est un stub `push out / ret` qui `exit(0)` tout de suite. Il faut partir de `0x401007` (patch `e_entry`, ou 7 NOP). Ensuite `./timotei-crackme-04 '+ORC'` affiche `_.:solved:._`.

---

## 1. Premier regard

```
file timotei-crackme-04
# ELF 64-bit LSB executable, x86-64, statically linked, stripped

readelf -h  → Entry point 0x401000
readelf -S  → .text 0x73 octets @ 0x401000 (même taille que le #02), .data 0x242 @ 0x402000
nm          → no symbols
strings -a -t x
```

Chaînes utiles :

| VA | Label reconstruit | Texte | Référencé ? |
|---|---|---|---|
| `0x402000` | `Credit` | `._:timotei crackme#4:_:.\0` | jamais |
| `0x402019` | `good` | `_.:solved:._\n\0` | `write` 0x0E octets |
| `0x402027` | `riddle` | héraldique + `hint: … Fowler,Noll and Vo …` | **jamais** (539 o, pas de `0` final) |

DIE : « Unknown ». 3 `PT_LOAD` paginés 4K, syscalls x64 uniquement (`write` / `exit`). Pas d’`int 0x80` (contrairement au #03).

Hashes : MD5 `6d82bae021fbc1b808013689bd5c473e`, SHA256 `fdb1884fed91315ccfa8685221ecaaa6364a40733a4182d9b12476c67224ee2a`.

```
./timotei-crackme-04
./timotei-crackme-04 '+ORC'
# les deux : silence, exit 0
```

Le mot de passe seul ne suffit pas. Il faut lire les **7 premiers octets**.

---

## 2. Flow global

```
_start (0x401000)                    ; EP ELF
    nop
    push 0x401069                    ; &out
    ret                              ; → exit(0)  TOUJOURS

real_start (0x401007)                ; jamais atteint sans patch
    si argc != 2 : exit
    strlen(argv[1])
    si != 4 : exit
    FNV-1 32 bits sur 4 octets
    si hash != 0x6FCD79A2 : exit
    write(stdout, good, 0x0E)        ; _.:solved:._\n\0
    exit(0)
```

Deux prédicats indépendants :

1. **Contrôle de flux** — l’EP est un leurre. Sans patch / `gdb` / nouveau `e_entry`, le FNV n’est jamais exécuté.
2. **FNV-1** — même algo que le #01 (`0x811C9DC5` / `0x01000193`), autre cible.

Pas de stdin. `argv[1]`, exactement 4 octets (`sub ecx, 4` / `jne`, pas un `cmp`).

---

## 3. Le leurre à l’entry point

```
401000  nop
401001  push  0x401069          ; 68 69 10 40 00
401006  ret                     ; c3
401007  cmp   byte [rsp], 2     ; vrai start
…
401069  out:
401069  mov   eax, 60
40106e  xor   rdi, rdi
401071  syscall                 ; sys_exit
```

`push imm32 / ret` = `jmp` vers `out`. Les 7 octets `90 68 69 10 40 00 C3` avalent tout lancement normal.

Deux patches équivalents (sur une **copie**) :

```
# A. e_entry 0x401000 → 0x401007  (octet fichier 0x18)
# B. NOP des 7 premiers octets du .text (fichier 0x1000)
```

Le solveur fait A. `gdb` : `break *0x401000` puis `set $pc=0x401007`.

Ce n’est pas un anti-debug : pas de `ptrace`, pas de timing. Juste un EP qui ne tombe pas sur le check.

---

## 4. Comment `+ORC` a été trouvé

### L’algo

```
401024  mov  rsi, [rsp+0x10]        ; argv[1]
401029  mov  ecx, 4
40102e  mov  eax, 0x811C9DC5
401033  mov  edi, 0x01000193
401038  xor  ebx, ebx
40103a  nextbyte:
40103a  mul  edi                    ; eax = eax * prime
40103c  mov  bl, [rsi]
40103e  xor  eax, ebx
401040  inc  rsi
401043  dec  ecx
401045  jne  nextbyte
401047  cmp  eax, 0x6FCD79A2
40104c  jne  out
```

| Constante | Valeur | Identité |
|---|---|---|
| `0x811C9DC5` | 2166136261 | FNV-1 32-bit **offset basis** |
| `0x01000193` | 16777619 | FNV-1 32-bit **prime** |
| `0x6FCD79A2` | — | hash cible |

`mul` puis `xor` : **FNV-1**, pas FNV-1a. Identique au 2ᵉ check du #01 (cible `0x86CFDCF8` → `+HCU`).

### Piste sémantique

Le `.data` n’est jamais affiché. On le lit dans le dump :

> hint: He is a legend so far for the cue, tell me to whom does this question leads to? To prove your thoughts to be dead right, Fowler,Noll and Vo stays on your side.

- **Fowler, Noll et Vo** = FNV. Confirme l’algo.
- Le #01 demandait *où* +Fravia enseignait → **+HCU**.
- +HCU a été fondée par **+ORC** (*Old Red Cracker*), le prof légendaire de la scène RCE 90s. Quatre caractères, pile la taille du hash.
- Le pavé héraldique (heaumes or / argent / acier) n’est référencé nulle part : décor, ou une autre couche de « who wears the helm ».

On teste le candidat évident :

```
'+' = 0x2b
'O' = 0x4f
'R' = 0x52
'C' = 0x43
```

| i | octet | `h * prime` (32 bits) | XOR | nouveau `h` |
|---|---|---|---|---|
| 0 | `+` `0x2b` | `0x811c9dc5 * 0x01000193 = 0x050c5d1f` | `^ 0x2b` | `0x050c5d34` |
| 1 | `O` `0x4f` | `0x050c5d34 * 0x01000193 = 0x2676b8dc` | `^ 0x4f` | `0x2676b893` |
| 2 | `R` `0x52` | `0x2676b893 * 0x01000193 = 0x1fe48f69` | `^ 0x52` | `0x1fe48f3b` |
| 3 | `C` `0x43` | `0x1fe48f3b * 0x01000193 = 0x6fcd79e1` | `^ 0x43` | **`0x6fcd79a2`** |

Match exact. `+HCU`, `ORC+`, `HCU+` ne matchent pas.

### Unicité

Même inversion que le #01 : on énumère 3 octets imprimables, on calcule le 4ᵉ. **Un seul** hit : `b'+ORC'`.

---

## 5. Vérification sur le binaire

Sans patch :

```
$ ./timotei-crackme-04 '+ORC'     # silence
$ ./timotei-crackme-04            # silence
```

Avec `e_entry` → `0x401007` (copie) :

```
$ ./timotei-crackme-04-patched '+ORC'
_.:solved:._
$ ./timotei-crackme-04-patched '+HCU'     # silence
$ ./timotei-crackme-04-patched '+ORC' extra   # argc==3, silence
```

Le `write` envoie 14 octets : `_.:solved:._\n` puis un `0`.

```bash
python3 timotei-crackme-04-solve.py
```

---

## 6. Solveur Python

Fichier : [`timotei-crackme-04-solve.py`](tools/timotei-crackme-04-solve.py).

**Ce n’est pas un lanceur.** `python3 timotei-crackme-04-solve.py` ne remplace pas `./timotei-crackme-04 '+ORC'`. Le binaire d’origine, lui, se tait toujours (voir section 3) : `rt` et `+ORC` sont identiques. Le script sert à comprendre et à *montrer* la différence, pas à « cracker en live » sur le fichier du dossier.

Il fait trois choses, dans l’ordre :

1. **Rejouer le FNV-1 en Python** — mêmes constantes que `0x40102E` / `0x401033` / `0x401047`. On peut hasher un candidat sans exécuter le process (et donc sans se faire avoir par le stub).
2. **Prouver l’unicité** — inversion du dernier XOR, 96³ tests imprimables, un seul hit : `b'+ORC'`.
3. **Comparer original vs check réel** — copie dans `/tmp`, `e_entry` (octet fichier `0x18`) passé de `0x401000` à `0x401007`, `exec`, suppression de la copie. Le `timotei-crackme-04` du dossier n’est **pas** modifié.

```bash
python3 timotei-crackme-04-solve.py
```

Sortie utile, à la fin :

```
=== live pw='+ORC' patch=False rc=0 ===
b''                          ← stub, argv ignoré (comme ./timotei-crackme-04 +ORC)

=== live pw='+ORC' patch=True rc=0 ===
b'_.:solved:._\n\x00'        ← e_entry = 0x401007, le FNV tourne

=== live pw='+HCU' patch=True rc=0 ===
b''                          ← bon EP, mauvais hash
```

| Fonction | Rôle |
|---|---|
| `fnv1_32(data)` | FNV-1 32 bits, `mul` puis `xor` (`nextbyte`) |
| `fnv1_trace(data)` | les 4 tours, pour recoller au listing |
| `brute_fnv_printable()` | inverse le dernier XOR → `[b'+ORC']` |
| `patch_entry(src, ep)` | copie + `e_entry` ; `os.close` du mkstemp sinon `ETXTBSY` |
| `run_binary(pw, patch=)` | `patch=False` : original. `True` : copie, puis unlink |

Cœur du prédicat (indépendant de l’EP) :

```python
def fnv1_32(data: bytes) -> int:
    h = 0x811C9DC5
    for b in data:
        h = (h * 0x01000193) & 0xFFFFFFFF
        h ^= b
    return h  # cible == 0x6FCD79A2
```

Le docstring en tête du `.py` dit la même chose : le relire avant de relancer `./timotei-crackme-04`.

---

## 7. Récap des adresses

| VA | Quoi |
|---|---|
| `0x401000` | `_start` — `nop` / `push out` / `ret` |
| `0x401007` | `real_start` — `cmp byte [rsp], 2` |
| `0x40101f` | `sub ecx, 4` — strlen exact |
| `0x40103a` | `nextbyte` — FNV-1 |
| `0x401047` | `cmp eax, 0x6FCD79A2` |
| `0x40104e` | `write` du succès |
| `0x401069` | `out` — `exit(0)` |
| `0x402019` | `good` |
| `0x402027` | `riddle` (mort, 539 o) |

Un mauvais hash, un mauvais `argc` ou un lancement non patché : même symptôme, `exit 0` silencieux. Lire le `cmp` / l’EP, pas le code de retour.

---

## 8. Dumps IDA Pro (asm + Hex-Rays)

Fichiers ajoutés :

| Fichier | Origine |
|---|---|
| [`timotei-crackme-04-idapro.asm`](analysis/timotei-crackme-04-idapro.asm) | listing IDA (Intel) |
| [`timotei-crackme-04-idapro.c`](analysis/timotei-crackme-04-idapro.c) | Hex-Rays 9.4 (`start` uniquement) |
| [`timotei-crackme-04.c`](tools/timotei-crackme-04.c) | C à la main, juste le prédicat à `0x401007` |

Hashes IDA = ceux de `diec` : MD5 `6D82BAE021FBC1B808013689BD5C473E`, SHA256 `FDB1884F…EE2A`.

### Ça correspond

Le listing IDA est le même graphe que `objdump` / le NASM :

| Listing IDA | Ce qu’on avait |
|---|---|
| `nop` / `push offset loc_401069` / `retn` | stub EP → `out` |
| `cmp byte ptr [rsp+0], 2` | `argc == 2` |
| `sub ecx, 4` / `jnz loc_401069` | strlen exact 4 |
| `eax=811C9DC5h`, `edi=1000193h` | FNV-1 offset / prime |
| `loc_40103A` : `mul` / `xor` / `dec ecx` | `nextbyte` |
| `cmp eax, 6FCD79A2h` | cible `+ORC` |
| `sys_write` `buf`, `0Eh` | `_.:solved:._\n\0` |
| `loc_401069` : `eax=3Ch` | `sys_exit` |

`[rsp+arg_8]` = `[rsp+10h]` = `argv[1]`. Même adresse, mauvais nom de frame (comme au #02).

### Ce que Hex-Rays a (presque rien) reconstruit

Le `.c` entier tient en une ligne utile :

```c
void __noreturn start(...)
{
  sys_exit(0);
}
```

C’est **juste**, et c’est le piège. Hex-Rays part de l’EP `0x401000`, voit `push out / ret`, et s’arrête : tout ce qui suit le `retn` est mort pour le décompilé. D’où `./timotei-crackme-04 rt` == `./timotei-crackme-04 +ORC` : le C d’IDA décrit exactement ce que le process fait au lancement.

Le FNV, `+ORC`, le `write` de `solved` : **absents du Hex-Rays**. Ils ne sont que dans le `.asm`, après le `retn`, sans label `real_start`.

### Pièges dans ces dumps

1. **« Compiler : GNU C++ »** — faux. Asm à la main. En-tête MASM `.686p` / `.model flat` : artefact 32 bits.

2. **Hex-Rays = le stub, pas le crackme.** Si on ne lit que le `.c`, on conclut « ça exit, rien à cracker ». Il faut forcer la désassemblage après `0x401006` (ou patcher `e_entry` et redécompiler).

3. **Pas de label à `0x401007`.** Le `cmp [rsp], 2` est collé juste sous le `retn` dans le même `start proc`. IDA n’en fait pas une fonction.

4. **Le riddle n’est pas une chaîne.** 539 octets, pas de `0` final → IDA dump `db 27h ; '` … `db 2Eh ; .` octet par octet. Pas de label `hint:`, pas de `Fowler,Noll and Vo` en clair dans un `db '…'`. Il faut relire le dump ou `strings`.

5. **`buf` = 14 octets, OK.** `_.:solved:._\n\0`, taille du `write`. `aTimoteiCrackme` (Credit) n’est jamais référencé — Hex-Rays ne le montre pas.

En pratique : le `.c` IDA pour *comprendre le silence au lancement* ; le `.asm` pour le FNV et les constantes ; le C à la main / le solveur pour `+ORC`.

### C à la main

Fichier : [`timotei-crackme-04.c`](tools/timotei-crackme-04.c). Le stub EP n’y figure pas : c’est le prédicat à `0x401007`.

```c
if (argc != 2 || strlen(argv[1]) != 4)
    return 0;
h = 0x811C9DC5u;
for (i = 0; i < 4; i++) {
    h *= 0x01000193u;
    h ^= p[i];
}
if (h == 0x6FCD79A2u)
    syscall(SYS_write, 1, good, 0x0E);
```

---

## 9. Source reconstruit (NASM + FASM)

Pas le fichier auteur. Même verdict que #01–#03 : FASM d’origine (ELF `executable`, 3 `PT_LOAD` 4K).

### 9.1 Fichiers

| Fichier | Assembleur | Binaire de test | Résultat |
|---|---|---|---|
| [`timotei-crackme-04-nasm.asm`](tools/timotei-crackme-04-nasm.asm) | NASM 2.16.01 | `timotei-crackme-04-nasm.bin` | **`.text` et `.data` identiques** |
| [`timotei-crackme-04-fasm.asm`](tools/timotei-crackme-04-fasm.asm) | FASM 1.73.32 | `timotei-crackme-04-fasm.bin` (869 o) | même comportement ; ELF tassé |

### 9.2 Compiler

```bash
nasm -f elf64 -o timotei-crackme-04-nasm.o timotei-crackme-04-nasm.asm
ld -nostdlib -static -no-pie \
   -o timotei-crackme-04-nasm.bin timotei-crackme-04-nasm.o

fasm.x64 timotei-crackme-04-fasm.asm timotei-crackme-04-fasm.bin
```

Les reconstructions **reproduisent le leurre**. Sans patch, `+ORC` ne suffit toujours pas.

### 9.3 Vérification live (7 NOP sur l’EP)

| argv[1] | Original | NASM | FASM |
|---|---|---|---|
| `+ORC` (non patché) | silence | silence | silence |
| `+ORC` (patché) | `solved` | `solved` | `solved` |
| `+HCU` (patché) | silence | silence | silence |

### 9.4 Data — layout exact

`file off 0x2000`, VA `0x402000`, taille `0x242`.

| Label | VA | Taille | Contenu | Écrit |
|---|---|---:|---|---|
| `Credit` | `0x402000` | 25 | `._:timotei crackme#4:_:.\0` | jamais |
| `good` | `0x402019` | 14 | `_.:solved:._\n\0` | 14 (`0x0E`), `0` compris |
| `riddle` | `0x402027` | 539 | `'Gold, … gentleman.'hint: … side.` | jamais |

Pas de `0` après `riddle` : il colle au bout de `.data`. En source : `db "…side."` **sans** `, 0`, sinon `.data` passe à `0x243`.

### 9.5 Encodings recopiés

| Source | Encodage | Pourquoi |
|---|---|---|
| `nop` / `push out` / `ret` | `90` `68 69 10 40 00` `C3` | leurre EP |
| `sub ecx, ecx` / `sub al, al` | `29 C9` / `28 C0` | pas `xor` |
| `sub ecx, 4` | `83 E9 04` | strlen == 4 |
| `mov rsi, good` | `48 BE …` movabs 10 o | FASM : `db 48h, 0BEh` / `dq good` |

### 9.6 Différences reconstruction ↔ original

| | Original (2020) | NASM 2.16 | FASM 1.73 |
|---|---|---|---|
| Taille | 9056 | 9584 | 869 |
| EP | `0x401000` | `0x401000` | `~0x4000B0` (même stub) |
| Data VA | `0x402000` | `0x402000` | collée après le code |
| Listing `objdump -d` | référence | **identique** | pas de `.text` visible |
