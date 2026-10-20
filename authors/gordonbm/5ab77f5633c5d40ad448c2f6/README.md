# crackmes.de's reverse_keygenme by gordonbm (« Encrypter »)

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2f6`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2f6) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | GordonBM (crackmes.de) |
| **Plateforme** | Windows, PE32 .NET 4.5 (WinForms, C#) |
| **SHA-256 du zip** | `fc0dd4e42801d6da7682e73a54c770edc25cd4366db4b661890be94da3f5a5d1` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/Reverse_Keygenme.zip` | archive d'origine (mot de passe `crackmes.one`) : `Encrypter.exe` + `readme.txt` |
| `analysis/extract/` | contenu dézippé (`Encrypter.exe`, `readme.txt`) |
| `original/source/` | C# décompilé par `ilspycmd -p -o original/source analysis/extract/Encrypter.exe` |
| `tools/reverse-keygenme-solve.py` | solveur : clé numérique → message |
| `tools/harness/` | petit projet .NET qui charge l'`Encrypter.exe` d'origine par réflexion et appelle `Engine.pump` (preuve) |

## Énoncé

Ici, c'est un *reverse keygen* : `Encrypter.exe` transforme un message en suite de chiffres (2 modes : normal / « Hardcore mode »). Le but est d'écrire l'inverse : on donne la clé, on récupère le message (ex. `GordonBM` ↔ `9247109931023928283286380308924708453882326686447837`, la clé hardcore change à chaque exécution).

## Réponse

| Mode | message `petik` → clé | clé → message |
|---|---|---|
| normal | `112101116105107` | `petik` |
| hardcore | ex. `127486101602127437126995` (aléatoire) | `petik` |

```bash
python3 tools/reverse-keygenme-solve.py 112101116105107        # -> petik
python3 tools/reverse-keygenme-solve.py 9247109931023928283286380308924708453882326686447837   # GordonBM dans la liste
python3 tools/reverse-keygenme-solve.py -q KEY                 # meilleur candidat seul
python3 tools/reverse-keygenme-solve.py --check                # compare au vrai Encrypter.exe
```

## Premier regard

```text
$ file analysis/extract/Encrypter.exe
PE32 executable for MS Windows 6.00 (GUI), Intel i386 Mono/.Net assembly
$ diec ... -> Library: .NET Framework(4.5), Tool: Visual Studio
```

`strings` montre directement les classes `Form1`, `Encrypter.Goodies.Engine`, `button1_Click`, `Random`. Le `readme.txt` interdit Reflector (on a pris `ilspycmd`, hors règle littérale : c'est un write-up éducatif) et décrit les deux modes.

## Flow

GUI : `textBox1` (Message), case `checkBox1` (Hardcore mode), bouton *Go* ; `button1_Click` fait :

```csharp
textBox2.Text = en.pump(textBox1.Text, checkBox1.Checked);
```

## Comment on trouve le prédicat

Ancrage : `ilspycmd -p` (le .NET se décompile en C# propre, voir `original/source/Encrypter.Goodies/Engine.cs`). Tout est dans `Engine.pump` :

```csharp
if (check) {                                    // hardcore
    for (i = 0; i < str.Length; i++)
        array2[i] = Convert.ToString((double)(int)array[i] + ran(str.Length));
} else {                                        // normal
    for (i = 0; i < str.Length; i++)
        array2[i] = Convert.ToString((int)array[i]);
}
text = concat(array2)
```

**Mode normal** : concaténation des codes ASCII décimaux. `petik` → `112|101|116|105|107`. Inverser = découper en nombres de 2-3 chiffres.

**Mode hardcore** : à chaque caractère on ajoute `ran(L)` où `L = str.Length` (appelée *par caractère*, donc autant de tirages indépendants) :

```csharp
double ran(int l) {
    double num = 0;
    for (int i = 0; i < l*2; i++)
        num = (i % 2 != 0) ? num + num*2                                  // impair : num = 3*num
                           : num + (num*2 + random.Next(0,2) * (i ^ 6));  // pair   : num = 3*num + r_i*(i^6)
    return num;
}
```

`random.Next(0,2)` vaut 0 ou 1, donc `ran(L) = Σ_{i pair < 2L} r_i · (i^6) · 3^(2L-1-i)` avec `r_i ∈ {0,1}`. Le poids `i^6` s'annule pour `i = 6` ; les autres poids sont 6, 4, 2, 14, 12, … . Le « hasard » est donc une somme de sous-ensemble d'un petit ensemble de constantes **qui ne dépend que de L**. Exemple L = 5 : offsets possibles `{0, 42, 486, 528, 8748, 8790, 9234, 9276, …}` (16 valeurs) ; L = 1 : `{0, 18}`.

Décodage de la clé (`tools/reverse-keygenme-solve.py`) :

1. pour chaque L candidat, énumérer les `2^k` offsets (`offsets(L)`), calcul en `double` comme le binaire (exact < 2^53) ;
2. construire la table `str(code + offset) → caractères` pour les codes ASCII imprimables 32..126 ;
3. DFS sur la clé : prendre la sous-chaîne de longueur n qui est dans la table, exiger exactement L caractères et la consommation complète de la clé ;
4. classer les candidats (peu de non-alphanumériques, peu de ruptures de casse).

Pièges :
- le découpage est **intrinsèquement ambigu** (`petik` / `Fetik` / `peJik` produisent des chaînes de même forme, car la différence de code 42 = un offset possible) : le solveur renvoie tous les candidats classés, et le bon (`GordonBM`, `petik`) est dedans. Sur la clé du readme, `GordonBM` fait partie des 64 candidats de L=8 ;
- `Convert.ToString(double)` passe en notation `E+` au-delà de 1e15 : le solveur ne traite que L ≤ ~16 (limite alignée sur ce format ; au-delà les clés ne sont pas des entiers purs) ;
- aucune graine : `new Random()` ⇒ clé différente à chaque clic, aucune clé « canonique ».

## Vérification

Preuve contre le binaire d'origine : le dossier `tools/harness/` charge `analysis/extract/Encrypter.exe` (IL d'origine, non modifié) par réflexion, instancie `Encrypter.Goodies.Engine` et appelle `pump` (le .NET 8 de la machine exécute l'IL ; pas de GUI nécessaire).

```bash
$ python3 tools/reverse-keygenme-solve.py --check
normal   112101116105107 -> ['petik', 'Fetik', 'petiA'] OK         (x5)
hardcore 1549335127490118245118247 -> ['petik', 'p;tik'] OK
hardcore 154118727118700633127439 -> ['petik', 'petiA', 'peJik'] OK
hardcore 1187381019350633118205 -> ['petik', 'petiA', 'peJik'] OK
...
```

Cas supplémentaires (clés du readme) :

```text
$ python3 tools/reverse-keygenme-solve.py --all 9247109931023928283286380308924708453882326686447837 | grep -n GordonBM
2:GordonBM
$ python3 tools/reverse-keygenme-solve.py 641116731023928251668612737064112073853163603287   # liste contenant GordonBM
```

Cas KO : une clé arbitraire non issue de l'Encrypter (ex. `1234`) → `aucune solution`.

Wine/GDB : pas utilisés (reverse 100 % statique + exécution de l'IL par `dotnet`), donc pas de section Debug GDB.

## Notes

- Le `ran` ne dépend ni du caractère ni de sa position : tous les caractères partagent le même ensemble d'offsets ; seule la valeur tirée varie par caractère.
- Si l'on veut unicité, il faut ajouter un contexte (dictionnaire / langue) pour trancher entre candidats ; ici le classement heuristique suffit à placer les messages lisibles en tête.
