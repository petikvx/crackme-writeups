# Orrery 2 — notes de reprise (2026-10-08)

> **Mise à jour 2026-10-08 : RÉSOLU** — voir [`../README.md`](../README.md). Le « probe pas fidèle » ci-dessous était
> une fausse piste : la VM Python était bonne, seul l'encodage de l'écho (`x+14*y+2`) était faux (vraie formule : voir write-up).
> Notes conservées telles quelles (historique du reverse).

Challenge ~~pas solved~~. Reverse statique IDA (MCP headless) + tables PE + VM Python partielle.
Suite : [README](../README.md) · solveur WIP [`../tools/orrery2-solve.py`](../tools/orrery2-solve.py).

Reprendre : relire cette note, relancer `python tools/orrery2-solve.py --dump-vm -d 20730`, corriger le **probe VM**, puis solver le ciel 11 planètes / 6 anneaux, puis encoder le serial pour `petik`.

---

## Binaires

ZIP site (password `crackmes.one`) → `original/crackmes-one-6ac2301aca34abba98f82e95.zip` (sha256 `b2714604…`) contient `orrery2-2.0.zip`.

| Fichier | SHA-256 | Taille |
|---|---|---|
| `original/orrery2-2.0.zip` | `c50028c0706285c7afc54ffa358fb903bd166759bb64405fa44b1eb856fd07e0` | 2204162 |
| `analysis/extracted/orrery2-2.0/orrery2.exe` | `847c36f83943f3e75096d1f26d2fec06067c7d742897f13dc5de4373fafaa2ee` | 498688 |
| `orrery2-linux` | `c2fd5739b0f730f7162b30c0e0539c73230490ea6a01a59ef70b693c391996c2` | 1189904 |
| `orrery2-macos` | `90f80128c4a70fcc2110c3d1a5eca202d3c92a7fe46190b53182fdbcfe202d28` | 1068848 |

PE64 static, `.text` petit (`0x3950`), **`.rdata` ~476 KiB** = tables + bytecode journalier.

IDA ouvert sur `analysis/extracted/orrery2-2.0/orrery2.exe` (bases `*.id0` gitignorées à côté). Un `original/orrery2.exe` doublon a pu rester locké — à supprimer, le canonical original est le ZIP.

x64dbg : pas attaché.

---

## Flow (`sub_140003D40`, vrai main)

1. Grille **14×14** (indices `0..13`). 48 cellules de bord (côtés sans coins) dans `dword_140080760` / `dword_1400806A0`.
2. Triangle de Pascal `C(n,k)` n≤144, k≤11 → combinadic 11 cellules parmi 144.
3. Jour : `ORRERY_DAY` ou `time()/86400`. Plage **`20686 .. 21051`** (2026-08-21 … +365 j). Hors plage : `the telescope has drifted out of range`.
4. Sans args : imprime les **56 sondes** du jour (`t=00..55`).
5. Avec `name` `XXXXX-XXXXX-XXXXX` : decode serial → 11 indices → pour chaque t=0..55 : VM **orbit** puis VM **probe**, compare l’écho au survey. Succès → `ORRERY2{%08X}` (FNV-1a-32 sur 19 octets : pack planètes + jour + hash nom).

Messages : `signal jammed: unreadable serial` · `the telescope seized` · `the echoes do not line up`.

---

## Tables `.rdata` (RVA → file = RVA − `0x2000`)

| RVA | Rôle |
|---|---|
| `0x61C0` | blobs bytecode concaténés |
| `0x6F240` | 366 × u16 longueurs |
| `0x6F520` | 366 × u32 offsets dans le blob |
| `0x6FAE0` | 366 × 56 octets **survey** (0=absorbed, 1=reflected, sinon `x+14*y+2`) |
| `0x74B00` | 366 × 56 octets **index de bord** (0..47) de la sonde t |

Jour `d` → `idx = d - 20686`.

---

## VM (`sub_1400015C0`)

Stack 64 × i32, 16 locals, callstack 16, mem 196 octets, max 100001 steps.

