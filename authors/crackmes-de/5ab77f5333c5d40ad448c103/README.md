# what_is_my_password (Crackme 6) — br0ken (crackmes.de)

- **Page** : https://crackmes.one/crackme/5ab77f5333c5d40ad448c103
- **Plateforme** : Windows PE32 console (MSVC 6, C), x86 — difficulté 2.0
- **Mot de passe** : **`95718t00w`**

## Énoncé

« Trouve mon mot de passe », aucune règle. Le binaire affiche lui-même le MD5 attendu une fois les tests passés.

## Comment on trouve

1. `strings` montre `Take a guess =`, `Congrats, you have found my password!` et `The MD5 hash of the password should be 7eeeec6420a2a99b123f66b5c5231547`.
2. Le code de vérification suit directement la lecture (`0x401064`, extrait dans `analysis/objdump-check.txt`). Chaque échec appelle `0x4011b0` (« You have failed! » puis `exit`).
3. **Longueur** : `repnz scasb` donne `len+1`, on ajoute 8 et on compare à `0x12`, donc **9 caractères**.
4. Après `add esp,0x2c`, le buffer est à `[esp+0x10]` ; on lit `b0=ebx, b1=esi, b2=edx, b3=ecx, b4=eax` et cinq équations linéaires :

| # | équation | valeur |
|---|---|---|
| 1 | 3(b0+b4) + 2b2 − b1 − b3 | 0x15b |
| 2 | 3(b3+2b0) − 2(b1+2b4) − b2 | 0x68 |
| 3 | 7b3 + b0 + 3(b1−b2) + b4 | 0x1c2 |
| 4 | 3(b3+b2) − 7b4 + 2b0 + b1 | 0x57 |
| 5 | b0+b1+b2+b3+b4 | 0x10e |

5. Puis (après 4 `pop`, le buffer est à `[esp]`) : `b6 ^ 0x6f == 0x5f` → `'0'`, `b7 == b6` → `'0'`, `b8 − b5 == 3` et `b8 + b5 == 0xeb` → `b5='t'`, `b8='w'`.
6. Gauss sur le système 5×5 : `b0..b4 = "95718"`. Le mot de passe complet `95718t00w` a bien le MD5 annoncé, ce qui confirme qu'il est unique et que ce n'est pas un faux positif.

## Solveur

```
python3 tools/what_is_my_password-solve.py
95718t00w
```

## Vérification

Sous wine (`xvfb-run -a wine cme6.exe`) : `95718t00w` → « Congrats, you have found my password! » ; `test` → « You have failed! ».
