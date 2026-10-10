# k1 by xtfusion

| | |
|---|---|
| **ID** | [`5ab77f5333c5d40ad448c0d8`](https://crackmes.one/crackme/5ab77f5333c5d40ad448c0d8) |
| **Auteur (site)** | crackmes.de (auteur original : xtFusion) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 console, C MinGW |
| **Difficulté** | 1.5 |

## Résultat

Keygen demandé. Exemple : nom **`petik`** → serial **`15476a`** (`petikvx` → `3179d2`).

```
$ python3 tools/crackmes-de-k1-solve.py petik
petik 15476a
```

Vérifié live sous wine : `Corect, now make a keygen` ; un serial faux (`2`) ne l’affiche pas.

## Comment on trouve

1. `diec` : PE32 console MinGW, non packé. `strings` : `Name:`, `Serial:`, `Serial 2 short!`, `Name 2 short!`, `Corect, now make a keygen`, et un format **`%x`** à `0x403010`.
2. `_main` (`0x401290`, voir [`analysis/main.asm.txt`](analysis/main.asm.txt)) lit le nom (`[ebp-0x68]`) et le serial (`[ebp-0x88]`) avec `gets`.
3. Boucle sur chaque caractère `c` du nom (`movsx`, signé) :
   ```
   t += c * 80          ; (c<<2)+c puis <<4
   u  = (t + u) ^ 0x32
   v += 4 * u
   w  = u + v + t
   ```
   `t`, `u`, `v` (`[ebp-0x14/-0x18/-0x1c]`) ne sont **jamais initialisés** dans le source ; sous wine (et sur un process frais) ils valent 0, ce que confirme le test live.
4. `wsprintfA(buf, "%x", w)` puis comparaison octet par octet **sur la longueur du serial saisi** : seul un préfixe de la chaîne hex est exigé (le serial `1` passe pour `petik`). Le serial « propre » est la chaîne hex complète.
5. Message d’échec : aucun ; seul le succès imprime `Corect…` (drapeau `[ebp-0x10]`).

## Solveur

[`tools/crackmes-de-k1-solve.py`](tools/crackmes-de-k1-solve.py) : même calcul en 32 bits signé, sortie `%x` non signée.

```
printf 'petik\n15476a\n' | xvfb-run -a wine xtfK1.exe  → Corect, now make a keygen
```

## Status

- [x] reverse
- [x] write-up
- [x] solveur
