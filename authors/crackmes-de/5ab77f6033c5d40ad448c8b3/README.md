# crackmes.de — rascal999, encrypt

> [crackmes.one](https://crackmes.one/crackme/5ab77f6033c5d40ad448c8b3) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | rascal999 (miroir crackmes.de) |
| **Plateforme** | Linux ELF32, FreeBASIC, GCC 4.1, ncurses |
| **Statut** | **solved** |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/encrypt.tar.gz` | archive du site |
| `original/encrypt` | chiffre / déchiffre (ELF32) |
| `original/crackme` | message chiffré, 318 octets |
| `original/readme.txt` | deux entiers, pas de virgule dans le clair |
| `tools/encrypt-solve.py` | déchiffrement MT19937 |
| `analysis/NOTES.md` | piste reprise (recherche ±8e6 trop courte) |

## Réponse

Les deux mots de passe sont des entiers. Le clair tient sur une seule ligne (318 octets, pas de virgule).

| Password 1 | Password 2 |
|---|---|
| **`756384985`** | **`999345234`** |

```text
Congratulations on cracking my encryption. I bet you brute forced ;P As you may have determined pass1 was 756384985 and pass2 was 999345234. Now that you've cracked me if I've found out I'll dedicate a post to you at http://www.rascal999.co.uk/. Better get me informed! Email is rascal999@gmail.com. Copy this message.
```

```bash
python3 tools/encrypt-solve.py
python3 tools/encrypt-solve.py -q          # 756384985 999345234
python3 tools/encrypt-solve.py --check
```

## Premier regard

```text
original/encrypt : ELF 32-bit LSB, Intel 80386, dynamically linked, stripped
                   for GNU/Linux 2.4.1, interprète /lib/ld-linux.so.2
original/crackme : data, 318 octets, pas de saut de ligne
```

`strings` sur l’ELF donne le menu, pas les mots de passe :

```text
* Rascal999 *
*  Encrypt  *
1) Encrypt
2) Decrypt
3) Exit
Filename>
Type>
Remember these passwords!
Password 1>
Password 2>
Please wait...
Output...
```

Imports utiles : `libncurses.so.5`, `libm` (`rint`), et le runtime FreeBASIC lié en statique (`RANDOMIZE` / `RND` ne sont pas des symboles libc). `srand` / `rand` sont importés mais ne servent que si l’algo RND vaut 1.

Le `readme.txt` de l’archive dit que les mots de passe sont des entiers, et qu’une virgule dans le texte clair coupe la saisie (`INPUT` FreeBASIC).

Les 318 octets ressemblent à de l’anglais décalé de quelques unités (`?lphrasopaqgoqt'…`). Ce n’est pas un XOR.

## Flow

`main` est en `0x8049480`. Au démarrage :

```c
fb_Init(argc, argv, 0);   /* sub_804AF1D : le 3e argument est l'algo RND par défaut */
```

Ce `0` est stocké à `dword_805957C`. La boucle affiche le menu et lit un entier :

1. **Encrypt** — `Filename>`, `Type>` (le clair), `Password 1>`, `Password 2>`, puis écrit le chiffré.
2. **Decrypt** — `Filename>`, les deux entiers, lit le fichier, affiche `Please wait...` (`sleep` 2 s), puis `Output...` et le clair.
3. **Exit**.

Chiffrement (`0x8049740`) :

1. `RANDOMIZE (double)password1, 0`
2. pour chaque caractère 1-based : `mid = fistp(ASC + 10 * RND(1))`, concaténé via `CHR$`
3. `RANDOMIZE (double)password2, 0`
4. pour chaque caractère : `C = fistp(mid - 10 * RND(1))`
5. écriture binaire du résultat (`PUT`-like, `sub_804ABBD`)

Déchiffrement (`0x80499a6`) : même couple, **ordre inverse**. D’abord l’addition avec le password 2, puis la soustraction avec le password 1.

`ASC` est `sub_804B6F0` (octet non signé, index 1-based). `CHR$` est `sub_804B9D0` : un entier, octet de poids faible. Un résultat hors 0..255 est donc tronqué modulo 256. Sur ce clair ASCII, ça n’arrive pas.

## Comment on trouve les deux entiers

### Ancrage

Hex-Rays sur `main` (`0x8049480`) et sur le runtime RND collé dans le binaire. Le point chaud du chiffrement, en `0x8049794` :

