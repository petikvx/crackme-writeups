# ghost256 — baby

| | |
|---|---|
| **ID** | [`6419d74e33c5d447bc761afa`](https://crackmes.one/crackme/6419d74e33c5d447bc761afa) |
| **Auteur** | ghost256 |
| **Plateforme** | Linux ELF **32 bits**, C, non strippé (jeu de labyrinthe en terminal) |
| **SHA-256** | `d448f8950b804a44e4fd6d401f84e19469eac7fbc7ccedc24b713c31519e3846` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/game` | binaire d'origine |
| `tools/baby-solve.py` | documente et rejoue la technique (crée un `flag.txt` de test, appelle `win()` sous gdb, `--check`) |

## Réponse

Ce n'est pas un mot de passe : le binaire exige un fichier **`flag.txt`** dans le répertoire courant, mais **aucun chemin normal du jeu ne l'affiche** (c'est un bug/une trappe volontaire). La fonction qui ouvre et imprime ce fichier, `win()`, n'est **appelée par personne** dans tout le binaire — il faut l'exécuter soi-même (par exemple sous GDB) pour voir son contenu.

```bash
echo 'FLAG{mon_flag_local}' > flag.txt   # fichier de test, pas fourni par l'auteur
gdb -q ./original/game
(gdb) break main
(gdb) run < /dev/null
(gdb) call (int)win()
(gdb) call (int)fflush(0)
# FLAG{mon_flag_local}
python3 tools/baby-solve.py --check
```

## Premier regard

Au lancement sans `flag.txt`, pas d'erreur immédiate ; le jeu affiche une carte 90×30 et un joueur `@` à déplacer avec `w`/`a`/`s`/`d` jusqu'à une case `X` (« End tile position: 29 89 »). `strings` montre `flag.txt not found in current directory` : le fichier est bien attendu, mais on ne sait pas encore où il intervient.

## Flow

`main` @ `0x8049674` : `init_player`, `init_map`, `print_map`, puis une boucle `getchar → move_player → print_map` jusqu'à ce que (ligne, colonne) == (29, 89) ; alors `puts("You win!")` et `exit`.
`move_player` gère `w/a/s/d` (déplacement) et deux touches spéciales : `l` (lit un octet supplémentaire, effet secondaire sans intérêt pour la solution) et `p` (appelle `solve_round`, qui **déplace le joueur automatiquement** jusqu'à la sortie — mais débouche sur le même `puts("You win!")`, toujours sans lire le fichier).

## Comment on trouve

**Ancrage** : `nm original/game` liste une fonction `win` (non exportée sous ce nom par `nm` simple, repérée par désassemblage de l'adresse suivant `main` dans le `.text`) :

```asm
804975d <win>:
  ...
  804978a: call fopen            ; fopen("flag.txt", "r")
  8049795: cmp [ebp-0xc],0 ; jne   ; NULL -> "flag.txt not found in current directory" + exit
  80497c3: call fgets            ; lit une ligne (jusqu'à 0x3c octets)
  80497d2: call printf           ; affiche le contenu
```

`objdump -d original/game | grep 804975d` ne montre **que la définition** de `win`, aucun `call 804975d` ailleurs dans le binaire : ni `main`, ni `solve_round`, ni le gestionnaire `SIGINT` (qui se contente d'`exit`) ne l'appellent. C'est du code mort, laissé volontairement pour forcer le passage par un débogueur.

## Debug GDB (pas à pas)

```bash
echo 'FLAG{mon_flag_local}' > flag.txt
gdb -q ./original/game
(gdb) break main
(gdb) run < /dev/null
(gdb) call (int)win()        # $1 = 20   <- printf a écrit 20 octets, mais le tampon stdout n'est pas encore vidé
(gdb) call (int)fflush(0)    # force l'affichage : FLAG{mon_flag_local}
```

Piège : sans `fflush`, la sortie de `printf` dans `win()` reste dans le tampon de stdio et n'apparaît jamais (le process se termine sous le contrôle de gdb sans le vider).

## Vérification

```text
$ python3 tools/baby-solve.py --check
win() @0x804975d n'est appelée par personne (vérifié par xref) : il faut la déclencher soi-même, par exemple sous gdb : ...
gdb call win() -> OK, contenu affiché | flag.txt créé pour le test : FLAG{exemple_local}
```

## Notes

- Ce crackme ne fournit pas de « vrai » flag : `flag.txt` est un fichier que l'utilisateur crée lui-même pour l'exercice ; la leçon est la technique (repérer et déclencher du code mort), pas une chaîne précise à retrouver.
- Reverse statique (`objdump`, recherche d'appelants) + preuve GDB ; pas de patch du binaire.
