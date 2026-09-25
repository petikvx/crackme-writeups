# jeffli6789's Orbit Fold

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ab1e2bf5c861323b6300702) · id `6ab1e2bf5c861323b6300702`

ELF64 **C** strippé (PIE, GCC 14.4.0). Un flag de 23 octets, checksum puis une passe par indice.  
Famille : [`../README.md`](../README.md) — [wallpaper](../69a2911b7a778cfffbfb67ca/), [x86](../5f01df5633c5d4285070948b/), [Maze](../5f009fa233c5d42850709479/).

| Fichier | Rôle |
|---|---|
| [`original/orbit_fold_linux_x86_64`](original/orbit_fold_linux_x86_64) | binaire |
| [`tools/orbit-fold-solve.py`](tools/orbit-fold-solve.py) | relit key + permutation / `--check` |

## Réponse

| | |
|---|---|
| **Flag** | `CMO{orbit_folded_twice}` |
| OK | `Correct. Submit that flag to claim your points.` (exit 0) |
| KO | `No orbit. Try again.` (exit 1) |

```bash
python3 tools/orbit-fold-solve.py -q
# CMO{orbit_folded_twice}
./original/orbit_fold_linux_x86_64 'CMO{orbit_folded_twice}'
printf '%s\n' 'CMO{orbit_folded_twice}' | ./original/orbit_fold_linux_x86_64
python3 tools/orbit-fold-solve.py --check
```

---

## 1. Premier regard

```text
orbit_fold_linux_x86_64: ELF 64-bit LSB pie executable, x86-64, dynamically linked, stripped
compiler   GCC: (GNU) 14.4.0
sha256     ae42024b9b30d25ad37a81675d0363efbad9da74f99952e5080d7c979ccd214f
size       14288
entry      0x1200
```

```bash
file original/orbit_fold_linux_x86_64
strings -n 5 original/orbit_fold_linux_x86_64
objdump -s -j .rodata original/orbit_fold_linux_x86_64
```

Imports : `puts`, `strlen`, `fwrite`, `fgets`, `strcspn`. Pas de `strcmp`.

```text
Orbit Fold - recover the accepted flag.
Correct. Submit that flag to claim your points.
Flag:
No orbit. Try again.
```

`.rodata` (offset fichier = VMA) contient ensuite deux blocs binaires, pas des C-strings :

```text
00002080  3e 2c c3 50 b2 67 f8 59 03 14 fa 19 15 81 ca 96
00002090  85 6d 3d a8 1b d1 f9          key, 23 octets
000020a0  07 00 13 03 0e 16 05 0b 01 11 09 14 06 0d 02 10
000020b0  08 15 04 0c 12 0a 0f          permutation de 0..22
```

Le binaire est strippé : pas de symbole `main`. `_start` (`0x1200`) fait `lea rdi, [rip-0x17b]` vers **`0x10a0`**, c'est la fonction passée à `__libc_start_main`.

---

## 2. Flow

1. `puts` du bandeau.
2. `argc == 2` → le candidat est `argv[1]`. Sinon `fwrite` de `Flag: ` (6 octets, sans saut de ligne), `fgets` de 0x80 octets, `strcspn` sur `"\r\n"` pour couper la fin de ligne, puis le même check.
3. `strlen == 23` (`0x17`). Sinon `No orbit. Try again.` et return 1.
4. Checksum 16 bits, puis la boucle « orbit » sur la permutation. Les deux doivent passer.
5. Succès → le message `Correct…` et return 0.

---

## 3. Comment on trouve le flag

### 3.1 Ancrage

```bash
objdump -d -M intel --start-address=0x10a0 --stop-address=0x11a7 original/orbit_fold_linux_x86_64
xxd -s 0x2080 -l 0x40 original/orbit_fold_linux_x86_64
```