**Permutation d’opcodes** (Fisher-Yates 256, seed `day ^ 0x564D5F4F50434F44` « VM_OPCOD » LE-ish, `splitmix64` après `+= GOLDEN64`) : les 36 premiers du tableau mélangé = ISA 0..35 ; inverse dans 256 octets (`0xFF` ailleurs).

**Stream** : chaque octet `blob[pc] XOR (fmix32(pc * 0x9E3779B9 + v81) >> 24)` avec murmur `0x85EBCA6B` / `0xC2B2AE35`.

**v81** (seed 32-bit) :

```
rdx = ((day ^ 0x42435F5354524D00) + GOLDEN64) ^ 0x381EB6433
rdx = splitmix-body (mul m1, >>27, mul m2, >>31)
v81 = rdx & 32
```

**PC de départ** (u16 bruts en tête du blob, **pas** stream-decrypt) XOR une clé 16-bit via `SHRD` de deux `fmix` **sans** le dernier `>>16` :

- orbit : `u16[0] ^ pc_xor_key(v81, v81 - 0x61C88647)`
- probe : `u16[1] ^ pc_xor_key(v81 + 0x3C6EF372, v81 - 0x255992D5)`

Appels :

- orbit : 12 locals = **11 indices planètes** (bytes combinadic) + **t** ; doit `HALT1` (return 1) ; écrit la grille dans `mem[y*14+x]`.
- probe : 2 locals = **(x,y)** du bord ; doit `HALT0` (return 0) avec `*out = TOS` = octet d’écho.

### ISA (index après perm, handlers `v17[]`)

| op | loc | effet |
|---:|---|---|
| 0 | `1964` | NOP |
| 1 | `23F0` | PUSHi16 (sign-extend) |
| 2 | `22D8` | PUSHi32 |
| 3 | `22B0` | POP |
| 4 | `2288` | DUP |
| 5 | `223B` | SWAP |
| 6 | `21E6` | OVER |
| 7 | `20A0` | GETLOCAL imm8 (0..15) |
| 8 | `215B` | SETLOCAL imm8 |
| 9 | `2048` | ADD |
| 10 | `1A18` | **SUB** (TOS -= ; pop b, NOS−b) |
| 11 | `1FF0` | MUL |
| 12 | `1F70` | DIV (idiv + ajustement signe) |
| 13 | `1F00` | MOD (reste ≥ 0) |
| 14 | `1E50` | AND |
| 15 | `1DF8` | XOR |
| 16 | `2480` | NEG |
| 17 | `1EA8` | SHL |
| 18 | `1C90` | EQ (TOS==NOS → 0/1) |
| 19 | `1D17` | **GT** (`setnle` : TOS > NOS) |
| 20 | `1CD1` | **MIN** (`cmovg`) |
| 21 | `1D78` | JMP rel16 (pc+3+rel) |
| 22 | `1BD0` | JZ rel16 (pop) |
| 23 | `1B10` | JNZ rel16 (pop) |
| 24 | `24C0` | CALL **absolu** u16 |
| 25 | `1ADE` | RET |
| 26 | `1A47` | LOAD `mem[TOS]` |
| 27 | `19BF` | STORE `mem[addr]=val` (addr≤`0xC3`) |
| 28 | `2545` | HALT0 `*out=TOS; return 0` |
| 29 | `19B5` | HALT1 `return 1` |
| >29 / 0xFF | `1900` | fail −1 |

Bytecode **obfusqué** : `NOP`, `PUSHi16 junk; POP`, `ADD 0`.

Jour 20730 (2026-10-04) : `bc_len=1162`, `pc_orbit=4`, `pc_probe=74=0x4A`. Orbit = 11× `GETLOCAL i; CALL 0x41D` puis HALT1.

### Orbit (état actuel du Python)

À **t=0**, 144 indices → 144 positions distinctes sur l’intérieur `1..12` (spirale / anneaux, **pas** row-major). Exemples :

`0→(1,4) 1→(1,3) 2→(1,2) 3→(1,1) 4→(2,1) … 11→(9,1) 12→(1,5) 143→(12,9)`

