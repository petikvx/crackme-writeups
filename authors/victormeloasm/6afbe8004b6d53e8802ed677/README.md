# victormeloasm's Orbiyal Relay (Orbital Relay KeygenMe v1.0)

| | |
|---|---|
| **ID** | [`6afbe8004b6d53e8802ed677`](https://crackmes.one/crackme/6afbe8004b6d53e8802ed677) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | victormeloasm |
| **Plateforme** | Linux ELF64 x86-64, PIE, sans table de sections, console |
| **SHA-256** (`original/download.bin`, ZIP) | `dadb2939b738ad94cff76e367f4236ee6ca7cbf28871c6519c6654c29846e89a` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mot de passe `crackmes.one`), contient `orbital` — **non modifié** |
| `analysis/orbital` | ELF extrait du ZIP (sha256 `254f0f08…43d3`) |
| `analysis/orbital.asm` | désassemblage `objdump -D -b binary -mi386:x86-64` (le binaire n'a pas de sections) |
| `tools/orbital-solve.py` | **keygen** (z3) ; `-q`, `--user`, `--check <binaire>` |
| `tools/orbital-emu.py` | recon : émulation unicorn de la fonction de check `0x1960` |

## Réponse

Usage du crackme : `./orbital <username> <serial>` — user 3-32 car. `[A-Za-z0-9_.-]`, serial `XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX`.

| user | serial |
|---|---|
| `petik` | **`D61353CD-38AD8806-6D1E04F5-76AB1026`** |

```bash
python3 tools/orbital-solve.py --user petik --check analysis/orbital
python3 tools/orbital-solve.py -q --user <nom>      # serial seul
```

(Le serial n'est pas unique : z3 en renvoie un parmi les solutions possibles ; le binaire accepte celui-ci.)

## Premier regard

```bash
python3 -c "import zipfile;zipfile.ZipFile('original/download.bin').extract('orbital','analysis',pwd=b'crackmes.one')"
readelf -h analysis/orbital      # ET_DYN, entry 0x1510, « There are no sections »
strings -n 4 analysis/orbital
```

Strings utiles : `ORBITAL/V1:` (0x2000), `:SOYUZ/2026` (0x200c), `[+] LICENSE ACCEPTED`, `[-] ACCESS DENIED`, `[!] Invalid username.`, `[!] Invalid serial format.`.
Les en-têtes de section sont absents → `objdump -d` classique ne marche pas : `objdump -D -b binary -mi386:x86-64 -M intel --start-address=0x1000 --stop-address=0x1f80`
(offset fichier = VMA pour le segment `.text`).

## Flow

`main` = `0x10e0` (passé à `__libc_start_main` à l'entry `0x1510`) :

1. `argc == 3` sinon usage (rc 2).
2. `0x1182` : `strlen(user)-3 <= 0x1d` (3..32) et chaque caractère dans `[A-Za-z]` (`c&~0x20 - 'A' <= 25`) ou dans `-./0-9…_` via un bitmap `bt` sur `0xfffbffffffffe004` (c-0x2d ≤ 0x32 : `-`, `.`, chiffres, `_`).
3. `0x1216` : `strlen(serial) == 0x23` (35), `serial[9*i-1] == '-'` pour i=1..3.
4. `0x1240..0x13f1` : chaque groupe de 8 hexa (maj. ou min.) devient un `u32` **big-endian** (`shl 4 / or`), stocké dans `[rsp+0x10+4*i]`.
5. `0x1960(user, serial_words)` renvoie `al` ; ≠0 → `LICENSE ACCEPTED`.

## Comment on trouve le prédicat

### 1. SHA-256 du nom (0x1960 → 0x1600)

`0x1960` initialise 32 octets depuis `0x2200` : `67e6096a 85ae67bb 72f36e3c 3af54fa5 7f520e51 8c68059b abd9831f 19cde05b`
= IV SHA-256 (`6a09e667 bb67ae85 3c6ef372 a54ff53a 510e527f 9b05688c 1f83d9ab 5be0cd19`, LE). `0x1600` est l'`update` (buffer de 0x40, compteur d'octets à `+0x60`, `bswap` des 16 mots avant la compression, padding `0x80` + longueur BE sur 8 octets à la fin). Appels successifs :

```
update(ctx, "ORBITAL/V1:", 11)     ; 0x2000
update(ctx, user, strlen(user))
update(ctx, ":SOYUZ/2026", 11)     ; 0x200c
padding… ; digest = 8 mots d'état
```

Donc `h = SHA-256("ORBITAL/V1:" + user + ":SOYUZ/2026")`. Vérifié avec `tools/orbital-emu.py` : l'état en mémoire à `0x1a6a` = mots `h0..h7` de `hashlib` (stockés LE).

### 2. Mélange ARX du serial (0x1a6a–0x1e44)

Les 4 mots `s0..s3` du serial (`[rbx]`, `+4`, `+8`, `+0xc`) passent par ~16 « rondes » de rotations/xor/add avec des constantes (`0xe28f41d5`, `0x6c9e7b12`, `0x61c88647`…), du type :

```asm
mov esi,eax ; rol esi,3 ; xor esi,0x6c9e7b12      ; esi = rol(s2,3) ^ K
mov ecx,eax ; xor ecx,0xe28f41d5 ; add ecx,edi     ; ecx = (s2 ^ K) + s3
…
xor eax,edi ; (final)  ; cmp r8d,eax               ; 0x1e44
```

Le code SIMD (`punpck*`, `pshufd`, `psrld`, `pand`, `packuswb`) mélangé à ce scalaire ne fait que **ré-ordonner les octets du digest** (bswap par mot). Pour savoir quels mots de `h` sont utilisés, j'ai émulé la fonction (unicorn, `tools/orbital-emu.py`, en forçant l'égalité aux `cmp` pour ne pas sortir tôt) et cherché les valeurs comparées parmi `h_i`/`bswap(h_i)` :

| Test | Adresse | Prédicat |
|---|---|---|
| C1 | `0x1e44` | `eax₁ == rol(h4,5) ^ h0` (`T1`) |
| C2 | `0x1eee` | `ecx ^ f₂ == rol(h6,13) ^ h2` (`T2`) |
| C3 | `0x1f12` | `eax₂ == rol(h5,9) + h1` (`T3`) |
| C4 | `0x1f5c` | `edx ^ f₄ == ror(h7,15) + h3` (`T4`) |

`eax₁`, `edx`, `ecx`, `esi` = registres en sortie de la première passe ARX ; `eax₂`, `f₂`, `f₄` = petites passes ARX de `0x1e6e`/`0x1f1a` qui consomment `T1`, `T2`, `T3`. Les valeurs de `eax`/`ecx`/`edx` comparées sont **indépendantes du nom** (même serial → mêmes valeurs), ce qui a confirmé que les `T_i` ne dépendent que de `h`.

### 3. Résolution

4 équations de 32 bits sur 4 inconnues de 32 bits : j'ai recopié l'asm (instruction par instruction) en expressions z3 `BitVec(32)` dans `model()` / `solve()` (`tools/orbital-solve.py`) et laissé z3 trouver `s0..s3` (≈0,2 s). Exemple :

```
petik → h = 0673d47f b44c3fff 41534106 09d213b1 02a0ee39 69e8f38b 75cd7595 ec17d0c5
        T1..T4 calculés → s = D61353CD 38AD8806 6D1E04F5 76AB1026
```

Pièges : `strings` ne montre pas le détail du check (tout est en immédiats) ; pas de sections (objdump en mode binaire) ; les groupes du serial sont **big-endian** (chaque nibble shifté à gauche) ; la partie SIMD est un leurre de lecture, pas une transformation cryptographique supplémentaire.

## Debug GDB

GDB n'est pas installé sur la machine d'analyse : reverse 100 % statique + émulation unicorn (pas de walkthrough GDB). Pour reproduire à la main : `gdb -q analysis/orbital`, `starti`, PIE chargé en `0x555555554000` → breakpoint sur `base+0x1e44` (`cmp r8d,eax`, compare `T1`), `base+0x1eee`, `base+0x1f12`, `base+0x1f5c`.

## Vérification

```text
$ ./analysis/orbital petik D61353CD-38AD8806-6D1E04F5-76AB1026
[+] LICENSE ACCEPTED
[+] Orbital relay online. Welcome, operator.
$ ./analysis/orbital petik D61353CD-38AD8806-6D1E04F5-76AB1027      # 1 bit de moins
[-] ACCESS DENIED
$ ./analysis/orbital Petik D61353CD-38AD8806-6D1E04F5-76AB1026      # casse du nom
[-] ACCESS DENIED
$ ./analysis/orbital ab x
[!] Invalid username.
[!] Invalid serial format.
```

Autres users (`--check` OK) : `abc` → `FF2650D7-1E9648EB-16FEFB88-5A4FA32E`, `Victor_M.x-1` → `2D09EDDE-BFDF4803-63AB9D56-95DBB707`, nom de 32 caractères → accepté aussi.

## Notes

- Aucun patch ; le binaire d'origine reste dans `original/download.bin`.
- Ce n'est pas un simple hash du nom : le serial est la préimage (par z3) d'un mélange ARX réversible, comparé à 4 mots dérivés du SHA-256.
