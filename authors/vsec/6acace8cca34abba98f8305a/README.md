# VSEC Challenger No.1

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6acace8cca34abba98f8305a) · id `6acace8cca34abba98f8305a`  
> **Auteur** : vsec · **Plateforme** : Windows PE64 console, **Go** (garble `-literals` + [VM_Garble](https://github.com/NIKJOO/VM_Garble)) · 6,5 Mo  
> **Statut** : **solved** (keygen + preuve live sur l'exe d'origine)

Le binaire s'appelle `VSEC_Challenger_No.1.exe` mais affiche `Usage: ./nightmare <username> <serial>` : c'est un
build « nightmare » de la chaîne NIKJOO (garble + machine virtuelle). Username + serial, aucun mot de passe en dur.

| Fichier | Rôle |
|---|---|
| [`original/VSEC_Challenger_No.1.exe`](original/VSEC_Challenger_No.1.exe) | binaire d'origine (non patché) |
| [`tools/vsec1-solve.py`](tools/vsec1-solve.py) | **keygen** (`--user`, `-q`, `--check`) |
| [`tools/vsec1-flag.py`](tools/vsec1-flag.py) · [`tools/vsec1-flag-scan.py`](tools/vsec1-flag-scan.py) | déchiffrement du flag pour un username donné / balayage de usernames (`elite`) |
| [`tools/vsec1-trace.py`](tools/vsec1-trace.py) | traceur Win32 debug API (ctypes) : hooks int3 sur les helpers de l'interpréteur, sha256, `math/big` via `MethodByName` |
| [`tools/vsec1-trace-summary.py`](tools/vsec1-trace-summary.py) | résume une trace en `a op b = c` / `cmp` |
| [`tools/vsec1-disasm.py`](tools/vsec1-disasm.py) · [`tools/vsec1-unflatten.py`](tools/vsec1-unflatten.py) | décodeur du bytecode VM_Garble + dé-aplatissement (tables DISPATCH) |
| [`analysis/bigint-trace-petik.txt`](analysis/bigint-trace-petik.txt) | les 110 appels `math/big` (méthode + opérandes lus en mémoire) pour `petik` |
| [`analysis/trace-binop-petik-hex32.txt`](analysis/trace-binop-petik-hex32.txt) | trace des opérations binaires/comparaisons (serial `0123…cdef` → `Invalid`) |
| [`analysis/live-verification.txt`](analysis/live-verification.txt) | sorties live OK / KO / bornes |
| [`analysis/disasm/blob*-unflat.txt`](analysis/disasm/) | les 3 fonctions VM_Garble dé-aplaties |
| [`analysis/NOTES.md`](analysis/NOTES.md) | clés / adresses / pièges de la couche VM_Garble |
| `analysis/sub_140*.c` | sorties Hex-Rays (IDA) de l'interpréteur et des natives |

## Réponse

**Flag : `CMO{UsrN4m3_S3r14l_N1ghtm4r3_0nly_3l1t3_R3s_w1ll_p4ss}`** — imprimé lisible uniquement avec le username **`elite`** (le flag lui-même le dit : « only 3l1t3 »).

| username | serial | sortie |
|---|---|---|
| `elite` | **`d756c82bcaf7662ecc6b043b51ec3baf5ff2a029e7cd02d309b5d08f7ef6da90`** | `[+] Serial accepted` + flag ci-dessus |

Pour `petik` (serial accepté, flag illisible) :

| username | serial |
|---|---|
| `petik` | **`96e401d44c51e4241439f854d2ac0ce82cf41eefbee7aabda047e48a9d321923`** |

```bash
python tools/vsec1-solve.py --user petik            # affiche user + serial
python tools/vsec1-solve.py --user petik -q         # serial seul
python tools/vsec1-solve.py --user petik --check    # + lance l'exe d'origine
VSEC_Challenger_No.1.exe petik 96e401d44c51e4241439f854d2ac0ce82cf41eefbee7aabda047e48a9d321923
# [+] Serial accepted
```

Contraintes : username **4 à 32 octets**, serial = **64 caractères hex en minuscules** (32 octets).
Le serial dépend de l'username, pas de la machine.

## Premier regard

```text
$ VSEC_Challenger_No.1.exe                       -> Usage: ./nightmare <username> <serial>   (exit 1)
$ VSEC_Challenger_No.1.exe petik 12345           -> [-] Invalid serial                       (exit 1)
```

* PE64, ~6,5 Mo, statique, symboles garble (`strings` inutile : littéraux chiffrés — `Usage…` n'apparaît qu'au
  `WriteConsoleW`). Les fonctions `main` sont **virtualisées** : `runtime.main` appelle un stub
  (`sub_1403EC880`) qui lance `RunFunc(2)` de la VM VM_Garble.
* Ce qui trompe : le mot de passe du cousin [nimanikjoo nightmare](../../nimanikjoo/6ac6ee38ace07d1c3fbc499e/)
  (`G0_VM_15_H4RD_4S_H3LL_2026!`) **ne marche pas** ici ; et le bytecode VM_Garble (3 fonctions) ne contient **pas**
  le prédicat — voir ci-dessous.

## Flow

```text
runtime.main ─► sub_1403EC880 ─► sub_1403E4680 (interpréteur VM_Garble, func 2 = « main »)
                                   blob2 :  CALLN 16 ; CALLN 17 ; CALLN 18 ; RET 0
                                                        │
                                  native 18 (sub_1403F08A0) ─► sub_1403BFCE0  ◄── le vrai code
```

Deux couches de VM :

1. **VM_Garble** (`sub_1403E4680`) : seulement 3 fonctions — `blob0` (normalise un `any` en int64 : type-switch
   `int8…uint64`), `blob1` (`cmp(op, a, b)` générique), `blob2` (`main` : 3 appels de natives). Ce sont des
   *helpers de runtime* ; elles ne contiennent aucune constante du check.
2. **Interpréteur « reflect »** (`sub_1403BFCE0`, ~4000 lignes Hex-Rays ; 9 clones quasi identiques
   `sub_140395AA0 … sub_1403BFCE0`, seul le dernier est atteint depuis la native 18) :
   un programme chiffré de **2595 octets** (519 enregistrements de 5 octets, XOR roulant + CRC32 de contrôle) est
   exécuté sur des `reflect.Value`. Les opérations passent par des helpers partagés : binop `sub_140391460`
   (`eax` = op : `0 +  1 -  2 *  3 /  4 %  5 ^`), comparaison `sub_140391A80`, « truthy » `sub_1403921A0`,
   `MethodByName` `sub_140393FA0`, `Call` `sub_140393BA0`, index `sub_140395520`… Le script appelle donc des
   **méthodes Go par leur nom** : `Mul`, `Mod`, `Add`, `Exp`, `ModInverse`, `Xor`, `SetBytes`, `Bytes` (de
   `*math/big.Int`) et `sha256`.

Garde anti-debug : `sub_140395880` lit deux fois une horloge (`sub_1403958E0`) autour d'une boucle vide de 64
tours et abandonne (`return 0` → `Invalid serial`) si l'écart dépasse 50 000 000 — ça casse le pas-à-pas dans
cette fenêtre, pas les `int3` posés sur les helpers appelés plus tard.

## Comment on trouve

### 1. Ancrage

* IDA headless (MCP `ida`) sur `original/VSEC_Challenger_No.1.exe` ; xrefs de `sub_1403EC880` (appelé par
  `runtime.main` @ `0x1400490B9`) et du `mov eax, 2` qui choisit la fonction VM (`func 2`).
* Interpréteur VM_Garble : `sub_1403E4680` ; décodeur d'instruction calé sur l'asm (`0x1403E4B7D`) :
  `wire = code[pc] ^ B0(pk)^B1(pk)^B2(pk)`, `op = xlat[wire]`, `arg = u64 ^ mix64(pk ^ 0xD6E8FEB86659FD93)`,
  `pk = mix64(mix64(ENV ^ KEY ^ pc·φ ^ pc<<17))` (détails dans [`analysis/NOTES.md`](analysis/NOTES.md)).
* Les trois blobs se consomment **exactement** (`leftover=0`) → décodage correct. Il manquait les tables
  DISPATCH : `case 52` (`sub_1403E4680` l. 1254) lit `v320[idx]` avec `v320 = off_14063E4F0`, c'est-à-dire
  **les 3 slices Go `Dispatch` des fonctions** (`{0x140620AE8,38}`, `{0x1406200C8,28}`, `{0x14061DCE0,5}`), pas des
  blobs « nested ». Formule vue dans l'asm :

  ```text
  pc = table[state] ^ TableKey2 ^ TableKey ^ mix64(TableKey) ^ mix64(TableKey2)
  ```

  100 % des cibles tombent sur un début d'instruction. `python tools/vsec1-unflatten.py` produit alors
  `blob0/1/2-unflat.txt` : `blob2` = `CALLN 16 ; CALLN 17 ; CALLN 18 ; RET 0`.

### 2. Où est le prédicat ?

`blob0`/`blob1` n'ont aucune constante utile (normalisation numérique et comparaison). La suite est donc dans les
natives : `CALLN 18` → `sub_1403F08A0` → **`sub_1403BFCE0`**. Sa pile d'appels au moment du `WriteConsoleW`
d'`Invalid serial` (x64dbg, session déjà active sur l'exe) confirme : `runtime.main → VM → native 18 →
sub_1403BFCE0 → … → fmt/os.File.Write`.

Pseudo-code (Hex-Rays) du début de `sub_1403BFCE0`, simplifié :

```c
if (anti_debug_timing()) return 0;                     // sub_140395880
buf = decrypt(off_14063E450, len=2595);                // buf[i] = data[i] ^ i ^ BYTE0(k) ^ BYTE1(k) ; k0 = 0xF4B15E7E ; k = i + 0x6B172C19*k + 0x9E3779B9
if (crc32(buf) != 0x7A473A21) { wipe; return 0; }      // CRC32 (poly 0xEDB88320)
for (pos = 0; pos + 5 <= len; pos += 5) {              // 5 octets / instruction
    xor5(buf+pos, (0x01000193*pos) ^ 0x9FA67267, LCG 1103515245/12345);
    regs[8] = microprogram(rec)                        // opcodes 0..10 : load8/32, const, xor, add, mul, ...
    key = hash(regs) ; (op, variant) = map[key]        // sub_14000B200 (lookup dans une map)
    run template[3*op + (hi16(state)+sel)%3]           // 16 types d'opérations sur une pile de reflect.Value
    re-xor5(buf...)                                    // auto-modifiant
}
```

C'est un **interpréteur de bytecode à gabarits** (35 opcodes × 3 variantes, états mutants) : le lire à la main est
hors de portée raisonnable. On le **trace** à la place.

### 3. Trace dynamique (Win32 debug API, sans patch)

`tools/vsec1-trace.py` lance l'exe d'origine sous `DEBUG_ONLY_THIS_PROCESS` (ctypes, aucune dépendance) et pose
des `int3` à l'entrée **des helpers partagés** (adresses IDA, relocation auto) :

| Hook | VA | Ce qu'on logge |
|---|---|---|
| `binop` | `0x140391460` | `eax` = op, `A`/`B` = (type, ptr) → valeurs int64 / string / octets, + résultat au `ret` |
| `cmp` / `truthy` | `0x140391A80` / `0x1403921A0` | comparaisons et booléens |
| `MethodByName` | `0x140393FA0` | nom de méthode (`rcx`/`rdi`) + valeurs `*big.Int` (`{neg, abs[]}` lus en mémoire) |
| `sha256` | `0x1403F2200 / F27E0 / F38E0` | bloc de 64 o en entrée + digest au retour |

Les types sont reconnus par leur adresse (`0x1405DF290` = int64, `0x1405DF050` = string…).

Première trace avec `petik` / `12345` : 37 évènements seulement, fin sur l'état `99` (échec). Les comparaisons
donnent **les contraintes d'entrée** :

```text
cmp len(user)   < 4      -> echec      (user >= 4)
cmp len(user)   > 32     -> echec      (user <= 32)
cmp len(serial) < 32     -> echec      (serial >= 32 ; et en pratique == 64 car comparé à un hex de 64)
```

Avec un serial hex de 32 caractères et `petik`, la trace passe à 563 opérations et se termine par :

```text
cmp '0123456789abcdef0123456789abcdef' == '96e401d44c51e4241439f854d2ac0ce82cf41eefbee7aabda047e48a9d321923' -> false
```

Le serial attendu est donc **calculé** par le programme et comparé à l'argument : c'est lui qu'il faut
reconstruire. (On pourrait déjà le lire pour chaque username en traçant, mais on veut un keygen.)

### 4. Reconstruction

**SHA-256 (3 appels, hookés).** Entrées lues dans les blocs de 64 octets :

| # | Entrée | Digest |
|---|---|---|
| 1, 2 | `"petik" ‖ 9a3f7c12e85b9144` (13 o) | `a = 908747d2dc32b18b…2ff98971` |
| 3 | `"petik" ‖ "NIGHTMARE"` (14 o) | `b = 6352ec133570c140…4cce8d3e` |

La salière `9a3f7c12e85b9144 ‖ 2d6af10873be19c5 ‖ 4e872bd9610fa35c` (S1‖S2‖S3) n'existe pas en clair :
elle est produite à l'exécution par une boucle `out_i = data_i ^ k_i`, `k_{i+1} = (k_i·27 + 90 + i) & 0xFF`,
`k_0 = 90` (visible dans la trace : `92 ^ 90 = 6 ; 90*27 = 2430 ; +90 ; +0 …`).

**`math/big` par réflexion.** `analysis/bigint-trace-petik.txt` montre les 110 appels (le calcul est exécuté **deux fois d'affilée**,
#715–#811 puis #1058–#1155, avec les mêmes opérandes — une re-vérification ; seule la 1ʳᵉ passe est détaillée). Les modules
apparaissent en clair :

| Module | Valeur | Identification |
|---|---|---|
| `p` | `0xFFFF…FFFFFFFEFFFFFC2F` | corps **secp256k1** |
| `n` | `0xFFFF…BAAEDCE6AF48A03BBFD25E8CD0364141` | ordre secp256k1 |
| `q` | `0x7FFF…FFFFFFED` | `2²⁵⁵ − 19` (Curve25519) |

Lecture de la séquence pour `petik` (numéros = évènements de la trace) :

| Évènements | Appels | Calcul |
|---|---|---|
| `#715` | `SetBytes` | `H = int(a)` |
| `#727–#772` | 6 × (`Mul`,`Mod`,`Add`,`Mod`) | `F = Σ cᵢ·Hⁱ mod p`, `c = 1337c0de, deadbeef, cafebabe, 8badf00d, feedface, dead10cc` |
| `#780–#781` | `Add`, `Mod` | `y = (S2 + 5·435) mod n` (`5·435 = 0x87f`, 5 = `len(user)`) |
| `#783` | `Exp` | `T = F^y mod p` |
| `#787–#795` | `SetBytes`, `Mod`, `ModInverse`, `Mul`, `Mod` | `m = int(S3‖user) mod q` ; `W = T·m⁻¹ mod q` |
| `#798–#802` | `SetBytes`, `Xor`, `Exp` | `e = int((S1‖S2)[4:12]) ^ 0x5a5a5a5a5a5a5a5a` ; `X = W^e mod q` |
| `#805–#806` | `Mul`, `Mod` | `V = X · 0x133713371337 mod p` |
| `#809–#811` | `SetBytes`, `Xor`, `Mod` | `R = (V ^ int(S1‖S2)) mod p` |

Valeurs intermédiaires pour `petik` (identiques à la trace) :

```text
H = 0x908747d2dc32b18b2e014b8b3f996cba5d573bac582249e35e6b191d2ff98971
F = 0x8e7207290fbba63a00ac4a4421045707ce78df1ceb179eef433bff508466daf9
y = 0x2d6af10873be2244
T = 0xc64288d9e2e82a1ea6f79ec8a99d1ae689975526427100a088b62febf75638e4
m = 0x4e872bd9610fa35c706574696b          (S3 ‖ "petik")
m⁻¹ mod q = 0x24f532157f57da3f2bb845835ac092584b0310f2cda0a0261d4fdd24998683b6
W = 0x735b2e2cbd6ba6d9c76f6cee4d49b37bd94697bf92b4798fc47a01a18a9c4c67
e = 0xb201cb1e7730ab52
X = 0x39c39202daf80984b4a5ecb2d55e2216cfc14463319497ffefeb45ec4807a77f
V = 0xf5b6edc7792125641439f854d2ac0ce8b6cb62fd56bc3bf98d2d1582ee8c00e6
R = f5b6edc7792125641439f854d2ac0ce82cf41eefbee7aabda047e48a9d321923   # V ^ (S1‖S2), 32 octets
```

**Étape finale (le piège de la comparaison).** Le tableau `R` est ensuite XORé *en place*, mais **seulement sur
les 8 premiers octets**, avec le début de `b` (boucle `i < 8 && i < 32`, `0 < 8`… `8 < 8` faux dans la trace) :

```text
R[0..8)  = f5 b6 ed c7 79 21 25 64
b[0..8)  = 63 52 ec 13 35 70 c1 40
R^b      = 96 e4 01 d4 4c 51 e4 24   → "96e401d44c51e424"
R[8..32) inchangé                    → "1439f854d2ac0ce82cf41eef…321923"
serial   = hex(R) = 96e401d44c51e4241439f854d2ac0ce82cf41eefbee7aabda047e48a9d321923
```

C'est exactement la chaîne comparée au serial (dernier `cmp` de la trace). Au passage, la trace montre que
`sha256(R_avant_xor)` sert ensuite de clé pour un « flag » de 54 octets imprimé après `[+] Serial accepted` : il
dépend de l'username, c'est du binaire (non lisible) pour tous les usernames testés — ce n'est pas le serial.

### 5. Pièges rencontrés

* **Hex-Rays se trompe sur les slices Go** et l'ABI (`RAX,RBX,RCX…`) : pris d'abord les slices `Dispatch`
  pour des blobs « nested » (38/28/5 octets d'« opcodes poubelle »). Le désassemblage du `case 52` a tranché.
* Le prédicat n'est **pas** dans les 3 fonctions VM_Garble (95 % du temps passé là) ; elles ne font que
  normaliser/comparer des entiers pour le vrai interpréteur.
* Sortie : `WriteConsoleW` en console, octets bruts si redirigée ; l'exit code (`0` OK, `1` KO) est le plus
  simple à tester. Le « flag » est binaire (voir Notes) : attention à l'affichage console.
* ASLR : `base = ImageBase + delta` ; tous les `int3` et toutes les adresses de types sont rebasés.
* Le timing anti-debug : ne **jamais** pas-à-pas au début de `sub_1403BFCE0` ; les `int3` sur les helpers
  (appelés plus tard) passent sans souci.
* L'« integrity » (sommes/XOR sur ~24 octets, `cmp 121 == 121`) et les `(x·(x+1)) % 2` sont des **prédicats
  opaques** : toujours vrais, sans lien avec l'username.

### 6. Le flag (username `elite`)

Après `Serial accepted`, la trace montre une 4ᵉ boucle sur 54 octets (`i % 32`, `i % 24`) :

```text
D  = SHA256(R)            # R = 32 octets AVANT le xor des 8 premiers octets avec b ; digest lu au bloc sha256 #1807
S  = S1 ‖ S2 ‖ S3         # les 24 octets de salière
flag[i] = ct[i] ^ D[i % 32] ^ S[i % 24]          # i = 0..53, ct constant du programme
```

Exemple trace `petik` : `226 ^ 62 = 220 ; 220 ^ 154 = 70 …` (`62 = D[0] = 0x3e`, `154 = S[0] = 0x9a`).
`ct` s'extrait de la sortie du binaire (xor involutif) et la formule se vérifie en rejouant un autre username
(`vsec1-flag.py` : `alice` reproduit l'exe). Comme `D` dépend de l'username, le texte n'est clair que pour
**un** username : on balaye un dictionnaire (`vsec1-flag-scan.py words`, ~16 000 candidats) en gardant ceux
dont les 54 octets sont tous imprimables ; un seul tombe : `elite`.

```text
$ VSEC_Challenger_No.1.exe elite d756c82bcaf7662ecc6b043b51ec3baf5ff2a029e7cd02d309b5d08f7ef6da90
[+] Serial accepted
[+] Flag: CMO{UsrN4m3_S3r14l_N1ghtm4r3_0nly_3l1t3_R3s_w1ll_p4ss}
```

## Prédicat consolidé

```python
P = 2**256 - 2**32 - 977                 # secp256k1 field
N = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141
Q = 2**255 - 19
S1, S2, S3 = bytes.fromhex("9a3f7c12e85b9144"), bytes.fromhex("2d6af10873be19c5"), bytes.fromhex("4e872bd9610fa35c")
C = [0x1337C0DE, 0xDEADBEEF, 0xCAFEBABE, 0x8BADF00D, 0xFEEDFACE, 0xDEAD10CC]

def serial(user: bytes) -> str:                       # 4 <= len(user) <= 32
    H = int.from_bytes(sha256(user + S1).digest(), "big")
    F = sum(c * pow(H, i, P) for i, c in enumerate(C)) % P
    y = (int.from_bytes(S2, "big") + 435 * len(user)) % N
    T = pow(F, y, P)
    m = int.from_bytes(S3 + user, "big") % Q
    W = T * pow(m, -1, Q) % Q
    e = int.from_bytes((S1 + S2)[4:12], "big") ^ 0x5A5A5A5A5A5A5A5A
    V = pow(W, e, Q) * 0x133713371337 % P
    R = ((V ^ int.from_bytes(S1 + S2, "big")) % P).to_bytes(32, "big")
    b = sha256(user + b"NIGHTMARE").digest()
    return bytes(R[i] ^ b[i] if i < 8 else R[i] for i in range(32)).hex()
```

## Debug live (Win32 debug API / x64dbg — pas de GDB)

Pas de GDB : binaire PE. Deux outils :

1. **x64dbg MCP** (session déjà active sur une copie temporaire de l'exe) : `kernel32!WriteConsoleW`
   atteint après `[-] Invalid serial` → `GetCallStack` donne `runtime.main → EC880 → interpréteur → native 18
   → sub_1403BFCE0 → … → Write` (adresses `image+0x…` converties en VA IDA). Dump de `xlat`
   (`image+0x6A0780`, 256 octets) pour la couche VM_Garble.
2. **`tools/vsec1-trace.py`** (reproductible, sans debugger graphique) :

   ```text
   python tools/vsec1-trace.py petik 0123456789abcdef0123456789abcdef > trace.txt
   python tools/vsec1-trace-summary.py trace.txt                # a op b = c / cmp
   python tools/vsec1-trace.py --find 1439f854d2ac0ce82cf41eef petik <serial>   # balaye le tas à chaque évènement
   python tools/vsec1-trace.py --step 1155 --funcs funcs.txt petik <serial>      # single-step d'un seul appel
   ```

   Astuce qui a débloqué la suite : `--find` cherche un motif (ici `R[8:24]`) dans toutes les régions RW privées
   après chaque évènement — il a localisé la création de `R` entre `MethodByName("Bytes")` (#1155) et l'add
   `user+"NIGHTMARE"` (#1156), puis le contexte mémoire (`func(*main.HashInt) []uint8`) a révélé `math/big`.

## Vérification

Binaire d'origine, Windows 10 natif ([`analysis/live-verification.txt`](analysis/live-verification.txt)) :

| Cas | Résultat |
|---|---|
| `petik` + `96e401d4…1923` | `[+] Serial accepted` (exit 0) |
| même serial, dernier nibble changé | `[-] Invalid serial` (exit 1) |
| même serial en MAJUSCULES | `[-] Invalid serial` |
| serial tronqué à 62 caractères | `[-] Invalid serial` |
| `petik` + serial de `alice` | `[-] Invalid serial` |
| `alice` + `a4030eb2…8224` | `[+] Serial accepted` |
| username 3 car. (`abc`) | `[-] Invalid serial` même avec « son » serial |
| username 4 car. (`abcd`) / 32 car. | accepté |
| username 33 car. | `[-] Invalid serial` |
| aucun / un seul argument | `Usage: ./nightmare <username> <serial>` |

Le keygen reproduit les 20 usernames collectés par traçage (`petik`, `petil`, `abcd`, `zzzz`, `Petik`,
`petikpetik`, `12345678`, `alice`, … ) : le serial attendu lu dans le dernier `cmp` du binaire est identique.

## Notes

* Le serial est valide pour **cet** username : changer l'username change tout (`R` et `b`).
* Tout username 4..32 donne `Serial accepted`, mais le flag n'est lisible que pour **`elite`** (voir ci-dessous).
* Aucune dépendance machine/horloge ; seule contrainte d'environnement : ne pas ralentir le début de
  `sub_1403BFCE0` (timing).
