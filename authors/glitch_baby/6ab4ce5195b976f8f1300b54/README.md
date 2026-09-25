# Glitch_Baby's Wheredakey

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ab4ce5195b976f8f1300b54) · id `6ab4ce5195b976f8f1300b54`

ELF64 **C** non strippé (PIE, GCC 13.3 Ubuntu). Source compilée : `wheredakey.c`.  
Premier crackme de l’auteur. Famille : [`../README.md`](../README.md).

| Fichier | Rôle |
|---|---|
| [`original/wheredakey`](original/wheredakey) | ELF (binaire suivi) |
| [`original/Wheredakey.zip`](original/Wheredakey.zip) | zip imbriqué tel que livré par le site |
| [`original/README.md`](original/README.md) | mot de l’auteur dans le zip |
| [`tools/wheredakey-solve.py`](tools/wheredakey-solve.py) | reconstruit le password / `--check` |

## Réponse

| | |
|---|---|
| **Password** | `BashQc3fZ16AjD701x0O` |
| OK | `Nice bruh you got it` |
| KO | ` Nuh uh, Study more bruh` (la chaîne commence par `\n`) |

```bash
python3 tools/wheredakey-solve.py -q
# BashQc3fZ16AjD701x0O
printf '%s\n' BashQc3fZ16AjD701x0O | ./original/wheredakey
python3 tools/wheredakey-solve.py --check
```

Le binaire appelle `exit(0)` sur le chemin KO : le code de sortie ne distingue pas un succès d’un échec. L’oracle est la chaîne affichée.

---

## 1. Premier regard

Le ZIP crackmes.one contient un second zip, sans mot de passe :

```text
Wheredakey/README.md     117 octets
Wheredakey/wheredakey  16232 octets
```

```text
wheredakey: ELF 64-bit LSB pie executable, x86-64, dynamically linked, not stripped
interpreter  /lib64/ld-linux-x86-64.so.2
compiler     GCC (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
sha256       e6900a12db890a69850d532edaae3acc0df5a010b27c7645c2812009bc17021f
size         16232
```

`readelf -s` donne `main` à la VMA **0x1209** (295 octets). Imports utiles : `puts`, `printf`, `scanf`, `strcat`, `strcmp`, `exit`.

```bash
strings -n 4 original/wheredakey
nm original/wheredakey | grep -E 'main|wheredakey'
```

Le dialogue est en clair dans `.rodata` (fichier offset = VMA) :

| VMA | Chaîne |
|---|---|
| `0x2008` | `This crackme is brought to you by GlitchBaby\n\n` |
| `0x2037` | `Enter the Password: ` |
| `0x204c` | `%s` |
| `0x204f` | `\n Nuh uh, Study more bruh` |
| `0x2069` | `Nice bruh you got it` |

`strings` remonte aussi `BashH`, `Qc3f`, `6AjD701xH`, `PTE1`, `u+UH`. Aucune de ces chaînes n’est le password (voir §3.4).

Le README de l’auteur, dans le zip :

```text
Wassup guys! This my first crackme and I solved it too. I hope you learn what I learnt. All the best!
 ~Glitchbaby
```

---

## 2. Flow

1. `puts` du bandeau, `printf` du prompt.
2. `scanf("%s", rbp-0x40)` — pas de largeur.
3. Trois tampons pile déjà remplis par des immediates. Deux `strcat` collent le 2ᵉ puis le 3ᵉ au 1ᵉʳ.
4. `strcmp(saisie, buffer)`. Égalité → `puts` du message OK et `return 0`. Sinon → `puts` du message KO et `exit(0)`.

Pas d’anti-debug, pas de username : le secret est un password fixe.

---

## 3. Comment on trouve le password

### 3.1 Ancrage

```bash
objdump -d -M intel --disassemble=main original/wheredakey
```

Tout le prédicat est dans `main` (`0x1209`–`0x132f`). Les immediates intéressants commencent à `0x1224`.

