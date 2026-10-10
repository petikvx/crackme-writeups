# dailycracking_by_flipflop by flipflop

| | |
|---|---|
| **ID** | [`5ab77f5333c5d40ad448c0e0`](https://crackmes.one/crackme/5ab77f5333c5d40ad448c0e0) |
| **Auteur (site)** | crackmes.de (auteur original : flipflop) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 console (MinGW, C) |
| **Difficulté** | 1.1 |

## Résultat

Le mot de passe change chaque jour : **`Crack` + le jour du mois sur deux chiffres**. Le 10 du mois : **`Crack10`**.

```
$ python3 tools/crackmes-de-dailycracking-solve.py
Crack10
```

Vérifié live sous wine (le 2026-10-10) :

```
$ printf 'Crack10' | wine dailycracking.exe
pass: right!
$ printf 'Crack00' | wine dailycracking.exe
pass: wrong!
```

## Comment on trouve

1. `strings` montre `Crackit`, `pass: ` et `%d`, plus des imports `time` / `localtime` / `strftime` : le nom « dailycracking » et ces imports laissent déjà deviner un mot de passe lié à la date. Le binaire garde ses symboles (`_main`, `_isOk`, `_getDay`, `_secretA`, `_secretB`).
2. `_main` : `fputs("pass: ")`, puis `fgets(buf, 8, stdin)` (la taille 8 vient de `.rdata:0x403000`), puis `_isOk(buf)`. Si c'est vrai, `_secretA` écrit `right! ` dans le buffer, sinon `_secretB` écrit `wrong! ` (les octets sont posés dans le désordre pour ne pas apparaître dans `strings`).
3. `_isOk` (voir [`analysis/objdump-isOk-getDay.txt`](analysis/objdump-isOk-getDay.txt)) : `strncpy(ref, "Crackit", 8)`, puis `_getDay(ref + 5)` qui fait `strftime(ref+5, 3, "%d", localtime(time()))`. On obtient donc `Crack` + `DD` + `\0`, comparé par `strcmp` à la saisie.
4. Comme `fgets` ne lit que 7 caractères, le `\n` final reste dans stdin et ne gêne pas la comparaison : on peut taper `Crack10` puis Entrée.

## Solveur

[`tools/crackmes-de-dailycracking-solve.py`](tools/crackmes-de-dailycracking-solve.py) : sans argument, il donne le mot de passe du jour ; avec une date ISO (`2026-10-25`), celui de ce jour-là (`Crack25`).

## Status

- [x] reverse
- [x] write-up
- [x] solveur
