# xyz_keygenme20110505 by xiayuanzhong (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1f0>
- **Plateforme** : Windows **PE32** console, C++ Dev-C++ (MinGW, `diec` : *Compiler: MinGW*), libstdc++ statique, **symboles présents** — difficulté 1.0
- **Archive** : `original/XYZ_KeygenMe20110505.zip` → `XYZ_KeygenMe20110505_Dev.exe` + `ReadMe.txt`
- **Statut** : résolu (keygen), vérifié **live sous wine**

## Solution

Le nom doit faire **6 à 14 caractères** : `petik` (5) est refusé, on prend donc `petik_` comme exemple.

```
python3 tools/xyz-keygenme0505-solve.py petik_ --check
petik_ -> X3_pfvlo
wine : [... "You're so COOL!~ Bingo! Well-done!", 'My email address is xiayuanzhong@gmail.com', ...]
```

| Nom | Serial |
|---|---|
| `petik_` | **`X3_pfvlo`** |
| `petikvx` | `X3_pfvlo{~wm` |
| `petikpetik` | `X3_pfvlouk{qtzphvya` |

Formule (`L = len(name)`) :

1. longueur du serial `k = F(L)` avec `F(n≤0)=0`, `F(1)=F(2)=F(3)=1`, `F(n)=F(n-1)+F(n-3)` (`Fibonacci_like`), puis `k ×= 2` si `6 ≤ L ≤ 8`, `k >>= 1` si `11 ≤ L ≤ 14` (9 et 10 : inchangé) ;
2. serial = `"X3_"` + pour `i = 0 .. k-4` : `c = name[i % L]`, caractère `c + i` si `c + i ≤ 0x7e`, sinon `c - i`.

## Comment on trouve

1. `nm` : `_main` (`0x401390`), `Fibonacci_like(short)` (`0x40210e`), `Decrypt(short*)` (`0x40217c`), `Congratulations()`. Aucun texte utile en clair dans `strings` : tous les messages sont des tableaux de `short` sur la pile, affichés par `Decrypt`, qui fait juste `cout << (char)~w` pour chaque mot jusqu'au 0 (ex. `0xff8a` → `~0x8a` = `u`).
2. `objdump -d -M intel` sur `main` : deux `operator>>(cin, std::string)`.
   - Nom : `5 < length ≤ 0xe` et un « jeton » `[ebp-0x12a] == 0x122a`, sinon on reboucle.
   - Serial : `0 < length ≤ 0x32`.
3. Contrôle du préfixe : une petite machine à états sur `[ebp-0x12a]`, qu'il faut amener à **`0x4af`**. Le seul chemin : `s[0] == 'X'` (`0x58`), `s[1] != 'X'`, `s[1] == '3'` (`0x33`) → état `0x4b0`, puis `s[2] == '_'` (`0x5f`) → `dec` → `0x4af`. Les autres branches posent `0x78`, `0x77`, `0x4b1`, `0x4d8`, `0x460`… et renvoient à la saisie (`jmp 0x40150e`). Donc préfixe **`X3_`**.
4. Longueur : `F(name.length())` stocké en `[ebp-0xba]`, doublé (`add eax,eax`) si `5 < L ≤ 8`, divisé par 2 (`sar eax,1`) si `10 < L ≤ 14`, et comparé à `serial.length()`.
5. Boucle `i` de 0 à `k-4` (`cmp i, k-3 ; jge`) : `name[i % L]` (`idiv`), `+ i` comparé à `0x7e` ; selon le cas, `serial[i+3]` doit valoir `name[i%L] + i` (`add al,[edx]`) ou `name[i%L] - i` (`sub al,dl`). Une erreur met le compteur `[ebp-0x1ea]` à `-100`.
6. Fin : `[ebp-0x1ea] == name.length()` → `[ebp-0xbc] = 0x928` → `Congratulations()`.

Le piège annoncé dans le `ReadMe.txt` (« I think you will make a mistake ») : la longueur dépend de `L` de trois façons différentes, et le décalage `±i` bascule quand on dépasse `~`.

## Vérification

- Live sous wine (stdin redirigé) : `petik_`, `petikvx`, `petikpetik`, `petik_crackme` → `You're so COOL!~ Bingo! Well-done!` + e-mail/nom de l'auteur.
- Contre-test : `petik_` / `X3_pfvlp` → pas de `Bingo`, le programme redemande la saisie.
