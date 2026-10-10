# crackme2 by midi

| | |
|---|---|
| **ID** | [`5ab77f5333c5d40ad448c0df`](https://crackmes.one/crackme/5ab77f5333c5d40ad448c0df) |
| **Auteur (site)** | crackmes.de (auteur original : MiDi) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 console (MinGW, C) + MessageBox |
| **Difficulté** | 2.0 |

## Résultat

Keygen. Exemple : nom **`petik`** → serial **`03277`** (et `petikpetik` → `0327755298`).

```
$ python3 tools/crackmes-de-crackme2-midi-solve.py petik
petik -> 03277
```

Vérifié live sous wine (via le harness décrit plus bas) : `petik` / `03277` ouvre la boîte **`Reg-Successful!`** (« If you obtained this serial illegal, click cancel, else click ok! », boutons OK/Annuler) ; `petik` / `03278` donne **`Reg-Unsuccessful!`** (« You have entered a wrong serial! »). `petikpetik` / `0327755298` passe aussi.

Les autres « missions » du readme (changer le texte de la boîte, ne garder qu'un bouton OK, empêcher l'ouverture du site) demandent un patch ; elles ne sont pas faites ici, parce que le repo ne patche jamais `original/`.

## Comment on trouve

1. `strings` : `RegNag`, `Name:`, `Serial:`, `Reg-Successful!`, `Reg-Unsuccessful!`, `IEXPLORE` et une URL ; imports `fgets`, `strlen`, `system`, `FindWindowA`, `MessageBoxA`, `ShellExecuteA`. Les chaînes du menu sont dans `.text`, celles des boîtes dans `.data` (voir [`analysis/objdump-main-check.txt`](analysis/objdump-main-check.txt)).
2. Au démarrage, `SetConsoleTitleA("RegNag")` puis une boucle `while (!hwnd) hwnd = FindWindowA(NULL, "RegNag");` (0x401400). Sous wine sans vraie fenêtre de console, cette boucle ne sort jamais : c'est pour ça que le binaire semble « planter » quand on le lance en pipe.
3. Boucle principale : `fgets(name, 0x14)` en 0x403040, `fgets(serial, 0x14)` en 0x403020, suppression du `\n` (0x401700). Un nom ou un serial vide fait sortir.
4. La vérification (0x401564) calcule un tableau en 0x403000 :
   - pour chaque index `i` du nom : `v = (name[i] + 0x1e) % (2*i + 2)` (division signée, mais tout est positif) ;
   - tant que `v > 9` (comparaison non signée sur un octet) : `v -= i` ;
   - puis compare `v` à `serial[i] - '0'`. Un seul écart met le drapeau `0x40200c` à 0.
   - Enfin, il faut `strlen(serial) == strlen(name)`, sinon c'est l'échec.
5. Donc le serial a autant de chiffres que le nom a de caractères, et chaque chiffre se calcule indépendamment : c'est le keygen.

## Solveur et vérification

[`tools/crackmes-de-crackme2-midi-solve.py`](tools/crackmes-de-crackme2-midi-solve.py) : keygen.

[`tools/regnag-harness.c`](tools/regnag-harness.c) (compilé avec `i686-w64-mingw32-gcc ... -luser32`) : crée une fenêtre titrée `RegNag` pour débloquer la boucle `FindWindowA`, lance le crackme avec stdin hérité, puis lit le titre et le texte de la MessageBox qui s'ouvre et la ferme. Aucun octet du binaire n'est modifié.

```
$ printf 'petik\n03277\n\n\n' | xvfb-run -a wine harness.exe crackme2.exe
MSGBOX title=Reg-Successful!
  [Static] If you obtained this serial illegal,
$ printf 'petik\n03278\n\n\n' | xvfb-run -a wine harness.exe crackme2.exe
MSGBOX title=Reg-Unsuccessful!
  [Static] You have entered a wrong serial!
```

## Status

- [x] reverse
- [x] write-up
- [x] solveur
