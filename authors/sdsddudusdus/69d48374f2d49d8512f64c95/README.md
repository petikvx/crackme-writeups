# sdsddudusdus's My First CrackMe

| | |
|---|---|
| **ID** | [`69d48374f2d49d8512f64c95`](https://crackmes.one/crackme/69d48374f2d49d8512f64c95) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | sdsddudusdus |
| **Plateforme** | Windows x86-64, console, .NET 9 (apphost natif + `chip-8.dll` managée) |
| **SHA-256** (`original/download.bin`) | `3955bad30f8c4e52e08569bfcb788a6529a0678a2666d1398406e65e6543d955` |

## Fichiers du dossier

| Chemin | Rôle |
|---|---|
| `original/download.bin` | binaire d'origine, **non modifié** : c'est en réalité un ZIP (pwd `crackmes.one`) contenant `mycrackme.zip` |
| `analysis/extracted/` | `chip-8.exe` (apphost) + `chip-8.dll` (le vrai code) extraits du ZIP imbriqué, et `chip-8-src/` (C# via `ilspycmd`) |
| `tools/sdsddudusdus-solve.py` | solveur : relit le serial dans la DLL, `--check` le rejoue contre le binaire |

## Réponse

**Serial : `password`**

```bash
python3 -I tools/sdsddudusdus-solve.py            # Serial : password
python3 -I tools/sdsddudusdus-solve.py -q         # password
python3 -I tools/sdsddudusdus-solve.py --check    # preuve live (runtime dotnet)
```

Il n'y a pas de user/login : la saisie est comparée telle quelle à une constante (donc `petik` est refusé, voir Vérification).

## Premier regard

- `download.bin` : `PK\x03\x04`, flag chiffré, entrée `mycrackme.zip`. Le mot de passe `crackmes.one` ouvre l'archive externe, et l'entrée est elle-même un ZIP (non chiffré) avec `chip-8.dll` (4 608 o) et `chip-8.exe` (156 160 o). Le script `add-crackme.sh` n'avait pas déballé ce second niveau.
  ```bash
  python3 -I -c "import zipfile;zipfile.ZipFile('original/download.bin').extractall('/tmp/x1',pwd=b'crackmes.one')"
  unzip /tmp/x1/mycrackme.zip -d analysis/extracted
  ```
- `chip-8.exe` : PE64 natif de 156 Ko, imports `hostfxr`-style (`ShellExecuteW`, `RegGetValueW`, `MessageBoxW`, CRT) et aucune chaîne de crackme : c'est l'**apphost** .NET, il ne fait que charger `chip-8.dll`. `strings` sur ce .exe est donc un leurre.
- `chip-8.dll` : `strings` montre `BSJB`, `v4.0.30319`, `System.Console`, `ReadLine`, `op_Equality` → assembly managée ; le chemin PDB `...\obj\Debug\net9.0\chip-8.pdb` et `.NETCoreApp,Version=v9.0` donnent la cible.

## Flow

`Main()` : affiche `Enter Serial: `, lit une ligne, la compare à une constante, affiche `Correct!` ou `Try Again.`, puis attend un `ReadLine()` (pause avant fermeture).

## Comment on trouve

1. **Ancrage** : le code est dans la DLL, pas dans l'EXE. Décompilation (l'alias `decompiledotnet` n'étant pas dispo en shell non interactif, appel direct de `ilspycmd`, qui est ce qu'il enrobe) :
   ```bash
   ilspycmd -p -o analysis/extracted/chip-8-src analysis/extracted/chip-8.dll
   ```
   Résultat (`Program.cs`, tout le crackme) :
   ```csharp
   Console.Write("Enter Serial: ");
   string text = Console.ReadLine();
   if (text == "password") { Console.WriteLine("Correct!"); Console.ReadLine(); }
   else                    { Console.WriteLine("Try Again.");  Console.ReadLine(); }
   ```
2. **Confirmation dans l'IL** (`ilspycmd -il chip-8.dll`), pour ne pas se fier qu'au décompilateur :
   ```
   IL_000c: call string System.Console::ReadLine()
   IL_0011: stloc.0                      ; text
   IL_0012: ldloc.0
   IL_0013: ldstr "password"             ; constante du #US heap
   IL_0018: call bool System.String::op_Equality(string, string)
   IL_001f: brfalse.s IL_0036            ; faux -> "Try Again."
   ```
   Comparaison **sensible à la casse**, sans transformation, sans hash.
3. **Où est la chaîne** : dans le heap `#US` (UTF-16LE, blobs `[longueur][octets][flag]`), offset fichier `0x71c` :
   `11 70 00 61 00 73 00 73 00 77 00 6f 00 72 00 64 00 00` → `0x11` = 16 octets + 1 flag = `password`. C'est ce que lit le solveur (les 4 chaînes dans l'ordre : prompt, serial, `Correct!`, `Try Again.`).
4. **Pièges** : (a) le ZIP imbriqué ; (b) `strings` sur `chip-8.exe` ne montre rien d'utile (apphost) ; (c) les chaînes .NET sont en UTF-16, un `strings -n 6` ASCII ne les voit pas (il faut `strings -e l`).

## Vérification

Pas de Wine/GDB dans cet environnement (donc pas de section GDB : reverse 100 % statique + exécution managée). Le crackme étant une DLL .NET, la preuve live a été faite avec le runtime `dotnet` 8 de la machine. La DLL cible net9 et référence `System.Runtime 9.0.0.0` ; sur un runtime 8 seul, le solveur patche **une copie temporaire** (octet *Major* des 2 `AssemblyRef` 9→8), jamais `original/`. Piège : la copie doit s'appeler `chip-8.dll` (nom d'assembly), sinon le host recharge l'autre DLL à côté.

```text
$ python3 -I tools/sdsddudusdus-solve.py --check
Serial : password
'password'   -> Correct  [OK]
'petik'      -> Try Again  [OK]
'Password'   -> Try Again  [OK]
''           -> Try Again  [OK]
```

Sous Windows : `chip-8.exe`, saisir `password` → `Correct!`.

## Notes

- Aucun anti-debug, pas d'obfuscation, pas de dérivation : serial statique.
- Le nom « chip-8 » n'a aucun rapport avec l'émulateur CHIP-8.