```asm
1209:  endbr64
120d:  push   rbp
120e:  mov    rbp, rsp
1211:  add    rsp, -0x80
1215:  mov    rax, QWORD PTR fs:0x28
121e:  mov    QWORD PTR [rbp-0x8], rax      ; canary
1222:  xor    eax, eax

1224:  mov    DWORD PTR [rbp-0x7c], 0x14       ; 20, jamais relu

; --- tampon destination, rbp-0x60 ---
122b:  mov    QWORD PTR [rbp-0x60], 0x68736142 ; imm32 sign-étendu → "Bash\0\0\0\0"
1233:  mov    QWORD PTR [rbp-0x58], 0
123b:  mov    QWORD PTR [rbp-0x57], 0          ; zéros qui se chevauchent :
1243:  mov    QWORD PTR [rbp-0x4f], 0          ; queue du buffer de 32 octets

; --- fragment B, rbp-0x72 ---
124b:  mov    DWORD PTR [rbp-0x72], 0x66336351 ; "Qc3f"
1252:  mov    DWORD PTR [rbp-0x6f], 0x315a66   ; "fZ1\0"  (réécrit le dernier 'f')

; --- fragment C, rbp-0x6b ---
1259:  movabs rax, 0x78313037446a4136          ; "6AjD701x"
1263:  mov    QWORD PTR [rbp-0x6b], rax
1267:  mov    DWORD PTR [rbp-0x64], 0x4f3078   ; "x0O\0"  (réécrit le dernier 'x')

126e:  lea    rdi, [rip+0xd93]                ; 0x2008  bandeau
1278:  call   puts
127d:  lea    rdi, [rip+0xdb3]                ; 0x2037  "Enter the Password: "
128c:  call   printf
1291:  lea    rsi, [rbp-0x40]
1298:  lea    rdi, [rip+0xdad]                 ; 0x204c  "%s"
12a7:  call   __isoc99_scanf

12ac:  lea    rsi, [rbp-0x72]                 ; "Qc3fZ1"
12b0:  lea    rdi, [rbp-0x60]                 ; "Bash"
12ba:  call   strcat
12bf:  lea    rsi, [rbp-0x6b]                 ; "6AjD701x0O"
12c3:  lea    rdi, [rbp-0x60]
12cd:  call   strcat                          ; rax = destination

12d2:  mov    rdx, rax
12d5:  lea    rax, [rbp-0x40]                 ; saisie
12d9:  mov    rsi, rdx
12dc:  mov    rdi, rax
12df:  call   strcmp                          ; strcmp(saisie, construit)
12e4:  mov    DWORD PTR [rbp-0x78], eax
12e7:  cmp    DWORD PTR [rbp-0x78], 0
12eb:  je     1306                            ; OK
12ed:  lea    rdi, [rip+0xd5b]                ; 0x204f  KO
12f7:  call   puts
12fc:  mov    edi, 0
1301:  call   exit                             ; exit(0) même en échec
1306:  lea    rdi, [rip+0xd5c]                ; 0x2069  OK
1310:  call   puts
1315:  xor    eax, eax
       ; … check canary, leave, ret
```

`mov r/m64, imm32` (`48 c7 …`) signe-étend l’immédiat. `0x68736142` a le bit 31 à 0, donc les 4 octets hauts sont nuls : le qword écrit est `42 61 73 68 00 00 00 00`.

### 3.2 Carte de pile

Frame de `0x80` octets. Du plus loin de `rbp` vers `rbp` :

| Emplacement | Rôle | Contenu une fois les stores faits |
|---|---|---|
| `rbp-0x7c` | dword mort | `0x14` (20) |
| `rbp-0x78` | retour de `strcmp` | encore 0 avant l’appel |
| `rbp-0x72` | fragment B | `Qc3fZ1\0` (7 octets, NUL en `rbp-0x6c`) |
| `rbp-0x6b` | fragment C | `6AjD701x0O\0` (11 octets, NUL en `rbp-0x61`) |
| `rbp-0x60` | destination | `Bash\0` puis la place des `strcat` (32 octets, jusqu’à `rbp-0x40`) |
| `rbp-0x40` | saisie `scanf` | 0x38 octets avant le canary |
| `rbp-0x8` | canary | `fs:0x28` |

