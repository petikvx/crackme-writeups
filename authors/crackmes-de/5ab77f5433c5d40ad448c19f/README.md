# crackme_9 by tcn30

| | |
|---|---|
| **ID** | [`5ab77f5433c5d40ad448c19f`](https://crackmes.one/crackme/5ab77f5433c5d40ad448c19f) |
| **Auteur (site)** | crackmes.de (tcn30) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows, .NET 2.0 (console, C#) |
| **Difficulté** | 2.0 |
| **SHA-256 (zip)** | `2180eeb77b66e4ff51a35b97e6f790cf9488a17ca87c8db4bb03a821c1d004da` |

## Solution

Mot de passe : **`Leteminman`** (fixe ; `petik` → « Bad Luck! Try again! »).

## Idée en une phrase

`Main` déchiffre une constante Base64 avec un helper « RijndaelSimple » (AES-256-CBC, clé dérivée par `PasswordDeriveBytes` MD5 ×1024) puis compare le clair à la saisie : il suffit d'appeler la même routine.

## Comment on trouve

1. `diec` → .NET CLR 2.0, ~6 Ko, non obfusqué.
2. `ilspycmd` (copie dans [`original/source/`](original/source/)) : la classe `RijndaelSimpleTest.Main` contient toutes les constantes :
   - `cipherText = "BnCxGiN4aJDE+qUe2yIm8Q=="`
   - `passPhrase = "^F79ejk56$£"`, `saltValue = "DHj47&*)$h"`, `hashAlgorithm = "MD5"`, `iterations = 1024`
   - `initVector = "&!£$%^&*()CvHgE!"`, `keySize = 256`
   - `plainText = RijndaelSimple.Decrypt(...)` puis boucle `if (Console.ReadLine() == plainText) break;`.
3. Plutôt que de réimplémenter l'extension propriétaire de `PasswordDeriveBytes` (PBKDF1 « étendu » pour 32 octets) et la conversion ASCII de `£` → `?`, on **charge l'assembly par réflexion** et on invoque la vraie méthode `RijndaelSimple.Decrypt` avec ces arguments → `Leteminman`.

## Solveur

```bash
python3 tools/crackme-9-by-tcn30-solve.py   # SDK dotnet 8 requis
# password: Leteminman
```

## Vérification

Exécution **native** du binaire d'origine sous `dotnet` 8 (runtimeconfig `rollForward: LatestMajor` ajouté à côté de l'exe, binaire non modifié) :

```
$ printf 'petik\nLeteminman\n\n' | dotnet ConsoleApplication3.exe
Please enter the password:
Bad Luck! Try again!
Please enter the password:
Well Done! You cracked it!
```
