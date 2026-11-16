# liboxin — hellgate1

| | |
|---|---|
| **ID** | [`6af00c585fa39ab0d4ac2236`](https://crackmes.one/crackme/6af00c585fa39ab0d4ac2236) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | liboxin |
| **Plateforme** | Windows PE64 console, Rust (mingw) + protecteur « aegis » (`.text` chiffré) + mini-VM obfusquée |
| **SHA-256 (`original/download.bin`)** | `bc4d6e96c89298b8f7b248206e5a9c4ffb0c467a86cde8b50256034a52184ebd` — c'est **le ZIP** du site (mot de passe `crackmes.one`) |
| **SHA-256 (`hellgate.exe` extrait)** | `523def47aa279d0726e49eca8d58e9bda393ffec626392b78ed9387557238ae6` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine, non modifié |
| `analysis/extracted/hellgate.exe` | exe extrait du ZIP (`unzip -P crackmes.one`) |
| `analysis/hellgate.unpacked.exe` | exe avec `.text` déchiffré (sortie de `tools/aegis-unpack.py`) |
| `analysis/vm-trace-petik-free.txt` | trace des 2274 instructions VM pour l'entrée `00112233…ff` (op, a, b, imm) |
| `tools/hellgate-solve.py` | **solveur** (`-q`, `--check`) |
| `tools/aegis-unpack.py` | déchiffre les pages du protecteur |
| `tools/hellgate-emu.py`, `tools/hellgate-opnames.py` | émulation Unicorn de la fonction de check + noms des handlers |

## Réponse

Pas de login : l'entrée est **16 octets en 32 caractères hexa**.

| Entrée | Valeur |
|---|---|
| **Input** | **`60ca82e9e1d419424688d241affaa094`** |
| Sortie du binaire | `the trace closes.` puis `FLAG: CMO{9_r0und5_0f_c0ld_5t33l_0n3_d00r_0nly}` |

```bash
python3 -I tools/hellgate-solve.py -q
python3 -I tools/hellgate-solve.py --check analysis/extracted/hellgate.exe   # preuve sous Wine
```

(Pas de nom d'utilisateur dans ce crackme, donc pas d'exemple `petik`.)

## Premier regard

```bash
diec original/download.bin          # ZIP
unzip -P crackmes.one original/download.bin -d analysis/extracted
diec analysis/extracted/hellgate.exe   # PE64 (détecté « PureBasic » : faux, c'est du Rust/mingw)
strings -n 5 analysis/extracted/hellgate.exe | grep -iE "hellgate|FLAG|rustc"
echo test | xvfb-run -a wine analysis/extracted/hellgate.exe
#   HELLGATE  ::  nine rounds, one door
#   input: 32 hex characters (16 bytes)
#   > [!] input must be 32 hex characters
```

- `download.bin` est un ZIP, pas l'exe (piège : `file`/`strings` sur le `.bin` donnent du bruit).
- Sections inhabituelles `.aegis` / `.aegisd` ; point d'entrée dans `.aegis` (`0x140050000+0x1c`) → protecteur. Les chaînes Rust (`/rustc/…`) sont lisibles, mais le code de `.text` est chiffré par pages (mêmes noms de section que le protecteur de *unpack me v1* du même auteur).
- Messages : `the trace closes.` / `[x] the trace does not close.` / `[!] execution trap: state divergence`.

## Flow

1. Lecture de la ligne, parse de 32 hex → 16 octets (`0x140002620…`).
2. Appel de la fonction de check `0x14000e660(out, in16)` : elle construit 4 programmes de bytecode, les exécute dans une mini-VM et renvoie `out[0] = 1` si le dernier programme a laissé 0 dans un octet témoin.
3. Si OK : dérivation de la clé (`MAC1`/`STRM`) et XOR du blob de 0x29 octets `0x140042bd4` → affichage du flag. Sinon `the trace does not close.`.

## Comment on trouve

### 1. Dépacker `.text` (protecteur aegis)

Le stub `.aegis` (`objdump -d -M intel --start-address=0x140050000`) contient :

- une table `AGIS` à `0x140052280` : magic, OEP (`+0xc` = `0x13f0`), flags (`+0x10` = `0x29`), nombre d'entrées (`+0x14` = `0x3b`), RVA de la table (`+0x18`) ;
- une entrée de 32 octets par page : `clé u64 | rva | taille | FNV-1a64 du clair | flag`.
- le déchiffreur `0x14005061d` : pour chaque bloc de 8 octets `i`, `qword ^= f(clé, i)` ; `f` (`0x1400506e1`) est un mélangeur type splitmix64 (constantes `0x9e3779b97f4a7c15`, `0xbf58476d1ce4e5b9`, `0x94d049bb133111eb`, `rol 0x17`, `0xc2b2ae3d27d4eb4f`) ; le hash FNV-1a-64 du clair est comparé à l'entrée.

`tools/aegis-unpack.py` réimplémente ça : **59/59 pages** ont un FNV valide → `.text` déchiffré (`analysis/hellgate.unpacked.exe`). Cela évite d'avoir à dumper la mémoire sous Wine.

Pièges : `gdb` absent de la machine ; l'anti-debug du protecteur (`rdtsc`, `Module32*`, `VirtualProtect`, `PEB.BeingDebugged` via `gs:0x60`) rend un debug live pénible → émulation (§3).

### 2. Retrouver la VM

Dans le `.text` déchiffré, `0x14000e660` (check) empile des programmes de bytecode et appelle `0x14000f940` → `0x14000a6e0` (boucle d'exécution). Chaque pas :

- décode l'instruction (octets chiffrés, MAC par instruction, clé roulante tous les 64 pas) ;
- appelle `handlers[op & 0x1f]` (table copiée à `0x14004b030`) avec `(vm, a, b, imm)` ;
- les registres `u32` sont stockés **masqués** par `vm+0x858` (`stocké = réel ^ masque`).

Les handlers (`0x1400089e0…0x1400097b0`) sont courts et lisibles :

| op | handler | sémantique (valeurs réelles) |
|---|---|---|
| 1 | `0x1400089f0` | `MOVI a, imm32` |
| 2/3/4/5 | `8a00/8a10/8a40/8a60` | `MOV`, `ADD`, `XOR`, `SUB` |
| 6/7 | `8a90/8ac0` | `AND`, `OR` |
| 8/9/10 | `8af0/8b20/8b50` | `SHL`, `SHR`, `ROL` (par `b & 31`) |
| 11 | `8b80` | `a *= (b \| 1)` |
| 15/16 | `8c00/8cf0` | `LDB/STB` : octet de `buf[handle(a)][imm16]` |
| 17/18 | `8de0/9090` | `LD32/ST32` |
| 19 | `9330` | `CMP a,b` ; `23 (93a0)` : `CMPM` (a == 0 ?) |
| 20–22 | `9350/9370/9390` | `JE/JNE/JMP` |
| 26 | `9580` | `MIX` (hash 32 bits type lowbias32) |
| 27 | `95e0` | `SBOX` : `a = SB[(b ^ glob) & 0xff]`, `SB` = permutation de 256 octets mélangée au 1er appel |
| 28 | `97b0` | `HALT` |

Les « buffers » ne sont pas des pointeurs : ce sont des handles u32 pseudo-aléatoires (`0x14000e510`) indexant une table `(ptr,len)` à `0x14003d000`, d'où les longues boucles de recherche répétées dans chaque handler (bruit d'obfuscation, pas de logique).

### 3. Émulation + trace

`tools/hellgate-emu.py` charge l'exe dépacké dans Unicorn, remplace l'IAT par des stubs (HeapAlloc bump, memcpy, … ; autres API → 0), met un faux `gs:0x60`, puis appelle `0x14000e660`. Un hook à `0x14000ab64` (le `call rax` du handler) logue chaque instruction décodée : **2274 pas**, en 4 programmes (36 / 82 / 115 / 2041 instructions), **sans branchement** (aucun `JE/JNE` n'est exécuté). Les 3 premiers programmes ne font que de l'hygiène sur un buffer de 32 octets (hash MIX de l'entrée, etc.) (rôle exact non analysé en détail : le solveur n'en a pas besoin, la preuve Wine passe) ; le dernier (2041 pas) est le vrai prédicat.

### 4. Le prédicat : 9 rounds inversibles

Le programme n°4 est régulier. Avec `w0..w3` = entrée lue en 4 `u32` LE (`LD32 13`) :

```
pour k = 0..8 :
    w[i] ^= RK[16k + 4i .. +4]                    # LD32 8  / XOR
    pour chaque octet j de w[i] :
        octet = SB[ octet ^ K9[16k + 4i + j] ]    # LDB 9 / XOR / SBOX
    w0 += w1 ; w1 += w2 ; w2 += w3 ; w3 += w0    # ADD en cascade (w0 déjà mis à jour pour w3)
    w[i] = ROL(w[i], (13, 7, 17, 3)[i]) * (0xCBA5CA77, 0xA6F982F3, 0xC96079B1, 0x7D74B79F)[i]
final : pour chaque octet o de l'état : acc |= o ^ C11[o] ^ C14[o]   # puis CMPM acc == 0 ; STB
```

Comptes de handlers dans la trace : 144 `SBOX` = 9×16, 36 `ADD` = 9×4, 36 `ROL`/`MUL`/`ST32`, 40 `LD32` = 4 (entrée) + 36 (RK). Les tables `RK` (0x90 octets), `K9` (0x90), `C11`, `C14` (16) et `SB` (256) sont constantes (identiques pour deux entrées différentes) ; je les ai lues dans la mémoire émulée (handles `0x4378911a`, `0x7a19c40c`, `0x15ab5884`, `0x61055732`) et embarquées dans le solveur.

Validation du modèle : `forward()` du solveur reproduit exactement le journal d'états écrit par la VM (`ST32 10`) — dernier état `90aa7572fb41efeccf2448c73f14eda2` pour l'entrée `00..0f`, et pour une entrée aléatoire (identique octet pour octet).

### 5. Inversion

Chaque étape est bijective :

- les constantes de `MUL` sont impaires → inverse modulaire `pow(c, -1, 2**32)` ;
- `ROL` → `ROR` ;
- cascade d'ADD : `w3 = a3 − a0 ; w2 = a2 − w3 ; w1 = a1 − w2 ; w0 = a0 − w1` ;
- `SB` est une permutation → `SB⁻¹`, puis `^K9`, puis `^RK`.

On part de la cible `T = C11 ^ C14 = c49ee4a577c074be12431eef56d509cc` et on remonte les 9 rounds → `60ca82e9e1d419424688d241affaa094`. `forward(inverse(T)) == T` est assert dans le solveur.

## Vérification

Binaire **d'origine** (extrait tel quel du ZIP), sous Wine :

```text
$ echo 60ca82e9e1d419424688d241affaa094 | xvfb-run -a wine analysis/extracted/hellgate.exe
  HELLGATE  ::  nine rounds, one door
  input: 32 hex characters (16 bytes)

>
the trace closes.
FLAG: CMO{9_r0und5_0f_c0ld_5t33l_0n3_d00r_0nly}

$ echo 00112233445566778899aabbccddeeff | xvfb-run -a wine analysis/extracted/hellgate.exe
> [x] the trace does not close.

$ echo test | xvfb-run -a wine analysis/extracted/hellgate.exe
> [!] input must be 32 hex characters
```

L'émulation donne aussi `out[0] = 1` pour la bonne entrée et `0` pour `00112233…`.

## Notes

- Pas de GDB ni de x64dbg/x32dbg utilisés (pas de session debug live) → pas de section « Debug GDB » ; analyse statique (`objdump`) + émulation Unicorn. Le MCP `ida` / `decc` n'étaient pas disponibles dans cet environnement (`decc: command not found`).
- Les stubs d'émulation renvoient 0 pour les API anti-debug : ça n'a pas changé le résultat (confirmé par Wine).
- Le flag n'est pas stocké en clair : il est XORé avec une clé dérivée du bloc d'entrée validé (`MAC1`/`STRM`), donc seule la bonne entrée l'affiche.
- Détection « PureBasic » de DiE = faux positif.