Le NUL du fragment C tombe en `rbp-0x61`, juste avant le `'B'`. Les trois tampons sont contigus et distincts.

### 3.3 Chevauchement des immediates

GCC pose un `char[]` court par un store large, puis un store plus petit qui recouvre la fin pour placer le NUL. Little-endian : l’octet de poids faible est écrit à l’adresse la plus basse.

Fragment B, `"Qc3fZ1"` :

| Adresse | `mov dword [rbp-0x72], 0x66336351` | puis `mov dword [rbp-0x6f], 0x315a66` |
|---|---|---|
| `rbp-0x72` | `Q` | `Q` |
| `rbp-0x71` | `c` | `c` |
| `rbp-0x70` | `3` | `3` |
| `rbp-0x6f` | `f` | `f` (réécrit, même octet) |
| `rbp-0x6e` | | `Z` |
| `rbp-0x6d` | | `1` |
| `rbp-0x6c` | | `\0` |

`0x315a66` tient sur 3 octets utiles ; le dword les complète par un NUL.

Fragment C, `"6AjD701x0O"` :

| Adresse | `movabs 0x78313037446a4136` | puis `mov dword [rbp-0x64], 0x4f3078` |
|---|---|---|
| `rbp-0x6b` … `rbp-0x65` | `6 A j D 7 0 1` | inchangé |
| `rbp-0x64` | `x` | `x` (réécrit) |
| `rbp-0x63` | | `0` |
| `rbp-0x62` | | `O` |
| `rbp-0x61` | | `\0` |

Décodage des immediates :

| Immédiat | Store | ASCII |
|---|---|---|
| `0x68736142` | qword via imm32 en `rbp-0x60` | `Bash` |
| `0x66336351` | dword en `rbp-0x72` | `Qc3f` |
| `0x00315a66` | dword en `rbp-0x6f` | `fZ1\0` |
| `0x78313037446a4136` | qword en `rbp-0x6b` | `6AjD701x` |
| `0x004f3078` | dword en `rbp-0x64` | `x0O\0` |

### 3.4 Ce que `strings` recolle

`strings` lit le fichier, pas la pile. L’immédiat est suivi de l’opcode d’après.

| Affiché | Offset fichier | Octets réels |
|---|---|---|
| `BashH` | `0x122f` | `42 61 73 68` puis REX `48` du `mov` suivant |
| `Qc3f` | `0x124e` | `51 63 33 66` ; l’octet suivant est `c7` (pas imprimable) |
| `6AjD701xH` | `0x125b` | `36 41 6a 44 37 30 31 78` puis REX `48` |
| `PTE1` | `0x1131` | dans `_start` (`and rsp, -16` / `push rax`) |
| `u+UH` | `0x11cb` | dans `__do_global_dtors_aux` |

Le password assemblé ne figure nulle part en une seule C-string.

### 3.5 Assemblage

`strcat` ajoute le fragment B, puis le fragment C, au tampon qui contient déjà `Bash` :

| Étape | `rbp-0x60` |
|---|---|
| après les stores | `Bash` |
| `strcat(..., rbp-0x72)` | `BashQc3fZ1` |
| `strcat(..., rbp-0x6b)` | `BashQc3fZ16AjD701x0O` |

Longueurs : 4 + 6 + 10 = **20** = `0x14`, la valeur du dword mort en `rbp-0x7c`. Le check ne la relit pas ; `strcmp` seul décide.

Équivalent du corps de `main` :

```c
char dest[] = "Bash";          /* buffer assez grand pour les strcat */
char frag_b[] = "Qc3fZ1";
char frag_c[] = "6AjD701x0O";
char in[56];
puts("This crackme is brought to you by GlitchBaby\n");
printf("Enter the Password: ");
scanf("%s", in);
strcat(dest, frag_b);
strcat(dest, frag_c);
if (strcmp(in, dest) != 0) {
    puts("\n Nuh uh, Study more bruh");
    exit(0);
}
puts("Nice bruh you got it");
```