```asm
call    sub_804B4DC          ; RND(1.0f) → st(0), double y/2^32
fmul    ds:dbl_8051C18       ; × 10.0
fadd    [ebp+var_7C]         ; + ASC (fild de l'octet)
fistp   dword ptr [esp]      ; arrondi au plus proche, pair
call    sub_804B9D0          ; CHR$(résultat)
```

La passe de soustraction est la même avec `fsubrp` (`0x8049838` au chiffrement, `0x8049b14` au déchiffrement). Pas de `fldcw` devant ces `fistp` : le contrôle d’arrondi x87 reste le défaut (round-to-nearest-even).

`RANDOMIZE` est `sub_804B50E(double seed, int algo)`. Appelé avec `algo = 0`. Le code relit `dword_805957C` :

- valeur 1 ou 2 → algo 1 (`srand` / `rand`)
- valeur 3 → algo 4 (générateur 24 bits)
- sinon, donc **0** après `fb_Init(..., 0)` → algo **3**

L’algo 3 tombe dans `sub_804B255`, un MT19937 :

- graine : `fistp` du double **tronqué vers zéro** (là, `fldcw` avec `AH = 0x0C`), 32 bits de poids faible. Un entier 32 bits passé en `(double)` revient donc tel quel.
- remplissage : `mt[i] = 1664525 * mt[i-1] + 1013904223` en 32 bits. La constante est l’immédiat `0x3C6EF35F` à `0x804b6ce`, et le facteur 1664525 est reconstruit par décalages.
- twist standard (`N = 624`, `M = 397`, `A = 0x9908B0DF`), temper standard (`>> 11`, `<< 7 & 0x9D2C5680`, `<< 15 & 0xEFC60000`, `>> 18`).
- `RND` renvoie `y / 2^32` dans `[0, 1)`.

`round(10 * RND)` vaut donc un entier **0..10** (10 seulement si `RND ≥ 0.95`). Comme l’ASC est entier, `fistp(ASC ± 10*RND) = ASC ± d` sauf sur un demi-entier exact, et il n’y a que deux sorties MT (`y = 2^30` et `y = 3*2^30`) qui tombent pile sur `.5`. En pratique :

```text
C = P + d1 - d2    avec d1, d2 ∈ 0..10
```

d’où `|C - P| ≤ 10`, et le déchiffrement est l’inverse (d’abord graine 2 en addition, puis graine 1 en soustraction).

### Préfixe

Les 15 premiers octets du chiffré sont trop hauts pour une espace (`C[0] = 0x3F`, fenêtre `'5'..'I'`). L’espace (32) redevient possible à l’indice 15 (`C[15] = 0x27`). Le premier mot fait donc 15 lettres, capitale puis minuscules.

Parmi les mots de 15 lettres du dictionnaire qui tiennent dans la fenêtre, le plus serré est `Congratulations` (`|P−C|` max = 6). Les suivants (`Administrations`, `Antiperspirants`, …) montent à 8 et au-delà.

Une recherche des deux graines dans ±8 millions, en meet-in-the-middle sur ces préfixes, ne donne rien. Les mots de passe ne sont pas dans cette boîte.

### Balayage 32 bits

`INPUT` écrit un `int` 32 bits (`sub_8049FB0`, `rint` s’il y a un point décimal). Toutes les saisies entières tiennent dans `uint32`.

Pour un préfixe connu, chaque graine `p1` produit `d1[0..14]`. La graine `p2` doit produire exactement `d2[i] = d1[i] + (P[i] - C[i])`, avec chaque `d2[i]` dans 0..10. Les 15 premières sorties du MT ne dépendent que de `mt[0..15]` et `mt[397..411]`, et l’init est une LCG : `mt[n]` se calcule par `A^n * seed + C * (A^n-1)/(A-1)` sans itérer 624 fois.

Un passage sur les `2^32` graines (36 mots de 15 lettres qui tiennent dans ±10) remplit une table des `d2` exigés. Le second passage cherche la graine `p2`. Quinze symboles dans 0..10 font ~52 bits, moins que l’espace des paires : **562** collisions, pas une seule. On déchiffre les 318 octets de chaque paire. Une seule reste de l’anglais :

```text
p1 = 756384985
p2 = 999345234
préfixe Congratulations
```

Le clair lui-même redonne les deux entiers. Re-chiffrer ce clair avec le même couple retrouve `original/crackme` octet pour octet.