```asm
10a0:  push   rbp
10a1:  mov    rbp, rsi                 ; argv
10a5:  mov    ebx, edi                 ; argc
10a7:  lea    rdi, [rip+0xf5a]         ; 0x2008  bandeau
10b5:  call   puts
10ba:  cmp    ebx, 2
10bd:  jne    11a7                     ; mode prompt

10c3:  mov    rbx, [rbp+8]             ; argv[1]
10ca:  call   strlen
10cf:  cmp    rax, 0x17
10d3:  je     10f0
10d5:  lea    rdi, [rip+0xf8e]         ; 0x206a  "No orbit. Try again."
10dc:  call   puts
10e1:  mov    eax, 1
       ; épilogue, ret

; checksum : rax = 1..23, ecx += s[rax-1] * rax
10f0:  mov    eax, 1
10f5:  xor    ecx, ecx
1100:  movzx  edx, BYTE PTR [rbx+rax-1]
1105:  imul   edx, eax
1108:  add    rax, 1
110c:  add    ecx, edx
110e:  cmp    rax, 0x18
1112:  jne    1100
1114:  cmp    cx, 0x728a
1119:  jne    10d5

; boucle orbit. rsi parcourt les 23 octets en 0x20a0
111b:  lea    rsi, [rip+0xf7e]         ; 0x20a0  permutation
1122:  xor    edi, edi                  ; OR des écarts, bas octet doit rester 0
1124:  lea    r9, [rip+0xf55]          ; 0x2080  key
112b:  mov    r8d, 0xcccccccd           ; multiplicateur « / 5 »
1131:  lea    r10, [rsi+0x17]          ; fin

1140:  movzx  ecx, BYTE PTR [rsi]       ; p
1143:  add    rsi, 1
1147:  lea    eax, [rcx*8]
114e:  movzx  edx, cl                  ; index = p
1156:  sub    eax, ecx                  ; eax = 7*p
1158:  add    eax, 0x31                 ; eax = 7*p + 0x31
115b:  xor    al, BYTE PTR [rbx+rdx]   ; ^= flag[p]
; p % 5 via (p * 0xCCCCCCCD) >> 34
1161:  imul   rdx, r8
1165:  shr    rdx, 0x22
1169:  lea    edx, [rdx+rdx*4]         ; (p/5)*5
116c:  sub    ecx, edx                 ; p % 5
116e:  lea    edx, [rbp+rbp*2]         ; 3*p     (ebp = p)
1172:  add    ecx, 1                   ; rot = (p % 5) + 1
1175:  lea    edx, [rbp+rdx*4]         ; 13*p
1179:  rol    al, cl
117b:  xor    edx, 0x5a                ; (13*p) ^ 0x5a
117e:  add    eax, edx
1180:  xor    al, BYTE PTR [r9+r11]    ; ^= key[p]
1184:  or     edi, eax
1186:  cmp    rsi, r10
1189:  jne    1140
118b:  test   dil, dil                 ; seul le bas octet compte
118e:  jne    10d5
1194:  lea    rdi, [rip+0xe95]         ; 0x2030  "Correct. …"
119b:  call   puts
11a0:  xor    eax, eax
```

`0xCCCCCCCD` puis `shr 34` est la division non signée par 5 : `(p * 0xCCCCCCCD) >> 34 == p / 5`. Le reste est `p - 5*(p/5)`.

Le prompt interactif est à `0x11a7` : `fwrite("Flag: ", 1, 6, stdout)`, `fgets(buf, 0x80, stdin)`, `strcspn(buf, "\r\n")`, NUL à la coupure, puis saut en `0x10c7` (le `strlen`).

### 3.2 Le test ne regarde que `dil`

`or edi, eax` mélange tout `eax`, mais la sortie de boucle est `test dil, dil`. Seul le bas octet de chaque itération doit valoir 0. Pour `p >= 20`, `(13*p) ^ 0x5a` dépasse 255 (350, 331, 324) : le report part dans les bits hauts de `eax`, et `xor al` ne les efface pas. Ça ne fait pas échouer le check.

