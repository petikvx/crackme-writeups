# liboxin's Unpack me v3

| | |
|---|---|
| **ID** | [`6af9f24cc0ad374eab0818d1`](https://crackmes.one/crackme/6af9f24cc0ad374eab0818d1) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | liboxin |
| **Plateforme** | Windows PE64 (MinGW, console) protégé par le packer « aegis » |
| **SHA-256** (`original/download.bin`, un ZIP) | `eca2f8fa9a6235d8aa433a91b2e688d89017d4f5b0a1650599c05d87db274fdb` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mdp `crackmes.one`) → `vmcrack.protected.exe` |
| `analysis/extracted/vmcrack.protected.exe` | exe extrait du ZIP (SHA-256 `f1bad8b3…9815`) |
| `analysis/aegisd_live.bin` | dump mémoire de `.aegisd` (table de pages déchiffrée par le stub) |
| `analysis/vmcrack.unpacked.exe` | image avec `.text`/`.rdata` déchiffrés |
| `analysis/vm-program.txt` | bytecode de la mini-VM désassemblé |
| `tools/aegis-unpack.py` | déchiffrement statique des pages |
| `tools/keymix-emu.py` | émulation unicorn de la fonction virtualisée `key_mix` |
| `tools/vm-disasm.py` | désassembleur de la mini-VM |
| `tools/vmcrack-solve.py` | **solveur** (`-q`, `--check`) |

## Réponse

Pas de user : le crackme demande un mot de passe unique (48 caractères).
(Pas de « petik » applicable ici.)

```
flag{VM_1s_a_h4rd_w4y_t0_h1de_but_a3g1s_d0ne_it}
```

```bash
python3 tools/vmcrack-solve.py -q          # affiche le mot de passe
python3 tools/vmcrack-solve.py --check     # rejoue le prédicat en Python
unzip -P crackmes.one original/download.bin -d analysis/extracted
printf '%s\n' "$(python3 tools/vmcrack-solve.py -q)" | xvfb-run -a wine analysis/extracted/vmcrack.protected.exe
```

## Premier regard

- `download.bin` est un **ZIP** (pas un exe) : `unzip -P crackmes.one`. Extrait dans `analysis/extracted/` (on ne touche pas à `original/`).
- PE64 console, sections inhabituelles `.aegis` (code du stub, EP `0x14001a020`) et `.aegisd` (données), plus des sections `/4 /19 …` (DWARF MinGW). `objdump -x` refuse le fichier ; `strings` ne montre rien d'utile (`.text` chiffré).
- Run Wine : `input: ` puis `Wrong.` (ou `Correct!`) — chaînes qu'on retrouvera après déchiffrement en `.rdata` (`0x140009000`).

## Flow

EP stub aegis → (déchiffrement / VEH par page) → CRT MinGW → `main` (`0x140007ba0`) → lecture stdin, **trim des espaces finaux**, longueur exigée = `0x30` (48) → mini-VM de 327 instructions → `Correct!` / `Wrong.`.

## Comment on trouve

### 1. Le packer : pages `.text` chiffrées

Un dump de `/proc/<pid>/mem` du processus Wine (`xvfb-run -a wine …` laissé en attente sur stdin) montre que `.text` est encore chiffré sauf 2 pages : le stub déchiffre **à la demande** (VEH sur pages non accessibles). Lecture du stub (`objdump -D -b binary -mi386:x86-64 --adjust-vma=0x14001a000` sur `.aegis`) :

- Header `AGIS` à `0x14001d6b8` ; la table de pages (`hdr+0x18`, 16 entrées de 0x20 octets : `q0, rva, size, q10, flags, d1c`) est elle-même XORée au démarrage, **en place**. Le dump live de `.aegisd` donne donc la table en clair.
- Déchiffrement d'une page (`0x14001acee`) :
  ```
  key = mix(q0 ^ q10 ^ d1c) ^ [0x14001d084]      ; [d084] = 0 ici
  mix = splitmix64 finalizer (0xbf58476d1ce4e5b9, 0x94d049bb133111eb)
  pour chaque qword i de la page : page[i] ^= ks(key, i)      ; ks = 0x14001aeee
  ```
- `tools/aegis-unpack.py` rejoue ça sur le fichier → `analysis/vmcrack.unpacked.exe`. Contrôle : `.text` commence par du code MinGW valide, `.rdata` contient `Correct!\n Wrong.\n input: `.

### 2. `main` et la mini-VM

`main` (`0x140007ba0`) : `fgets` (`0x140007a60`), trim des `\t\n\v\f\r ` (masque `0x100002600` + `bt`), `cmp r8,0x30` → 48 octets obligatoires. Puis :

