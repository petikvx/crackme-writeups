# crackmes.de's crackme by aharli

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2e1`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2e1) |
| **Auteur (site)** | crackmes.de (auteur d'origine : aharli) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32, VB.NET WinForms (.NET Framework 2.0, 2008) |
| **Difficulté site** | 1.0 |
| **SHA-256 (zip)** | `e2e596f6012ae254d07d23bf306384f88556cc61a58ee9d5e86f047f6a0c4c25` |
| **SHA-256 (`Crack me.exe`)** | `a2ebaf23c5a0f1154f07f4db2f0eb846b1860740797b5a5d4eab532aaa3cb203` |

Voir [`ORIGIN.yml`](ORIGIN.yml) · ZIP password : `crackmes.one`.

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme.zip` | archive d'origine (crackmes.one) |
| `original/Crack me.exe` | binaire d'origine (non patché) |
| `original/read me.txt` | consigne : « please crack me » |
| `original/source/` | projet C# décompilé par `ilspycmd -p` |
| `tools/aharli-crackme-solve.py` | solveur : relit le tas `#US` du binaire + rejoue la logique du bouton |

## Réponse

| User | Pass |
|---|---|
| **`aharli`** | **`1368`** |

→ MessageBox « **Cracked** ».

```bash
python3 tools/aharli-crackme-solve.py          # User : aharli / Pass : 1368
python3 tools/aharli-crackme-solve.py --check  # parse #US + simulation OK/KO
```

Pas de keygen : le nom d'utilisateur est **fixe**, donc l'exemple habituel `petik` ne peut pas marcher (avec `petik` on n'obtient jamais « Cracked », quel que soit le mot de passe).

## Premier regard

```text
$ file "original/Crack me.exe"
PE32 executable for MS Windows 4.00 (GUI), Intel i386 Mono/.Net assembly, 4 sections
$ cat "original/read me.txt"
please crack me
```

Les chaînes UTF-16 (`strings -el`) suffisent presque à spoiler le challenge, car elles sortent dans l'ordre du tas `#US` (user strings .NET) :

```text
Button1  TextBox1  TextBox2  Label1  User  Label2  Pass  Form1
aharli
1368
Can not Cracked
Cracked
```

Deux libellés `User` / `Pass`, puis deux littéraux isolés (`aharli`, `1368`) juste avant les deux messages : c'est très suspect, mais il faut le code pour savoir lequel est comparé à quoi.

## Flow

Une fenêtre `Form1` avec deux `TextBox` (`TextBox1` = User, `TextBox2` = Pass) et un bouton `Button1`. `Form1_Load` met un champ compteur `a = 1`. Tout se joue dans `Button1_Click`.

## Comment on trouve la réponse

### 1. Décompilation

```bash
ilspycmd -p -o original/source "original/Crack me.exe"
# (équivalent de : bash -ic 'decompiledotnet original/Crack\ me.exe')
```

Le fichier utile est [`original/source/Crack_me/Form1.cs`](original/source/Crack_me/Form1.cs). Le code est du VB.NET avec `On Error Resume Next` / gestion d'erreurs « à l'ancienne », d'où le gros `switch (try0000_dispatch)` généré par ILSpy. En ignorant ce bruit (les `num = …` ne servent qu'à mémoriser le numéro de ligne pour `Resume Next`), il reste :

```csharp
// Form1_Load
a = 1;

// Button1_Click, partie utile
if ((CompareString(TextBox1.Text, "aharli", false) != 0) &      // User faux
    (CompareString(TextBox2.Text, "1368",   false) != 0))       // ET Pass faux
{
    a++;
    if (a >= 3) {                       // test « if (a < 3) → sortie », sinon :
        MsgBox("Can not Cracked");
        ProjectData.EndApp();           // ferme l'application
    }
    return;
}
if ((CompareString(TextBox1.Text, "aharli", false) == 0) &
    (CompareString(TextBox2.Text, "1368",   false) == 0))
    MsgBox("Cracked");
```

`Operators.CompareString(x, y, false)` est la comparaison de chaînes VB **binaire** (`TextCompare = false`) : sensible à la casse, `Aharli` ne passe pas.

### 2. Lecture de la logique

- La réponse est donc simplement **User = `aharli`**, **Pass = `1368`** (littéraux chargés par `ldstr` depuis le tas `#US`).
- Le `&` de VB.NET (`And` non court-circuité) ne change rien au résultat ici, mais la première condition a un effet de bord : le compteur `a` n'augmente **que si les deux champs sont faux en même temps**.
- `a` démarre à 1 : au **2ᵉ** essai « tout faux », `a` vaut 3 → « Can not Cracked » puis `EndApp()` (l'appli se ferme). Ce n'est pas un vrai anti-bruteforce : un seul champ juste suffit pour ne jamais incrémenter le compteur.
- Si un seul des deux champs est juste, il ne se passe **rien** (aucun message).

### 3. Pièges

- `strings` seul donne les deux littéraux, mais pas l'association User/Pass : on pourrait croire à `1368` comme nom. Le décompilé lève le doute (`TextBox1` ↔ `"aharli"`).
- Le `switch` de dispatch d'ILSpy fait peur mais n'est que la traduction de `On Error Resume Next` ; aucune logique cachée dedans (les `case` renvoient vers les mêmes étiquettes).

## Vérification

Le binaire est une appli WinForms (GUI), donc pas de saisie en console. La preuve repose sur le binaire d'origine lui-même :

```text
$ python3 tools/aharli-crackme-solve.py --check
#US : ['Property can only be set to Nothing', 'WinForms_RecursiveFormCreate', 'WinForms_SeeInnerException',
       'Button1', 'TextBox1', 'TextBox2', 'Label1', 'User', 'Label2', 'Pass', 'Form1',
       'aharli', '1368', 'Can not Cracked', 'Cracked', 'Crack_me.Resources']
  'petik'    '0000'   -> None  (a=2)
  'aharli'   '0000'   -> None  (a=2)
  'petik'    '1368'   -> None  (a=2)
  'aharli'   '1368'   -> Cracked  (a=2)
  2 essais tout faux : None / Can not Cracked (EndApp)
OK
```

- Le solveur parse vraiment le PE (`data directory` CLR → métadonnées → flux `#US`) et vérifie que les deux littéraux comparés existent dans le tas, à l'octet près.
- OK : `aharli` / `1368` → « Cracked ».
- KO : un seul champ juste → aucun message, compteur inchangé.
- KO : deux essais avec les deux champs faux → « Can not Cracked » et fermeture.

## Notes

- Crackme de 2008 très simple (difficulté 1.0) : mot de passe en clair, pas d'obfuscation, pas de hash.
- Ce n'est **pas** un keygenme : impossible de produire un serial pour `petik`.
