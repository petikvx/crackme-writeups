# SVz's Orrery 2

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ac2301aca34abba98f82e95) · id `6ac2301aca34abba98f82e95`

Crackme **multiplateforme** (PE64 + ELF64 + Mach-O universal), **C/C++**, console.  
Auteur site : **SVz**. Difficulty **5.0** · quality **4.0**. Suite de [Orrery](../6a89cff9cab6678aefe9da94/).  
**Statut : solved** (2026-10-08) — keygen journalier, vérifié sur le binaire réel.

| Fichier | Rôle |
|---|---|
| [`original/crackmes-one-6ac2301aca34abba98f82e95.zip`](original/crackmes-one-6ac2301aca34abba98f82e95.zip) | ZIP site (password `crackmes.one`) |
| [`original/orrery2-2.0.zip`](original/orrery2-2.0.zip) | archive auteur (imbriquée, sans mot de passe) |
| [`analysis/extracted/orrery2-2.0/`](analysis/extracted/orrery2-2.0/) | `orrery2.exe` / `orrery2-linux` / `orrery2-macos` + README auteur |
| [`analysis/NOTES.md`](analysis/NOTES.md) | notes de reverse brutes (ISA, tables, formats) |
| [`tools/orrery2-solve.py`](tools/orrery2-solve.py) | keygen : VM Python + physique native + z3 + encodeur de serial |

## Réponse

Le serial change **chaque jour** (jours Unix `20686..21051`, env `ORRERY_DAY` pour épingler) et dépend du nom.  
Il faut donc un keygen : `tools/orrery2-solve.py` lit les tables du `.exe`, rejoue la VM du jour, retrouve les 11 planètes depuis les 56 échos et encode le serial.

