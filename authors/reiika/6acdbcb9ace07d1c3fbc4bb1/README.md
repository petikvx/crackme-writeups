# stckwzrd — Reiika

| | |
|---|---|
| **ID** | [`6acdbcb9ace07d1c3fbc4bb1`](https://crackmes.one/crackme/6acdbcb9ace07d1c3fbc4bb1) |
| **Auteur (site)** | Reiika |
| **Auteur (local)** | reiika |
| **Plateforme** | Unix/Linux — ELF64 x86-64, C/C++ (GCC 16.2.1), stripped |
| **Difficulté (site)** | Medium (3) |
| **SHA-256** | `3bc0c0c2fbcaf696bfbe613d3745e1d453e7601449e8d449994966868061b7ed` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/stckwzrd` | binaire d’origine (non patché) |
| `analysis/bytecode.txt` | bytecode déchiffré, désassemblé par le solveur (`--dump`) |
| `analysis/verify.txt` | runs natifs OK / KO |
| `tools/stckwzrd-solve.py` | déchiffre le bytecode, émule la VM, inverse la transformation |

## Réponse

```
St4ckW1z4rd_0x5A
```

```bash
python3 tools/stckwzrd-solve.py          # seed=0x5a … serial: St4ckW1z4rd_0x5A
python3 tools/stckwzrd-solve.py --check St4ckW1z4rd_0x5A   # OK
python3 tools/stckwzrd-solve.py --dump   # listing du bytecode
echo St4ckW1z4rd_0x5A | ./original/stckwzrd
```

Pas de nom d’utilisateur ici (ce n’est pas un keygenme) : un seul serial de 16 caractères est accepté.

## Premier regard

```
$ file original/stckwzrd
ELF 64-bit LSB executable, x86-64, dynamically linked, stripped
$ strings original/stckwzrd
ptrace  fgets  strcspn  strlen  puts  printf
  stckwzrd :: the stack wizard guards this gate
  the wizard scoffs. (wrong length)
  the stack unwinds cleanly. ACCESS GRANTED.
  the stack overflows with doubt. denied.
  serial>
```

Aucun serial en clair : comme annoncé dans la description, le check tourne dans une petite VM à pile dont le programme est chiffré. Le `.text` utile est minuscule (`main` à `0x4010b0`, ~700 lignes d’objdump), donc `objdump -d -M intel` suffit, pas besoin d’IDA.

## Flow

1. `ptrace(PTRACE_TRACEME)` (`0x4010d2`) : anti-debug léger qui ne bloque rien, mais change une constante du bytecode.
2. Boucle SSE `0x401160` : déchiffre 0x120 octets de bytecode depuis `0x402140` vers la pile (`rsp+0x260`).
3. Patch du bytecode : `bc[1] = 0x5a` (ou `0` sous debugger), puis 5 octets ajoutés en queue (`0f 06 10 80 fe`).
4. `fgets` → `strcspn("\n")` → `strlen == 16` sinon « wrong length ».
5. Boucle d’interprétation `0x401300` : `switch` sur l’opcode via la table de sauts `0x4020e0` (24 entrées), opcode `0xfe` = fin.
6. Un flag d’erreur (`r8d`) est OU-é par chaque instruction `CHK` ; à la fin, `r8d == 0` → ACCESS GRANTED.

## Comment on trouve le serial

### 1. La clé de déchiffrement du bytecode

La boucle `0x401160` fabrique en SSE un vecteur d’indices `i` (compteurs `402270` + 4/8/12/16), garde l’octet bas (`pand` avec `0x00ff`, `packuswb`), puis enchaîne des `paddb`/`psubb` :

```asm
movdqa xmm0,xmm8        ; x = i
paddb  xmm0,xmm8        ; 2x
paddb  xmm0,xmm0        ; 4x
paddb  xmm0,xmm0        ; 8x
psubb  xmm0,xmm8        ; 7x
paddb  xmm0,xmm0        ; 14x
paddb  xmm0,xmm0        ; 28x
psubb  xmm0,xmm8        ; 27x
paddb  xmm0,xmm0        ; 54x
paddb  xmm0,xmm0        ; 108x
paddb  xmm0,xmm8        ; 109x
paddb  xmm0,xmm4        ; + 0x3b3b3b3b
pxor   xmm0,[rax-0x10]  ; ^ octets chiffrés (0x402140…)
movaps [rdx-0x10],xmm0  ; → bytecode sur la pile (rsp+0x260)
```

C’est une réduction de force de `key[i] = (109*i + 0x3b) mod 256`, donc `bc[i] = enc[i] ^ key[i]` pour `i` de 0 à 0x11f.

Juste après :

```asm
4010eb: cmp rax,-1           ; résultat de ptrace(TRACEME)
4010ef: mov eax,0x5a
4010fd: cmovne esi,eax       ; pas de debugger → esi = 0x5a, sinon 0
401236: mov [rsp+0x261],sil  ; bc[1] = 0x5a
40123e: mov dword [rsp+0x380],0x8010060f
40124e: mov byte  [rsp+0x384],0xfe   ; fin de programme
401227/401249: 16 octets de 0x402280 → rsp+0x10 (valeurs attendues)
```

### 2. Le jeu d’instructions

Le dispatcher lit `bc[pc]`, refuse `0` et tout ce qui dépasse `0x17` (sauf `0xfe`), puis saute via `movsxd rax,[0x4020e0+op*4]; add rax,rdi; jmp rax`. En lisant chaque handler :

| op | handler | sémantique | taille |
|---|---|---|---|
| 01 | `0x40162b` | `PUSH imm` | 2 |
| 02 | `0x4017b9` | `DROP` | 1 |
| 03 | `0x401790` | `DUP` | 1 |
| 04 | `0x4017cb` | `SWAP` | 1 |
| 05 | `0x40157c` | `LDIN i` : push `input[i]` | 2 |
| 06 / 07 / 08 / 09 | … | `ADD` / `SUB` / `XOR` / `MUL` (binaires, sur 8 bits) | 1 |
| 0a / 0b | … | `AND` / `OR` | 1 |
| 0c / 0d | `0x4016d3` / `0x401541` | `ROL imm` / `ROR imm` (sur l’octet) | 2 |
| 0e / 0f | … | `SHL imm` / `SAR imm` | 2 |
| 10 / 11 | `0x4014d8` / `0x40143d` | `STM a` / `LDM a` (mémoire 256 octets, `rsp+0x160`) | 2 |
| 13 | `0x40146b` | `CHK i` : pop `v`, `r8d \|= (v != expected[i])` | 2 |
| 15 / 16 / 17 | … | `ADD imm` / `XOR imm` / `MUL imm` | 2 |
| 00, 12, 14 | `0x401811` | « denied » | — |

La pile fait 64 octets (`rsp+0x20`, `cmp esi,0x3f`), un underflow met aussi `r8d = 1`.

### 3. Le programme déchiffré

`python3 tools/stckwzrd-solve.py --dump` (extrait, complet dans [`analysis/bytecode.txt`](analysis/bytecode.txt)) :

```
000: PUSH 0x5a        ; état initial s = 0x5a
002: STM 0x80
004: LDIN 0x00        ; c = serial[0]
006: DUP
007: LDM 0x80
009: XOR              ; c ^ s
00a: ADDI 0x62        ; + k0
00c: ROLI 0x01        ; rol r0
00e: XORI 0x9e
010: DUP
011: CHK 0x00         ; == expected[0] ?
013: ADD              ; s = c + v
014: STM 0x80
016: LDIN 0x01 …      ; même bloc, k1 = 0x6c, rol 2
```

16 blocs identiques de 18 octets, avec pour chaque position `i` une constante `k_i` (`62 6c 7c 4d 5a 4e 49 26 3a 24 34 35 12 16 01 1e`) et une rotation `r_i = (i mod 8) + 1`. Les 5 octets écrits en dur après le déchiffrement (`0f 06 10 80 fe` à `0x120`) ne sont pas chiffrés : ils terminent le dernier bloc (opérande `0x0f` du `CHK`, `ADD`, `STM 0x80`) puis `0xfe` arrête la VM à `pc = 0x124`.

### 4. Prédicat et inversion

Pour `i = 0..15`, avec `s₀ = 0x5a` et `E = 48 f3 e0 d2 89 e2 36 dd a5 a1 c3 44 2a 90 81 8b` :

```
v_i     = rol8(((c_i ^ s_i) + k_i) & 0xff, r_i) ^ 0x9e      doit valoir E[i]
s_{i+1} = (c_i + v_i) & 0xff
```

Comme `v_i` doit valoir `E[i]`, l’état suivant ne dépend que de `c_i` et d’une constante connue, donc tout s’inverse en avant, octet par octet :

```
c_i     = (ror8(E[i] ^ 0x9e, r_i) - k_i) & 0xff ^ s_i
s_{i+1} = (c_i + E[i]) & 0xff
```

Résultat : `St4ckW1z4rd_0x5A` (le `0x5A` final est un clin d’œil à la graine). L’unicité annoncée par l’auteur est logique : chaque étape est une bijection sur l’octet.

### Piège anti-debug

Sous `gdb`/`strace`, `ptrace(TRACEME)` renvoie -1, donc la graine vaut `0` et le « bon » serial devient un autre (non imprimable : `python3 tools/stckwzrd-solve.py --traced` donne `09bee2b5…`). Taper `St4ckW1z4rd_0x5A` sous debugger serait refusé. Je n’ai pas eu besoin de GDB ici : la lecture statique et l’émulateur Python ont suffi.

## Vérification

Binaire natif ([`analysis/verify.txt`](analysis/verify.txt)) :

```
$ echo St4ckW1z4rd_0x5A | ./stckwzrd
  serial>   the stack unwinds cleanly. ACCESS GRANTED.
$ echo St4ckW1z4rd_0x5B | ./stckwzrd
  serial>   the stack overflows with doubt. denied.
$ echo short | ./stckwzrd
  serial>   the wizard scoffs. (wrong length)
```

Le solveur rejoue aussi le bytecode dans son émulateur (`--check`) avant d’afficher le serial.

## Notes

- Pas de patch : `original/` est intact.
- La description parle d’un programme « XOR-encrypted » : la clé n’est pas constante, c’est la suite affine `109*i + 0x3b`, cachée derrière la réduction de force SSE.
- Ce n’est ni un hash ni une comparaison directe : c’est une chaîne de bijections octet par octet avec un état propagé, ce qui permet aussi une recherche glouton caractère par caractère (vérifiée en parallèle de l’inversion analytique).
