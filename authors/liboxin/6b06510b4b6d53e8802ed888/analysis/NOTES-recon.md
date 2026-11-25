# easy vm v2 (liboxin) — notes de reverse (dépaqueté, VM comprise, clé non trouvée)

## Identité
- `original/supervm_v144_full_5mb.exe` — PE32+ console, x86-64, **20 sections**, 4.8 Mo
- sha256 `58231c214c2bb01ebf00bb11d55d57d2954f83645ae4f4aba8ff4b9892be2876`
- mingw-w64 / gcc 13.1.0 (visible dans les sections DWARF renommées `.sNN`)

## Banner (Wine)
```
=== AEGIS SUPER VM CRACKME ===
Two independent encrypted bytecode VMs guard one 22-byte key.
input flag: ACCESS DENIED.
```
`xvfb-run -a wine original/supervm_v144_full_5mb.exe`

## 1. Dépaquetage du protecteur « aegis » v144 — **résolu**

Le dépôt avait déjà traité « aegis » sur deux crackmes du même auteur
([unpack me v1](../6af59fc52c7537120cbe8a22/), [hellgate1](../6af00c585fa39ab0d4ac2236/)).
La v144 réutilise les mêmes primitives avec un header différent.

Seul le stub `.aegis` `0x19000`–`0x1c000` est en clair (entropie 6.0–6.3) ;
au-delà, `.aegis` est à 7.95 et `objdump` n'y lit que du bruit. `.aeg` (2 Mo)
n'est que du bloat : 21842 stubs de 0x60 octets appelés en boucle depuis
`0x1402a3000` — ce sont les « 21911 fonctions » que voit IDA.

Primitives, lues dans le stub clair :

```
mix(x)          = finaliseur splitmix64                       (sub_14001A3DD)
  x ^= x>>30 ; x *= 0xBF58476D1CE4E5B9
  x ^= x>>27 ; x *= 0x94D049BB133111EB
  x ^= x>>31
ks(c, i)        = keystream du protecteur, identique à celui de
                  unpack me v1 / hellgate1 (double tour splitmix + rol 23
                  + 0xC2B2AE3D27D4EB4F)
seed            = qword_1400620D8
```

`seed` vaut **0** : il n'est remplacé par `rdtsc` (`sub_140019F0E`) que si le
self-hash FNV-1a de `.aegis` (0x49000 octets, avec un trou donné par
`hdr+0x84`/`hdr+0x88`) ne vaut pas `hdr+0x68`. C'est l'anti-patch : un octet
modifié et le déchiffrement devient irrécupérable. La plage `+0x84`/`+0x88`
(`0x5be48`+`0x5db8`) est exclue du hash parce que le protecteur y écrit au
runtime — c'est là que vit `sub_14005BE50`, la routine qui restaure les
prologues volés.

Header AGIS (magic `"AGIS"` dans `.aegisd`, file offset `0x157638`) :

| champ | valeur | rôle |
|---|---|---|
| `+0x14` | 16 | nombre de pages |
| `+0x18` | `0x164560` | rva de la table de pages (chiffrée) |
| `+0x28`/`+0x2c` | `0x164770` / `0x13daa4` | gros blob dans `.aegisd` |
| `+0x40`/`+0x44` | `0x1644d8` / 17 | seconde table (zéros dans le fichier : cache runtime) |
| `+0x4c` | `0xc911be79` | sel du self-hash |
| `+0x60`/`+0x64` | `0x2a2218` / 2 | constructeurs |
| `+0x68` | `0xf181870e660406c0` | self-hash attendu de `.aegis` |
| `+0x84`/`+0x88` | `0x5be48` / `0x5db8` | trou dans le self-hash |
| `+0x90`/`+0x94` | `0x2a3000` / `0x200000` | `.aeg` |

Table de pages : chiffrée avec `mix(selfhash ^ hdr+0x4c)` = `0x4d09340f4d7f3d5f`
et le keystream `mix(k ^ 0x9E3779B97F4A7C15*i)` (boucle en clair en
`0x1400191b4`–`0x140019216`). 16 entrées de 32 octets :

```
+0x00 u64 key   +0x08 u32 rva   +0x0c u32 size
+0x10 u64 k2    +0x18 u32 flags +0x1c u32 k3
```

Clé de page, lue en asm dans `sub_14001AB40` (`0x14001ab56`–`0x14001ab68`) :

```asm
mov  rcx, r8                      ; entry.key
xor  rcx, QWORD PTR [rbp+0x10]    ; ^ k2
mov  eax, DWORD PTR [rbp+0x1c]
xor  rcx, rax                     ; ^ k3
call 0x14001a3dd                  ; mix(...)
xor  rbx, QWORD PTR [0x1400620d8] ; ^ seed (= 0)
```