| Jour | Nom | Serial | Fingerprint |
|---|---|---|---|
| 2026-10-08 (`20734`) | `petik` | **`09HMY-36RP0-HVGG0`** | `ORRERY2{4E946723}` |
| 2026-10-04 (`20730`) | `petik` | `6177B-59ZFG-PR50N` | `ORRERY2{4F749E30}` |
| 2026-10-04 (`20730`) | `bestaireverser` | `QSXAJ-VN34E-92NJJ` (commentaire du site, **retrouvé à l'identique**) | `ORRERY2{08053E7E}` |

```bash
pip install z3-solver                       # seule dépendance externe
python tools/orrery2-solve.py               # jour courant, nom "petik"
python tools/orrery2-solve.py -d 20730 -u petik --check   # + lance orrery2.exe sur le serial
python tools/orrery2-solve.py -q            # serial seul
ORRERY_DAY=20734 analysis/extracted/orrery2-2.0/orrery2.exe petik 09HMY-36RP0-HVGG0
```

≈ 2–3 min par jour (≈ 80 s de z3 + construction de la table d'orbites par la VM, parallélisée). `--dump-vm`, `--survey`, `--decode` restent pour le recon.

## Premier regard

```text
PE32+ x86-64, statique, .text 0x3950 (minuscule), .rdata ≈ 476 Kio
orrery2.exe  sha256 847c36f8…aa2ee   (498 688 o)
```

- Sans argument : le binaire imprime le **survey** du jour : 56 sondes `t=00..55`, chacune « absorbed / reflected / deflected to (x,y) ».
- Avec `nom serial` : `signal jammed: unreadable serial`, `the telescope seized`, `the echoes do not line up`, ou `system charted - ORRERY2{%08X}`.
- `.text` ridicule + `.rdata` énorme = **les données sont les tables** : 366 jours × (bytecode, survey, index de sonde). Le programme ne contient **aucune** position de planète, ni comparaison de serial en clair (voir README de l'auteur) : il *rejoue* le ciel du serial et compare les échos.

Hors plage de jours : `the telescope has drifted out of range`.

## Flow

`sub_140003D40` (vrai main) :

1. Jour = `ORRERY_DAY` ou `time()/86400` ; `idx = jour − 20686` (0..365).
2. Décodage du serial (Crockford 15 car. → 75 bits → Feistel clé par le nom → rang combinadic) → **11 indices dans 0..143** (les 144 cases de l'intérieur 12×12).
3. Pour `t = 0..55` : VM **orbit** (`locals = 11 indices + t`) → écrit la grille 14×14 en mémoire VM ; VM **probe** (`locals = (x,y)` du bord de la sonde t) → octet d'écho ; comparé à `survey[t]`.
4. Tout égal → `FNV-1a-32` sur 19 octets (11 cellules, jour u16, hash du nom) → `ORRERY2{%08X}`.

## Comment on trouve

### 1. Ancrage : tables dans `.rdata`

`.rdata` VA `0x140006000` = fichier `0x4000` (donc **fichier = RVA − 0x2000**). Via MCP `ida` (xrefs depuis le main) :

| RVA | Contenu |
|---|---|
| `0x61C0` | blobs de bytecode concaténés |
| `0x6F240` | 366 × `u16` longueur |
| `0x6F520` | 366 × `u32` offset dans le blob |
| `0x6FAE0` | 366 × 56 octets **survey** (écho attendu de la sonde t) |
| `0x74B00` | 366 × 56 octets **index de bord** (0..47) de la sonde t |

Le survey imprimé par l'exe pour le jour 20730 correspond octet pour octet à ces tables (`--survey`).

### 2. La VM (`sub_1400015C0`) — threaded code

Hex-Rays ne voit qu'un `jmp rax` : c'est un interpréteur à *computed goto*. Les handlers sont des `loc_` (pas des fonctions) ; on les lit en désassemblage (`0x140001900..0x140002600`). Pile 64 × i32, 16 locals i32, pile d'appels 16, mémoire 196 octets, 100 001 pas max.

Trois couches d'obfuscation **quotidiennes** (toutes reproduites dans le solveur) :

1. **Permutation d'opcodes** : Fisher-Yates de 256 valeurs, graine `day ^ 0x564D5F4F50434F44`, `splitmix64` ; les 36 premières valeurs mélangées = ISA 0..35 (30 handlers réels, le reste → échec).
2. **Chiffrement du flux** : `clair = blob[pc] ^ (fmix32(pc*0x9E3779B9 + seed) >> 24)`, `fmix32` = finaliseur Murmur3 (`0x85EBCA6B`, `0xC2B2AE35`).
3. **PC de départ** : deux `u16` en tête du blob (orbit, probe), XORés avec une clé 16 bits dérivée de `seed` par deux `fmix` **sans** le dernier `>>16` (c'est un `SHRD` dans l'asm).

`seed` = `splitmix64((day ^ 0x42435F5354524D00) + GOLDEN ^ 0x381EB6433) & 0xFFFFFFFF`.

ISA (extrait, index après permutation) : `PUSHi16/32`, `GETLOCAL/SETLOCAL imm8`, `ADD SUB MUL DIV MOD AND XOR NEG SHL`, `EQ GT MIN`, `JMP/JZ/JNZ rel16`, `CALL abs16`, `RET`, `LOAD/STORE mem`, `HALT0` (sort avec `*out = TOS`), `HALT1`. `SUB` = `NOS − TOS`, `GT` = `TOS > NOS`, `DIV` est un *floor*. Le bytecode est en plus truffé de bruit : `NOP`, `PUSHi16 k ; POP`, `PUSHi16 a ; PUSHi16 b ; ADD` pour fabriquer les constantes.

### 3. Piège : la VM était bonne, l'encodage de l'écho non

Les notes de reprise concluaient « le probe Python n'est pas fidèle » (ciel vide → `x+37` au lieu de `x+184`). En réalité l'hypothèse `écho = x + 14*y + 2` était fausse. Test décisif : prendre le serial publié par `bestaireverser` (voir §5), en tirer les 11 cellules, faire tourner **orbit puis probe** dans la VM Python pour les 56 sondes → **56/56 échos identiques** au survey. La VM était donc exacte.

### 4. Le programme probe = Black Box (Atoms) sur 14×14

Désassemblage CFG du probe (`--dump-vm`), réduit à sa logique (les `x==13` sont écrits `7+6`, etc.) :

```text
dx = (x==0) - (x==13) ; dy = (y==0) - (y==13)        ; direction vers l'intérieur depuis le bord
loop:
  head = (x+dx, y+dy)
  si mem[head]            -> écho 0 (absorbed)
  A = (head.x+dy, head.y+dx) ; B = (head.x-dy, head.y-dx)   ; les deux « épaules »
  si A et B               -> écho 1 (reflected)
  si A (seul) ou B (seul) : si 1er pas -> écho 1 ; sinon dévier (A: (dx,dy)=(-dy,-dx) ; B: (dx,dy)=(dy,dx))
  (x,y) += (dx,dy)
  si (x,y) sur le bord    -> écho = code(x,y)
```

Encodage de sortie (lu dans les blocs `0x0296`, `0x0078`, `0x009F` du probe) :

| Sortie | Code |
|---|---|
| `y == 0` | `x + 1` |
| `y == 13` | `x + 37` |
| `x ∈ {0,13}` | `2*y + 12 + (x==13)` |

Ce sont 48 codes distincts (2..49), 0 = absorbed, 1 = reflected. C'est exactement l'`echo_code()` du solveur. Réimplémentation native `trace()` validée **56/56** sur le ciel connu, et contre la VM sur le même ciel.

### 5. L'orbite : 6 anneaux qui tournent

Le programme orbit fait `GETLOCAL i ; CALL 0x41D` pour chacun des 11 indices, puis `HALT1`. Un indice `i ∈ 0..143` désigne une case d'un des **6 anneaux carrés concentriques** (44+36+28+20+12+4 = 144 cases) de l'intérieur 12×12, et `t` fait tourner chaque anneau. Plutôt que de comprendre la formule de rotation, on **interroge la VM** : `POS[t][i]` = case de la planète `i` au tick `t` (planète seule, 56×144 exécutions, parallélisées). Vérifié : le ciel complet (11 planètes) = union des 11 positions individuelles, donc pas d'interaction entre planètes.

### 6. Retrouver le ciel : z3

56 sondes ≈ 56 contraintes booléennes sur 144 variables `p[i]` (« l'indice i est choisi »), exactement 11 vraies. Pour chaque sonde, le rayon est déroulé **symboliquement** : à chaque pas, `head/A/B` sont des variables `p[inv_t(case)]` (la case de la planète `i` est `POS[t][i]`, c'est une bijection), la trace est un arbre de `If`. Détails :

- mémoïsation par `(x, y, dx, dy, premier_pas, nb_pas)` ; **limite de 40 pas** (`MAX_RAY`) car des hypothèses contradictoires peuvent boucler dans le graphe symbolique alors qu'un vrai rayon ne boucle jamais. Une première version coupait les cycles via une pile de récursion : **faux** (la mémoïsation empoisonnait les états partagés) → UNSAT sur un ciel pourtant valide. Le compteur de pas dans la clé règle ça.
- Deux essais « DFS maison » (variables en 3 valeurs, puis supports par sonde) explosaient (> 5 M nœuds / troncature d'énumération qui forçait des valeurs fausses). z3 règle ça en ≈ 80 s.
- Unicité : on ajoute la négation du modèle trouvé → UNSAT, donc le ciel est unique (comme promis par l'auteur : « some configurations would be indistinguishable… never come up »).

Résultat jour 20730 : `[82, 81, 76, 67, 66, 62, 55, 26, 20, 16, 11]` = exactement le ciel du serial `QSXAJ-VN34E-92NJJ`. Jour 20734 : `[143, 141, 122, 120, 74, 67, 66, 38, 30, 16, 12]`.

### 7. Encodage du serial (par le nom)

Le serial est 15 chiffres Crockford (`0123456789ABCDEFGHJKMNPQRSTVWXYZ`, 75 bits, tirets ignorés) :

```text
full(75) = payload(64) << 11 | chk(11)
chk      : ((FNV-1a-16(payload LE) ^ low16(full)) & 0x7FF) == 0     (off 0x9DC5, prime 403)
rank     = combinadic de 11 indices parmi 144 (C(144,11))
payload  = Feistel-27( rank<<10 | (fnv64(NAME)>>54) )               ; 10 bits d'auth du nom
```

- Nom : `trim`, majuscules, `FNV-1a-64`. Deux `splitmix64` (`h + GOLDEN`, `h + 0x3C6EF372FE94F82A`) donnent 16 octets → key-schedule 26 tours (`ROR8/ROL3`) → 27 dwords.
- Feistel déchiffrement (le binaire) : pour `i = 26..0` : `lo = ROR32(hi^lo, 3)` ; `hi = ROL32((key[i]^hi) − lo, 8)` ; auth = `(lo & 0x3FF) == fnv64>>54`. Le keygen fait l'**inverse** (`hi = (ROR8(hi)+lo) ^ key[i]` ; `lo = ROL3(lo) ^ hi`, `i = 0..26`).
- Le nom entre dans le chiffrement : deux noms ne partagent jamais de serial.

Validation croisée : le serial de `bestaireverser` (commentaire du site, 2026-10-04) se décode en `[82,81,76,67,66,62,55,26,20,16,11]` ; z3 retrouve ce ciel depuis le seul survey, et `encode_serial('bestaireverser', ciel)` redonne **`QSXAJ-VN34E-92NJJ`** caractère pour caractère.
(Le second commentaire, `arshi` → `W0ZKN-C6GA4-53P0W`, n'a pas été utilisé : nom exact non confirmé.)

## Vérification

```text
> set ORRERY_DAY=20730
> orrery2.exe bestaireverser QSXAJ-VN34E-92NJJ
  system charted - ORRERY2{08053E7E}
> orrery2.exe petik 6177B-59ZFG-PR50N
  system charted - ORRERY2{4F749E30}

> set ORRERY_DAY=20734
> orrery2.exe petik 09HMY-36RP0-HVGG0
  system charted - ORRERY2{4E946723}
```

Cas KO (rejoués) :

```text
ORRERY_DAY=20730  petik  09HMY-36RP0-HVGG0   -> the echoes do not line up   (serial d'un autre jour)
ORRERY_DAY=20735  petik  6177B-59ZFG-PR50N    -> the echoes do not line up   (le ciel a tourné)
ORRERY_DAY=20730  bob    6177B-59ZFG-PR50N    -> signal jammed: unreadable serial   (auth Feistel/nom)
ORRERY_DAY=30000  petik  6177B-59ZFG-PR50N    -> the telescope has drifted out of range
```

Les captures n'existent pas (pas de screenshot fourni) ; les sorties ci-dessus sont celles du binaire PE64 lancé nativement sous Windows par `--check`.

## Debug / outils

- **IDA (MCP `ida`)** : pseudo Hex-Rays de `sub_1400015C0` (table de handlers `v17[]` + `jmp rax`) puis listing `0x140001900..0x140002600` pour lire chaque handler ; tables `.rdata` via les xrefs du main. Base `.i64` sous `analysis/extracted/…` (gitignorée).
- **GDB / x64dbg** : non utilisés (reverse statique + exécution du binaire réel avec `ORRERY_DAY`). Le MCP x64dbg n'était pas attaché.

## Notes

- La clé de voûte est de **ne pas** vouloir lire la mémoire : le binaire ne connaît pas les planètes. Il faut inverser une simulation de 56 observations — d'où z3.
- Pièges rencontrés : (1) formule d'écho supposée fausse (`x+14*y+2`) → faux diagnostic « VM infidèle » ; (2) cycles symboliques et mémoïsation dans le déroulage du rayon ; (3) ne pas croire une troncature d'énumération (elle force des valeurs fausses) ; (4) `SUB` = `NOS − TOS`, `GT` = `TOS > NOS` (sens inversé par rapport à l'intuition).
- Dépendance supplémentaire : `z3-solver`. Résolution ≈ 2–3 min.
