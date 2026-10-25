# memetic0's Lattice (Lattice-6)

| | |
|---|---|
| **ID** | [`6add58b64ab951a9999da0c8`](https://crackmes.one/crackme/6add58b64ab951a9999da0c8) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | memetic0 |
| **Plateforme** | Linux x86-64, ELF64 statique stripé, Rust (TUI), `lattice6` |
| **SHA-256 (zip)** | `6eb67d26cd104f1d3d60a03e229a3260ef70cc2ded20cf7a48371071042fa6fb` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/lattice6-crackmes.zip` | archive d'origine (`lattice6` + `README.txt`) — non modifiée |
| `analysis/extracted/` | contenu dézippé (binaire + README de l'auteur) |
| `analysis/vm-disasm.txt` | les 808 slots du programme de la VM, désassemblés |
| `tools/lattice-solve.py` | keygen / solveur autonome (lit le binaire dans le zip) |

## Réponse

Le serial fait 44 caractères (alphabet base64 *custom* `81LkD4RM…V7A`, 33 octets). Le flag est
chiffré (AEAD) et lié à l'user **`CrackMes1`** (celui de l'auto-validation du README de l'auteur) :

| User | Serial | Sortie du binaire |
|---|---|---|
| `CrackMes1` | `8YO4cBYeQNL+RPAgxK/sPqc5kd7taPp1u2Et5BYJpeDN` | `CMO{lattice_lu_gf65537_spn}` |
| `petik` | `8YYVyNhYApFHl7LopvNPMv14TxenQ4LHjbb2tG1dFpq4` | `Serial rejected.` (voir *Notes*) |

```bash
python3 tools/lattice-solve.py            # CrackMes1 -> serial
python3 tools/lattice-solve.py --check    # teste sur le vrai binaire et affiche le flag
python3 tools/lattice-solve.py --user petik   # serial « VM-valide » pour petik (mais pas de flag possible)
```

## Premier regard

```bash
unzip -P crackmes.one original/lattice6-crackmes.zip -d analysis/extracted
file analysis/extracted/lattice6   # ELF64 static, no section header
diec analysis/extracted/lattice6   # Compiler: Rust
strings -n 4 analysis/extracted/lattice6 | grep crates/   # lattice-crackme/tui.rs, lattice-asm, lattice-field
./lattice6 petik serial.txt        # mode CLI : "Serial rejected."
```

Le README de l'auteur annonce : serial de 44 caractères, flag `CMO{...}`, « patcher ne révèle pas
le flag », et un mode `./lattice6 <user> <fichier-serial>` (pratique pour tester sans TUI).
Les noms de crates (`lattice-asm`, `lattice-field`) annoncent déjà : une VM + de l'arithmétique de corps.

## Flow

1. Décodage du serial : 44 caractères → 33 octets (alphabet custom à `0x455720`, 4 chars → 3 octets, MSB d'abord).
2. Construction d'une VM (fonction `0x407096`, stripée) : 8 Kio de mémoire, 16 registres u64,
   programme de 808 slots **chiffrés** (déchiffrement paresseux, splitmix64).
3. Le programme VM calcule 16 mots `out` (mem `0xe80`).
4. Les `out`, le serial, l'user, un CRC32 du code des helpers, etc. alimentent une éponge/MAC ; un
   tag de 16 octets est comparé à une constante ; si OK, le flag (27 octets) est déchiffré.

## Comment on trouve

### Ancrage

Pas de symboles, pas de section headers (`objdump -d` ne sort rien) : on désassemble en brut
(`objdump -D -b binary -mi386:x86-64 --adjust-vma=0x400000 --start-address=0x401000 …`).
Les *panic locations* Rust (`crates/lattice-asm/src/lib.rs`, `…/lattice-field/…`) sont des structures
`{ptr,len,line,col}` en `.rodata` ; leurs adresses (`0x455630`, `0x4556c0`, …) apparaissent en
`mov r8d, imm32` dans le code, ce qui localise le cœur : `0x407096` (VM) et `0x40e2xx–0x40ea38` (helpers).
(Pas d'IDA/MCP dans cet environnement : objdump + capstone + gdb uniquement.)

### Le chargement de la VM (`0x4073e9–0x407700`)

```asm
4073f3 mov edi,0x2000 / call [calloc]       ; mem[0x2000]
40742f..  copie user  -> mem[0x00..len]     ; 40e39b/40ea38 = slice get / copy_from_slice
40746f..  len (u32)   -> mem[0x40]
4074aa..  33 octets serial -> mem[0x50..0x71]
40752a mov r13,[rbp*8+0x452553]             ; table de 0x328 = 808 u64 chiffrés
```

Les slots sont déchiffrés **à la volée** (`0x407718`), avec `splitmix64` (`0x40e353`) :

```text
ks    = splitmix(i * 0xd6e8fdb93a1c55e1 ^ st)      ; st = 1 au départ
slot  = table[i] ^ ks
st    = splitmix(i * 0xa24baed496e3c17d ^ st ^ (slot & 0xff))
```

et l'opcode logique (octet 0 du slot) passe par une permutation de 32 valeurs obtenue par un
Fisher-Yates piloté par splitmix (`0x4075ef`), puis par la table de saut `0x44d250` (25 handlers).
Format : `[op][dst][a][b][imm32]`.

### Les 25 opcodes (table de saut `0x44d250`)

| idx | sémantique | idx | sémantique |
|---|---|---|---|
| 0 | halt | 13 | jmp imm |
| 1 | `r = imm` | 14 | jz r → imm |
| 2 | `r = a` | 15 | jnz r → imm |
| 3 | `r = a ^ b` | 16 | `r = (a == b)` |
| 4/5/6/7 | add / sub / and / mul (u64) | 17 | `r = (a < b)` |
| 8 / 9 | ldb / stb `mem[imm+reg]` | 18 | `r = sbox(a)` (`0x40e574`) |
| 10 / 11 | ldw / stw (u32) | 19 | `mix4` sur 4 octets (`0x40e3ed`) |
| 12 | `r = imm + a` | 20 | `blk` : permutation 32 octets (`0x40e483`) |
| 21/22/23 | add / sub / mul **mod 65537** (`0x44ce8b/ced2/cea9`) | 24 | `r %= 65537` |

Les helpers : GF(2⁸) poly `0x11d` (`0x40e453`), S-box = inverse GF `x^254` puis `rol5^rol2^rol1^0xa5`
(`0x40e574`), `mix4` = matrice circulante `01 01 02 01…` (`0x44d1c0`), `blk` = 8 tours
(xor clé `0xa5+0x1d·i`, sbox, mix4 par colonne, rotation d'un octet ; clé initiale du tour suivant `+0xed`).

### Ce que fait le programme (voir `analysis/vm-disasm.txt`)

1. Éponge de 32 octets (rate 16, permutation `blk`) : absorbe `0xa1 || user || serial[0]`, pad `0x80`,
   puis **squeeze** : 192 octets de clés de tour (mem `0xc0`), deux matrices 16×16 `A`,`B` (mots
   24 bits mod 65537, mem `0x200`/`0x600`) et un vecteur `c` (mem `0xe00`).
2. `P = A·B mod 65537` (mem `0xa00`).
3. Les 32 octets `serial[1..33]` passent par un **SPN** : 6 tours (xor clé de tour, sbox, mix4 ×8, permutation
   d'octets `i → (7i+3) & 31`), puis 16 mots big-endian `x` (mem `0xe40`).
4. `out = P·x + c  (mod 65537)` → mem `0xe80`. Fin de programme avec 16 constantes
   `0x2eeb, 0xab4c, 0x38e, 0xd6d9, 0x11, 0xfa00, 0x56ce, 3, 0x1000, 0xea61, 0x4d, 0x7ab7, 0x320, 0x3039, 0xffff, 0x1092`
   (les 16 dernières instructions calculent même `const − out`, mais l'hôte ne regarde que `out`).

### Inversion (le keygen)

La contrainte « out = cible » est un système linéaire **inversible** sur 𝔽₆₅₅₃₇ (c'est le côté « lattice ») :

```text
x = P⁻¹ · (cible − c) mod 65537        (Gauss-Jordan mod p ; il faut x_i ≤ 0xffff)
serial[1..33] = SPN⁻¹(x)               (perm⁻¹, mix4⁻¹ via matrice inverse GF(2⁸), sbox⁻¹, xor clé)
serial[0] = « salt » libre (0..255)    -> 44 chars via l'alphabet custom
```

`P`, `c` et les clés ne dépendent que de `(user, serial[0])` : on les lit dans la mémoire de la VM
après un run à vide (`run_vm(user, salt || 0*32)`), puis on résout.

### Le tag final (`0x4083a3–0x408650`)

Après `halt`, l'hôte lit `mem[0xe80..0xec0]` (16 u32), les hache avec `tag(3o) || serial(33o) || user || crc32(0x44ce8b..0x44cf71) || ebp || out`
dans un sponge (`0x40e5ed`/`0x40e664`), tire un masque 128 bits, calcule un polynôme sur le chiffré
(27 octets à `0x44d001`) et compare à un tag constant (`0x44d00c`…). Si égal, le flag est
`chiffré ⊕ keystream`. Détails piégeux :

- le `crc32` couvre les 230 octets des helpers `0x44ce8b..0x44cf71` : **patcher** ces helpers change la clé ;
- `ebp` dépend d'un `int3` + handler `SIGTRAP` (0x408362) et d'un `rdtsc` (>1 s → pénalité) : anti-debug ;
- la clé étant dérivée de `(user, serial, out)` et le chiffré/tag étant des constantes du binaire, **une seule paire (user, serial) déchiffre**.

Test exhaustif : pour `CrackMes1`, parmi les 256 valeurs de `serial[0]` toutes VM-valides (`out == cible`),
**seul `salt = 0`** passe le tag.

## Debug GDB (pas à pas)

```bash
cd analysis/extracted
printf %s AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA > /tmp/s.txt
gdb -q ./lattice6
(gdb) handle SIGTRAP nostop noprint pass     # indispensable : le binaire fait un int3 volontaire (0x408362)
(gdb) break *0x407d2e                        # opcode halt : [rsp+0xf8] = slots décodés (808*9 octets)
(gdb) break *0x407d88                        # juste après : [rsp+0x28] = mem VM de 0x2000 octets
(gdb) run petik /tmp/s.txt
(gdb) dump binary memory /tmp/dec.bin *(long*)($rsp+0xf8) (*(long*)($rsp+0xf8))+0x328*9
(gdb) dump binary memory /tmp/perm.bin $rsp+0x130 $rsp+0x150     # permutation d'opcodes inverse
(gdb) continue
(gdb) dump binary memory /tmp/mem.bin *(long*)($rsp+0x28) (*(long*)($rsp+0x28))+0x2000
(gdb) x/16wx *(long*)($rsp+0x28)+0xe80       # les 16 mots `out`
```

Pièges : sans `handle SIGTRAP … pass`, le programme s'arrête sur l'`int3` avant la VM ; un
`continue` après le 1er breakpoint peut aussi finir en SIGTRAP (faire un run par breakpoint).
Le dump `dec.bin`/`perm.bin` a servi à **valider** le déchiffreur statique (`load_program`) octet pour octet,
et `mem.bin` à valider l'émulateur Python (`out` identiques pour un serial `AAAA…`).

## Vérification

```text
$ python3 tools/lattice-solve.py --check
user=CrackMes1 salt=0 serial=8YO4cBYeQNL+RPAgxK/sPqc5kd7taPp1u2Et5BYJpeDN
CMO{lattice_lu_gf65537_spn}

$ ./lattice6 CrackMes1 serial.txt     # le binaire d'origine (dézippé)
CMO{lattice_lu_gf65537_spn}

$ ./lattice6 CrackMes1x serial.txt    # autre user, même serial
Serial rejected.

$ python3 tools/lattice-solve.py --user petik --check
aucun serial accepté par le binaire
```

Preuve faite en **mode CLI** (`./lattice6 <user> <fichier>`) ; le chemin TUI n'a pas été rejoué
(même fonction de vérification, d'après le README de l'auteur).

## Notes

- **`petik` ne peut pas obtenir de flag** : le chiffré et le tag sont des constantes du binaire et
  la clé AEAD dépend de l'user. `lattice-solve.py --user petik` fournit bien un serial qui fait
  atteindre à la VM les 16 constantes (`out == cible`, vérifié par l'émulateur), mais le binaire
  répond `Serial rejected.` Seul `CrackMes1` est acceptable — d'où le défaut du solveur à `CrackMes1`
  (exception à la convention `petik`).
- « Keygen » ici = résoudre le système linéaire mod 65537 + inverser le SPN ; l'AEAD final verrouille
  ensuite le couple (user, salt). Ce n'est pas un keygen utilisable pour un user arbitraire.
- Le flag est dérivé, pas stocké : patcher le saut final ne donne rien (comme annoncé par l'auteur).
- L'archive contient aussi `README.txt` (copié dans `analysis/extracted/`).
