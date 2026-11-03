# bikers80keygenme2 — Keygenme2.exe (bikers80)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3d8`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3d8) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (bikers80) |
| **Plateforme** | Windows PE32 GUI, VB.NET (CLR 2.0), 284 672 octets |
| **SHA-256 du zip** | `423de382da46707f3581645d49d3e4e6fd8e3d2ebaa11846c540513176131cb1` (mot de passe du zip : `crackmes.one`) |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/Keygenme2.zip` | archive d'origine (contient `Keygenme2.exe`) |
| `original/source/` | projet C# décompilé (`ilspycmd -p`) — `WindowsApplication1/Form1.cs` |
| `tools/keygenme2-solve.py` | keygen |
| `tools/harness/` | harness .NET 8 qui exécute l'IL d'origine de `Form1` (preuve) |

## Réponse

Le serial dépend du **nom** et du **nom de l'ordinateur** (`%COMPUTERNAME%`).

| Nom | COMPUTERNAME | Serial |
|---|---|---|
| `petik` | `PETIK-PC` | **`5G7E7<877883:39`** |
| `petik` | `box` | `95:398:79<9E` |

```bash
python3 tools/keygenme2-solve.py                          # name=petik COMPUTERNAME=PETIK-PC serial=5G7E7<877883:39
python3 tools/keygenme2-solve.py --name petik --computer box -q
```

Contrainte sur le nom : longueur 5..9 ou 50..60 (voir Notes).

## Premier regard

```bash
unzip original/Keygenme2.zip -d /tmp/kg2d
diec /tmp/kg2d/Keygenme2.exe     # Linker MS 8.0, Compiler VB.NET, .NET CLR 2.0.50727
```

GUI « KeygenMe 2 by bikers80 » : champ Name (`TextBox1`), champ Sérial (`TextBox2`), boutons « Valider » / « Exit », et un label de résultat. Assembly .NET → décompilation C# :

```bash
bash -ic 'decompiledotnet Keygenme2.exe'     # (ici : ilspycmd -p -o out Keygenme2.exe)
```

Toute la logique est dans `WindowsApplication1.Form1` (`var1` … `var11`).

## Flow

`Button1_Click` → `Label1.Text = var10()`. `var10` compare `TextBox2.Text` (`var3`) à `var11()` ; égal → message « Bravo :) », sinon « Manqué :( » (les deux chaînes sont stockées « décalées de −3 » et passées par `DecodeASCII2`).

## Comment on trouve le prédicat

Ancrage : `original/source/WindowsApplication1/Form1.cs`, méthodes `DecodeASCII2`, `var1`…`var11`.

1. **`DecodeASCII2(s)`** : renvoie `s` dont chaque caractère est incrémenté de 3 (`Chr(Asc(c)+3)`).
2. **`var1()`** : `Environ(DecodeASCII2("`ljmrqbok^jb"))`. Le littéral décodé donne `` ` ``→`c`, `l`→`o`, `j`→`m`, `m`→`p`, `r`→`u`, `q`→`t`, `b`→`e`, `o`→`r`, `k`→`n`, `^`→`a`, `j`→`m`, `b`→`e` = **`computername`** : le nom de l'ordinateur.
3. **`var2()`** = `StrReverse(var1())` ; **`var4()`** = concaténation de `Hex(Asc(c))` pour chaque caractère du nom d'ordinateur inversé.
4. **`var5()`** = le nom saisi (avec la vérification de longueur) ; **`var6()`** = même hex (`Hex(Asc(c))`) du nom.
5. **`var7()`** = `var4() + var6()` ; **`var8()`** = `DecodeASCII2(var7())` (+3 sur chaque caractère de la chaîne hex).
6. **`var11()`** = `Mid(var8(), 5, 15)` : 15 caractères à partir du 5ᵉ (indice 1-based, donc on saute 4 caractères). **Le serial attendu est ce résultat**, comparé à `TextBox2.Text` (`Operators.ConditionalCompareObjectEqual`, égalité exacte).