et le XOR des pages utilise **`ks`**, pas `mix` (trouvé en scorant la densité
de motifs x86 sur la page `rva 0x1000` : 298 contre 26 pour le bruit).

→ `tools/aegis-unpack-v144.py` déchiffre les 16 pages (`.text` 0x1000–0x8000
et les `.sNN` 0x12000–0x18000) et produit `analysis/supervm.unpacked.exe`,
où les chaînes apparaissent en clair, dont
`ACCESS GRANTED. VM1 and VM2 accepted the key.`

Les « 10 fonctions » que Hex-Rays décompilait dans `.text` (icebp, `rcr`,
JUMPOUT hors bornes) n'étaient donc pas du junk volontaire : c'était du
chiffré mal interprété.

## 2. La mini-VM — **résolue**

`main` est en `0x14000826a` ; le verdict vient de `0x140001ad0` :

```c
int check(const char *flag) {
    if (strlen(flag) != 0x16) return 0;            // 22 octets
    if (vm_run(&prog_vm1, flag) != 1) return 0;    // prog @ 0x14000a1a0
    return vm_run(&prog_vm2, flag) == 1;           // prog @ 0x14000a180
}
```

Chaque fonction de `.text` a ses 5 premiers octets volés (`jmp` vers un
trampoline `.aegis` qui fait `push <id>` puis `jmp 0x14001a4c9`), d'où les
`// weak` d'IDA : il faut lire l'asm, ou inférer le prologue depuis l'épilogue.

Descripteur de programme :

```c
struct prog { const u8 *code; u32 size; u32 seed; const u8 *optbl; };
  VM1 : code 0x14000a260, size 154, seed 0x13579bdf, optbl 0x14000a320
  VM2 : code 0x14000a1c0, size 154, seed 0x2468ace1, optbl 0x14000a300
```

- `code` est chiffré par un **LCG** (`sub_140001450`) :
  `state = state*0x41C64E6D + 0x3039` puis `plain[i] = code[i] ^ (state>>24)`,
  état initial = `seed`.
- `optbl` est une permutation de 18 octets ; la VM en construit l'inverse
  (`sub_140001500`) et l'applique à l'opcode avant de sauter dans la table de
  `0x14000a000`. Les deux programmes ont des permutations différentes.
- Une instruction fait **7 octets** : `op, a, b, imm32` (LE), cf.
  `sub_140001860`. 154 = 22 instructions.
- Contexte : bytecode en `ctx+0`, input (64 u32) en `ctx+0x100`, 8 registres
  u32 en `ctx+0x200`, `len` en `ctx+0x220`, `pc` en `ctx+0x224`, flag de
  comparaison en `ctx+0x228`. La boucle s'arrête après 0x1000 pas et exige
  `reg[0] == 1`.

Les 18 handlers (`0x140001590`–`0x140001850`) donnent le jeu d'instructions :
`HALT, MOV_IMM, LOAD_IN, LOAD_LEN, ADD, SUB, XOR, MUL_IMM, ROL_IMM, SHR_IMM,
CMP_REG, CMP_IMM, JE, JNE, INC, DEC, MOV_REG, JMP`.

`tools/supervm-emu.py dis` sort les deux programmes :

```
=== VM1 (seed 0x13579bdf)        === VM2 (seed 0x2468ace1)
00 LOAD_LEN r0                   00 LOAD_LEN r0
01 CMP_IMM  r0, 0x16             01 CMP_IMM  r0, 0x16
02 JNE      20                   02 JNE      20
03 MOV_IMM  r1, 0x811c9dc5       03 MOV_IMM  r1, 0x9e3779b9
04 MOV_IMM  r2, 0x0              04 MOV_IMM  r2, 0x16
05 CMP_IMM  r2, 0x16             05 DEC      r2
06 JE       16                   06 LOAD_IN  r3, r2
07 LOAD_IN  r3, r2               07 ADD      r1, r3
08 XOR      r1, r3               08 MUL_IMM  r1, 0x85ebca6b
09 MUL_IMM  r1, 0x1000193        09 MOV_REG  r4, r1
10 MOV_REG  r4, r1               10 SHR_IMM  r4, 0xb
11 SHR_IMM  r4, 0xd              11 XOR      r1, r4
12 XOR      r1, r4               12 ROL_IMM  r1, 0x7
13 ROL_IMM  r1, 0x5              13 CMP_IMM  r2, 0x0
14 INC      r2                   14 JE       16
15 JMP      5                    15 JMP      5
16 CMP_IMM  r1, 0x9f3c8d51       16 CMP_IMM  r1, 0x92e28c11
17 JNE      20                   17 JNE      20
18 MOV_IMM  r0, 0x1              18 MOV_IMM  r0, 0x1
19 HALT                          19 HALT
20 MOV_IMM  r0, 0x0              20 MOV_IMM  r0, 0x0
21 HALT                          21 HALT
```

