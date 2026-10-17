# D4RKFL0W — Crack_5

| | |
|---|---|
| **ID** | [`5f0998cb33c5d42a7c667974`](https://crackmes.one/crackme/5f0998cb33c5d42a7c667974) |
| **Auteur** | D4RKFL0W |
| **Plateforme** | Linux ELF64 PIE, C++, non strippé (`func1`, `func2`, `convert`, `args`) |
| **SHA-256** | `d4a38dec4dfcfb88674f52ff11f5a190282a2412da9004a6d14b86d0c7bb1e4c` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crack_5` | binaire d'origine |
| `analysis/crack_5.i64` | base IDA (gitignorée) |
| `tools/crack5-solve.py` | rejoue la preuve (`-q`, `--check`) |

## Réponse

**Appel** (2 arguments avant le mot de passe saisi au clavier) : `./crack_5 AAAAAAAA YAAAAXA` puis, à l'invite `Password:` :

**`P0iNT3R_tYPe5_M4tt3r`**

```bash
printf 'P0iNT3R_tYPe5_M4tt3r\n' | ./original/crack_5 AAAAAAAA YAAAAXA     # Correct
python3 tools/crack5-solve.py --check
```

## Premier regard

`strings` : `Sorry, That Is Wrong.`, `Please Try Again.`, `Password: `, `Correct`, `Sorry, That's Wrong...`. Symboles `args(char*, char*)`, `func1`, `func2`, `convert`. Lancé sans argument : échoue avec les deux messages d'erreur.

## Flow

`main` : construit deux messages d'erreur, appelle `args(argv[1], argv[2])` ; si vrai, scramble deux tableaux globaux (`fake_password`, `coded_password`) via des boucles fixes de `func1`/`func2`, affiche `Password: `, lit une ligne, convertit `coded_password` en chaîne (`convert`), compare.

## Comment on trouve

**Ancrage** : MCP `ida` (idalib + Hex-Rays) sur `main` et `args`, pour lever une ambiguïté que la seule lecture asm avait mal tranchée.

```c
// args(a1=argv[1], a2=argv[2])
if ( strlen(a1) == 8 && strlen(a2) != 8 && a2[strlen(a2)-2] == 'X' && a2[0] > 'X' )
    return 1;   // sinon : imprime "Sorry, That's Wrong..." et retourne 0
```

Piège (confirmé par Hex-Rays après un mauvais essai en asm brut) : la condition est `strlen(a2) **!=** 8`, pas `== 8` — un premier essai avec `argv[2]` de longueur 8 échoue systématiquement.
Exemple valide : `argv[1] = "AAAAAAAA"` (8 car.), `argv[2] = "YAAAAXA"` (7 car. ; `[0]='Y'>'X'` ; `[len-2]='X'`).

Une fois la porte `args()` passée, `main` exécute des boucles **fixes** (indépendantes des arguments) qui transforment `coded_password` via `func1`/`func2` (XOR/rotation répétés de nombreuses fois) ; reproduire ces rondes à la main est source d'erreurs. La valeur finale est lue directement en mémoire sous GDB, juste après l'appel à `convert()`.

## Debug GDB (pas à pas)

```bash
gdb -q ./original/crack_5
(gdb) break *0x555555555603      # juste après convert(), avant la comparaison (PIE, base 0x555555554000)
(gdb) run AAAAAAAA YAAAAXA
Password: <taper n'importe quoi>
(gdb) x/gx $rbp-0xb0              # pointeur _M_p du std::string résultat : 0x...6d3a0
(gdb) x/s *(long*)($rbp-0xb0)     # "P0iNT3R_tYPe5_M4tt3r"
```

Pièges :
- `print *(std::string*)(...)` échoue (« No symbol "std" ») faute d'info de type pour la libstdc++ dans ce binaire ; il faut lire le `_M_p` (pointeur, premier membre) à la main et faire `x/s` sur sa valeur ;
- sans les deux arguments `argv[1]`/`argv[2]` valides, `args()` déréférence `argv[2]` même absent → `SIGSEGV` dans `strlen` (vérifié) ;
- un premier essai avec `argv[2]` de longueur 8 échoue silencieusement avec les DEUX messages d'erreur cumulés (celui d'`args()` et celui de `main`), ce qui a nécessité Hex-Rays pour clarifier la condition exacte.

## Vérification

```text
$ printf 'P0iNT3R_tYPe5_M4tt3r\n' | ./crack_5 AAAAAAAA YAAAAXA   -> Password: / Correct
$ printf 'wrong\n'                 | ./crack_5 AAAAAAAA YAAAAXA   -> Password: / Sorry, That Is Wrong. / Please Try Again.
$ ... ./crack_5 AAAAAAAA YAAAAAXA   (argv[2] de longueur 8)       -> Sorry, That's Wrong... / Sorry, That Is Wrong. / Please Try Again.
```

## Notes

- Reverse avec le MCP `ida` (nécessaire pour trancher un piège de lecture asm) + débogage GDB (lecture mémoire directe) ; aucun patch du binaire.
