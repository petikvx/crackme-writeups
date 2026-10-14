# jandepora (crackme #4) — esn_min (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5b33c5d40ad448c5c2 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux (source **C** fournie, `crackme4.c`) ; compilé ici avec `gcc -O0` (`analysis/dfa/crackme4`)
- Archive : `original/crackme4.zip` → `crackme4.c` (aucun binaire)
- Usage : `name` puis `serial` sur stdin

## Réponse

Le serial est un mot de 43 caractères sur `{a,b,c}` qui fait parcourir à un automate à 8 états un chemin
valide avec **exactement** `#a / #b / #c` occurrences, ces nombres dépendant du nom :

| Name | #a / #b / #c | Serial |
|---|---|---|
| `petik` | 37 / 4 / 2 | `aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbcabc` |
| `admin` | 27 / 14 / 2 | `aaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbcabc` |
| `Zorro` | 33 / 9 / 1 | `aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbc` |

```bash
python3 -I tools/jandepora-solve.py petik --check
# check: OK (Registered=True, serial altéré→Wrong=True)
```

## Premier regard

Le source est un « crackme obfusqué par processus » : 8 processus (`fork`) reliés par des pipes non bloquants
se passent un compteur ; selon le caractère courant du serial (`a`, `b` ou `c`) chaque processus écrit dans un
pipe différent (donc réveille un autre processus). Au rang 43 le processus qui détient le jeton envoie `SIGUSR1`
(« Registered ») sauf le dernier (`pids[7]`) qui envoie `SIGUSR2` (« Wrong serial number »).

## Comment on trouve

**1. Compteurs** (`retrieve`) : `n = Σ` du nom de droite à gauche : `n = (n + name[len-1]) * 37` (unsigned 32 bits) ;
`#b = n % 17 + 1`, `#c = n % 16 + 1`, `#a = 43 − #b − #c`. Le serial doit contenir exactement ces nombres de `a`, `b`, `c`
et rien d'autre (`wrong()` sinon) ; sa longueur est donc 43 et les comptes imposent aussi `#a ≥ 10`.

**2. L'automate** : la table de câblage des pipes (numéros de descripteurs `3…16` modifiés par `pipe`, `close`, `fork`)
est pénible à suivre à la main. On l'**instrumente** (`analysis/dfa/crackme4_instr.c`) : chaque processus écrit sur
`stderr` `S<id>:<count>` quand il lit le jeton ; on retire le contrôle des comptes. Pour un préfixe `p`,
`serial = p + 'x'` (le `x` ne correspond à aucun `case`, le jeton s'arrête) : l'identifiant du processus qui lit au
rang `len(p)` est l'état atteint. Exploration en largeur (`analysis/dfa/explore.py`, 24 exécutions) :

```
      a  b  c
 0:   0  0  1
 1:   2  4  7
 2:   1  3  7
 3:   4  2  5
 4:   3  1  7
 5:   6  6  1
 6:   5  5  7
 7:   7  7  7     <- le processus 7 envoie SIGUSR2 : état puits « Wrong »
```

départ = processus 0 ; accepté si, après exactement 43 caractères, l'état est ≠ 7.

**3. Recherche du serial** : programmation dynamique mémoïsée sur `(état, a restant, b restant, c restant)`, en
interdisant l'état 7. Exemple `petik` : 37 `a` (le bouclage `0 –a→ 0` ne consomme rien d'autre), puis `bbb` (`0 –c→ 1`
n'est pris qu'à la fin) puis `c a b c` : `0 –a→ 0`, … → `1 –b→ 4 –b→ 1 …` (voir `tools/jandepora-solve.py`).

**Pièges :**
- Le serial doit contenir **les trois lettres dans les bonnes quantités** *et* être un chemin de l'automate : d'où la DP.
- L'état 7 est absorbant : un seul pas dedans et c'est `Wrong`.
- Le programme boucle (`for(;;)`) après avoir lancé les enfants : `--check` lance le groupe de processus dans une nouvelle
  session et le tue (`killpg`) pour ne laisser aucun processus.
- `report()` écrit les pourcentages `\r` sur la sortie standard : normal.

## Vérification

```text
$ python3 -I tools/jandepora-solve.py petik --check       # analysis/verify.txt
check: OK (Registered=True, serial altéré→Wrong=True)
```

Le `--check` exécute le `crackme4.c` d'origine compilé (sans instrumentation) : le serial est accepté, et en changeant
le dernier caractère il passe en « Wrong serial number ».

## Fichiers

- `analysis/crackme4.c` : source d'origine ; `analysis/dfa/` : `crackme4_instr.c` (copie instrumentée), `explore.py` (BFS de l'automate), `crackme4` (compilé), `orig.c`
- `tools/jandepora-solve.py` : keygen (DP) + `--check`