Même reconstruction que le solveur :

```python
mem = bytearray(0x80)
def st(off, val, n):
    i = 0x80 + off
    mem[i:i+n] = val.to_bytes(n, "little")
def cs(off):
    i = 0x80 + off
    return bytes(mem[i:mem.index(0, i)])

st(-0x60, 0x68736142, 8)
st(-0x72, 0x66336351, 4)
st(-0x6F, 0x00315A66, 4)
st(-0x6B, 0x78313037446A4136, 8)
st(-0x64, 0x004F3078, 4)
pw = cs(-0x60) + cs(-0x72) + cs(-0x6B)   # b"BashQc3fZ16AjD701x0O"
```

---

## 4. Debug GDB (pas à pas)

PIE, symbole `main` présent. `break *main+…` est relogé par GDB ; la VMA non relogée de `main` est `0x1209`.

```bash
gdb -q -ex 'set debuginfod enabled off' ./original/wheredakey
(gdb) break *main+0x65      # 0x126e, juste après le dernier store, avant puts
(gdb) run
Bash
(gdb) x/s $rbp-0x60
(gdb) x/s $rbp-0x72
(gdb) x/s $rbp-0x6b
```

Session réelle, avant les `strcat` :

```text
0x7fffffffd5c0: "Bash"
0x7fffffffd5ae: "Qc3fZ1"
0x7fffffffd5b5: "6AjD701x0O"
```

Écarts : `0x5c0 - 0x5ae = 0x12` (`rbp-0x60` moins `rbp-0x72`), `0x5c0 - 0x5b5 = 0xb` (`rbp-0x6b`).

Second stop sur l’appel `strcmp` (`main+0xd6` = VMA `0x12df`), saisie volontairement fausse `petik` :

```bash
(gdb) break *main+0xd6
(gdb) run
petik
(gdb) printf "rdi = %s\n", $rdi
(gdb) printf "rsi = %s\n", $rsi
```

```text
rdi = petik
rsi = BashQc3fZ16AjD701x0O
```

`rdi` est le tampon `scanf` (`rbp-0x40`), `rsi` le retour du second `strcat` (`rbp-0x60`). Avec le bon password les deux chaînes sont identiques et le `je` en `0x12eb` part vers `0x1306`.

Quand stdout n’est pas un tty, la libc le bufferise par blocs : sous `gdb -batch` le bandeau et le prompt n’apparaissent qu’au flush de fin de processus. Le binaire lui-même affiche le prompt avant `scanf`.

---

## 5. Vérification

```bash
python3 tools/wheredakey-solve.py -q
printf '%s\n' BashQc3fZ16AjD701x0O | ./original/wheredakey
printf '%s\n' petik | ./original/wheredakey
python3 tools/wheredakey-solve.py --check
```

OK :

```text
This crackme is brought to you by GlitchBaby

Enter the Password: Nice bruh you got it
```

KO (`petik`, et aussi une ligne vide) — exit code **0** dans les deux cas :

```text
This crackme is brought to you by GlitchBaby

Enter the Password:
 Nuh uh, Study more bruh
```

`--check` exige le message OK sur le password reconstruit, et le message KO sur `petik`. Un test qui ne regarderait que `$?` passerait aussi sur un mauvais mot.

---

## 6. Notes

- Le secret est le collage `Bash` + `Qc3fZ1` + `6AjD701x0O`. Le dword `0x14` en `rbp-0x7c` a la bonne longueur et n’est jamais relu.
- `scanf("%s")` sans largeur. Le password tient (21 octets avec le NUL) dans les 32 octets du tampon destination et dans la saisie.
- Les deux issues terminent avec le status 0 (`exit(0)` vs `return 0`).
- Le sha256 du zip site (`956cd48a…`) n’est pas celui de l’ELF. `ORIGIN.yml` suit `original/wheredakey` ; le zip est en `binary.companion`.
