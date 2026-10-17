# D4RKFL0W — D4RK_FL0W-3.5

| | |
|---|---|
| **ID** | [`5ce137b933c5d4419da55ac2`](https://crackmes.one/crackme/5ce137b933c5d4419da55ac2) |
| **Auteur** | D4RKFL0W |
| **Plateforme** | Linux ELF64 PIE, C++, non strippé |
| **SHA-256** | `ba1808ad2ccfbc5f9b9e46ec25af47a4606945df503e8974016c7822ba3628db` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/D4RK_FL0W-3.5` | binaire d'origine |
| `analysis/D4RK_FL0W-3.5.i64` | base IDA |
| `tools/d4rkflow35-solve.py` | code (`-q`, `--check`) |

## Réponse

**Code à 4 chiffres, saisis un par un : `4`, `2`, `7`, `3`.**

```bash
printf '4\n2\n7\n3\n' | ./original/D4RK_FL0W-3.5
python3 tools/d4rkflow35-solve.py --check
```

## Premier regard

```bash
file original/D4RK_FL0W-3.5     # ELF64 PIE, C++, not stripped
strings -n 5 original/D4RK_FL0W-3.5
```

Chaînes : `Please Enter Four Digits Seperately: `, `Second Digit: `, `Third Digit: `, `Fourth Digit: `, `Well done`, `SORRY MAYBE NEXT TIME!!`. Classe C++ `Password` avec `get_num1`..`get_num4` et `check_passcode`.

## Flow

Le constructeur `Password::Password()` calcule les 4 chiffres attendus, `get_input()` lit les 4 saisies, `check_passcode()` compare.

## Comment on trouve

**Ancrage** : MCP `ida`, Hex-Rays sur le constructeur et les `get_numN`.

```c
d1 = get_num1(40, 32445)  = (40 + 32445) % 9;
d2 = get_num2(1, 4)        = (2*(1+4) + 1) % 9;
d3 = get_num3(70)          = 70 % 9;
d4 = get_num4(35453, 837)  = (837 + 35453 + 10) % 9;
```

Calcul direct : `(4, 2, 7, 3)`.

## Vérification

```bash
$ printf '4\n2\n7\n3\n' | ./original/D4RK_FL0W-3.5
...
Well done

SORRY MAYBE NEXT TIME!!
```

(Le message « SORRY MAYBE NEXT TIME!! » s'affiche **toujours**, succès ou pas — `main` ne fait pas de `return`/`else` après le `if` : c'est « Well done » qui signale la réussite, pas l'absence du message d'échec.)

## Notes

- Pas de GDB nécessaire : constantes en dur, calcul trivial.
- Piège de lecture : `main` affiche le message d'échec même en cas de succès — bien vérifier la présence de « Well done » plutôt que l'absence du message « SORRY ».
