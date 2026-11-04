# cm2 (crackmes.de) — lagalopex

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3f6`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3f6) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (lagalopex) |
| **Plateforme** | Linux ELF32 i386, stripped, dynamique |
| **SHA-256 (zip)** | `049961141f3de0cdd447f93a5d08a22d34f0146d1318cd4ccfa82540b71e2734` |

Consigne du `readme` fourni : *« Get a working keygen. Brute-force is neither necessary, nor allowed. Patching/Hijacking prohibited »*.

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/cm2.zip` | archive d'origine (`cm2` + `readme`, mot de passe `crackmes.one`) |
| `tools/cm2-solve.py` | keygen (`-q`, `--check <cm2>`) |
| `analysis/block-0x8048688-decrypted.{bin,asm}` | bloc auto-déchiffré (clé `0x1679afcc`) et son désassemblage |

## Réponse

Usage : `./cm2 <name> <A> <B>` (exactement 3 arguments).

| name | A | B |
|---|---|---|
| **`petik`** | **`2691050739`** | **`184513939`** |

```bash
python3 tools/cm2-solve.py petik --check /chemin/vers/cm2
# ./cm2 petik 2691050739 184513939  ->  Hello petik... / You got it ;)
```

`A` est constant (il ne dépend pas du nom) ; `B` dépend du nom (> 3 caractères).

## Premier regard

```bash
unzip -P crackmes.one original/cm2.zip -d /tmp/cm2x     # dossier neuf
file cm2        # ELF 32-bit LSB, dynamically linked, stripped
strings cm2     # imports : printf getpagesize ptrace atoll mprotect
./cm2           # rc=2, rien d'affiché
```

Pas de chaîne lisible : les messages sont stockés octet par octet sur la pile (`mov byte [ebp-x], imm`) et XORés à l'affichage avec un octet global `0x8049a38` (initialisé à `0xcc`, modifié par des `sub byte [0x8049a38], imm` dans `main`). Imports parlants : `ptrace` (anti-debug), `mprotect` + `atoll` (code auto-modifiable).

## Flow (`main` @ 0x80487a0, pseudo-C)

```c
if (argc != 4) return 2;
key8 -= 0x22;  banner(argv[1]);            // 0x8048578 : "Hello <name>..."
key8 -= 0x6a;
if (ptrace(PTRACE_TRACEME,0,1,0)) fail();  // 0x8048484 : message anti-debug
uint32_t B = atoll(argv[3]);
uint32_t a = atoll(argv[2]);
uint32_t v = (a << 15) | (~a >> 17);       // 0x804880a..0x8048812
int r = decrypt_block(v);                  // 0x8048623
if (r == 1) return 0x16;                   // mprotect KO
if (r == 2) { key8 -= 0x64; check(~B, argv[1]); return 0; }   // 0x8048688
return 2;                                  // r == 3 : mauvaise clé, silence
```

## Comment on trouve

### 1. Ancrage

`objdump -d -M intel cm2` : le point d'entrée (`0x80483e0`) pousse `0x80487a0` comme `main`. Juste avant, `0x8048623` fait `mprotect(page, ..., RWX)` puis :

```asm
8048662: xor DWORD PTR [eax],esi      ; eax = 0x8048688 .. 0x80487a0
8048664: add eax,4
8048667: cmp eax,0x80487a0
804866c: jne 8048662
8048670: cmp WORD PTR ds:0x8048688,0x8355   ; octets attendus 55 83
```

Donc le bloc `0x8048688..0x80487a0` (280 octets, la vraie fonction de vérif) est **chiffré par XOR avec un dword `v`** dérivé de `argv[2]` ; seule une clé qui redonne `55 83` en tête est acceptée (retour 2), sinon retour 3 → silence.

### 2. Retrouver `v` sans brute-force de serial

Le test ne contraint que 16 bits (`0x8355 ^ 0x2c99 = 0xafcc`, d'où `v & 0xffff = 0xafcc` ; on retrouve aussi `cc af` répété dans le bloc chiffré = zéros en clair). Pour les 16 bits hauts, on utilise le texte clair connu : après XOR le bloc doit se désassembler (capstone) sur exactement 280 octets, contenir un `call 0x80483b4` (`printf@plt`) et finir par `ret`. Sur les 65536 candidats, **un seul** passe : `v = 0x1679afcc`. (Ce n'est pas un brute-force du serial : c'est de la reconstruction de clé par plaintext connu.)

### 3. Inverser `v = (a<<15) | (~a>>17)`

Les 17 bits bas de `a` deviennent les bits 15..31 de `v`; les 15 bits hauts de `a` sont complémentés et placés en bits 0..14 :

```
a[0..16]  = v >> 15
a[17..31] = ~(v & 0x7fff) & 0x7fff
→ A = 2691050739
```
(`make_A()` du solveur vérifie la relation inverse.)

### 4. La fonction déchiffrée (`analysis/block-0x8048688-decrypted.asm`)

Arguments : `[ebp+8] = P = ~B`, `[ebp+0xc] = name`.

```text
di = 1 ; w = 0
pour i = 0 .. 0x3ff :                      ; 80486b2..80486ea
    c  = (signed char) name[i % len]       ; div [ebp-0x34]
    r  = ((di & 0xffff) + c) idiv 0xfb     ; reste (mod 251)
    di = r
    w  = (w + (r & 0xffff)) idiv 0xfb      ; reste
s1 = r (dernier reste) ; s2 = w

b0..b3 = octets de P (b0 = poids faible)
b0 ^ b2 == s1          ; 80486f1..80486fc
b1 ^ b3 == s2          ; 8048702..8048710
b1 ^ b2 == 0x8a        ; 8048716..804871e
len(name) > 3          ; 8048720
```
Si tout passe, les octets en pile (`85 b3 a9 fc …`) XORés avec `0x8049a38` (valeur finale de la clé 8 bits) affichent `You got it ;)`.

### 5. Assemblage de la réponse (`petik`)

1. Simulation de la boucle sur `petik` → `s1`, `s2` (`name_state()`).
2. Un octet est libre (`b2`, 256 solutions) : on prend `b2 = 0` → `b1 = 0x8a`, `b0 = s1`, `b3 = s2 ^ 0x8a`.
3. `P = b3<<24 | b2<<16 | b1<<8 | b0`, et comme le programme appelle `check(~B)` : `B = ~P` (32 bits). Pour `petik` : `B = 184513939`.

### Pièges

- Le test de clé (`cmp WORD`) ne vérifie que 2 octets : une mauvaise valeur de `A` donne **aucune sortie** (rc 2), pas de message d'erreur.
- `idiv` signé : `name` est lu en `movsx` ; les noms non ASCII se comportent différemment (le solveur reproduit le signe).
- `ptrace(TRACEME)` : sous `gdb`/`strace`, le 2ᵉ ptrace échoue et on tombe sur le chemin d'échec. Reverse fait ici **100 % statique + exécution native**, sans session GDB.

## Vérification

```text
$ ./cm2 petik 2691050739 184513939
Hello petik...
You got it ;)          rc=0

$ ./cm2 petik 2691050739 184513940      # B faux
Hello petik...         (pas de « You got it »)

$ ./cm2 petik 1 184513939               # A faux (mauvaise clé XOR)
(aucune sortie)        rc=2

$ python3 tools/cm2-solve.py Alice1 --check cm2    # autre nom -> « You got it ;) »
```

## Notes

- `A` est une constante (le crackme est en fait « name → B » avec une porte d'entrée sur `A`).
- Pas de patch du binaire : seule la clé XOR légitime est reconstruite.
