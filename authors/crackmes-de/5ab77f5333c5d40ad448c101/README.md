# crackme_4 (BruteforceMe) — br0ken (crackmes.de)

- **Page** : https://crackmes.one/crackme/5ab77f5333c5d40ad448c101
- **Plateforme** : Windows PE32 console (MinGW, C), x86 — difficulté 1.0
- **Mot de passe** : **`yippee`**

## Énoncé

Le `readme.txt` demande d'écrire un bruteforcer, charset `a-z`, sans patch, avec l'indice « brute les caractères un par un ».

## Comment on trouve

1. `strings cm4.exe` montre `Password :`, un format `%X%X%X%X%X%X` et une chaîne suspecte **`4D11628EBE1D`** (copiée depuis `.data` 0x403000 au début de `main`).
2. `objdump -d -M intel` sur `_main` (voir `analysis/objdump-main.txt`) :
   - `scanf("%s")` puis `strlen == 6` (sinon on saute directement au `strcmp` avec un buffer vide → échec) ;
   - chaque caractère est XORé avec une clé fixe : `0x34, 0x78, 0x12, 0xFE, 0xDB, 0x78` ;
   - `wsprintfA(buf, "%X%X%X%X%X%X", ...)` puis `strcmp(buf, "4D11628EBE1D")`.
3. Les valeurs `%X` n'ont pas de largeur fixe (une valeur < 0x10 s'écrit sur un seul chiffre), d'où un découpage ambigu : on fait un parcours en profondeur sur `a-z` en vérifiant que l'hexa de chaque caractère est bien un préfixe de la suite de la cible.

| i | clé | char | c^clé | %X |
|---|---|---|---|---|
| 0 | 0x34 | y | 0x4D | 4D |
| 1 | 0x78 | i | 0x11 | 11 |
| 2 | 0x12 | p | 0x62 | 62 |
| 3 | 0xFE | p | 0x8E | 8E |
| 4 | 0xDB | e | 0xBE | BE |
| 5 | 0x78 | e | 0x1D | 1D |

Solution unique : `yippee`.

## Solveur

```
python3 tools/crackme_4-solve.py
yippee
```

## Vérification

Sous wine (`xvfb-run -a wine cm4.exe`) : `yippee` → « That's right! Now write a small tut :) », `yippef` → « Nope... try again. ».
