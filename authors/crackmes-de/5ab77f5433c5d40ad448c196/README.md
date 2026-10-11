# libertyordeaths_linux_keygenme_1 — LibertyorDeath (réimport crackmes.de)

- **Page** : [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c196)
- **Plateforme** : Linux ELF32 i386 (GCC, Ubuntu 8.04, strippé), difficulté 1.5
- **Publication** : 2018-03-25
- **Règles** : pas de patch, trouver un serial (keygen bienvenu). `Source.rar` est chiffré, inutile ici.

## Solution

Seul le **dernier caractère** du nom et sa **longueur** comptent :

```
serial = 50 * (2 * nom[-1] * (len(nom) - 1))²     (arithmétique int32 signée)
```

Exemple : `petik` → `2·107·4 = 856`, `856² = 732736`, `×50` → **`36636800`**.

```
$ python3 tools/crackmes-de-libertyordeaths_linux_keygenme_1-solve.py petik
36636800
$ printf 'petik\n36636800\n' | ./crackme
Input name: Input serial (numbers only): Yay good job!
```

## Comment on trouve

1. `strings` / `.rodata` : « Input name: », « Input serial (numbers only): », « Yay good job! », « Nope sorry. » ; imports `getchar`, `gets`, `atoi` → serial numérique comparé à une valeur calculée.
2. `objdump -d -M intel` sur `main` : boucle `getchar()` jusqu'à `\n` avec un compteur `i` (`[ebp-0x110]`). À chaque caractère `c` :
   ```
   v = c + c ; v *= i ; v = v * v
   ```
   `v` est **écrasé** à chaque tour (il ne dépend pas de la valeur précédente), donc seul le dernier caractère reste, avec `i = len-1`.
3. Après la boucle `v *= 0x32` (50), puis `atoi(serial)` est comparé à `v` (`cmp eax, [ebp-0x118]`).
4. Lecture statique suffisante, pas de session GDB.

## Vérification

Vérifié en natif : `petik / 36636800` et `LibertyorDeathXYZ / 414720000` donnent `Yay good job!`, un serial faux donne `Nope sorry.`.
