# RodrigoTeixeira's Roullete Simulator

| | |
|---|---|
| **ID** | [`693c48822d267f28f69b8518`](https://crackmes.one/crackme/693c48822d267f28f69b8518) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | RodrigoTeixeira |
| **Plateforme** | Java (classe compilée, Java SE 19 / version 63), multiplateforme |
| **SHA-256** | `eaa7e973051601a69e389bd3e7fb3f50163c94e9d3d87e134dec6bef727fd4cb` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/main.class` | binaire d'origine (intact) |
| `tools/roulette-solve.py` | solveur / preuve live (`--check`) |

## Réponse

Pas de serial : il faut finir avec un **solde négatif**. Méthode : retrouver le seed du PRNG (16 bits seulement) via les issues observées, puis miser **tout le solde** sur les tirs gagnants prédits (et 1 sur les perdants) jusqu'à ce que `money + bet` **déborde** l'int 32 bits.

```bash
python3 -I tools/roulette-solve.py --check --java /chemin/java   # preuve live
python3 -I tools/roulette-solve.py --predict 0x1234              # plan pour un seed
```

(Pas de login dans ce crackme : `petik` sans objet.)

## Premier regard

- `file` : `compiled Java class data, version 63.0 (Java SE 19)`.
- `strings` : règles du jeu, « Please Input a valid 32-bit integer », « Congratulations, you solved the crackme! ». La chaîne `DecompilingJavaCodeIsReallyEasyIsntIt` est un simple message de l'auteur (leurre).
- Pas de `javap` sur la machine : désassemblage via `jawa` (venv), JVM 21 (`install-jdk`) pour l'exécution.

## Flow

`Main()` (constructeur, appelé depuis `main`) :
1. `seed = (int)System.nanoTime() & 0xFFFF` (`ldc 65535`) ;
2. propose les règles ; solde `money = 100` ;
3. boucle tant que `money > 0` : lit `bet` (`nextInt`, redemandé si `< 1` ou `> money`) ; `if (rand() % 37 < 18) money += bet; else money -= bet;` puis affiche `Money: N` ;
4. sortie de boucle : si `money < 0` → « Congratulations ».

## Comment on trouve

Ancrage : désassemblage des 3 méthodes (`<init>`, `rand`, `main`) — les `ldc` pointent la constante 65535 (cp #25).

`rand()` (xorshift 16 bits) :
```
seed ^= (seed << 7) & 0xFFFF;
seed ^=  seed >>> 9;
seed ^= (seed << 8) & 0xFFFF;
return seed;              // toujours dans [0, 65535], donc % 37 ≥ 0
```

Trois constats :
1. La contrainte `1 ≤ bet ≤ money` interdit de passer sous 0 par une perte (`money - bet ≥ 0`) ; seul `money + bet` peut devenir négatif, par **overflow int32** dès que `money + bet > 2^31-1`, donc `bet = money ≥ 2^30`.
2. Le seed ne vaut que 65536 valeurs et l'issue de chaque tir (gain si `rand()%37 < 18`) est lisible dans la variation de `Money:`. On mise 1 (peu de risque) et on garde la liste des issues ; on filtre les 65536 seeds par force brute jusqu'à ce que tous les candidats restants prédisent le même futur (en général 15–20 sondes).
3. Avec l'état connu, on prédit chaque tir : mise = tout le solde si gain prédit, 1 sinon. Le solde double à chaque gain (100 → … → ≥ 2^30 en ~25 gains), puis le dernier gain déborde et devient négatif.

Piège : seed `0` est un point fixe (rand renvoie 0 → toujours gain) ; cas géré naturellement (`--predict 0` → 25 coups).

## Vérification

JVM 21 sur une copie de `main.class` renommée `Main.class` (le nom de classe est `Main`) — `original/` non touché :

```
$ python3 -I tools/roulette-solve.py --check --java .../bin/java
[+] 16 sondes, seed candidats=1 ex. 0xd10c
['Congratulations, you solved the crackme!', '', 'Press Enter to Exit.']
[+] SOLVED (Congratulations affiché)
```
Trois exécutions de suite (seeds différents) : SOLVED. Cas KO : mise > solde ou ≤ 0 → « Enter bet » redemandé ; perdre tout → fin sans victoire.

## Notes

- Le règlement interdit d'automatiser la saisie : le solveur sert de preuve de concept ; à la main, on suit le plan (`--predict`) en saisissant les mises.
- Pas de GDB ni de debug live : reverse 100 % statique + exécution.
