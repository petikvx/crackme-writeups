# billy_bat's My First Crackme

| | |
|---|---|
| **ID** | [`69e69e738afd9d6c48b489a9`](https://crackmes.one/crackme/69e69e738afd9d6c48b489a9) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | billy_bat |
| **Plateforme** | .NET 9 (console, `chip-8.dll` + apphost `chip-8.exe`) |
| **SHA-256** (`original/download.bin`) | `1ad6aadfb6b7f4bdaba9b77bedbea3e850cf4dd3403203c8570fb6b6691cea2b` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP du site (mdp `crackmes.one`) contenant `mycrackme.zip` |
| `tools/billy-bat-solve.py` | extrait la constante attendue depuis la DLL (`-q`, `--check`) |
| `analysis/x/` | extraction locale (zip imbriqué, DLL, `README.txt`) |

## Réponse

**Serial : `password`**

```bash
python3 -I tools/billy-bat-solve.py -q   # → password
```

Pas de username dans ce crackme (exemple `petik` sans objet : le serial est constant).

## Premier regard

- `download.bin` est un ZIP chiffré (`crackmes.one`) qui contient **un second ZIP** `mycrackme.zip` (non chiffré) → `chip-8.dll`, `chip-8.exe`, `chip-8.runtimeconfig.json`, `README.txt`.
- Le README fourni indique : lancer `dotnet chip-8.dll`, entrer un serial, « Correct! » si OK.
- `strings chip-8.dll` : `System.Console`, `ReadLine`, `op_Equality`, métadonnées `v4.0.30319` → assembly .NET managé. Le nom « chip-8 » est trompeur (aucun émulateur CHIP-8).

## Flow

`Enter Serial:` → `Console.ReadLine()` → comparaison de chaînes → `Correct!` ou `Try Again.`, puis `ReadLine` pour garder la fenêtre.

## Comment on trouve

Ancrage : `bash -ic 'decompiledotnet analysis/x/mycrackme/chip-8.dll'` (équivalent `ilspycmd chip-8.dll`). Tout le programme tient dans `Program.Main` :

```csharp
Console.Write("Enter Serial: ");
string text = Console.ReadLine();
if (text == "password")        // String.op_Equality(text, "password")
{   Console.WriteLine("Correct!"); Console.ReadLine(); }
else
{   Console.WriteLine("Try Again."); Console.ReadLine(); }
```

Le serial est une **constante en clair** (littéral dans le heap `#US`), pas de calcul. Piège : `strings` par défaut ne le voit pas (UTF-16LE) ; `strings -el` ou le décompilateur le montre. Aussi, `chip-8.exe` n’est que l’apphost : la logique est dans la DLL.

## Vérification

Le runtime .NET 9 n’est pas installé ici (seulement 8.0). Pour exécuter réellement la DLL d’origine, une **copie jetable dans `/tmp`** a été utilisée : octet « major » des 2 AssemblyRef (`System.Runtime`/`System.Console` 9.0.0.0 → 8.0.0.0) patché et `runtimeconfig` en net8.0 — rien n’est modifié sous `original/`. Le code IL est identique.

```text
$ echo password | dotnet chip-8.dll
Enter Serial: Correct!
$ echo petik | dotnet chip-8.dll
Enter Serial: Try Again.
```

Pas de GDB / x64dbg / IDA utilisés (reverse 100 % statique + exécution managée).

## Notes

- Aucun obfuscateur, aucune dérivation : le serial est le même pour tous.
- Le zip imbriqué (zip dans zip) est la seule « difficulté » d’accès.