```asm
mov ecx,0xc0ffee ; call 0x140001450     ; seed = key_mix(0xc0ffee) -> r9d
lea r11,[0x140009580]                   ; mots d'instruction chiffrés
lea r10,[0x140009060]                   ; clés par instruction
lea r8 ,[0x14000901c]                   ; jump table (13 handlers)
loop:  ks = key_mix((pc*0x9e3779b9 + 0x1234567) ^ seed)
       w  = prog[pc] ^ ks               ; op = w>>24, rdi = w>>16&ff, rbp = w>>8&ff
       imm= ks ^ keys[pc] ^ 0xa5a5a5a5  ; immédiat (eax dans les handlers)
       if w > 0x0cffffff -> Wrong ; jmp table[op]
```

Registres de la VM = `dword [rsp+0x20+4*i]`, entrée = octets à `rsp+0x30`. Handlers (op → sens) : 0 `LOADB`, 1 `SHL`, 2 `SHR`, 3 `XORI`, 4 `MULI`, 5 `XOR rr`, 6 `MOV`, 7 `CMPI`, 8 `JZ` (saut si flag=0), 9 `WIN` (`Correct!`), 10 `FAIL`, 11 `CMP rr`, 12 `LDK` (`reg = key_mix((imm*0x9e3779b9+0x7a7a7a7a)^seed)`). `tools/vm-disasm.py` produit `analysis/vm-program.txt`.

### 3. Piège : `key_mix` (`0x140001450`) est virtualisée

Les 5 premiers octets sont `jmp 0x14001b8d0` → `push 0 ; jmp 0x14001ba2c` : c'est une fonction **virtualisée par le stub aegis** (bytecode dans `.aegisd`), les octets suivants (`xor eax,ecx ; imul 0x85ebca6b …`) sont un leurre/résidu qui induit en erreur (ils donnent `fmix32(x)` correct seulement pour `x < 0x10000`).
`tools/keymix-emu.py` (unicorn, image unpackée + `.aegisd` live, appel à `0x140001450`) donne la vraie fonction :

```
key_mix(x) = H(x ^ (x >> 16))   avec   H(x): x*=0x85ebca6b; x^=x>>13; x*=0xc2b2ae35; x^=x>>16
```
(vérifié sur x = 1, 2, 0x10000, 0xc0ffee, 0xffffffff, 0x12345678).

### 4. Le prédicat

Le bytecode (`analysis/vm-program.txt`) est 12 blocs identiques :

```
r1 = in[4k] | in[4k+1]<<8 | in[4k+2]<<16 | in[4k+3]<<24      ; LOADB/SHL/XOR
r0 ^= r1 ; r0 ^= 0x9e3779b9
r0 = H(r0)                                                    ; r2 = r0>>16 … MUL … 
r2 = LDK ^ imm  (= T[k]) ; if r0 != r2 -> FAIL
```
avec `r0 = 0x243f6a88` au départ (premier `XORI r0`). `H` est bijective (xorshift + multiplications par impairs), donc pour chaque bloc :
`w_k = H⁻¹(T[k]) ^ 0x9e3779b9 ^ T[k-1]` (`T[-1] = 0x243f6a88`).

Cibles : `T = 61d19662 cf4be1ab e7567332 ac7ab4ae 9dbdf84e 1641201d 1d35daf1 029e8805 2ddb7834 63162d42 a91a86c4 16ae42ce` ; chaque `T[k]` = `LDK ^ XORI` lu dans le programme déchiffré.
Exemple bloc 0 : `H⁻¹(0x61d19662) ^ 0x9e3779b9 ^ 0x243f6a88` = `"flag"` LE.

## Debug live / GDB

Pas de GDB. Analyse statique + lecture mémoire `/proc/<pid>/mem` du process Wine + émulation unicorn (`pip install unicorn`). x64dbg/IDA MCP non utilisés. (`winedbg` essayé, inexploitable à cause des pages gardées du packer.)

## Vérification

| Entrée | Binaire d'origine (Wine) |
|---|---|
| `flag{VM_1s_a_h4rd_w4y_t0_h1de_but_a3g1s_d0ne_it}` | `input: Correct!` |
| même chaîne + `X` (49 car.) | `input: Wrong.` |
| `flaG{VM_…}` (1 octet changé) | `input: Wrong.` |

Le SHA-256 de l'exe extrait est `f1bad8b3…9815`, binaire non modifié.

## Notes

- Le crackme est un « unpack me » : la protection est le stub, la logique est une VM maison à chaîne de hash inversible.
- Les 5 octets de `key_mix` en clair sont un piège : réimplémenter la fonction à la main sans émulation donne un résultat faux.
- Le trim des espaces finaux signifie qu'un mot de passe ne peut pas se terminer par un espace (sans importance ici).
