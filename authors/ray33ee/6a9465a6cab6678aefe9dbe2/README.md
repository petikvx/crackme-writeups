# ray33ee's obscurio (2)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a9465a6cab6678aefe9dbe2) · id `6a9465a6cab6678aefe9dbe2`

Crackme **Windows** PE64 console + bytecode `program.bin` (mini-VM à pile, tout le calcul est fait en `AND/OR/NOT/SHL/SHR`).  
Auteur : [ray33ee](https://crackmes.one/user/ray33ee). Série **obscurio** (archive `obscurio2.zip`).

Dossier : `authors/ray33ee/6a9465a6cab6678aefe9dbe2/` — [série](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/obscurio2.zip`](original/obscurio2.zip) | archive d'origine (mot de passe `crackmes.one`), **non modifiée** |
| [`analysis/extract/crackus.exe`](analysis/extract/crackus.exe) / [`program.bin`](analysis/extract/program.bin) | contenu du zip dézippé (hôte VM + bytecode) |
| [`analysis/crackus.dis`](analysis/crackus.dis) | `objdump -d -M intel` de l'hôte |
| [`analysis/wine-verify.log`](analysis/wine-verify.log) | preuve live Wine (OK + KO) |
| [`tools/obscurio-solve.py`](tools/obscurio-solve.py) | **keygen** user → password (`-q`, `--check`, `--wine`) |
| [`tools/obscurio-vm.py`](tools/obscurio-vm.py) | émulateur Python fidèle de l'hôte (hooks/trace) |
| [`tools/obscurio-dis.py`](tools/obscurio-dis.py) | désassembleur du bytecode (opérandes décodés) |

## Réponse

Le crackme demande **username + password**. Le password doit avoir exactement **2× la longueur du username** et respecter des contraintes de classes de caractères (voir plus bas).

| username | password |
|---|---|
| **`petik~~~`** | **`aavzzZZZZ///``8~`** |

```bash
python3 tools/obscurio-solve.py                 # user=petik~~~ → password
python3 tools/obscurio-solve.py -q              # aavzzZZZZ///``8~
python3 tools/obscurio-solve.py --user 'foo~~~~~' --check --vm analysis/extract/program.bin
python3 tools/obscurio-solve.py --wine analysis/extract/crackus.exe   # preuve sur le binaire d'origine
```

> **`petik` seul est impossible** : avec 5 lettres le password ferait 10 caractères, or il en faut au moins
> 5 minuscules + 4 majuscules + 3 ponctuations + 2 « crochets » + 1 chiffre = 15. D'où le suffixe neutre `~~~` (n = 8 → 16 caractères).

## Premier regard

```bash
unzip -P crackmes.one original/obscurio2.zip -d analysis/extract   # crackus.exe + program.bin
file analysis/extract/*
# crackus.exe: PE32+ executable (console) x86-64 (MinGW GCC 13.1)
# program.bin: data (1 018 184 octets = 127 273 instructions de 8 octets)
strings -n 6 analysis/extract/crackus.exe | grep -i "stack\|opcode\|heap\|program.bin"
# Operator stack overflow / Call stack overflow / Heap out of bounds / Unknown opcode: %i / program.bin
```

Les textes `Enter username:`, `Enter password:`, `nope`, `well done lmao` ne sont **pas** dans l'exe : ils sont construits par le bytecode
(`STOREH` caractère par caractère). `strings` ne les voit donc pas.

Run à vide : `Enter username: Enter password: nope` (≈ 8,3 M d'instructions VM, ~16 800 de plus par caractère de password — la boucle fait toujours 100 tours).

## Flow

1. `main` (`0x140002603`) ouvre `program.bin` (`fopen "rb"`), `fread` de qwords dans un tableau, puis appelle l'interpréteur `0x1400018a0`.
2. Le bytecode affiche `Enter username: `, lit une ligne (`op 0x1f8`), `Enter password: `, lit une ligne.
3. Il copie les deux chaînes dans deux tampons de 100 mots (fonction `memcpy` au pc 881).
4. Boucle de **100 itérations** (pc 26361 → 108123) : à chaque tour, caractère `c = user[i]`, `d = pw[i]` (0 au-delà de la fin) ; 9 compteurs `L6..L14` sont mis à jour.
5. Test final (pc 118296 → 126945) : conjonction de 9 comparaisons sur ces compteurs → `well done lmao` sinon `nope`.

## Comment on trouve

### 1. L'interpréteur (hôte x86-64)

Ancrage : `objdump -d -M intel analysis/extract/crackus.exe` ; la fonction de la VM est en `0x1400018a0`
(la chaîne `"Unknown opcode: %i"` en `0x14000c0a5` est référencée par le `default` en `0x14000259f`), les tables de décodage sont en `.rdata`.
Chaque instruction = 1 qword : `op` (dword bas) + `arg` (dword haut) ; l'`arg` est **obfusqué en fonction du pc** :

```text
0x14000c000 : 01 03 00 02                     (T4)
0x14000c020 : 03 08 01 0e 06 0c 09 00 0b 04 0f 07 0d 02 0a 05   (T16)

dec16(a)   = (a & ~0xf) + T16[a & 0xf]                       ; cibles de saut / call  (0x14000181b)
dec_idx(a,pc) = ((a<=0xf ? (a&~3)+T4[a&3] : (a&~0xf)+T16[a&0xf]) ^ (pc % 9))   ; index local/arg (0x14000175b)
dec_n(a,pc)   = ((a & ~3) + T4[a&3]) ^ (pc & 3)              ; taille de frame ENTER/LEAVE (0x140001858)
dec_const(a,pc) (0x1400016e5) :
    x = a ^ a>>8 ^ a>>16 ^ a>>24 (xorshift à pas 8,16)  ; x *= 0x65587ac3 ; x -= 0x71b5
    x ^= x<<5 ^ x<<10 ^ x<<20 ^ x<<40(→32 bits) ; x *= 0x62677787
    x ^= x>>7 ^ x>>14 ^ x>>28 ; x -= 0xa3d7 ; return x - pc
```

(`0x140001677` / `0x1400016ae` sont les deux « xorshift » `x ^= x >> k; k <<= 1` tant que `k <= 31`, droite et gauche.)

Table d'opcodes (relevée dans la chaîne de `cmp eax, imm` de `0x1400018a0`) :

| op | mnémonique | effet |
|---|---|---|
| `0x04` | PUSH | pile d'opérandes ← `dec_const` |
| `0x00/01` | LOADL / STOREL | local `cs[bp+idx+1]` |
| `0x02/03` | LOADA / STOREA | argument `cs[bp-idx-2]` |
| `0x05` | PUSHCS | dépile → pile d'appels (passage d'arg) |
| `0x28` / `0x2a` / `0x29` | CALL / ENTER n / LEAVE n | convention d'appel |
| `0x14` | JZ | saute si le sommet est 0 |
| `0x64 0x65 0x68 0x69 0x96` | AND OR SHL SHR NOT | **les seules opérations arithmétiques** |
| `0xc8 0xca 0xc9 0xcb` | OVER DUP ROT3 ROT4 | manip. de pile |
| `0x1f5 / 0x1f6` | LOADH / STOREH | tas (1 M mots) |
| `0x1f4 / 0x1f7 / 0x1f8` | PRINTI / PRINTS / READS | E/S |

Il n'y a ni `ADD`, ni `XOR`, ni comparaison : tout est recomposé à partir de AND/OR/NOT/SHL.
J'ai réécrit l'hôte en Python ([`tools/obscurio-vm.py`](tools/obscurio-vm.py)) ; il produit la même sortie que le binaire
(`petik/hello → nope`, `petik~~~`/`aavzzZZZZ///``8~` → `well done lmao`), ce qui valide le décodage.

### 2. Lire un bytecode « boolean-only »

Le désassemblage brut est illisible (127 k instructions) mais **extrêmement répétitif**. Gabarit d'un additionneur 32 bits :

```text
[ OVER OVER AND PUSH 1 SHL ROT3 OVER OVER AND NOT ROT3 OR AND ] × 32   puis OR      ; = ADD32 (417 instr.)
```

(carry = `(a&b)<<1`, somme = `(a|b)&~(a&b)`, déroulé 32 fois). Autres gabarits repérés par un RLE sur les n-grammes :

- `NOT PUSH 1 ADD32 ADD32` → soustraction `a - b` ;
- `DUP>>16 OR, DUP>>8 OR, DUP>>4 OR, DUP>>2 OR, DUP>>1 OR, PUSH 1 AND` → `x != 0` (smear des bits) ; suivi de `PUSH 1 XOR` → `x == 0` ;
- `PUSH 31 SHR` → bit de signe (comparaisons `a <= c <= b`) ;
- `ROT4 ADD32 …` ×32 → multiplication par décalage/addition (masque 0/-1 × valeur).

Avec ces macros repliées (le désassembleur [`tools/obscurio-dis.py`](tools/obscurio-dis.py) décode les opérandes ; le repli ADD32/RLE était un script jetable), la boucle de 81 k instructions devient quelques dizaines d'« instructions »
de haut niveau. En plus, on **sonde** la boucle avec l'émulateur : un hook sur le pc de fin de tour (108123) affiche les locals, ce qui permet
de mesurer l'effet de chaque caractère (tableau des deltas pour `c` = caractère du user, `d` = caractère du password) :

| local | mise à jour par position |
|---|---|
| `L6` | `+= c − d` |
| `L7` | `+= 'a'<=c<='z'` (minuscules du user) |
| `L8` | `+= 'a'<=d<='z'` (minuscules du password) |
| `L9` | `+= upper(d) − upper(c)` (`'A'..'Z'`) |
| `L10` | `+= (c−'0') si chiffre` `+ (d−'0') si chiffre` |
| `L11` | `+= (33<=d<=47) − voyelle(c)` (`aeiouAEIOU`, côté user) |
| `L12` | `+= 58<=d<=64` (`: ; < = > ? @`) |
| `L13` | `+= 91<=d<=96` (``[ \ ] ^ _ ` ``) |
| `L14` | `+= 2·(c≠0) − (d≠0)` |

(Le `L14` est le piège : valeurs mesurées `('ab','a') → 1,3`, `('a','ab') → 1,0`, `('','ab') → −1,−2` ⇒ `2·nz(c) − nz(d)`.)

### 3. Le test final (pc 118296 → 126945)

Les 9 tests, tous de la forme `x − k` puis `x != 0` :

```text
T1  (L6 & 255)  == 0          ← ... PUSH 255 AND, PUSH 0 NOT PUSH 1 ADD ADD, smear, ^1
T2  L7 == L8
T3  L8 != 0                   ← (même gabarit que T2 mais SANS le « PUSH 1 XOR » final) ← piège
T4  L9  == 4
T5  L10 == 8
T6  L11 == 1
T7  L12 == 0
T8  L14 == 0
T9  L13 == 2
```
combinés par `AND`, puis `JZ 127270` (→ `nope`).

**Piège** : une première lecture croyait `L8 == 0` ; le solveur « sans minuscule » faisait pourtant tomber exactement tous les autres
tests mais le stack-dump aux pcs `LOADL` (118715, 119585, 120506, …) montrait `[1]` après T1/T2 puis `[0]` après T3. T3 est `L8 != 0`
(pas de `PUSH 1 XOR`). D'où « nombre de minuscules identique et non nul » dans user et password.

### 4. Contraintes consolidées

Pour un user `U` (n caractères) et un password `P` :

```text
len(P) = 2·n                                  (T8 : 2·n − m = 0)
#minuscules(P) = #minuscules(U) ≥ 1           (T2, T3)
#MAJ(P) − #MAJ(U) = 4                         (T4)
Σ chiffres(U) + Σ chiffres(P) = 8             (T5)   (valeur du chiffre, pas le code ASCII)
#ponct[33..47](P) − #voyelles(U) = 1          (T6)
aucun caractère 58..64 dans P                 (T7)
exactement 2 caractères 91..96 dans P         (T9)
(Σ U − Σ P) mod 256 = 0                       (T1)
```

Seules les **classes** comptent (l'ordre n'a pas d'importance, ni les caractères exacts), donc le solveur fait un DP sur
`(somme mod 256, somme des chiffres)` en choisissant pour chaque emplacement un caractère de la bonne classe ; les emplacements
« libres » sont remplis avec `{ | } ~` (classe neutre : ni lettre, ni chiffre, ni 33..47, ni 58..64, ni 91..96).

### 5. Assemblage de la réponse pour `petik~~~`

| élément | valeur |
|---|---|
| n | 8 → `len(P) = 16` |
| minuscules(U) | `p e t i k` = 5 → 5 minuscules dans P |
| majuscules | U : 0 → P : 4 |
| voyelles(U) | `e i` = 2 → 3 ponctuations dans P |
| crochets | 2 |
| chiffres | `8` (somme = 8) |
| filler | 16 − 5 − 4 − 3 − 2 − 1 = **1** |
| somme | Σ`petik~~~` = 919 ≡ 151 (mod 256) ; Σ(P) = 1431 ≡ 151 (mod 256) |

⇒ `P = aavzzZZZZ///``8~` : `aavzz` (5 min.), `ZZZZ` (4 maj.), `///` (3 ponct.), ` `` ` (2 backticks), `8`, `~`.

## Debug GDB / x64dbg

Non utilisé (reverse 100 % statique + émulation). Aucune session x64dbg/x32dbg MCP active, ni MCP `ida` (pas d'IDA dans l'environnement) : lecture avec `objdump` seulement.

## Vérification

```bash
cd analysis/extract
printf 'petik~~~\naavzzZZZZ///``8~\n'  | xvfb-run -a wine crackus.exe   # → well done lmao
printf 'petik~~~\naavzzZZZZ///``8~x\n' | xvfb-run -a wine crackus.exe   # → nope   (longueur ≠ 2·n)
printf 'petik\nhello\n'                | xvfb-run -a wine crackus.exe   # → nope
```

Journal : [`analysis/wine-verify.log`](analysis/wine-verify.log). Le même résultat est reproduit par l'émulateur :
`python3 tools/obscurio-solve.py --check --vm analysis/extract/program.bin` (3 s).

## Notes

- `crackus.exe` doit être lancé **depuis le dossier de `program.bin`** (`fopen("program.bin")` relatif) ; stdin peut être un pipe.
- Les entrées sont lues jusqu'au `\n` ; les caractères > 127 ne sont pas utiles ici.
- Plusieurs passwords valides existent (seules les classes comptent) ; le solveur en donne un.
- Ce n'est **pas** un test d'égalité user/password : `L6` n'impose que `Σ U ≡ Σ P (mod 256)`.
