# crackmes.de's collide by crp

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c399`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c399) |
| **Auteur (site)** | crackmes.de (binaire de **crp**, 2005) |
| **Plateforme** | Linux ELF32, GCC 3.3.6, stripé, entrée `0x80485ba` |
| **SHA-256 ELF** | `2141200d97193c42c25144374eeeced095d570e6f5e88b30ff9e6d4fa4594c97` |
| **Archive** | `original/collide.tgz` (`816352ce1da5ec5c055905f3dd779e1f58bacc36a20589341ce1bb88710ad2d6`) |

## Fichiers

| Chemin | Rôle |
|---|---|
| [`ORIGIN.yml`](ORIGIN.yml) | métadonnées crackmes.one |
| [`original/collide.tgz`](original/collide.tgz) | archive telle que livrée par le site |
| [`original/collide/collide`](original/collide/collide) | ELF (extrait du `.tgz`, non patché) |
| [`original/collide/readme.txt`](original/collide/readme.txt) | « pathing is boring, we need a keyfile :) » |
| [`tools/collide-solve.py`](tools/collide-solve.py) | construit `.key`, `-q` / `--check` |
| `analysis/collide.i64` | base IDA (gitignorée) |

## Réponse

Pas de mot de passe. Le binaire ouvre **`./.key`** (cwd), sans argument.

Pour **`petik`** (`pw_uid = 1000`, `pw_gid = 1000`) :

| Champ | Valeur |
|---|---|
| pli du nom | `0x1ffa4ba4` |
| custom (`sub_8048750`) | `0x1ffa4ba4` (uid et gid pairs) |
| clé TEA | `(0x3e8, 0x3e8, 0x1ffa4ba4, 0x1ff509e4)` |
| fichier | 384 octets, mode **exactement `0400`** |

```text
[ collide.crp- ]
stage0: OK
stage1: OK
stage2: OK
[ key accepted ]
```

```bash
python3 tools/collide-solve.py -q
python3 tools/collide-solve.py --check
python3 tools/collide-solve.py --out .key   # chmod 0400, puis ./original/collide/collide
```

`-q` affiche `petik uid=1000 gid=1000 custom=0x1ffa4ba4 .key 384 bytes mode 0400`.

La collision MD5 (deux blocs après un préfixe de 64 octets) vient de **fastcoll** (Marc Stevens, hashclash `md5fastcoll`) : `$FASTCOLL` ou `fastcoll` dans le `PATH`.

## Premier regard

```text
original/collide/collide: ELF 32-bit LSB executable, Intel 80386, stripped
entrypoint 0x80485ba
NEEDED libc.so.6
.comment: GCC: (GNU) 3.3.6
```

Imports utiles : `getuid`, `getgid`, `getpwuid`, `__lxstat`, `open`, `read`, `write`, `malloc`/`free`, `memcpy`, `memset`, `_exit`. Pas de `strcmp` : les comparaisons sont des boucles maison (`sub_8049EA0` = strlen, `sub_8049EC6` = memcmp qui rend 0 si égal).

Chaînes de `.rodata` (`0x8049f5c`) :

| Adresse | Texte |
|---|---|
| `0x8049f5c` | `hmpf, i need a hint...` |
| `0x8049f73` | `[ collide.crp- ]` |
| `0x8049f85` | `stage0: ` |
| `0x8049f8e` | `.key` |
| `0x8049f93` | `OK\n` |
| `0x8049f96` | `stage1: ` |
| `0x8049f9f` | `-- re..... -- ` |
| `0x8049fb1` | `stage2: ` |
| `0x8049fb9` | `[ key accepted ]` |
| `0x8049fcb` | `FAILED\n` |

`strings` montre aussi `xVaK1` vers l'offset fichier `0x45a` : c'est du **code** (`.text` commence à `0x3f0`), pas une clé.

Le readme de l'archive annonce un keyfile. L'entrée ELF **est** le programme (pas de `_start` CRT) : bannière, trois stages, `_exit(0)` dans tous les cas. Le code de sortie ne distingue pas OK et KO.

## Flow

`start` @ `0x80485ba` (Hex-Rays) :

1. `write` de `[ collide.crp- ]`.
2. `sub_8048750` remplit trois dwords depuis `getpwuid(getuid())` : `pw_uid`, `pw_gid`, custom. La valeur de retour est ignorée.
3. **stage0** — `sub_804883B(".key")` : `__lxstat(3, ".key")`. Succès seulement si fichier régulier, taille `≤ 0x800000`, `st_uid == getuid()`, `st_gid == getgid()`, et le mode est **exactement** `0100400` :
   - `(mode & 0xF000) == 0x8000` (`S_IFREG`)
   - `(mode & 0x38) == 0` (aucun droit groupe)
   - `(mode & 7) == 0` (aucun droit other)
   - `(mode & 0x1C0) == 0x100` (owner = `S_IRUSR` seul)
4. **stage1** — lecture intégrale, puis :
   - si le début du fichier colle à `hmpf, i need a hint...` (`sub_8048470`) : affiche `-- re..... -- ` et brûle `2004 × 199` itérations vides (`sub_8048418`), puis `FAILED` ;
   - sinon `sub_80488CB` doit rendre 1 (voir prédicat). Il **déchiffre TEA sur place** la seconde moitié.
5. **stage2** — `sub_8048AB6` : MD5 de chaque moitié, digests égaux, et les moitiés différentes. Alors `[ key accepted ]`.

Tout autre chemin écrit `FAILED`.

## Comment on trouve le prédicat

Ancrage : IDA (MCP `ida`, Hex-Rays) sur `original/collide/collide`, entrée `0x80485ba`. Les trois stages sont des appels directs dans cette fonction ; le gros morceau `sub_8048FCB` (3472 octets) est la compression MD5, reconnue par l'IV posée dans `sub_8048DC0`.

### Identité (stage 0 + pli du nom)

`sub_8048750` @ `0x8048750` :

```c
j = 99;
for (c = *pw_name; c; ++c) {
    j = c ^ ((c * j) >> 3);          /* int32 */
    while (j & 3)
        j *= 2;
}
custom = (pw_gid & 1) + 2 * (pw_uid & 1) + j;
```

`>>` est arithmétique. `j *= 2` tant que les deux bits bas sont non nuls : le pli est toujours `≡ 0 (mod 4)`.

Pour **`petik`** (partie de 99) :

| c | produit `c*j` | `>> 3` | XOR | doublements | `j` |
|---|---:|---:|---:|---|---:|
| `p` (112) | 11088 | 1386 | `0x51a` | ×2 → | `0x00000a34` |
| `e` (101) | 263812 | 32976 | `0x80b5` | ×2, ×2 | `0x000202d4` |
| `t` (116) | 15288336 | 1911042 | `0x1d2976` | ×2 | `0x003a52ec` |
| `i` (105) | 401343180 | 50167897 | `0x02fd8030` | — | `0x02fd8030` |
| `k` (107) | 1072993296 | 134124162 | `0x07fe92e9` | ×2, ×2 | `0x1ffa4ba4` |

`uid` et `gid` de petik sont pairs, donc `custom = 0x1ffa4ba4`.

Le stage0 ne regarde pas ce pli : il ne fait que filtrer le fichier (nom, propriétaire, mode `0400`). Un `.key` en `0644` meurt ici, avant toute crypto.

### Mélangeur d'offsets

`sub_804872C` @ `0x804872c`, quatre dwords little-endian :

```asm
8048739: mov    eax, DWORD PTR [eax+0x4]    ; w1
804873c: imul   eax, DWORD PTR [edx+0x8]    ; w1 * w2
8048746: mov    ebx, DWORD PTR [eax+0xc]    ; w3
8048749: lea    eax, [ebx+edx]              ; w3 + w1*w2
804874c: xor    eax, DWORD PTR [ecx]        ; w0 ^ (w3 + w1*w2)
```

Soit `mix(w) = w0 ^ (w3 + w2*w1)` sur 32 bits. On choisit l'offset cible et on résout `w3` :

```text
w3 = (w0 ^ offset) - w2*w1
```

### Stage 1 — où sont uid, gid, custom

`sub_80488CB` @ `0x80488cb` refuse si la taille est impaire, `≤ 0x77`, pas multiple de 16, ou si `uid == 0` (root ne passe pas).

Les deux premiers octets sont un `uint16` LE, offset du premier bloc de 16 octets. Trois `mix` consécutifs donnent trois offsets ; les dwords à ces offsets doivent valoir `uid`, `gid`, `custom`. Le test est fait **deux fois** :

1. sur le fichier tel quel ;
2. après TEA-decrypt de **toute** la seconde moitié (`sub_8048CDA`, 8 octets par tour, clé 16 octets).

La clé TEA est copiée depuis l'identité :

```text
k0 = uid
k1 = gid
k2 = custom
k3 = custom ^ (gid * uid)     ; petik → 0x1ffa4ba4 ^ (1000*1000) = 0x1ff509e4
```

`sub_8048BF8` est le sens chiffrement (somme qui part de 0 et ajoute `0x9E3779B9` trente-deux fois). `sub_8048CDA` part de `0xC6EF3720` (`-957401312`) et retire le delta : TEA classique, avec `k0` sur le `<< 4` et `k1` sur le `>> 5`.

Conséquence : les trois blocs et les trois dwords doivent vivre dans la **première** moitié, sinon le decrypt du second passage change le `mix` ou la valeur pointée. Préfixe retenu, 64 octets (un bloc MD5) :

| Offset | Contenu |
|---:|---|
| 0 | `uint16` `2` |
| 2 | bloc `mix → 50` : `11 11 11 11  04 03 02 01  07 00 00 00  07 fc 02 0a` |
| 18 | bloc `mix → 54` : `22 22 22 22  08 07 06 05  09 00 00 00  cc e2 eb f4` |
| 34 | bloc `mix → 58` : `33 33 33 33  0d 0c 0b 0a  0b 00 00 00  7a ae b9 c4` |
| 50 | `uid` `e8 03 00 00` |
| 54 | `gid` `e8 03 00 00` |
| 58 | `custom` `a4 4b fa 1f` |
| 62 | deux zéros de bourrage |

Les `w0,w1,w2` sont arbitraires ; seul `w3` est calculé. Hex du préfixe :

```text
020011111111040302010700000007fc020a222222220807060509000000cce2ebf4
333333330d0c0b0a0b0000007aaeb9c4e8030000e8030000a44bfa1f0000
```

### Stage 2 — collision MD5, pas égalité des moitiés

`sub_8048DC0` pose l'IV MD5 :

```asm
8048dda: mov  DWORD PTR [eax], 0x67452301
8048de4: mov  DWORD PTR [eax+0x4], 0xefcdab89
8048def: mov  DWORD PTR [eax+0x8], 0x98badcfe
8048dfa: mov  DWORD PTR [eax+0xc], 0x10325476
```

`sub_8048E02` est l'update (longueur en bits, blocs de 64 via `sub_8048FCB`). `sub_8048F18` padde avec `0x80` (`byte_804A0E0`) puis la longueur LE : MD5 standard. `sub_8048AB6` hash chaque moitié **après** le decrypt du stage 1, exige des digests égaux (`sub_8049EC6` sur 16 octets) et des moitiés **différentes**.

Donc le fichier disque est `A || TEA(B)` avec `MD5(A) = MD5(B)`, `A ≠ B`, et `A` comme `B` commencent par le préfixe ci-dessus. Le MD5 des deux moitiés **brutes** ne colle pas : la seconde est encore chiffrée quand on la lit sur disque.

fastcoll (attaque de Stevens, préfixe identique) ajoute 128 octets. Différences appliquées au second message, dwords little-endian :

| Bloc | mot | écart |
|---|---:|---|
| 0 | 4 | `+ 0x80000000` |
| 0 | 11 | `+ 0x00008000` |
| 0 | 14 | `+ 0x80000000` |
| 1 | 4 | `+ 0x80000000` |
| 1 | 11 | `− 0x00008000` |
| 1 | 14 | `+ 0x80000000` |

Ces mots sont dans le suffixe, pas dans les 64 octets d'identité : les deux passages du stage 1 voient les mêmes `mix` et les mêmes dwords. Taille finale `64+128 = 192` par moitié, **384** octets, multiple de 16 et `> 0x77`.

```python
def u32(x):
    return x & 0xFFFFFFFF

