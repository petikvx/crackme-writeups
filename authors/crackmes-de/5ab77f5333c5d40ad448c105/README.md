# crackme_3 — br0ken (crackmes.de)

- **Page** : https://crackmes.one/crackme/5ab77f5333c5d40ad448c105
- **Plateforme** : Windows PE32 console (MinGW, C), x86 — difficulté 2.0
- **Exemple** : nom `petik` → serial **`br0-341111-293352267-ken`**

## Énoncé

Le `readme.txt` récompense le keygen (« Gold Medal = Keygen + src + tut »).

## Comment on trouve

1. `strings` : `Name :`, `Serial :`, le format **`%s-%lu-%lu%lu-%s`** et les morceaux `br0` / `ken` dans `.rdata`, plus une table **`@^*R$FVT%@`** à `0x403000`.
2. `_main` (`objdump -d -M intel`, voir `analysis/objdump-main.txt`) recopie cette table sur la pile à `[ebp-0x348]` (11 octets, le reste est mis à zéro par `memset`). Le nom est à `[ebp-0x278]`, le serial saisi à `[ebp-0xd8]`.
3. Boucle sur chaque caractère `c_i` du nom :
   - `c % 10` est calculé avec la division magique `imul 0x67` / `sar 2`, puis `B += c ^ T[c % 10]` ;
   - `A += c * T[i] + 0xEFEF` (attention : `ebp-8+i-0x340` = `ebp-0x348+i`, c'est la même table indexée par la position, et non un second tableau) ;
   - une boucle interne recalcule `C = c_j² + A − B` pour tous les `j` : seule la valeur du dernier caractère compte.
4. `wsprintfA(buf, "%s-%lu-%lu%lu-%s", "br0", A, B, C, "ken")` puis `strcmp(buf, serial)`. Le `B` et le `C` sont collés sans tiret.

## Keygen

```
python3 tools/crackme_3-solve.py petik
br0-341111-293352267-ken
```

## Vérification

Sous wine (`xvfb-run -a wine cm3.exe`) : `petik` / `br0-341111-293352267-ken` → « Serial is valid. Now make a keygen :) », un faux serial → « Nope, try again :) ».
