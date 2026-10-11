# crackme2 by cyclops

| | |
|---|---|
| Page | [crackmes.one/crackme/5ab77f5433c5d40ad448c15b](https://crackmes.one/crackme/5ab77f5433c5d40ad448c15b) |
| Auteur | cyclops (réimport crackmes.de) |
| Publié | 2018-03-25 |
| Plateforme | DOS 16 bits (MZ), Borland C++ 1991 — le site dit « Borland Delphi », c'est faux |
| Difficulté | 1.0 |
| Solution | keygen — `petik` → **`83496`** |

## Énoncé

Le `readme.txt` : « Dos crackme with serial protection. I used some mathematical calculations to find serial. » On demande un nom puis un serial numérique (`%ld`).

## Comment on trouve

1. `file` → exécutable MZ DOS ; `strings` montre `Borland C++ - Copyright 1991`, les messages `Good Work Cracker.` / `Try Another Time Dude.` et les formats `%s` / `%ld`.
2. Le segment de données commence à `0x2800` dans le fichier (juste avant la chaîne Borland). `Enter Your Name:` est à DS:`0xEA` → un seul `mov ax,0xea` dans le désassemblage (`ndisasm -b16 -e 0x200`), à `0x2F5` : c'est `main`.
3. Lecture du `main` :
   - `scanf("%s", name)` (buffer `bp-0x60`), `n = strlen(name)` ;
   - boucle 1 : `name[i] = tolower(name[i])` (la routine `0xF61` teste le bit « majuscule » de la table ctype et ajoute `0x20`) ;
   - boucle 2 : `v[i] = name[i] & 0x7F` dans un tableau de `long` (`bp-0x50`) ;
   - si `n` est **pair** : `v[i] += i` pour i pair, `v[i] += i>>1` pour i impair ;
   - si `n` est **impair** : `v[i] += (i>>1) + 10` pour i pair, `v[i] += i + 5` pour i impair ;
   - boucle finale : `sum += v[i] * 0x8E` (`call 0x83C` = multiplication 32 bits `LXMUL`) ;
   - `scanf("%ld", &serial)` puis comparaison 32 bits `serial == sum` (`0x630`) → `Good Work Cracker.` sinon `Try Another Time Dude.`.

## Keygen

```
serial = Σ 0x8E × ((tolower(c_i) & 0x7F) + bonus(i, n))   (int32 signé)
```

```
$ python3 tools/crackmes-de-crackme2-solve.py petik petikvx
petik -> 83496
petikvx -> 120558
```

Le nom est mis en minuscules, donc `Petik` donne aussi `83496`.

## Vérification

Lancé dans DOSBox (sous `xvfb-run`) avec l'entrée redirigée (`CM2 < IN.TXT`). L'affichage passe par conio (écriture vidéo directe), donc pas de sortie redirigeable : la preuve est une capture d'écran.

- `petik` / `83496` → **Good Work Cracker.** ([capture](analysis/dosbox-petik-good.png))
- `petikvx` / `120558` → **Good Work Cracker.** ([capture](analysis/dosbox-petikvx-good.png))
- `petikvx` / `123` → `Try Another Time Dude.` ([capture](analysis/dosbox-bad.png))
