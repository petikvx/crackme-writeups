# 6_levels by typhoon (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5433c5d40ad448c1d7>
- **Plateforme** : Windows PE32 console, MSVC 2013 (C), PDB fourni — difficulté 2.0
- **Archive** : `original/bomb.zip` (mot de passe `crackmes.one`) → `bomb.exe` + `bomb.pdb`
- **Statut** : résolu, **vérifié live sous wine** (`wine original/bomb.exe analysis/solution.txt` → code de sortie 0 et « Congratulations! You've defused the bomb! »)

## Solution

Variante Windows de la « binary bomb » du CMU : 6 niveaux annoncés, en réalité 7 + un niveau secret. Une ligne par niveau (fichier passé en argument, sinon stdin) :

```
Peace Sells... but Who's Buying?
HHH7HAHM
1 2 6 24 120 720
1 W 501
9 guava
bpdhklblbc
1 2 1 4 5 4
flame
```

```
python3 tools/6-levels-solve.py --check   ->  écrit analysis/solution.txt, wine bomb.exe ... exit code: 0
```

## Comment on trouve

1. `strings` + le PDB (`strings bomb.pdb`) donnent les symboles : `_explode_bomb`, `_read_line`, `_read_six_numbers`, `_func4`, `_strings_not_equal`, `_secret_level`. `main` (`0x401760`) appelle 7 phases : `0x4012f0`, `0x401310`, `0x401390`, `0x401410`, `0x401520`, `0x401560`, `0x4015e0`, chacune suivie de `phase_defused` (`0x401110`). `explode_bomb` (`0x401000`) affiche le champignon ASCII puis `exit(5)`.
2. **Niveau 1** (`0x4012f0`) : `strings_not_equal(ligne, "Peace Sells... but Who's Buying?")`.
3. **Niveau 2** (`0x401310`) : `strlen ≥ 8`, `s[0]=='H'`, `s[3]-'0'==7`, `s[5]=='A'`, `s[7]=='M'` ; les autres caractères sont libres.
4. **Niveau 3** (`0x401390`) : six entiers, `a[0]==1` et `a[i] == (i+1)·a[i-1]` → factorielles `1 2 6 24 120 720`.
5. **Niveau 4** (`0x401410`) : `sscanf("%d %c %d")`, `switch(n-1)` sur une table de sauts en `0x4014fc` ; pour `n=1` : `c=='W'` et `m==0x1f5` (501). Les 5 autres cas marchent aussi, vérifiés sous wine (`2 2 771`, `3 e 24`, `4 % 206`, `5 P 435`, `6 l 337`).
6. **Niveau 5** (`0x401520`) : `sscanf("%d")` puis `func4(n) == 0x37` ; `func4` (`0x4012b0`) est Fibonacci avec `f(0)=f(1)=1` → `f(9)=55`.
7. **Niveau 6** (`0x401560`) : 10 caractères, `out[i] = "abm!gllrsewhi057"[s[i] & 0xF]` doit valoir `"magshimim!"` → indices `2 0 4 8 B C 2 C 2 3` → par ex. `bpdhklblbc`.
8. **Niveau 7** (`0x4015e0`) : six entiers dans `[1,6]`, deux voisins jamais égaux, puis `Σ a[i]·node[i].val == 0x41` en parcourant la liste chaînée `{val, next}` depuis `0x416774` (valeurs `4 5 1 2 6 3`). Une recherche exhaustive donne `1 2 1 4 5 4` (4+10+1+8+30+12 = 65).
9. **Niveau secret** : `phase_defused` (après la 7e phase) relit la **ligne 5** avec `"%d %s"` ; si le mot est `guava` (`0x416210`), « Curses, you've found the secret level! » puis `secret_level` (`0x4016a0`) sur la ligne 8. Celle-ci (≤ 5 caractères) fait, pour chaque caractère, `call table[i] + (char)c` avec `table` en `0x4162ac` pointant dans `.data` : des NOP-sleds terminés par `ret`, avec un seul `inc esi` (`0x46`) placé à l'offset d'une lettre donnée ; il faut `Σ esi == 5`. En émulant chaque saut (Unicorn, octets de `.data`), seules les lettres `f`, `l`, `a`, `m`, `e` incrémentent `esi` aux positions 0–4 → `flame`.

## Vérification

- Live : `wine original/bomb.exe analysis/solution.txt </dev/null` → code de sortie **0** ; sous `script` on voit défiler tous les messages jusqu'à « Curses, you've found the secret level! » puis « Congratulations! You've defused the bomb! ».
- Contrôles négatifs : un mauvais niveau 6 (`badhkmbmbc`, mauvaise lecture de la table) ou un mauvais secret (`abcde`) → code **5** (explosion).
- Astuce : avec un fichier tronqué et `stdin` sur `/dev/null`, le code de sortie 1 (EOF) indique que tous les niveaux fournis sont passés, 5 qu'un niveau a explosé.