def fold(name, j=99):
    for c in name.encode():
        j = u32(c ^ u32(((c * j) & 0xFFFFFFFF) >> 3))  # voir le tableau : ×2 si j & 3
        while j & 3:
            j = u32(j * 2)
    return j

custom = fold("petik") + (1000 & 1) + 2 * (1000 & 1)   # 0x1ffa4ba4
k3 = u32(custom ^ u32(1000 * 1000))                    # 0x1ff509e4
# fichier = A || TEA_encrypt(B, (1000, 1000, custom, k3))
# MD5(A) == MD5(B), A[:64] == B[:64] == préfixe
```

Le `>> 3` du snippet est logique ; pour un produit négatif il faudrait un shift arithmétique. Sur `petik` tous les produits tiennent dans un `int32` positif.

## Vérification

OK (cwd du `.key`, mode `0400`) :

```text
$ python3 tools/collide-solve.py --check
[ collide.crp- ]
stage0: OK
stage1: OK
stage2: OK
[ key accepted ]
check ok (accepté, mode 0644 refusé, hint → re.....)
```

KO utiles, mêmes octets de clé :

| Cas | Sortie |
|---|---|
| mode `0644` | `stage0: FAILED` (le stage1 n'est pas atteint) |
| contenu `hmpf, i need a hint...`, mode `0400` | `stage0: OK` puis `stage1: -- re..... -- FAILED` |
| moitiés identiques ou MD5 différents | `stage1` ou `stage2` puis `FAILED` |

Le binaire quitte toujours par `_exit(0)`. `--check` matche le texte, pas le code de retour.

## Notes

- Le leurre `hmpf, i need a hint...` est un délai, pas un indice sur la clé. `sub_8048470` compare le préfixe commun (longueur du plus court) et, s'il colle, n'appelle jamais le vrai stage 1.
- `uid == 0` est rejeté dans `sub_80488CB` (`*src == 0`), même avec un `.key` par ailleurs valide.
- Propriétaire du fichier : `getuid()` / `getgid()` du processus. Les dwords dans le fichier : `pw_uid` / `pw_gid` de `getpwuid`. Ici les deux paires coïncident (`1000/1000`).
- Le nom du fichier est le littéral `.key`, pas `<user>.key`.
- Base IDA : `analysis/collide.i64` (non versionnée). Pas de session GDB : le prédicat se lit en statique, la preuve est le binaire natif i386.
