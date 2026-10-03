# vmlinuz719's Product Activation

- **ORIGINE** : [ORIGIN.yml](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/670fd1469b533b4c22bd1537)
- **Auteur** : vmlinuz719
- **Plateforme** : Linux ELF64 PIE, stripé, lié dynamiquement
- **Type** : clé d'activation, mini-VM 16 bits dont la ROM est `libcerberus.so`

## Fichiers

| Chemin | Rôle |
|---|---|
| [ORIGIN.yml](ORIGIN.yml) | ID, hash du ZIP, statut |
| [original/challenge2.zip](original/challenge2.zip) | Archive du site (mot de passe `crackmes.one`) |
| [original/activate](original/activate) | ELF d'origine (mode `+x` à poser en local) |
| [original/libcerberus.so](original/libcerberus.so) | ROM de la VM, 645 octets, pas un ELF |
| [tools/activate-solve.py](tools/activate-solve.py) | Générateur de la clé + `--check` sur un pty |
| `analysis/activate.i64` | Base IDA (gitignorée) |
| [analysis/NOTES.md](analysis/NOTES.md) | Notes de reprise, périmées par ce write-up |

## Réponse

La clé est **`289F95CF-47FA06D3`** (17 caractères, hexadécimal majuscule, un tiret). Le buffer comparé ne contient pas le retour chariot.

```bash
python3 tools/activate-solve.py
python3 tools/activate-solve.py -q
python3 tools/activate-solve.py --check
```

`--check` lance `./activate` depuis `original/` (pour que `fopen("libcerberus.so")` trouve la ROM) sur un pty, envoie la clé suivie de `\r`, et exige `Product activation successful`. Une variante d'un octet doit afficher la phrase de piratage.

## Premier regard

```text
original/activate
  ELF 64-bit LSB pie executable, x86-64, stripped, dynamically linked
  BuildID[sha1]=fc4999aed3310aa1ed2e823080b905d918882fe9
  SHA-256 fff00cdaedbb8bba61bc51a869daa32803a0adfdc09f85c05054d9995b21298f
  51328 octets, entry 0x1a30, main 0x1420
  GNU/Linux 3.2.0

original/libcerberus.so
  data, 645 octets
  SHA-256 f99523b7b03e318429bb6a7a8963507d57ae2c635c952e7120dc0d7097e2a145
  en-tête 34 55 39 54 …
```

Le ZIP du site pèse 17697 octets, SHA-256 `3585dd41563fc2d52cd9863f245527f36920b4cd6b16dfa2cb5d4c0105261f4d`.

Chaînes de l'ELF : `libcerberus.so`, `FATAL: libcerberus.so not found`, `error`. Les textes d'interface ne sont pas dans l'ELF. Ils sont dans la ROM, recopiés en RAM guest :

| RAM | Fichier ROM | Texte |
|---|---|---|
| `0x11b8` | `0x1f4` | `0123456789ABCDEF` |
| `0x11c8` | `0x204` | table du mélangeur (18 octets utiles, le 18e produit 0) |
| `0x11da` | `0x216` | `Enter key: ` |
| `0x11e6` | `0x222` | `Product activation successful\n` |
| `0x1205` | `0x241` | `Product activation failed, you may be a victim of software piracy!\n` |

Imports qui comptent pour le runtime : `fopen`, `malloc`, `pthread_create`, `tcgetattr`, `tcsetattr`, `getchar`. `time` / `srand` / `rand` sont importés ; la clé ne dépend pas d'eux.

`main` ouvre `libcerberus.so` en `"rb"` et charge au plus `0x1000` octets dans l'objet device (`rbx+0x41`). Il faut lancer le binaire avec `original/` comme répertoire courant.

## Flow

`activate` est l'interpréteur. `libcerberus.so` est le programme.

Contexte (offsets IDA = VMA du PIE) :