Rotation avec t (cell 0) : `(1,4) (12,9) (1,10) (2,1) (6,1) (4,1) (1,6) (9,12) (6,1)…` — **6 anneaux qui tournent**.

### Probe (Python **pas fidèle**)

Ciel vide, sonde `(x,0)` : le VM Python sort `x+37` au lieu de traverser jusqu’à `(x,13)` (`x+14*13+2 = x+184`). Live jour 20730 `t=00` : `(8,0) reflected` (survey table `probes[0]=7`, `survey[0]=1`) — cohérent avec le binaire, pas avec notre interprète.

Pistes : JZ/JNZ (sens / consommation), DIV floor, copie des locals (bytes vs dwords — a7=2 copie 8 octets = 2 i32, a7=12 copie 48 octets), un opcode encore mal câblé (OR n’existe pas : les booléens de bord sont des **SUB** de `==0` et `==13`).

CFG probe (extrait) : init `L14=(x==13)-(x==0)`, `L9=(y==13)-(y==0)` puis `JMP 0x33D` : next=`(x+L14,y+L9)`, `LOAD` tête, `JZ` → épaules, `HALT0` absorbed si occupé, etc. Black Box comme Orrery 1, grille 14, stride 14.

---

## Serial (15 Crockford, alphabet `0123456789ABCDEFGHJKMNPQRSTVWXYZ`)

Ignore `-` et espaces. 15×5 = **75 bits**.

- payload 64 bits = `full >> 11`
- chk 11 bits = `full & 0x7FF`
- FNV-1a-16 (`off=0x9DC5`, `prime=403`) sur les 8 octets LE du payload ; `((fnv16 ^ low16(full)) & 0x7FF)==0`

Décryptage 64-bit (après hash nom) :

- nom : trim, toupper, **FNV-1a-64** (`0xCBF29CE484222325`, `0x100000001B3`)
- `sub_140002690` : deux splitmix64 (`h+GOLDEN` et `h+0x3C6EF372FE94F82A`), plus `h>>54` (10 bits)
- key schedule 26 rounds (ROR8/ROL3) → 27 dwords
- Feistel **27** itérations `i=26..0` :
  - `lo = ROR32(hi^lo, 3)`
  - `hi = ROL32((key[i]^hi) - lo, 8)`
- auth `(lo & 0x3FF) == (fnv64>>54)`
- `rank = (lo | hi<<32) >> 10` combinadic 11 parmi 144

Le Python a `encode_serial` / `decode_serial` / `key_expand` **non validés** contre un serial live.

Commentaires site (jour **2026-10-04** = unix day **20730**) :

- `bestaireverser` `QSXAJ-VN34E-92NJJ` → `ORRERY2{08053E7E}`
- `arshi` `W0ZKN-C6GA4-53P0W` → `ORRERY2{ADDACF5A}`

S’en servir pour caler Feistel + combinadic avant le keygen `petik`.

Fingerprint succès : FNV-1a-32 (`0x811C9DC5`, `16777619`) sur **19 octets** (11 cells + u16 jour + hash nom).

---

## Suite (ordre utile)

1. Tracer le probe Python vs un ciel vide / 1 planète (comparer `LOAD` addr et HALT) jusqu’à coller Black Box.
2. Rejouer 56 sondes : orbit(t) puis probe(edge[t]) == survey[t].
3. Solver : 11 indices 0..143 (anneaux) unique pour le jour — brute naïve impossible ; contraintes Black Box + rotation d’anneaux, ou enum raisonnable une fois le modèle d’orbit écrit en clair (sans VM).
4. Valider serial avec les commentaires, puis `petik` + `ORRERY_DAY` + run `orrery2.exe`.
5. Write-up FR, `status: solved`, index famille svz 1/1 → 2/2, historique racine.

Orrery 1 (déjà solved) : `authors/svz/6a89cff9cab6678aefe9da94/` — Black Box 10×10, 5 planètes, serial 8 chars. Ici 14×14, 11 planètes, 6 anneaux, 56 sondes **datées**, VM quotidienne.
