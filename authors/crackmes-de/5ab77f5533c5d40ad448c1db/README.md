# keygenning4newbies_crackme_2 by analyst (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1db>
- **Plateforme** : Windows PE32 GUI, **Borland C++** — difficulté 1.0
- **Archive** : `original/k4n2.zip` → `k4n2.EXE` + `readme.txt`
- **Statut** : résolu (keygen), vérifié par **émulation Unicorn** du bloc `0x4010F7..0x40123C`

## Solution

```
python3 tools/k4n2-solve.py petik          ->  1E29E126845-10107B90-42544815431080209-A3172A4
python3 tools/k4n2-solve.py --check petik  ->  Congratulations! …
```

Nom : **len > 3** (et `< 0x32` pour la 2ᵉ boucle). Format sprintf :

```
"%lX%lu-%lu%lX-%lu%lu-%lX%lX"
```

Huit valeurs : mélange de calculs sur le nom (toupper, `imul`, `rol`/`xor 0x1E240`, etc.) **et** de trois champs dérivés du pointeur de frame `edi = ebp - 0x474` (après les `rep movs` locaux). Le solveur fixe **EBP = 0x108000** pour un serial reproductible.

## Comment on trouve

1. `diec` : Borland C++. `readme.txt` : « a little bit harder than the 1st ».
2. Handler Check `0x401000` : name (ctrl `0x66`), serial (ctrl `0x68`).
3. Boucles `0x401126` / `0x40118f` / `0x4011b3` : normalisation ASCII majuscule, produits cumulés, `Σ(name[i]+i)` puis `rol`/`xor 0x1E240`, etc.
4. `sprintf` `0x404f84` avec le format ci-dessus (8 arguments dont 3 liés à `edi`) ; comparaison puis SetWindowText Congratulations.

## Vérification

- `tools/k4n2-solve.py --check` émule le vrai code (hooks sprintf / strcmp / SetWindowText) : serial ci-dessus → Congratulations ; `0` → NOT Valid.
- Les champs frame rendent le serial dépendant de EBP : l’émulation documente un EBP fixe (pas de GUI wine pilotée ici).
