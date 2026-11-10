# plikan's Ez Crackme

| | |
|---|---|
| **ID** | [`692272032d267f28f69b7ff5`](https://crackmes.one/crackme/692272032d267f28f69b7ff5) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | plikan |
| **Plateforme** | Windows PE32 .NET Framework 4.7.2, console (`superdupercrackme1377.exe`) |
| **SHA-256** (`original/download.bin`) | `34cd73e80625afaf2a3a9a8d36f58f79ad8afb6052095926c966d74262efb160` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP (mot de passe `crackmes.one`) contenant `superdupercrackme1377.exe` — non modifié |
| `analysis/extracted/` | exe extrait du ZIP + `.runtimeconfig.json` pour le lancer sous `dotnet` |
| `analysis/Program.cs` | `Main` décompilé (ilspycmd) |
| `tools/ez-crackme-solve.py` | extrait le mot de passe du binaire ; `-q`, `--check` |

## Réponse

**Mot de passe : `ar@gerg554y345@htw54`**

```bash
python3 -I tools/ez-crackme-solve.py          # affiche le mot de passe
python3 -I tools/ez-crackme-solve.py --check  # le teste contre l'exe (OK) + « petik » (KO)
```

Pas de notion d'utilisateur : le mot de passe est constant (`petik` est rejeté).

## Premier regard

- `download.bin` : `strings` ne montre que `superdupercrackme1377.exeUT` → c'est un **ZIP**, pas un exe. Le scaffold n'a donc pas dézippé la couche interne ; on l'extrait sous `analysis/extracted/` (`original/` reste intact) :
  `python3 -c "import zipfile;zipfile.ZipFile('original/download.bin').extractall('analysis/extracted',pwd=b'crackmes.one')"`
- L'exe : `objdump -x` → `pei-i386`, sous-système console, entrypoint `0x402892` (stub `_CorExeMain`), `strings` : `v4.0.30319`, `#Strings`, `#US`, `mscorlib`, `Console`, `ReadLine`, `op_Equality`… → assembly **.NET**, pas de code natif à lire.
- Chaîne UTF-16 repérée dans `strings -el` : `ar@gerg554y345@htw54`, accompagnée de messages russes (heap `#US`).

## Flow

1. Affiche `введи пароль пидорас` (« entre le mot de passe »).
2. `Console.ReadLine()` comparé avec `String.op_Equality` à une chaîne constante.
3. Égal → `правильный пароль, ты пидорас` ; sinon → `неправильный пароль, иди нахуй`.

## Comment on trouve

- **Ancrage** : `~/.dotnet/tools/ilspycmd analysis/extracted/superdupercrackme1377.exe` (l'alias `decompiledotnet` n'est pas disponible en shell non interactif ici ; ilspycmd direct). Résultat dans [`analysis/Program.cs`](analysis/Program.cs).
- **Lecture** : `Main` est trivial, le mot de passe est littéral :
  ```csharp
  string text = "ar@gerg554y345@htw54";
  if (Console.ReadLine() == text) ...
  ```
- **Contre-vérification IL brut** (sans décompileur) : le corps de méthode fait `0x33` octets, `13 30 02 00 33 00 00 00 …` (header fat/tiny), puis
  `72 01 00 00 70 0a` = `ldstr 0x70000001 ; stloc.0` — token `0x70` = table `#US`, offset 1 = **première** chaîne du heap, i.e. le mot de passe. Puis `72 2b…` `28 0f…` (`ldstr` message + `Console.WriteLine`), `28 10` `ReadLine`, `06` `ldloc.0`, `28 11` `op_Equality`, `2c 0b` `brfalse.s` vers le message d'échec. Le solveur parse donc le heap `#US` (entrées = longueur + UTF-16LE + octet de flag) et renvoie l'entrée n°1.
- **Pièges** : le ZIP imbriqué dans `download.bin` (le « binaire » d'origine n'est pas un PE) ; les messages sont en cyrillique → forcer UTF-8 côté console. Aucun anti-debug, aucune obfuscation. Pas de GDB/IDA/x64dbg utilisés (reverse 100 % statique + exécution live).

## Vérification

Ni Wine ni Mono n'étant installés, preuve live avec le runtime **.NET 8** (`dotnet`) : l'assembly .NET Framework 4.7.2 tourne tel quel via `mscorlib` (façade) avec un `runtimeconfig.json` posé à côté de la copie extraite.

```text
$ echo 'ar@gerg554y345@htw54' | dotnet superdupercrackme1377.exe
введи пароль пидорас
правильный пароль, ты пидорас          # OK

$ echo 'petik' | dotnet superdupercrackme1377.exe
введи пароль пидорас
неправильный пароль, иди нахуй         # KO
```

`python3 -I tools/ez-crackme-solve.py --check` rejoue ces deux cas (exit 0).

## Notes

- Comparaison sensible à la casse, sans transformation : aucune dérivation, pas de keygen.
- Vu la nature « Ez », un simple `strings -el` sur l'exe suffit à trouver la réponse.

## Status

- [x] reverse
- [x] write-up
- [x] solveur