## Prédicat

```text
RND  : MT19937 FreeBASIC (algo 3), graine = int32
d(y) : round_even(10 * y / 2^32) ∈ 0..10
chiffre : pour chaque octet,  P → P+d(RND_p1) → C = mid-d(RND_p2)
déchiffre : C → C+d(RND_p2) → P = mid-d(RND_p1)
```

`round_even` est celui de `fistp` (demi-entier vers l’entier pair). Le solveur le fait en entier :

```text
round_even((octet << 32) ± 10 * y) 
```

## Debug GDB (pas à pas)

Le binaire veut `libncurses.so.5`. Un lien vers la `.so.6` i386 suffit pour atteindre `main` :

```bash
mkdir -p /tmp/nclib
ln -sfn /lib/i386-linux-gnu/libncurses.so.6 /tmp/nclib/libncurses.so.5
cd authors/crackmes-de/5ab77f6033c5d40ad448c8b3
gdb -q -nx original/encrypt
```

```text
set pagination off
set confirm off
set debuginfod enabled off
set env LD_LIBRARY_PATH=/tmp/nclib
starti
break *0x8049480
continue
```

`0x8049480` est `main` (binaire non PIE). On appelle `RANDOMIZE(123, 3)` puis quatre `RND(1.0f)` sans passer par le menu. Le second argument `3` force le MT ; avec `0` ce serait le même algo, parce que `fb_Init` a mis le défaut à 0.

```text
p ((double(*)(double,int))0x804b50e)(123.0, 3)
p ((long double(*)(float))0x804b4dc)(1.0f)
p ((long double(*)(float))0x804b4dc)(1.0f)
p ((long double(*)(float))0x804b4dc)(1.0f)
p ((long double(*)(float))0x804b4dc)(1.0f)
```

```text
$1 = 0
$2 = 0.32137498282827436924
$3 = 0.752522273221984505653
$4 = 0.186694343807175755501
$5 = 0.826587012270465493202
```

Ce sont les quatre premières valeurs de l’init `1664525*mt[i-1]+1013904223`, twist et temper standards, divisées par `2^32`. Le solveur les reproduit. Le contrôle d’arrondi du `fistp` de chiffrement n’est pas modifié par ces appels (le `fldcw` de la conversion de graine est restauré avant le `ret`).

Piège : `/dev/tty` échoue si le processus n’a pas de terminal contrôlant (`ENXIO`), et le runtime envoie `ESC[6n` puis attend la réponse curseur `ESC[<l>;<c>R`. Sans ça, le menu s’affiche et ne lit plus rien. Pour la preuve live, PTY + `TIOCSCTTY` + réponse à `ESC[6n`.

## Vérification

Solveur, aller-retour sur les 318 octets :

```bash
python3 tools/encrypt-solve.py --check
# ok
python3 tools/encrypt-solve.py -q
# 756384985 999345234
```

Binaire d’origine, menu **2**, fichier `original/crackme`, puis les deux entiers. `libncurses.so.5` résolu comme ci-dessus, terminal 40×120, réponse à `ESC[6n` :

```text
Please wait...
Output...
Congratulations on cracking my encryption. I bet you brute forced ;P As you may have determined pass1 was 756384985 and pass2 was 999345234. ...
```

Mauvais second mot de passe (`1` à la place de `999345234`), le programme affiche quand même un bloc, illisible :

```text
?nnks^osrglkmnq$so%]q_anjjbopgoetzqzmpn3 K#`cuwmsgnwqa$epqbf\&8L!@{vrw!gau)b_rbfbzjqidjek%q^vq. ...
```

Il n’y a pas de message « wrong password » : toute paire d’entiers produit une sortie de même longueur.

## Notes

- Les graines sont loin de ±8 millions (756 millions et 999 millions). Une boîte plus petite rate la paire même avec le bon préfixe.
- Quinze octets de `d ∈ 0..10` ne distinguent pas une paire unique sur `2^32 × 2^32` : il faut scorer le reste du texte.
- Ce n’est pas `rand()` de la libc, ni un XOR, ni un décalage constant. L’algo RND 1 (`srand`) n’est pris que si `dword_805957C` vaut 1 ou 2 au moment du `RANDOMIZE`.
- Le clair confirme le `readme.txt` : pas de virgule. Le point-virgule de « brute forced ;P » passe, la virgule non.
