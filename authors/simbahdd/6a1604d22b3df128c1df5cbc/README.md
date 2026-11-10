# SimbaHDD's very easy crackme

| | |
|---|---|
| **ID** | [`6a1604d22b3df128c1df5cbc`](https://crackmes.one/crackme/6a1604d22b3df128c1df5cbc) |
| **Auteur (site)** | SimbaHDD |
| **Plateforme** | Windows, .NET Framework (PE32, console, CIL) |
| **SHA-256 (`download.bin`)** | `8dc99b35bedea6d150bbb11f71156ff2f88ab5e279996ef5a7cfc2c75d140d2c` |

Origine : [`ORIGIN.yml`](ORIGIN.yml) · [page crackmes.one](https://crackmes.one/crackme/6a1604d22b3df128c1df5cbc)

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | archive ZIP chiffrée, mdp `crackmes.one` (contient `CRACKME.exe`) — **non modifiée** |
| `analysis/CRACKME.exe` | `CRACKME.exe` extrait du ZIP (sha256 `4c73a36c…6f99`) |
| `original/source/` | décompilation C# (`ilspycmd -p`) |
| `tools/very-easy-solve.py` | solveur (`-q`, `--check`) |

## Réponse

**Password : `crackme12345ez`**

```bash
python3 -I tools/very-easy-solve.py          # password = crackme12345ez
python3 -I tools/very-easy-solve.py -q
python3 -I tools/very-easy-solve.py --check  # rejoue le binaire : check: OK
```

(Pas de username : pas d'exemple `petik` applicable.)

## Premier regard

- `file`/`diec` ne sont pas installés ici ; `download.bin` commence par `PK` → c'est un **ZIP** (et non le PE directement) : `python3 -I -c 'import zipfile; zipfile.ZipFile("original/download.bin").extractall("/tmp/x", pwd=b"crackmes.one")'` donne `CRACKME.exe` (4608 octets).
- `strings -n 4` : `BSJB`, `v4.0.30319`, `mscorlib`, `_CorExeMain`, classe `crackmebro`, `ReadLine`, `op_Equality` → assembly **.NET**.
- Les littéraux de `Main` sont en UTF-16 dans le heap `#US` : `strings` classique ne les voit pas, il faut `strings -el` ou un regex UTF-16.

## Flow

1. Titre console `Crackme by Simba`, bannière « SIMPLE CRACKME CHALLENGE ».
2. `Enter password:` → `Console.ReadLine()`.
3. `text == "<littéral>"` (`String.op_Equality`) → vert `[+] CORRECT! You cracked it!`, sinon rouge `[-] WRONG! Try again.`.
4. `Press any key to exit...` + `ReadKey`.

## Comment on trouve

**Ancrage** : décompilation .NET avec le wrapper du dépôt :

```bash
bash -ic 'ilspycmd -p -o original/source analysis/CRACKME.exe'   # (decompiledotnet attend un fichier ; ilspycmd direct ici)
```

Extrait de `crackme.crackmebro.Main()` :

```csharp
Console.Write("Enter password: ");
string text = Console.ReadLine();
if (text == "crackme12345ez")      // comparaison en clair, sensible à la casse
{
    Console.ForegroundColor = ConsoleColor.Green;
    Console.WriteLine("[+] CORRECT! You cracked it!");
}
else { ... "[-] WRONG! Try again." }
```

Aucune transformation : le mot de passe est un littéral. Recoupement sans décompilateur : en listant les chaînes UTF-16 du binaire (offsets fichier 0x5e6…), le littéral `crackme12345ez` est juste après `Enter password: ` (0x6ba → 0x6dc), avant les deux messages de résultat :

```
1706 Enter password:
1740 crackme12345ez
1770 [+] CORRECT! You cracked it!
1828 [-] WRONG! Try again.
```

**Piège** : l'entrée du `download.bin` est un ZIP, pas un PE ; et les chaînes .NET sont en UTF-16 (`strings` simple ne montre que les noms de métadonnées).

## Vérification

Ni Wine ni Mono n'étaient installés sur la machine ; le binaire d'origine (assembly .NET Framework, références `mscorlib`) a été exécuté avec le host **`dotnet` 8** + un `CRACKME.runtimeconfig.json` minimal (fait par `--check`, dans un dossier temporaire). `ReadKey` plante ensuite car stdin est redirigé (sans importance, après le verdict).

| Entrée | Sortie |
|---|---|
| `crackme12345ez` | `[+] CORRECT! You cracked it!` |
| `wrong` | `[-] WRONG! Try again.` |

Pas de GDB, pas de debug live (reverse 100 % statique + exécution du binaire).

## Notes

- Casse et longueur exactes (14 caractères) : `CrackMe12345ez` échoue (comparaison ordinale).
- Aucun anti-debug / obfuscation.