Équation, octet bas :

```text
rot    = (p % 5) + 1
start  = (7*p + 0x31) ^ flag[p]
rolled = rol8(start, rot)
(rolled + ((13*p) ^ 0x5a)) ^ key[p]   & 0xff  ==  0
```

Donc

```text
rolled  = (key[p] - ((13*p) ^ 0x5a)) & 0xff
flag[p] = ror8(rolled, rot) ^ (7*p + 0x31)
```

La permutation est exactement `{0..22}` : chaque position est fixée une fois. Le checksum `0x728a` ne sert plus à chercher, il confirme.

### 3.3 Exemple `p = 7` (première itération, lettre `i`)

| Étape | Valeur |
|---|---|
| `p` | 7 |
| `rot` | `(7 % 5) + 1 = 3` |
| `7*p + 0x31` | `98` (`0x62`) |
| `flag[7]` | `i` = `0x69` |
| `start` | `0x62 ^ 0x69 = 0x0b` |
| `rol8(0x0b, 3)` | `0x58` |
| `(13*7) ^ 0x5a` | `91 ^ 0x5a = 1` |
| bas octet | `0x58 + 1 = 0x59` |
| `key[7]` | `0x59` |
| écart | `0x59 ^ 0x59 = 0` |

Inverse du même indice : `(0x59 - 1) & 0xff = 0x58`, `ror8(0x58, 3) = 0x0b`, `0x0b ^ 0x62 = 0x69`.

### 3.4 Les 23 positions

| i | car | `7i+0x31` | rot | `((13i)^0x5a) & 0xff` | `key[i]` |
|---|---|---|---|---|---|
| 0 | `C` | 49 | 1 | 90 | `0x3e` |
| 1 | `M` | 56 | 2 | 87 | `0x2c` |
| 2 | `O` | 63 | 3 | 64 | `0xc3` |
| 3 | `{` | 70 | 4 | 125 | `0x50` |
| 4 | `o` | 77 | 5 | 110 | `0xb2` |
| 5 | `r` | 84 | 1 | 27 | `0x67` |
| 6 | `b` | 91 | 2 | 20 | `0xf8` |
| 7 | `i` | 98 | 3 | 1 | `0x59` |
| 8 | `t` | 105 | 4 | 50 | `0x03` |
| 9 | `_` | 112 | 5 | 47 | `0x14` |
| 10 | `f` | 119 | 1 | 216 | `0xfa` |
| 11 | `o` | 126 | 2 | 213 | `0x19` |
| 12 | `l` | 133 | 3 | 198 | `0x15` |
| 13 | `d` | 140 | 4 | 243 | `0x81` |
| 14 | `e` | 147 | 5 | 236 | `0xca` |
| 15 | `d` | 154 | 1 | 153 | `0x96` |
| 16 | `_` | 161 | 2 | 138 | `0x85` |
| 17 | `t` | 168 | 3 | 135 | `0x6d` |
| 18 | `w` | 175 | 4 | 176 | `0x3d` |
| 19 | `i` | 182 | 5 | 173 | `0xa8` |
| 20 | `c` | 189 | 1 | 94 | `0x1b` |
| 21 | `e` | 196 | 2 | 75 | `0xd1` |
| 22 | `}` | 203 | 3 | 68 | `0xf9` |

Lecture : `CMO{orbit_folded_twice}`.

Pour `i = 20, 21, 22` l'addend complet est `0x15e`, `0x14b`, `0x144`. La colonne n'en garde que le bas octet, celui qui entre dans l'équation.

Checksum, multiplicateur = indice + 1 :

```text
sum(ord(c) * (i+1) for i, c in enumerate(flag)) == 0x728a
```

