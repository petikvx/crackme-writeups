# crackmekeygenme1_breaker — brk12345 (réimport crackmes.de)

- **Page** : [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c1a4)
- **Plateforme** : Windows PE32 .NET 2.0 (VB.NET, WinForms), difficulté 1.0
- **Publication** : 2018-03-25
- **Règles** (`RULEZ.txt`) : pas de patch, faire un keygen.

## Solution

```
serial = str(85·len(nom)) + "-" + reverse(nom[1..3]) + "ata-" + str(100 + 80·len(nom))
```

Exemple : `petik` → **`425-iteata-500`**. Keygen : `tools/crackmekeygenme1_breaker-solve.py`.

## Comment on trouve

1. `7z x` de l'archive (mot de passe `crackmes.one`) → `Crackme1.exe` + `RULEZ.txt`.
2. C'est de l'IL .NET : `ilspycmd Crackme1.exe > analysis/decompiled.cs`.
3. On cherche le handler du bouton « Crack » : `Form1.Button1_Click`. Il construit la chaîne attendue
   à partir du nom (`TextBox1`) et la compare au serial (`TextBox2`) avec `Operators.CompareString` :

```csharp
string text = Conversions.ToString(TextBox1.Text.Length * 85) + "-"
            + Strings.StrReverse(Strings.Mid(TextBox1.Text, 2, 3)) + "ata-"
            + Conversions.ToString(100 + 80 * TextBox1.Text.Length);
```

4. `Strings.Mid(nom, 2, 3)` est 1-indexé : ce sont les caractères 2 à 4 (`nom[1:4]` en Python),
   inversés par `StrReverse`. Pour `petik` (longueur 5) : `85·5 = 425`, `"eti"` inversé = `"ite"`,
   `100 + 80·5 = 500` → `425-iteata-500`.

Remarque : pour un nom de moins de 4 caractères, `Mid` renvoie simplement ce qui reste (pas d'exception).

## Vérification

La GUI WinForms n'a pas pu être pilotée sous wine/xvfb dans le temps imparti. Le **code de vérification exact**
(même expression, mêmes fonctions `Microsoft.VisualBasic`) a été rejoué en natif avec `dotnet`
(`analysis/verify-Program.cs`) : `petik` / `425-iteata-500` → `Right Password!`, un faux serial → `Wrong Password!`.
