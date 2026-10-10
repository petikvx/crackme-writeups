# learn_the_first_few_tricks_1 — deibiz_xxl (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c11a
- Plateforme : Windows PE32 console (MinGW GCC), difficulté 2.5
- Statut : **résolu** (mot de passe vérifié sur le binaire live sous wine)

## Résultat

```
Type your password: [DEIBIZ]
Well done, have you patched your name?
```

Mot de passe fixe : **`[DEIBIZ]`** (pas de nom en entrée, donc pas d'exemple `petik` pour le pass).

```
python3 tools/ltfft-solve.py LTFFT.exe
[DEIBIZ]
OK
```

## Comment on trouve

### 1. Les chaînes

`strings` montre `ZCDHAHY\` suivi de `XXXXXXXXXXXX`, puis `Type your password:`, `Well done...`, `Bad...` et un
import `strcmp` : la comparaison est directe, reste à savoir avec quoi.

### 2. `main` (`analysis/main.asm`)

```
scanf("%s", buf_0x404070)
createGoodBoy()                       ; 0x401357
if (strcmp(buf_0x404070, good_0x404060) == 0) puts("Well done...")
else puts("Bad...")
```

### 3. `createGoodBoy`

Boucle `i = 0..7` : `good[i] = data_0x402000[i] + 1`. Les 8 octets à `0x402000` sont `ZCDHAHY\` :

```
Z C D H A H Y \   (+1)
[ D E I B I Z ]
```

d'où `[DEIBIZ]` (le pseudo de l'auteur entre crochets). `good` est en `.bss`, donc l'octet suivant vaut 0 et termine la chaîne.

### 4. Objectif 2 (patch du nom) — décrit seulement

Le `printf("Cracked By: %s ...", 0x402009)` affiche les 12 `X` de `.data` (`0x402009`, offset fichier `0xe09`).
Il suffirait d'y écrire son nom (≤ 12 caractères + NUL), par ex. `petik`, dans une **copie** du binaire ; `original/`
n'est pas modifié.