- PC : `ctx+0x13138`. Au reset : `0xFFFF000000010000`.
- RAM : `malloc(0x4000)` en `ctx+0x13128`, limite `ctx+0x13130 = 0x4000`. Lectures et écritures **big-endian** (`sub_1BFB` échange les octets d'un halfword, `sub_1B9C` / `sub_1BA0` font `bswap`).
- Table de devices : `ctx+0x13010`, pas `0x30`, un seul device. Méthodes : lecture `sub_2E89`, écriture `sub_2F82`, contrôle `sub_1B8C`.
- Registres : `ctx+0x13020 + i*8`. R0 lit 0 et ignore les écritures. R1–R15 sont les nibbles usuels. R16–R31 passent par les opcodes `0x70` / `0x71`.

Les adresses `> 0xFFFEFFFFFFFFFFFF` sont du MMIO. Index device = `(addr >> 32) & 0xFFFF`, offset = bas 32 bits. La ROM du device 0 occupe les offsets `0x10000..0x10FFF`, donc la base guest `0xFFFF000000010000`. Un halfword MMIO est `(rom[0] << 8) | rom[1]`, sans le `bswap` de la RAM : **l'opcode est le premier octet du fichier**.

Fetch `sub_2C1E` (`0x2c1e`). La table `byte_94C0[opcode]` donne le nombre de halfwords **en plus** du premier. Taille = `2 * (1 + extra)`. L'instruction packée est `hw0<<48 | hw1<<32 | hw2<<16 | hw3`. Champs : `Rd = (insn>>52)&0xF`, `Rs = (insn>>48)&0xF`, `Rb = (insn>>44)&0xF`, `imm12 = (insn>>32)&0xFFF`, `imm16 = hw1`.

Le dispatcher `sub_6110` (`0x6110`) saute selon `insn>>56` (table `jpt_614D` à `0x9104`). Le handler écrit une longueur d'octets dans `ctx+0x13150` (2, 4, 6 ou 8). La boucle de `main` l'ajoute au PC après l'appel en `0x1909`. Un branchement pris laisse la longueur à 0. Le pseudo Hex-Rays de ce `switch` mélange les SSA : l'assembleur fait foi.

Exception : `error` (`0x3511`) fait `edx = code+1` et poste le vecteur `0x11`. `main` recharge alors le PC depuis le qword big-endian en RAM à l'adresse `(code+1)*8`. Un accès hors RAM (code 2) reprend donc le qword stocké en RAM `0x18`.

Prologue ROM, PC `0xFFFF000000010000` :

1. `34 55` — XOR R5, R5.
2. Construit huit qwords du pointeur de base ROM en RAM `0..0x38`.
3. `14 50 0F F8` à `…1008` — LEA : `R5 = PC + R0 + R0 + sext12(0xFF8) = PC - 8`, donc la base ROM.
4. Opcode `0x20`, `20 D6 0F FF` : copie `0x1000` octets depuis `R6 = base+0x3c` vers la RAM `0x1000`. Deux pas de VM par octet (phase chargement, phase stockage). Le compteur vit dans les bits 30:16 du status.
5. `JR R13` avec `R13 = 0x1000`. La suite s'exécute dans la copie RAM. Une adresse RAM `A` correspond à l'offset fichier `A - 0x1000 + 0x3c`.

La copie se termine par une sonde : `stq` du continuateur `0x101a` en RAM `0x18`, puis des `ldq` jusqu'à `R5 = 0x4000`, qui faute et reprend en `0x101a`. `R5` reste `0x4000` (taille de la RAM).

`0x101a..0x1036` : `A3` sur le device. `sub_1B8C` renvoie `0x1896` quand l'index de registre (nibble `Rs`) est 0 et que `(R[Rb]+imm12) <` nombre de devices, sinon 0. Ici `R6` a été mis à 0 par un XOR, donc l'appel renvoie `0x1896` et la boucle sort. Le spin n'est pas un bug de l'émulateur.

Appels : `BAL` (`0xB1`) écrit le lien `PC+4` dans `R[Rd]` (R0 jette le lien) et fait `PC = PC + R[Rs] + sext16(hw1)*2`. Retour : `JR` (`0xB2`) écrit `PC+2` dans `R[Rd]` et saute à `R[Rs]`. Les routines de ce programme lient dans R4 et reviennent par `B2 04`.

Le prompt part de `0x10be` : rechargement du pointeur MMIO stocké en RAM `0x218`, attente du bit 6 (place en sortie), puis émission de chaque octet de la chaîne vers l'offset de port 3 (`47 87 00 03`, store octet). `sub_2F82` offset 3 taille 1 ajoute l'octet à la console.

Le lecteur (`0x10e0..0x1142`) dépose les caractères en RAM `0xF00` :

- port offset 0 : bit 7 si un octet clavier est en file, bit 6 toujours vrai dans l'hôte (place en sortie) ;
- port offset 1 : dépile un octet, ou 0 si la file est vide ;
- `EA` (`0x111e`, `ea 08 00 0e 00 0a`) sort si l'octet vaut `0x0A` ;
- `0x08` est un backspace ;
- sinon l'octet est stocké et l'index avance ;
- `DE` (`0x1132`, `de 87 ff f4`) reboucle en `0x111a` tant que le bit 7 du status est à 1.

À la sortie, `47 05 60 00` écrit un NUL. La clé comparée est donc la ligne **sans** fin de ligne.

Le tty est passé en raw (`tcgetattr` / `tcsetattr` sur fd 0). Un pipe ne suffit pas. La preuve live écrit la clé puis `\r` sur un pty, après le prompt. Le lecteur guest compare à `0x0A` ; sur ce pty la ligne est acceptée et le succès s'affiche.

## Comment on trouve la clé

Ancrage : IDA (`analysis/activate.i64`) pour `main` `0x1420`, le fetch `0x2c1e` et le dispatcher `0x6110` ; GDB pour le PC de reset et la première instruction ; puis lecture de la copie RAM `0x1158`, confirmée par une trace de registres sur l'entrée `ABCD`.

Première instruction exécutée, breakpoint sur `sub_6110` :

```text
pc   = 0xffff000000010000
insn = 0x3455000000000000     ; opcode 0x34, XOR R5, R5
```

Le fichier commence par `34 55`. Le halfword MMIO est déjà gros-boutiste : l'opcode n'est pas l'octet `0x55`.

La comparaison n'est pas un `memcmp` contre une constante. À `0x1158` (fichier `0x194`) le programme engendre chaque octet et le compare à la saisie. Désassemblage commenté, état du premier tour entre parenthèses (`x` part de 0) :

```text
1158  6d 92              push R9          ; sauve R9 via R2
115a  13 90 c1 a5       R9 = 0xC1A5      ; graine
115e  6d d2              push R13
1160  34 dd              R13 ^= R13       ; index = 0
1162  0f 03 89 f9       R8 = R9 >> 7     ; 0xC1A5 >> 7 = 0x183
1166  34 98              R9 ^= R8         ; 0xC026
1168  0f 03 79 09       R7 = R9 << 9     ; 0x1804C00
116c  34 97              R9 ^= R7         ; 0x1808C26
116e  0f 03 89 f3       R8 = R9 >> 13    ; 0xC04
1172  34 98              R9 ^= R8         ; 0x1808022
1174  05 99              R9 = zx16(R9)    ; 0x8022
1176  0f 03 89 f8       R8 = R9 >> 8     ; 0x80
117a  34 89              R8 ^= R9         ; 0x80A2
117c  04 88              R8 = zx8(R8)     ; 0xA2
117e  4d 85 d0 00       R8 ^= [R5+R13]   ; table RAM 0x11C8, 0xA2 ^ 0x90 = 0x32
1182  60 76 d0 00       R7 = [R6+R13]++  ; octet saisi, R13++
1186  db 87 00 06       si R8 != R7 → 0x1192
118a  da 08 00 08       si R8 == 0  → 0x119a   ; NUL de fin, succès
118e  b1 00 ff ea       BAL 0x1162       ; tour suivant, R9 déjà masqué
1192  6c d2              pop R13
1194  07 5f              R5 = -1          ; échec
1196  6c 92              pop R9
1198  b2 04              JR R4
119a  6c d2              pop R13
119c  34 55              R5 ^= R5         ; R5 = 0, succès
119e  6c 92              pop R9
11a0  b2 04              JR R4
```

`0x0F` sous-cas 3 est un décalage. La destination est le nibble haut du troisième octet, la source le nibble bas (pas les champs Rd/Rs du premier halfword). Le compte est l'octet bas de `hw1`. Le bit 7 de cet octet choisit le décalage à droite, du montant `négation de l'octet signé` (`0xF9` → 7, `0xF3` → 13, `0xF8` → 8, `0x09` → gauche de 9). Cas logique, pas arithmétique : les valeurs de ce mélangeur tiennent dans 32 bits, les deux lectures coïncident.

`R5` est le pointeur de table `0x11C8` (fichier `0x204`). `R6` est le buffer `0xF00`. L'index `R13` est le même pour le XOR table et pour la lecture de la saisie, le post-incrément ayant lieu après.

Formule, pour chaque indice jusqu'à l'octet nul :

```text
x ^= x >> 7
x ^= x << 9
x ^= x >> 13
x &= 0xFFFF
octet = (((x >> 8) ^ x) & 0xFF) ^ table[i]
```

Table (fichier `0x204`) : `90 c1 c7 ed 48 08 3f 91 36 38 ee e4 53 ea 91 21 94 d8`.

Premier octet : `0xA2 ^ 0x90 = 0x32` = `'2'`. Les 17 octets avant le 0 sont `32 38 39 46 39 35 43 46 2d 34 37 46 41 30 36 44 33`, soit `289F95CF-47FA06D3`. Le 18e octet engendré est 0 et tombe sur le NUL du buffer. La casse et le tiret comptent : `289f95cf-47fa06d3` et `289F95CF-47FA06D4` prennent le chemin `07 5F`.

L'appelant imprime la chaîne de succès quand ce retour laisse R5 à 0, et la chaîne de piratage quand R5 vaut -1.

`0x11a2..0x11b6` (sauvetage de deux qwords en `0x200`, puis `74 00` qui est un RETI) n'est pas sur le chemin de la clé. `0x11b6` est la fin du code : l'alphabet commence à `0x11b8`.

## Prédicat

```python
x = 0xC1A5
table = rom[0x204:0x216]  # 90 c1 c7 ed 48 08 3f 91 36 38 ee e4 53 ea 91 21 94 d8
for b in table:
    x ^= x >> 7
    x ^= (x << 9) & (2**64 - 1)
    x ^= x >> 13
    x &= 0xFFFF
    out = (((x >> 8) ^ x) & 0xFF) ^ b
    # out == 0 clôt la clé ; sinon out est le caractère exigé
```

## Debug GDB (pas à pas)

ELF64 PIE stripé. Avec `set disable-randomization on` (défaut de gdb), la base est `0x555555554000`. Les adresses IDA sont les VMA : breakpoint = base + VMA. `starti` s'arrête dans `ld.so`. Le programme appelle `tcsetattr` sur fd 0 : coller gdb et le tty brut dans le même flux noie la trace de NUL. Séparer `inferior-tty` (un pty) et écrire le journal dans un fichier.

```bash
cd original
export DEBUGINFOD_URLS=
gdb -nx -q ./activate
(gdb) set debuginfod enabled off
(gdb) set disable-randomization on
(gdb) starti
# base 0x555555554000
(gdb) break *(0x555555554000 + 0x1868)    # fetch de la boucle main
(gdb) break *(0x555555554000 + 0x6110)    # sub_6110, rdi=ctx, rsi=insn packée
(gdb) break *(0x555555554000 + 0x2f82)    # sub_2F82, 4e arg = octet console
```

Au premier arrêt dans `sub_6110` :

```text
*(uint64_t*)($rdi + 0x13138) = 0xffff000000010000   # PC
$rsi = 0x3455000000000000                            # XOR R5, R5
```

Les coups suivants montrent `39 54 40 00` (`R5 |= 0x4000<<48`), `71 05` (copie vers R16), puis l'opcode `0x14` qui reconstruit la base ROM, puis `0x20` qui reste sur `…010034` le temps de copier `0x1000` octets. Le champ PC est `ctx+0x13138`. Le qword de status des handlers est `ctx+0x130A0` ; le compteur de devices, lui, est `ctx+0x13018`.

Un `break` Python (`gdb.Breakpoint.stop`) qui logue `rdi`, `rsi` et le PC dans `/tmp/vm.trace` évite les `commands` gdb qui réécrivent `stop`. Formater avec `%`, pas une f-string englobante : le générateur évaluerait `rdi` trop tôt.

## Vérification

```bash
chmod +x original/activate
python3 tools/activate-solve.py --check
```

Sortie live du binaire, pty, clé suivie de `\r`, code de sortie 0 :

```text
Enter key: 289F95CF-47FA06D3
Product activation successful
```

Le buffer capturé est `Enter key: 289F95CF-47FA06D3\r\nProduct activation successful\r\n` (`ONLCR` sur le `\n` écrit par le programme). `289F95CF-47FA06D4` et la variante en minuscules affichent `Product activation failed, you may be a victim of software piracy!`.

## Notes

- Lancer depuis `original/`. Ailleurs, `fopen` rate la ROM et le programme quitte sur `FATAL: libcerberus.so not found`.
- `original/activate` doit être exécutable. Le bit a été posé en local ; le fichier n'est pas patché.
- Opcode = premier octet de la ROM. Les notes de pause qui lisaient `0x55` comme opcode décrivaient le halfword à l'envers.
- La longueur d'une instruction vient de `byte_94C0`, pas d'un décodage x86.
- `0x74` avec le nibble bas à 0 est un RETI (restaure PC `ctx+0x130A8` et le status `ctx+0x130B0`). Le succès n'y passe pas : il revient par `JR R4`.
- `crackme-puzzle` (0x78102) reste en pause. Cette clé n'a rien à voir avec ce binaire.
