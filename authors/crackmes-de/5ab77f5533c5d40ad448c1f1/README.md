# xyz_keygenme20110405 by xiayuanzhong (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1f1>
- **Plateforme** : Windows **PE32** console, C++ Dev-C++ (MinGW, `diec` : *Compiler: MinGW*), libstdc++ statique, symboles partiels (`_main`, `KEEP`/`CTS`/`STS`/`STC`, `XYZ`, `Errors`, `Congratulations`) — difficulté 2.0
- **Archive** : `original/XYZ_KeygenMe20110405.zip` → `XYZ_KeygenMe20110405.EXE` + `ReadMe.txt`
- **Statut** : résolu (keygen), vérifié **live sous wine**

## Solution

Le nom doit contenir **au moins une majuscule** A–Z (sinon « Illegimate string! ») ; `petik` est refusé, on prend `Petik`.

```
python3 tools/xyz-keygenme0405-solve.py Petik --check
Petik -> Petikxyzxyzxyzx
wine : [... "You're so COOL!~ Well-done!", 'My email address is xiayuanzhong@gmail.com', ...]
```

| Nom | Password |
|---|---|
| `Petik` | **`Petikxyzxyzxyzx`** |
| `PeTik` | `PeikxyzTxyzxyzx` |
| `PETIK` | `PxyEzxTyzIxyKzxyzx` |
| `aBcd` | `Bacdxyzxyzx` |

Formule (`L = len(name)`, `caps` = majuscules du nom) :

1. longueur attendue `k = 2L+10` ; si `k ≠ 50` alors `k -= 7` (donc `2L+3` sauf `L=20` → 50) ; `+2` si `name[0]` majuscule, `+3` si `name[-1]` majuscule ;
2. `reps = k // len(caps)` ;
3. pour `i = 0 .. k-1` : si `i == j·reps` et `j < len(caps)` → `password[i] = caps[j]` ; sinon prochain caractère **non-majuscule** du nom, puis cycle `XYZ(xyz%3)` avec `xyz` partant de 1 (`0→z`, `1→x`, `2→y`).

## Comment on trouve

1. `nm` : `_main` (`0x401390`), `Announcement`, `Errors`, `Congratulations`, `KEEP`/`CTS`/`STS`/`STC`, `XYZ(short)`. Peu de chaînes utiles en clair pour le succès : `KEEP` est une identité obscurcie (`STC(STS(CTS(c))) ≡ c`) utilisée pour `printf("%c", …)` caractère par caractère.
2. `Errors(code)` : seul `0x20ca` imprime « Please enter the Name… » ; `0x241d` imprime « Illegimate… » ; `0x202d` demande le password ; `0x30eb` / `0x932` → « Error! Try Again » ; les autres codes sont des no-op (leurres).
3. Validation nom : `0 < length ≤ 20`, et une boucle pose `[ebp-0x9e] = 0x11d0` dès qu’un caractère ∈ `['A','Z']` ; sinon on reboucle.
4. Longueur password : part de `2·L+10`, `-7` sauf si déjà 50, puis `+2`/`+3` selon majuscules en tête/queue ; doit égaler `password.length()` (et `password.length() > name.length()`).
5. Extraction de `caps` (majuscules uniquement) ; `reps = k / len(caps)`.
6. Boucle `i` : aux indices `0, reps, 2·reps, …` on exige `password[i] == caps[j]` ; ailleurs on avance dans le nom en **sautant** les majuscules, puis on remplit avec `XYZ(compteur % 3)` une fois le nom épuisé. Succès si le jeton `[ebp-0x9c]` reste `0x2e20` → `Congratulations()`.

Le `ReadMe` annonce de l’ASM « anti-virus » et des chaînes dures à trouver : en pratique l’obfuscation est `KEEP` + codes magiques dans `Errors`, pas un packer.

## Vérification

- Live sous wine (stdin redirigé) : `Petik`, `PeTik`, `PETIK`, `aBcd` → `You're so COOL!~ Well-done!` + e-mail/nom de l’auteur.
- Contre-test : `Petik` / `PetikxyzxyzxyzY` → `Error! Try Again Please!~`.
