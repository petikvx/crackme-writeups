# crackmes.de's new_keygenme_by_bikers80 by bikers80

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3d7`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3d7) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | bikers80 (site : crackmes.de) |
| **Plateforme** | Windows PE32 GUI, VB.NET (CLR 2.0) |
| **SHA-256 (zip)** | `07589e1a4cbc2dc29976e0e6fb4423afcdffc42b2d3e8777f41ff70a3859725f` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/NewKeygenME.zip` | archive d'origine (mot de passe `crackmes.one`), non modifiée |
| `analysis/x/NewKeygenME.exe` | exe extrait du zip (copie de travail) |
| `original/source/` | C# décompilé par `ilspycmd -p` (`Crackme/MainForm.cs`, `Module1.cs`, `Module2.cs`) |
| `tools/new-keygenme-solve.py` | keygen |
| `tools/harness/` | harness .NET 8 qui appelle le **vrai IL** de l'exe par réflexion (preuve) |

## Réponse

Le serial dépend du **nom saisi** (mis en majuscules) **et** du nom d'utilisateur Windows (`Environ("UserName")`).

| Nom | Utilisateur Windows | Serial |
|---|---|---|
| `petik` | `petik` | **`4408852210`** |
| `petik` | `box` | `168654562` |

```bash
python3 tools/new-keygenme-solve.py --name petik --winuser petik     # name=petik winuser=petik serial=4408852210
python3 tools/new-keygenme-solve.py -q --name petik --winuser <ton_user_windows>
```

## Premier regard

```bash
unzip -P crackmes.one original/NewKeygenME.zip -d analysis/x
diec analysis/x/NewKeygenME.exe     # PE32, VB.NET, .NET CLR 2.0
strings -el -n 3 analysis/x/NewKeygenME.exe   # "Please enter a name", "Unregistered"/"registered", "Close Reflector Please"
ilspycmd -p -o analysis/x/src analysis/x/NewKeygenME.exe
```

Les `strings` montrent une UI de keygenme (Name / Serial, textes « Unregistered » / « registered »). Le binaire refuse de tourner si le process `Reflector` est lancé (`Module2.clo`) — anti-décompileur sans effet ici.

## Flow

`MainForm_Load` affiche un nag (`Form3`, fenêtre principale à opacité 0) ; `Button1` (Check) appelle `clo()` puis `tst()` :

```csharp
if (LikeObject(var8(), ld(), Binary))   // var8() = serial attendu, ld() = TextBox2 (serial saisi)
    td = 1;  // "registered" + son Good
```

## Comment on trouve

**Ancrage** : `tst()` dans `Crackme/MainForm.cs` compare `var8()` au contenu de `TextBox2` avec l'opérateur `Like` (le serial attendu est un nombre décimal sans métacaractère, donc égalité simple).

**`var8()`** :

```csharp
num  = ToLong(Module2.var5());      // dérivé du nom d'utilisateur Windows
num2 = ToLong(var7());              // dérivé du Name saisi (ToUpper dans sd())
serial = num*6 + Round(num2 / 3.0);
```

**La fonction de dérivation `f`** (identique pour les deux, `var7` pour le nom, `var5` pour `Environ("UserName")`) :

1. `Module1.var` : `Chr(Asc(s[i]) + i)` pour `i = 1..len` (décalage croissant) ;
2. `Module1.var1` : `StrReverse` ;
3. `Module1.var2` : hex (`Conversion.Hex`, majuscules) de chaque caractère, concaténé ;
4. `Module2.var6` : supprime toutes les lettres `A`..`F` (il ne reste que des chiffres) ;
5. `Module2.var10` : tronque aux 10 premiers caractères.

Exemple `PETIK` (le nom est mis en majuscules par `sd()`) :

```text
P E T I K  + (1..5)  → Q G W M P
reverse              → P M W G Q
hex                  → 50 4D 57 47 51  → "504D574751"
sans A-F             → "504574751"       (9 chiffres, < 10 donc pas tronqué)
num2 = 504574751
```

Exemple `petik` côté utilisateur Windows : `qgwmp` → `pmwgq` → `706D776771` → `706776771` → `num = 706776771`.

Assemblage : `706776771 × 6 = 4240660626`, `round(504574751 / 3) = round(168191583.67) = 168191584`, somme = **`4408852210`**.

**Pièges** :

- Le serial dépend de la machine (`UserName`) : un serial « universel » n'existe pas, le keygen prend `--winuser`.
- Le nom est converti en majuscules mais pas le nom d'utilisateur (d'où `706…` pour `petik` contre `504…` pour `PETIK`).
- `Math.Round` est un arrondi bancaire, mais `n/3` n'a jamais de partie fractionnaire `.5` : arrondi classique, géré par `divmod` dans le solveur.
- Si le nom contient des caractères > 0x7F, `Asc`/`Chr` VB passent par la page ANSI (le solveur utilise cp1252).
- La chaîne de repli `"ïùüñï"` du `catch` de `var` n'est jamais atteinte avec des noms normaux.

## Vérification

Wine ne lance pas ce binaire ici : `xvfb-run -a wine analysis/x/NewKeygenME.exe` plante dans le CLR 2.0 du préfixe (`virtual_setup_exception stack overflow` dans `mscorwks`), aucune fenêtre n'apparaît. La preuve se fait donc sur le **code IL d'origine**, chargé par réflexion dans un harness .NET 8 (`Module1.var/var1/var2`, `Module2.var5/var6/var10` du vrai exe, `Environ` lu depuis la variable `UserName`) :

```bash
cd tools/harness && ~/.dotnet/dotnet build -v q -o /tmp/h-out
UserName=petik ~/.dotnet/dotnet /tmp/h-out/h.dll ../../analysis/x/NewKeygenME.exe petik   # 4408852210
```

| UserName | Name | Harness (IL d'origine) | Solveur |
|---|---|---|---|
| petik | petik | 4408852210 | 4408852210 |
| petik | Abc | 4240815440 | 4240815440 |
| petik | xY | 4240660812 | 4240660812 |
| box | petik | 168654562 | 168654562 |
| box | Abc | 617792 | 617792 |
| Zed_9 | petik | 386397634 | 386397634 |

9 combinaisons testées, toutes identiques. Cas KO : un serial différent (ex. celui de `winuser=box` alors que `UserName=petik`) ne passe pas, puisque `Like` compare à une valeur différente.

Limite : la boîte de dialogue GUI (« registered » + son) n'a pas été observée en live ; la comparaison finale `Like` est lue dans le code décompilé, pas exécutée.

## Notes

- Pas de GDB/x64dbg : reverse 100 % statique (décompilation C#) + exécution de l'IL d'origine via harness.
- Aucun patch ; `original/` est intact.
