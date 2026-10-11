# crackmekeygen_breaker — brk12345 (réimport crackmes.de)

- **Page** : [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c1a6)
- **Plateforme** : Windows PE32 .NET 2.0 (VB.NET WinForms), difficulté 1.0
- **Publication** : 2018-03-25
- **Règles** (`RULES.txt`) : pas de patch, keygen + tutoriel.

## Solution

Seule la **longueur** du nom compte : `serial = 81·len(nom) + 19350`.

Exemple : `petik` (5 caractères) → **`19755`**. Keygen : `tools/crackmekeygen_breaker-solve.py`.

## Comment on trouve

1. `7z x` (mot de passe `crackmes.one`) → `CRACKME(KEYGENME)-Breaker.exe` + `RULES.txt`.
2. Assembly .NET non obfusquée : `ilspycmd` → `analysis/decompiled.cs`.
3. `Form1.Button1_Click` :

```csharp
string text  = Conversions.ToString(TextBox1.Text.Length);
string text2 = Conversions.ToString(Conversions.ToDouble(text) * 81.0 + 19350.0);
if (Operators.CompareString(TextBox2.Text, text2, false) == 0) MsgBox("Good Way!");
```

Le calcul passe par un `double`, mais pour un entier `Conversions.ToString` ne met ni décimale ni séparateur : on obtient un entier simple.

## Vérification

Le **code de vérification exact** (mêmes conversions `Microsoft.VisualBasic`) a été rejoué en natif avec `dotnet`
(`analysis/verify-Program.cs`) : `petik` / `19755` → « Good Way! », un faux serial → « Not right! ». La GUI n'a pas été pilotée.