Soit, sur les 22 octets `k[0..21]` :

```
VM1 (gauche → droite) : FNV-1a modifié
  h1 = 0x811c9dc5
  pour i = 0..21 : x = (h1 ^ k[i]) * 0x01000193 ; x ^= x>>13 ; h1 = rol32(x, 5)
  exigé : h1 == 0x9f3c8d51

VM2 (droite → gauche) : murmur-like
  h2 = 0x9e3779b9
  pour i = 21..0 : x = (h2 + k[i]) * 0x85ebca6b ; x ^= x>>11 ; h2 = rol32(x, 7)
  exigé : h2 == 0x92e28c11
```

`tools/supervm-emu.py run <clé>` rejoue les deux VMs et reproduit le verdict
du binaire (`petik` → ACCESS DENIED, comme sous Wine).

## 3. Ce qui reste : trouver les 22 octets

Il faut une **collision simultanée sur deux hash de 32 bits**, soit 64 bits de
contrainte, les deux sens de parcours étant opposés. Les deux pas sont
bijectifs en `h` (xor-shift, multiplication par un impair, rotation), donc on
peut avancer et reculer librement — mais aucune inversion directe ne donne la
clé, puisque les états initiaux sont imposés.

Ce qui a été tenté :

- **Z3** (`timeout` 240 s, charset `[a-z0-9_]`) → `unknown`. Les 44
  multiplications 32 bits chaînées sont trop pour le solveur tel quel.
- **Meet-in-the-middle** (`tools/supervm-mitm.c`) : on fixe 14 des 22 octets
  et on laisse **8 octets libres contigus**, ce qui rend les quatre états de
  bord constants (`P0`, `Q0` pour VM1, `R0`, `S0` pour VM2) et réduit le
  problème à
  `fwd1(P0, k[F..F+7]) == Q0` et `fwd2(R0, k[F+7..F]) == S0`.
  Split 4 + 4 octets, table du côté droit indexée par `u'>>4` (une entrée par
  case, ~26 % de pertes, pas de tri), filtrée sur les 4 bits bas de `u'`
  → 16 passes.
  Mesuré : **une passe ≈ 2 min** mono-thread (169 M entrées utiles sur 268 M),
  et **~4 % de chance de collision par passe** — donc ~63 % sur les 16 passes,
  à refaire avec une autre base de 14 octets en cas d'échec.
  La version OpenMP (boucles externes `d3` et `g0` parallélisées, enchaînement
  automatique des 16 passes) est écrite et compile, mais n'a pas été lancée :

  ```bash
  cc -O3 -march=native -fopenmp -o mitm tools/supervm-mitm.c
  ./mitm        # enchaîne les passes 0..15
  ./mitm 7      # une seule passe
  ```

  Avec 8 cœurs, l'ensemble des 16 passes devrait tenir en quelques minutes.
  La base de 14 octets est la constante `BASE` du `.c` (`"aegis_vm_????????_key!"`,
  positions libres 9..16) : la changer donne un tirage indépendant.

Une fois la clé sortie, elle vaut pour le binaire d'origine (encore packé) :
la vérification live se fait avec
`printf '<clé>\n' | xvfb-run -a wine original/supervm_v144_full_5mb.exe`,
qui doit afficher `ACCESS GRANTED. VM1 and VM2 accepted the key.`

Note : le crackme n'exige pas une clé « intentionnelle » — toute chaîne de
22 octets satisfaisant les deux hash est acceptée.

## Debug live : impossible ici
- `/proc/<pid>/mem` refusé (`yama/ptrace_scope = 1`), et Wine 10 lance le PE
  dans un process distinct du lanceur, donc
  `gdb --args /usr/lib/x86_64-linux-gnu/wine/wine …` ne voit jamais l'image à
  `0x140000000` (testé avec `catch syscall read`, interruption temporisée et
  balayage de tous les inferiors).
- `winedbg --command "info share" <chemin Windows>` démarre, mais le
  protecteur **détecte le débogueur** et part dans le junk :
  `Unhandled stack overflow at address 00000001400013F1`.
- Tout ce qui précède a donc été obtenu en statique.
