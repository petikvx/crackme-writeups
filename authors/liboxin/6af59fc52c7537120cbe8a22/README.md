# liboxin's unpack me v1

| | |
|---|---|
| **ID** | [`6af59fc52c7537120cbe8a22`](https://crackmes.one/crackme/6af59fc52c7537120cbe8a22) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | liboxin |
| **Plateforme** | Windows PE64, console, MSVC 19.44 + protecteur maison « aegis » |
| **SHA-256** (`original/download.bin`) | `bde7649418ee21bc7195aec59a5060888a3244d723fe06bcd04dee29cc5622ab` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP du site (mot de passe `crackmes.one`) contenant `crackme.protected.exe` — **non modifié** |
| `analysis/zip/crackme.protected.exe` | exe extrait du ZIP (pour Wine / objdump) |
| `analysis/dump.bin` | image PE (0x140000000–0x14003f000) **déchiffrée**, dumpée depuis `/proc/<pid>/mem` du process Wine |
| `analysis/iat.txt` | IAT (adresse + nom) générée par `tools/pe-imports.py` |
| `tools/liboxin-solve.py` | **solveur** + `--check` contre le binaire d'origine (Wine) |
| `tools/aegis-dump.py` | dump mémoire du process Wine bloqué sur le prompt |
| `tools/aegis-emu.py` | émulation Unicorn de `main()` sur le dump (recon, stubs CRT) |
| `tools/pe-imports.py` | liste les imports |

## Réponse

Le serial est **fixe** (aucun login) :

```text
N6NY-PHP1-WL48-NO51
```

```bash
python3 tools/liboxin-solve.py -q        # → N6NY-PHP1-WL48-NO51
python3 tools/liboxin-solve.py --check   # preuve OK + KO sous Wine
```

(L’exemple `petik` ne s’applique pas : le crackme ne demande ni nom ni login ; `petik` donne simplement `Invalid serial.`)

## Premier regard

```bash
mkdir -p analysis/zip && unzip -P crackmes.one original/download.bin -d analysis/zip
diec analysis/zip/crackme.protected.exe     # PE64, MSVC, pas de packer reconnu
objdump -h analysis/zip/crackme.protected.exe
```

- Sections `.text` (0x29800) / `.rdata` / `.data` / `.pdata` / `.fptable` / `.reloc` **+ `.aegis` et `.aegisd`** (ajoutées par le protecteur).
- Entry point = `0x14003c01c`, dans `.aegis` (et non dans `.text`). `.text` et `.rdata` sont chiffrés dans le fichier (`strings` ne sort que du bruit, aucun « serial » / « Invalid »).
- Lancé sous Wine : `serial> ` puis, pour une mauvaise saisie, `Invalid serial.`.

```bash
printf 'petik\n' | xvfb-run -a wine analysis/zip/crackme.protected.exe
# serial> Invalid serial.
```

## Flow

1. Stub `.aegis` (`0x14003c01c`) : retrouve la base, lit l’en-tête `AGIS` (`0x14003e280`, signature `0x53494741`), déchiffre `.text`/`.rdata` en place (XOR par blocs, puis `VirtualProtect`), résout ses API par hash, appelle les TLS/CRT init, puis saute à l’OEP RVA `0x13860` (lu à `[hdr+0xc]`, `jmp rax` en `0x14003c462`).
2. `main` (`0x140001000` → ret `0x14000425e`, mais le corps déborde jusqu’à ~`0x140012e00`) :
   - affiche `serial> ` (chaîne décodée à la volée, puis ré-effacée avec des `mov byte [..],0`) ;
   - `fgets(buf,0x80,stdin)`, `strcspn(buf,"\n")` → longueur ;
   - longueur **19** et `-` aux positions 4, 9, 14 ; les 16 autres caractères doivent passer `f9` (= `isalnum`-like, appelé 16 fois) ;
   - les `-` sont retirés → tableau de 16 caractères sur la pile ;
   - boucle de 16 tours : vérification d’un octet par caractère (voir ci-dessous) ;
   - succès : `Serial accepted. Welcome, operator.` / échec : `Invalid serial.`.

## Comment on trouve

### 1. Obtenir le code en clair

Le code est chiffré sur disque, mais le stub le déchiffre **avant** d’attendre la saisie. On laisse donc Wine arriver au prompt (stdin tenu ouvert par `sleep`) puis on lit la mémoire du process :

```bash
(sleep 40 | xvfb-run -a wine analysis/zip/crackme.protected.exe >/dev/null &)
# pid du process Wine qui mappe crackme.protected.exe (grep dans /proc/*/maps)
python3 tools/aegis-dump.py <pid>        # → analysis/dump.bin
objdump -D -b binary -mi386:x86-64 -M intel --adjust-vma=0x140000000 \
        --start-address=0x140001000 --stop-address=0x14002a800 analysis/dump.bin > analysis/dump.asm
```

(`gdb` n’est pas installé sur cette machine : pas de session GDB ; le reverse est statique sur le dump + émulation.)

`dump.asm` n’est pas versionné (2,5 Mo, régénérable).

### 2. Obfuscation de `main`

Le dump contient du code lisible mais volontairement pénible :

- **MBA** partout : `a+b-2*(a&b)` = `a^b`, `(a|b)-(a&b)` = `a^b`, `x+K … -K`, etc. ;
- **prédicats opaques** calculés depuis une graine pile `[rsp+0xc8]` (`imul 0x9e3779b9`, `shr 0xf`, …) qui valent toujours la même chose ;
- **control-flow flattening** : chaque bloc « réel » finit par `jmp` vers un bloc qui XOR trois graines (`[rsp+0xb0/b4/b8]`) puis passe par un hash (`imul 0x518166cf`, `rol`, …) → index d’une jump table (`0x14000c4cc`, `0x14000c86c`, …) ;
- **appels indirects** : `call rax` avec `rax = TABLE_A[i] ^ TABLE_B[i]` (écrit `a+b-2(a&b)`), tables en `0x140036dc0` / `0x1400361e0`. Décodées : `f3` = `printf`, `f4` = `__acrt_iob_func`, `f5` = `fflush`, `f6` = `fgets`, `f7` = `puts`, `f8` = `strcspn`, `f9` = test de caractère (`isalnum`-like) ;
- **chaînes chiffrées** dans `.data` (`0x140036000…`) décodées octet par octet juste avant usage, puis remises à 0.

Lire ça en statique à plat est inutile ; on émule.

### 3. Émulation Unicorn (`tools/aegis-emu.py`)

On charge `analysis/dump.bin` à `0x140000000`, TEB/GS minimal, IAT remplacée par des stubs, et on exécute `main` en :

- stubant les wrappers CRT quand leur adresse de retour est dans `main` (`f3/f7` = print, `f6` = fgets qui injecte le serial, `f8` = strcspn, etc.) ;
- laissant `f9` tourner nativement (c’est lui qui valide chaque caractère).

Avec `1234-5678-9ABC-DEF0` l’exécution fait ~245 000 instructions (≈2 s) et finit sur `Invalid serial.`. Deux entrées ne différant que par le dernier caractère donnent **exactement la même trace** : le contrôle ne branche donc pas sur la valeur, c’est un accumulateur de « tout est bon ».

Pour repérer les données utiles, on journalise les écritures dans le frame de `main` (`R0 = rsp après sub 0x2a8`) :

```text
R0+0x160..0x16f  16 caractères du serial sans les '-'   (copie en 0x1400028ac)
R0+0x17b         accumulateur 8 bits « acc »             (init 0x5a, écrit en 0x140003299)
R0+0x17c         somme cumulée des y
R0+0x188         index i de la boucle (0..15)
R0+0x196         c = caractère courant                   (0x140002adc)
R0+0x238         x = c ^ acc                             (0x140002b0d, version MBA de xor)
R0+0x247         y = TABLE[x]                            (0x140002b5a)
R0+0x26c         E[i] attendu
```

### 4. Le prédicat (une itération, `0x140002ad4` → `0x140003299`)

```asm
140002adc  mov  al,[rsp+rax+0x160]        ; c = clean[i]
140002af2  mov  [rsp+0x230],eax           ; c
140002af9  movzx eax,byte [rsp+0x17b]     ; acc
140002b0d  mov  eax,[rsp+0x230]
140002b14  add  eax,[rsp+0x234]           ; c + acc
140002b1b  mov  ecx,[rsp+0x230]
140002b22  and  ecx,[rsp+0x234]
140002b29  shl  ecx,1
140002b2c  sub  eax,ecx                   ; = c ^ acc   (x)
140002b62  lea  rax,[rip+0x334b9]         ; = 0x140036022 : SBOX[256]
140002b69  mov  al,[rax+rcx]              ; y = SBOX[x]
140002ff4  mov  eax,[rsp+0x24c]           ; y
140002ffb  cmp  eax,[rsp+0x26c]           ; y == EXPECT[i] ?   (EXPECT = 0x140036122 + i)
140003002  jne  <échec>
...
140003235  imul edx,ecx,7                 ; 7*c
14000324d  xor/and/shl/add                ; acc + 7*c      (MBA de l'addition)
140003290  ... + i                        ; + [rsp+0x188]
140003299  mov  [rsp+0x17b],al            ; acc = (acc + 7*c + i) & 0xff
```

Pseudo-code :

```c
acc = 0x5a;
for (i = 0; i < 16; i++) {
    c = clean[i];
    if (SBOX[c ^ acc] != EXPECT[i]) ok = 0;   // sbox en 0x140036022, 256 octets
    acc = (acc + 7*c + i) & 0xff;
}
```

Vérification de la formule d’`acc` sur la trace (`0123-4567-89AB-CDEF`) : `90 + 7*48 + 0 = 426 → 170 (0xaa)` ✓. ; `170 + 7*49 + 1 = 514 → 2` ✓ ; `2 + 7*50 + 2 = 354 → 98` ✓ … (le `0x17c` qui ressemblait à un candidat n’est qu’une somme des `y`, piège écarté en testant un modèle linéaire en `somme`, qui ne colle pas).

### 5. Tables

`SBOX` (0x140036022) et `EXPECT` (0x140036122) sont elles-mêmes déchiffrées au runtime (suite de `add/xor/sub` octet par octet dans `main`, flags `0x140036dba/dbb`). On les relit simplement dans la mémoire de l’émulateur après exécution (`rd(0x140036022,256)`, `rd(0x140036122,16)`) — elles sont identiques quel que soit le serial saisi, et `SBOX` est une **permutation** (256 valeurs distinctes), donc inversible. Elles sont embarquées dans `tools/liboxin-solve.py`.

`EXPECT = 4451ccbe2bed8a3d68dc1bc6a9c9aadc`

### 6. Inversion

L’accumulateur ne dépend que des caractères déjà choisis, pas de `y` : on reconstruit donc le serial caractère par caractère :

```text
c_i = SBOX^-1[EXPECT[i]] ^ acc_i ;  acc_{i+1} = (acc_i + 7*c_i + i) & 0xff ; acc_0 = 0x5a
```

| i | EXPECT[i] | x = SBOX⁻¹[EXPECT[i]] | acc_i | c_i = x ^ acc_i |
|---|---|---|---|---|
| 0 | `44` | `14` | `5a` | `N` (`4e`) |
| 1 | `51` | `4a` | `7c` | `6` (`36`) |
| 2 | `cc` | `b9` | `f7` | `N` (`4e`) |
| 3 | `be` | `42` | `1b` | `Y` (`59`) |
| 4 | `2b` | `dd` | `8d` | `P` (`50`) |
| 5 | `ed` | `89` | `c1` | `H` (`48`) |
| 6 | `8a` | `ee` | `be` | `P` (`50`) |
| 7 | `3d` | `c5` | `f4` | `1` (`31`) |
| 8 | `68` | `05` | `52` | `W` (`57`) |
| 9 | `dc` | `f7` | `bb` | `L` (`4c`) |
| 10 | `1b` | `ec` | `d8` | `4` (`34`) |
| 11 | `c6` | `76` | `4e` | `8` (`38`) |
| 12 | `a9` | `af` | `e1` | `N` (`4e`) |
| 13 | `c9` | `40` | `0f` | `O` (`4f`) |
| 14 | `aa` | `70` | `45` | `5` (`35`) |
| 15 | `dc` | `f7` | `c6` | `1` (`31`) |

Résultat : `N6NYPHP1WL48NO51` → avec les tirets (positions 4/9/14) : **`N6NY-PHP1-WL48-NO51`**. Les 16 caractères sont alphanumériques majuscules, ce qui est cohérent avec le test `f9` (c’est l’émulation qui l’a confirmé : ce n’est pas du hex strict, `1234-5678-9ABC-DEF0` passe `f9` aussi mais échoue ensuite au contrôle SBOX).

Piège : la contrainte de format n’est que `len==19` + tirets + 16 caractères « alnum » ; tout le reste est le contrôle SBOX/acc. Pas de dépendance au nom d’utilisateur, à la date ni à la machine.

## Vérification

Émulateur (`tools/aegis-emu.py`) :

```text
$ python3 tools/aegis-emu.py analysis/dump.bin N6NY-PHP1-WL48-NO51
   PRINT b'Serial accepted. Welcome, operator.\n'
RETURNED rax= 0x0 insns 225737
```

Binaire d’origine sous Wine (preuve live) :

```bash
python3 tools/liboxin-solve.py --check
# serial: N6NY-PHP1-WL48-NO51
# wine: serial> Serial accepted. Welcome, operator.
# wine (KO): serial> Invalid serial.        # même serial, dernier caractère changé
```

Autres cas KO observés sous Wine : `petik` → `Invalid serial.` ; `N6NY-PHP1-WL48-NO52` → `Invalid serial.`.

## Notes

- Le « unpack me » du titre : le protecteur aegis déchiffre tout au chargement ; on n’a pas besoin de reconstruire un PE propre, le dump `/proc/<pid>/mem` suffit pour lire et émuler.
- L’exe protégé détecte (rdtsc, `IsDebuggerPresent`) ; aucun debugger n’a été utilisé (ni GDB, ni x64dbg MCP actif) : reverse statique du dump + émulation Unicorn + preuve Wine.
- `original/` n’a pas été touché ; l’extraction du ZIP est sous `analysis/zip/`.
