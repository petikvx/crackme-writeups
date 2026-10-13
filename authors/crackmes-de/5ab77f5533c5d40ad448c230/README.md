# ncn by eslimasec

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c230`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c230) · [ORIGIN](ORIGIN.yml) |
| **Auteur** | eslimasec (crackme écrit par « CT » pour le concours de la con espagnole NoConName ; réimport crackmes.de, local `crackmes-de`) |
| **Publié** | 2018-03-25 (binaire de juin 2009) |
| **Plateforme** | Linux ELF32 i386, C (GCC 3.4.6 Gentoo), dynamique, **non strippé** (symboles + debug info) |
| **Difficulté** | 2.0 (qualité 4.0) |
| **SHA-256 exe** | `145d5604adc9bed14980858408a65cdf62fd6cfc8ebcd4e03cdfa8f774e10d00` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/ncn.zip`, `original/ncn`, `original/Readme.txt` | archive, binaire, consigne (texte chiffré à déchiffrer) |
| `analysis/main-disasm.txt`, `analysis/vacia-disasm.txt` | `objdump -d -M intel` de `main` et `vacia` |
| `tools/ncn-solve.py` | réimplémentation du chiffreur + déchiffreur (re-chiffre pour vérifier) |
| `tools/fixrand.c`, `tools/verify.sh` | preuve live : `LD_PRELOAD` qui fige `rand()` puis lance le binaire original |
| `analysis/run-verify.txt` | sortie de la preuve live |

## Énoncé

Ce n'est pas un crackme « mot de passe » classique : `ncn <texte>` **chiffre** son argument et l'affiche. Le Readme donne un texte chiffré, il faut retrouver le clair :

```
0J3N2rElwSr1KrOPiJW0Th6ZjxQ06poPnwCfybk3ZtARCXWEId8YuBiyMr9JkCZl
```

## Réponse

```
Esto no es una contrasena cifrada cualquiera, sino una especial
```

(« Ce n'est pas un mot de passe chiffré quelconque, mais un spécial ».)

```bash
python3 tools/ncn-solve.py          # seed=45 ('J') -> Estoanoaesaunaacontrasenaacifradaacualquieraaasinoaunaaespecial
tools/verify.sh                     # binaire original, rand() figé à 45 -> exactement le texte du Readme
```

## Reverse

Tout est dans `main` (0x80484d4) et une petite fonction récursive `vacia` (« vide »), avec des globales aux noms espagnols parlants (`SEMILLA` = graine, `SALTO` = saut, `increase`, `newpos`, `procesadas`, `clear`, `cifred`).

### Initialisation

```c
char min[] = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"; // 62 car.
SALTO = 3; newpos = 1; procesadas = 0;
srand(time(0)); increase = 5;
SEMILLA = rand() % 62;      // imul 0x84210843 + sar 5  ==  division par 62
```

L'argument est copié dans `clear` (80 octets max, refus si `strlen <= 3`), puis `cifred[0..len]` est rempli de `'0'` et terminé par `\0` : **la sortie fait len + 1 caractères**. Ensuite `cifred[1] = min[SEMILLA]` : **la graine est écrite en clair** dans le chiffré.

### Boucle de chiffrement

```c
for (i = 0; i < len; i++) {
    newpos = vacia(SALTO + newpos, len);
    for (j = 0; j < strlen(min) && min[j] != clear[procesadas]; j++) ;   // j = 62 si absent
    cifred[newpos] = min[(SEMILLA + j + increase) % 62];
    procesadas++; increase += 5;
}
```

`vacia(p, n)` cherche la première case « vide » (qui vaut encore `'0'`) à partir de `p`, avec un retour circulaire :

```c
int vacia(int p, int n) {
    if (p > n) p = p - n - 1;
    if (cifred[p] == '0') return p;
    return vacia(p + 1, n);
}
```

C'est donc une **substitution à décalage variable** (`SEMILLA + 5·(k+1)` pour le k-ième caractère) combinée à une **permutation** des positions (pas de 3 dans un tableau circulaire de `len+1` cases, en sautant les cases déjà prises).

### Déchiffrement

1. `len = 64 - 1 = 63` et `SEMILLA = idx(chiffré[1]) = idx('J') = 45`.
2. On rejoue exactement la même suite de `newpos` (elle ne dépend que de `len` et des cases déjà remplies, pas du clair), et pour chaque position on inverse la substitution : `j = (idx(chiffré[newpos]) - SEMILLA - 5·(k+1)) mod 62`.
3. On obtient `Estoanoaesaunaacontrasenaacifradaacualquieraaasinoaunaaespecial`.

Les `a` « en trop » viennent d'une perte d'information du chiffreur : tout caractère absent de `min` (espace, virgule…) donne `j = 62`, ce qui équivaut à `j = 0` modulo 62, donc au même chiffré que `'a'`. En remettant les espaces et la virgule là où l'espagnol les demande (`cualquiera` + `,` + espace = `cualquieraaa`), on obtient la phrase de la réponse. `contrasena` est bien écrit sans `ñ` : un `ñ` UTF-8 ferait 2 octets et changerait la longueur.

Petit piège du chiffreur : le chiffre `'0'` est à la fois une valeur de `min` (index 26) et le marqueur « case vide ». Si un caractère chiffré vaut `'0'`, sa case peut être réécrite plus tard. Ça n'arrive pas ici (le solveur re-chiffre le clair et retrouve exactement le texte du Readme, `assert` à l'appui).

## Vérification live

`rand()` dépend de l'heure, donc `tools/fixrand.c` (chargé par `LD_PRELOAD`, compilé en `-m32 -nostdlib` faute d'en-têtes i386 sur la box) force `rand() = 45` :

```
$ tools/verify.sh
Syntaxis OK
LA cadena encriptada es: 0J3N2rElwSr1KrOPiJW0Th6ZjxQ06poPnwCfybk3ZtARCXWEId8YuBiyMr9JkCZl
attendu : 0J3N2rElwSr1KrOPiJW0Th6ZjxQ06poPnwCfybk3ZtARCXWEId8YuBiyMr9JkCZl
```

Le binaire original, avec la graine lue dans le chiffré, reproduit le texte du Readme caractère pour caractère.

## Status

- [x] reverse
- [x] write-up
- [x] solveur