```python
def ror8(x, n):
    n &= 7
    x &= 0xFF
    return ((x >> n) | (x << (8 - n))) & 0xFF

blob = open("original/orbit_fold_linux_x86_64", "rb").read()
key = blob[0x2080:0x2080+23]
perm = blob[0x20A0:0x20A0+23]
flag = [0] * 23
for p in perm:
    rot = (p % 5) + 1
    rolled = (key[p] - ((13 * p) ^ 0x5A)) & 0xFF
    flag[p] = ror8(rolled, rot) ^ ((p * 7 + 0x31) & 0xFF)
# b"CMO{orbit_folded_twice}"
```

---

## 4. Debug GDB (pas à pas)

Binaire **strippé** et **PIE**. `starti` s'arrête dans `ld.so` : le mapping du crackme n'existe pas encore. Un `continue` avec `stop-on-solib-events` le fait apparaître. La base est la première plage `r--p` d'offset `0` (ici `0x555555554000`). L'entrée non relogée reste `0x1200`, le check `0x10a0`, le `cmp cx` `0x1114`, le `xor al, key[p]` `0x1180`.

```bash
gdb -q -ex 'set debuginfod enabled off' ./original/orbit_fold_linux_x86_64
(gdb) set pagination off
(gdb) set stop-on-solib-events 1
(gdb) starti
(gdb) continue
(gdb) info proc mappings
```

```text
0x555555554000  r--p  offset 0x0   orbit_fold_linux_x86_64
0x555555555000  r-xp  offset 0x1000
0x555555556000  r--p  offset 0x2000
```

```gdb
set stop-on-solib-events 0
break *(0x555555554000+0x1114)
break *(0x555555554000+0x1180)
run CMO{orbit_folded_twice}
```

Au `cmp cx, 0x728a` :

```text
Breakpoint 1, 0x0000555555555114
cx = 0x728a
```

Premier tour de la permutation (`p` est dans `r11`, le candidat dans `rbx`, `key` dans `r9`). On s'arrête **avant** le `xor al, key[p]`, donc `al` doit déjà égaler `key[p]` :

```text
Breakpoint 2, 0x0000555555555180
p = 7
s[7] = 0x69    ; 'i'
al = 0x59
key[7] = 0x59
```

Puis le programme affiche `Correct. Submit that flag to claim your points.` Sous GDB, stdout n'est pas un tty : le bandeau sort au flush de fin, après les breakpoints.

---

## 5. Vérification

```bash
python3 tools/orbit-fold-solve.py -q
./original/orbit_fold_linux_x86_64 'CMO{orbit_folded_twice}' ; echo exit:$?
printf '%s\n' 'CMO{orbit_folded_twice}' | ./original/orbit_fold_linux_x86_64 ; echo exit:$?
./original/orbit_fold_linux_x86_64 'CMO{orbit_folded_twicX}' ; echo exit:$?
./original/orbit_fold_linux_x86_64 short ; echo exit:$?
python3 tools/orbit-fold-solve.py --check
```

OK, argument ou stdin :

```text
Orbit Fold - recover the accepted flag.
Correct. Submit that flag to claim your points.
exit:0
```

(le mode stdin insère `Flag: ` juste avant `Correct`.)

KO, 23 octets dont le dernier est faux, et mot trop court : même message, exit 1.

```text
Orbit Fold - recover the accepted flag.
No orbit. Try again.
exit:1
```

`--check` couvre les quatre lancements.

---

## 6. Notes

- Le flag n'est pas une chaîne de `.rodata`. `strings` ne montre que le dialogue.
- `test dil, dil` ignore le report de `(13*p) ^ 0x5a` quand `p` vaut 20, 21 ou 22. L'équation se résout modulo 256.
- `argc == 2` saute le prompt et lit `argv[1]`. Toute autre `argc` passe par `fgets`.
- Frères du même auteur, tous avec une section GDB : [wallpaper](../69a2911b7a778cfffbfb67ca/), [x86](../5f01df5633c5d4285070948b/), [Maze](../5f009fa233c5d42850709479/).