### Exemple `petik` @ `PETIK-PC`

| Étape | Valeur |
|---|---|
| `StrReverse("PETIK-PC")` | `CP-KITEP` |
| hex | `43 50 2D 4B 49 54 45 50` → `43502D4B49544550` |
| hex(`petik`) | `70 65 74 69 6B` → `706574696B` |
| concat (`var7`) | `43502D4B49544550706574696B` |
| +3 par caractère (`var8`) | `4→7, 3→6, 5→8, 0→3, 2→5, D→G, 4→7, B→E, …` → `76835G7E7<877883:39…` |
| `Mid(…, 5, 15)` | **`5G7E7<877883:39`** |

Les chiffres hex `0-9` deviennent `3-<` (`:` = 7, `;` = 8, `<` = 9), les lettres `A-F` deviennent `D-I`, d'où les symboles bizarres dans le serial.

Pièges :
- `Hex(Asc(c))` n'ajoute **pas** de zéro de tête (valable ici car tous les caractères ASCII imprimables font 2 chiffres hex).
- `Environ` est **insensible à la casse sous Windows** (`COMPUTERNAME` est en majuscules) ; sous Linux (harness) la variable doit s'appeler `computername`, sinon `Environ` renvoie une chaîne vide.
- Si nom + hex d'ordinateur est trop court, `Mid` renvoie moins de 15 caractères ; le solveur reproduit ce comportement par slicing.

## Debug GDB / x64dbg

Non utilisés : reverse 100 % statique (décompilation C#) + exécution de l'IL d'origine.

## Vérification

`xvfb-run -a wine Keygenme2.exe` plante dans le CLR 2.0 du préfixe Wine (`err:virtual:virtual_setup_exception stack overflow` ; aucune fenêtre n'apparaît), comme pour les autres bikers80. La preuve se fait donc sur le **vrai IL de `Form1`**, appelé par réflexion depuis un harness .NET 8 (`GetUninitializedObject(Form1)`, `_TextBox1/_TextBox2` remplis, `System.Windows.Forms` remplacé par un stub minimal ; `var10`/`var11` d'origine exécutées) :

```bash
cd tools/harness
dotnet build stub -o /tmp/stubout && dotnet build h.csproj -o /tmp/hout
cp /tmp/stubout/System.Windows.Forms.dll /tmp/hout/
S=$(python3 ../keygenme2-solve.py -q)
computername=PETIK-PC dotnet /tmp/hout/h.dll /tmp/kg2d/Keygenme2.exe petik "$S"
```

| computername | Nom | Serial saisi | `var11` (attendu) | `var10` |
|---|---|---|---|---|
| PETIK-PC | petik | `5G7E7<877883:39` | `5G7E7<877883:39` | **Bravo :)** |
| PETIK-PC | petik | `0000` (KO) | `5G7E7<877883:39` | **Manqué :(** |
| PC1 | petik | `83:398:79<9E` | idem | Bravo :) |
| box | Abcdef | `95749596979899` | idem | Bravo :) |
| A-b_9 | zz9q1 | `955G74:D:D6<:46` | idem | Bravo :) |

9 combinaisons (3 ordinateurs × 3 noms) toutes identiques au solveur.

Limite : la fenêtre WinForms n'a pas été observée en live.

## Notes

- `var5` compare `Len(nom)` **converti en chaîne** à `"5"` (comparaison lexicographique) : les longueurs `10`–`49` donnent `"10" < "5"` → MsgBox « Veuillez entrer 5 lettre minimum » ; valides : `5`–`9` et `50`–`60` (`MaxLength = 60`). Lu dans le code décompilé, non exécuté (MsgBox).
- Le serial n'est pas portable d'une machine à l'autre (dépend de `COMPUTERNAME`).
- Aucun patch ; `original/` est intact.
