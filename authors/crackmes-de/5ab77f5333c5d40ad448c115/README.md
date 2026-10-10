# crackme — honestgamer (crackmes.de, réimport crackmes.one)

| | |
|---|---|
| Page | [crackmes.one/crackme/5ab77f5333c5d40ad448c115](https://crackmes.one/crackme/5ab77f5333c5d40ad448c115) |
| Plateforme | Windows, .NET (C#, Visual Studio 2010), console |
| Difficulté | 1.0 |
| Binaire | `original/` → `Crackme.exe` (+ `Info.txt`) |
| Source décompilée | [`original/source/Keygen.cs`](original/source/Keygen.cs) (ilspycmd) |
| Solveur | [`tools/honestgamer_crackme-solve.py`](tools/honestgamer_crackme-solve.py) |

## Objectif

Le programme demande un **User ID** (entier de 1 à 9999) puis un **Code** ; il répond `Valid Code, Well Done! Write A Keygen Now...`. Ici le « nom » est forcément numérique, donc pas de `petik` possible : l'exemple utilise l'ID `1234`.

## Comment on trouve

1. `file` : assembly .NET → pas besoin de désassembler du x86.
2. `ilspycmd Crackme.exe` donne la classe `Keygen` en clair (pas d'obfuscation) :
   ```csharp
   private void Generate()
   {
       int num = UserID * 786;
       ValidCode = num * 17;
       num = ValidCode / 12;
       ValidCode = num + 1991;
   }
   private void Check(ref int RFlag) { RFlag = (ValidCode == UserCode) ? 1 : 0; }
   ```
3. Le constructeur boucle tant que `UserID` n'est pas dans `]0, 10000[`, puis lit `UserCode` avec `Convert.ToInt32`.

## Keygen

```text
Code = (ID × 786 × 17) div 12 + 1991
```

Avec `ID ≤ 9999`, `ID × 13362 ≤ 133 606 638` : aucun débordement d'`int32`, et la division entière C# sur un positif est la même qu'en Python.

```bash
$ python3 tools/honestgamer_crackme-solve.py 1234
User ID 1234 -> Code 1376050
```

## Vérification

Preuve **statique** sur le code IL décompilé (déterministe, sans obfuscation). L'exécution live n'a pas été possible ici : wine n'a pas Wine Mono (`CLRRuntimeInfo_GetRuntimeHost Wine Mono is not installed`) et il n'y a pas de runtime mono/dotnet sur la machine. Pas de patch de `original/`.
