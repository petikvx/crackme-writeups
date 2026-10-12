# damos_crackme_1_for_linux by damo2k (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1e6>
- **Plateforme** : Linux **ELF32** i386, GCC 3.3.5, non strippé (debug info) — difficulté 2.0
- **Archive** : `original/crkme1-linux32.gz` → `crkme1-linux32`
- **Statut** : résolu (keygen), vérifié (**natif**)

## Solution

```
./original/crkme1-linux32 POFKPPEZAS      →  Good Serial!
python3 tools/damo-crackme1-solve.py -n 6 --check   # 1 serial fixe + 5 aléatoires, testés sur le binaire
```

Le serial est passé en argument (`argv[1]`) et doit faire **10 caractères**. Les minuscules sont d'abord converties en majuscules (`-0x20`), donc `pofkppezas` marche aussi.
Puis cinq contraintes linéaires entre caractères (`s` = serial upcasé) :

| Contrainte | Exemple `POFKPPEZAS` |
|---|---|
| `s[0] = s[9] - 3` | `P` = `S` − 3 |
| `s[1] = s[8] + 14` | `O` = `A` + 14 |
| `s[2] = s[7] - 20` | `F` = `Z` − 20 |
| `s[3] = s[6] + 6` | `K` = `E` + 6 |
| `s[0] = (s[4] + s[5]) / 2` (division entière) | `P` = (`P` + `P`) / 2 |

Il n'y a pas de nom : c'est un serial « à contraintes », il en existe énormément. Un serial commençant par `PETIK` est impossible (il faudrait `s[7] = 'h'`, qui serait upcasé en `H`).

## Comment on trouve

1. `strings` : `Usage: %s <serial>`, `Good Serial!`, `Bad Serial!`, imports `strlen` + `printf` seulement.
2. `objdump -d -M intel` sur `main` (`0x80483c4`, symboles présents) :
   - `strlen(argv[1]) == 0xa` sinon *Bad Serial!* ;
   - boucle sur chaque octet : si `0x60 < c ≤ 0x7a` → `c -= 0x20` (en place) ;
   - cinq blocs `movsx` / `add`/`sub imm` / `cmp` / `je` ; le dernier fait `(s4+s5)` puis l'idiome `sar 0x1f ; shr 0x1f ; add ; sar 1` = division signée par 2.
3. Choix des caractères : on fixe `s9`, `s8`, `s7`, `s6`, puis `s4` + `s5` tels que leur somme vaille `2·s0` ou `2·s0+1`.

## Vérification

- Natif : `./original/crkme1-linux32 POFKPPEZAS` → `Good Serial!` ; `POFKPPEZAX` → `Bad Serial!`.
- `tools/damo-crackme1-solve.py --check` lance le binaire sur chaque serial généré.
