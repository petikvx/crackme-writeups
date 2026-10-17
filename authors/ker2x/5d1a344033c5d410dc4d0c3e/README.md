# ker2x — guild hall adventure Ch.2

| | |
|---|---|
| **ID** | [`5d1a344033c5d410dc4d0c3e`](https://crackmes.one/crackme/5d1a344033c5d410dc4d0c3e) |
| **Auteur** | ker2x |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `faef71da6e6937aca164059e31d2fbba4d95d864e46eb068e3dda81206fe9690` (archive `adventure2-package.tgz` d'origine) |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/adventure2-package/adventure2` | binaire principal de ce chapitre |
| `original/adventure2-package/adventure` | **bonus** : version *complète* du chapitre 1 fournie par l'auteur dans ce package (le README de l'auteur explique que la version soumise à l'origine pour le chapitre 1 manquait un challenge) — voir [guild hall adventure Ch.1](../5d0fa1ac33c5d41c6d56e172/) pour son analyse |
| `original/adventure2-package/README.txt` | mot de l'auteur |
| `analysis/adventure2.i64` | base IDA |
| `tools/adventure2-solve.py` | reproduit la séquence gagnante (`-q`, `--check`) |

## Réponse

**Étape 1 (optionnelle, « cheat » explicitement suggéré par le jeu) :** lancer `./adventure2 1A` plutôt que sans argument — passe directement à l'étape 2 sans la narration interactive.

**Étape 2 (question mathématique) :** répondre **`64`** à la question « what's X + 3 * 5 ? ».

```bash
printf '\nY\n\n64\n\n\n\n\n' | ./original/adventure2-package/adventure2 1A
python3 tools/adventure2-solve.py --check
```

Le programme **segfault volontairement à la fin dans tous les cas** (un pointeur de fonction non initialisé est appelé sans condition, dixit l'auteur : « you really succeded but i'll kill you anyway »). Le signal de réussite est le message **« ho damn, that's right...\nWHY ? »** affiché juste avant ce crash final, pas le code de sortie.

## Premier regard

```bash
file original/adventure2-package/adventure2    # ELF64 PIE, not stripped
strings -n 5 original/adventure2-package/adventure2
```

Ton très narratif (donjon RPG). Symboles `main`, `step2`, `coredump`. Le texte du programme donne lui-même l'indice de triche : *« you can directly skip to step2 using './adventure2 2'... probably :D »*.

## Flow

`main` : si `argc != 1`, vérifie `strlen(argv[1]+1) == argv[1][0] - '0'` (format « chiffre N suivi d'exactement N caractères ») et que `argv[1] != "222"` — si les deux passent, saute directement à `step2()`. Sinon, narration interactive avec plusieurs `getchar()` comparés à une table obfusquée (chemin « normal », plus long).

## Comment on trouve

**Ancrage** : MCP `ida` sur `original/adventure2-package/adventure2`, Hex-Rays sur `main` (`0x84d`) et `step2` (`0xdbb`).

### Étape 1 : construire un `argv[1]` valide pour le raccourci

```c
if (strlen(argv[1]+1) == argv[1][0]-'0') {
    if (strncmp(argv[1], "222", 3) == 0) puts("nice try...");
    else step2(argc, argv, argc);
}
```

N'importe quelle chaîne « chiffre `N` + exactement `N` caractères, différente de `"222"` » convient. Choix le plus simple : **`"1A"`** (`'1'` → `N=1`, suivi d'exactement 1 caractère `'A'`).

### Étape 2 : la question mathématique

```c
// step2(argc, argv, a3)
v8 = (signed char)argv[1][0] + 15;     // PAS lie a la question affichee !
printf("what's %c + 3 * 5 ? ", v7);     // v7 = un getchar() purement cosmetique
scanf("%d", &v6);
if (v8 == v6) { /* succes narratif, puis crash final quand meme */ }
else          { /* meme crash, plus tot */ }
```

Piège : le caractère affiché dans la question (`%c`) vient d'un `getchar()` **sans rapport** avec le calcul réel — la vraie valeur attendue est `argv[1][0] + 15`, où `argv[1]` est **l'argument utilisé pour invoquer le programme** (encore un écho du thème « `argv[0]`/`argv[1]` piégeux » déjà vu chez [chillywilly](../../chillywilly/5e76c37d33c5d4439bb2df1b/) et [kawaii-flesh](../../kawaii-flesh/5d24585133c5d410dc4d0cbd/)).

Pour `argv[1] = "1A"` : `ord('1') = 0x31 = 49`, donc réponse = `49 + 15 = 64`.

### Séquence stdin exacte

`step2` consomme **4 `getchar()`** avant le `scanf` (repérés en désassemblage, pas tous visibles dans le pseudocode Hex-Rays qui en fusionne certains) :

1. `getchar()` jeté (« press enter » après l'intro) ;
2. `getchar()` → stocké comme caractère affiché dans la question (cosmétique) ;
3. `getchar()` jeté (reste de ligne) ;
4. `getchar()` jeté (« press enter » avant le clear screen) ;
5. `scanf("%d", &v6)`.

D'où la séquence `"\nY\n\n64\n"` (+ des lignes vides supplémentaires pour les `getchar()` après le test, qui précèdent le crash final).

## Vérification

```bash
$ printf '\nY\n\n64\n\n\n\n\n' | stdbuf -o0 ./original/adventure2-package/adventure2 1A 2>&1 | tail -6
...
ho damn, that's right...
WHY ?

To be continued... (you really succeded but i'll kill you anyway. don't worry, you'll be fine)
```

Avec une mauvaise réponse (ex. `1`), le même crash arrive mais **sans** le message « ho damn, that's right... » — c'est la seule différence observable.

## Notes

- Pas de GDB nécessaire pour le calcul lui-même ; GDB a servi uniquement à **valider** `v8` et `v6` au point du `cmp` (`break *base+0xf14 ; print $eax`), pour déboguer un problème d'alignement des `getchar()` côté solveur (pas le crackme) — le README n'exige donc pas de section « Debug GDB » dédiée (pas un élément du prédicat, juste de l'outillage de mise au point).
- Le crash final systématique est une blague assumée par l'auteur, pas un bug à corriger : le signal de réussite est textuel, pas le code de sortie du process.
