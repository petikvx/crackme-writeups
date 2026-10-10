# serialkeygen_me — br0ken (crackmes.de)

- **Page** : https://crackmes.one/crackme/5ab77f5333c5d40ad448c102
- **Plateforme** : Windows PE32 console (MinGW, C), x86 — difficulté 2.5
- **Exemple** : **`petiki!`** (keygen à partir de `petik`)

## Énoncé

Trouver un mot de passe valide, keygen optionnel, sans modifier l'exe.

## Comment on trouve

`strings` donne `Enter password :` / `You've done it!` ; on désassemble `_main` (`objdump -d -M intel`, extrait dans `analysis/objdump-main.txt`).

1. **Longueur** : `n = strlen(pwd)` puis le code calcule `n*n*n - 5*n*n - 6*n - 0x38` et exige 0. Le polynôme \(n^3-5n^2-6n-56\) a pour seule racine entière positive **n = 7** (343 − 245 − 42 − 56 = 0).
2. **Somme** : boucle `i = 0..5` (le 7ᵉ caractère n'est pas lu) : `S += (3*c_i - 40) * c_i` (`lea edx,[eax-0x28]` puis `imul`), avec `S` initialisé à 0.
3. **Test final** : la constante magique `0x66666667` + `sar 2` est une division par 10 ; on calcule `S % 10` et il faut 0.

## Keygen

On garde 5 caractères du nom (`petik`), on cherche un 6ᵉ caractère qui rend `S` multiple de 10, et on met n'importe quoi en 7ᵉ :

```
python3 tools/serialkeygen_me-solve.py         # petiki!
python3 tools/serialkeygen_me-solve.py autre   # autre base
```

## Vérification

Sous wine (`xvfb-run -a wine cm2.exe`) : `petiki!` → « You've done it! Now write a solution :) », `petikaa` → « Invalid password, try again! ».
