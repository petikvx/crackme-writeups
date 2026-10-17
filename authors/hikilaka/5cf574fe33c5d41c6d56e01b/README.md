# hikilaka — crackme #1

| | |
|---|---|
| **ID** | [`5cf574fe33c5d41c6d56e01b`](https://crackmes.one/crackme/5cf574fe33c5d41c6d56e01b) |
| **Auteur** | hikilaka |
| **Plateforme** | Linux ELF64, C++ (statiquement lié libstdc++), strippé |
| **SHA-256** | `99ce00634501b4da092d0ad185bdbfe78ee67e2d7c06f1415978393bd7cd8a00` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme` | binaire d'origine |
| `analysis/crackme.i64` | base IDA |
| `tools/crackme1-solve.py` | mot de passe (`-q`, `--check`) |

## Réponse

**Saisie en deux temps : un entier (longueur, `10`) puis le mot `ghnuhbijra`.**

```bash
printf '10 ghnuhbijra\n' | ./original/crackme
python3 tools/crackme1-solve.py --check
```

## Premier regard

```bash
file original/crackme     # ELF64, statically linked libstdc++, stripped
strings -n 5 original/crackme | grep -iE "password|login"
```

Chaînes : `Password: `, `Login successful.`, `Login unsuccessful.`. Binaire **statiquement lié** à libstdc++ : des centaines de symboles de template `std::string`/algorithmes STL noient les quelques fonctions utiles, et Hex-Rays affiche des noms `sub_XXXX` partout — il faut suivre les appels un par un plutôt que de chercher un symbole parlant.

## Flow

`main` (trouvé via MCP `ida`, décompilation directe malgré le stripping — le binaire garde une table de fonctions complète) :

1. lit un **entier** `N` sur `cin` (`std::istream::operator>>(int&)`), clampé à `min(N, 10)` ;
2. lit `N` **caractères** sur `cin` un par un (`cin >> char`, qui saute les espaces) dans un buffer de 10 octets ;
3. génère une séquence de référence de 10 octets avec un **générateur de Fibonacci entier** seedé `(5, 1)` ;
4. compare les deux séquences avec `std::mismatch` et exige qu'elles soient identiques sur toute la longueur.

## Comment on trouve

**Ancrage** : MCP `ida`, décompilation de `main` (`0x4023a0`) et des petites fonctions qu'elle appelle. Beaucoup de wrappers triviaux (`sub_402840`, `sub_4029F0`, …) à suivre un par un — reconnaître `std::mismatch` (boucle qui avance deux itérateurs en parallèle jusqu'à la première différence ou la fin d'une des deux plages, `sub_402FE0`) est la clé pour comprendre que le programme compare deux séquences de même façon qu'un `==` sur deux conteneurs.

Le générateur (`sub_4028C0`, appelé 10 fois par `sub_402840`) :

```c
int next_byte(int32_t *state) {       // state = {x, y}, 2 x int32 adjacents
    int v = state[0] + state[1];      // v = x + y
    state[0] = state[1];              // x <- y
    state[1] = v;                     // y <- v   (Fibonacci standard)
    return (v % 26) + 'a';
}
```

Seed initiale lue dans l'initializer-list `{5, 1}` passée au générateur. 10 appels produisent le mot de passe attendu :

```python
x, y = 5, 1
out = []
for _ in range(10):
    v = x + y
    out.append(chr(v % 26 + 97))
    x, y = y, v
# -> "ghnuhbijra"
```

Le premier entier saisi doit être `10` (ou plus, car clampé à 10) pour que les **10** caractères du mot de passe soient bien lus.

## Vérification

```bash
$ printf '10 ghnuhbijra\n' | ./original/crackme
Password: Login successful.

$ printf '10 wrongpass1\n' | ./original/crackme
Password: Login unsuccessful.
```

## Notes

- Pas de GDB nécessaire : tout le calcul est statique et déterministe, entièrement reproductible en Python.
- Le binaire est **stripped** mais pas obfusqué au niveau algorithmique — la seule difficulté est le bruit des symboles de template C++ statiquement liés, qui noie les quelques fonctions réellement utiles derrière des dizaines de wrappers `_M_data`/`_M_create`/etc.
