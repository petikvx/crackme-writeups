# rascal999 encrypt — reprise

Statut : **parked** (2026-09-28). Chiffre identifié, deux mots de passe entiers non trouvés. Recherche coupée (trop longue).

## Fichiers

- `original/encrypt` ELF32 FreeBASIC, GCC 4.1, entrée `0x80493d0`, sha256 `5cee599e539258f3feed15d38a7626936ad3852c99f933f046bb68bea438db63`
- `original/crackme` 318 octets, le message chiffré (pas de saut de ligne)
- `original/readme.txt` : deux mots de passe **entiers** ; pas de virgule dans le texte clair (INPUT FreeBASIC coupe sur `,`)
- Base IDA : `analysis/encrypt.i64` (gitignorée)

## Chiffre (main `0x8049480`)

`fb_Init(argc, argv, 0)` remet l’algo RND à 0, donc `RANDOMIZE n, 0` prend l’algo **3** (MT19937 FreeBASIC, pas libc `rand`).

Vérifié sous GDB : `sub_804B50E(123.0, 3)` puis `sub_804B4DC(1.0f)` donne

`0.32137498282827437, 0.75252227322198451, …`

identique à l’init `mt[i] = 1664525*mt[i-1]+1013904223`, twist standard, temper standard, `y/2^32`.

`fistp` (arrondi au plus proche, pair) :

- passe 1, graine = password 1 : `mid = round(P + 10*RND)`
- passe 2, graine = password 2 : `C = round(mid - 10*RND)`
- déchiffrement : d’abord password 2 en addition, puis password 1 en soustraction
- chaque `round(10*RND)` vaut un entier **0..10**
- donc `C = P + d1 - d2` avec `d1, d2 ∈ 0..10`

Menu ncurses : `1` chiffre le champ `Type>` vers `Filename>`, `2` déchiffre. `libncurses.so.5` absent ; un lien vers `libncurses.so.6` suffit pour afficher le menu. La saisie n’a pas été rejouée de façon fiable (INPUT via le runtime FB).

## Clair partiel

Les 15 premiers octets **ne peuvent pas** être une espace (`ct[0..14]` trop hauts ; `ct[15]=0x27` peut l’être). Mot de 15 lettres, casse imposée par la fenêtre ±10.

Candidats du dictionnaire système qui tiennent :

| Mot | `|P-C|` max |
|---|---|
| `Congratulations` | 6 |
| `Administrations` | 8 |
| `Antiperspirants` | 8 |
| `Defenestrations` | 10 |
| `Generalizations` | 10 |
| `Infinitesimally` | 10 |

`Crystallography` / `Intelligibility` ont un écart 11 : hors modèle.

## Ce qui a été cherché (vide)

Graines signées, les 6 mots ci-dessus comme préfixe de 15 octets (`d2 = d1 + (P-C)`, seaux 0..10) :

- paires ±32767 (1 min) et ±100000
- meet-in-the-middle ±8e6 puis lancé ±1e8 — **interrompu**, pas de hit au moment de l’arrêt

Le MITM sur ±8e6 (16e6 graines, ~40 s, ~256 Mo) n’a rien donné. ±1e8 était en cours (`/tmp/rascal_mitm`).

## Reprise

1. Relancer le MITM sur une plage plus large, ou par tranches de `p2`, toujours sur ces 6 préfixes. Code de travail : `/tmp/rascal_mitm.c` (pas dans le dépôt).
2. Si le premier mot n’est pas dans le dico, le préfixe de 15 lettres est inconnu : il faut un score anglais sur tout le texte, pas un mot fixe.
3. Preuve live : menu `2`, fichier `original/crackme`, les deux entiers, attendre le `sleep` de 2 s, lire `Output...`.
