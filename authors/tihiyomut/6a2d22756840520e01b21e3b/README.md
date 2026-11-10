# TihiyOmut's EZFTP_ByTOMUT

| | |
|---|---|
| **ID** | [`6a2d22756840520e01b21e3b`](https://crackmes.one/crackme/6a2d22756840520e01b21e3b) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | TihiyOmut |
| **Plateforme** | Windows, .NET Framework 4.8, console (AnyCPU) |
| **SHA-256 `original/download.bin`** | `bfbbe0d728632d2aaee35b193972a10b78c094e536552840c9fec92a3ff1067c` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (non modifié) |
| `analysis/extracted/FTP_ByTihiyOmut/` | contenu extrait : `FindThePasswordEZByTOMUT.exe` (sha256 `aa6b58a1…f9b9`) + `readme.md` de l'auteur |
| `analysis/source/` | C# décompilé (`ilspycmd -p`) |
| `tools/ezftp-solve.py` | solveur (extrait le password du binaire, `--check` le teste) |

## Réponse

**Password : `TihiyOmut_Secret_2026`**

```bash
python3 -I tools/ezftp-solve.py        # affiche le password
python3 -I tools/ezftp-solve.py --check  # + exécute l'exe : bon password et KO
```

Pas de champ user/login : rien à dériver, donc pas d'exemple `petik` (il sert ici seulement de mauvais password pour le cas KO).

## Premier regard

Le `download.bin` n'est pas un exe mais un **ZIP chiffré contenant un autre ZIP** :

```bash
python3 -I -c "import zipfile;z=zipfile.ZipFile('original/download.bin');print(z.infolist()[0].filename)"
# FTP_ByTihiyOmut.zip (flag chiffrement = 1)
```

Piège : le ZIP interne s'ouvre avec le **même mot de passe que le site**, `crackmes.one` (pas avec le nom de l'auteur). Il contient `FindThePasswordEZByTOMUT.exe` (5120 o) et un `readme.md` qui annonce : « console C# .NET, utilise dnSpy/ILSpy, pas d'obfuscation ».

`strings` confirme : `v4.0.30319`, `mscoree.dll`, `_CorExeMain`, PDB `...FindThePasswordEZByTOMUT.pdb`, et le nom de classe `OhLookUFoundPasswordYesItsASecretCommentTihiyOmutEZCrack` (namespace `Password`).

## Flow

Banner → `Enter password:` → `Console.ReadLine()` comparé à une constante → message « good boy » ou « bro r u serious? » → `Press Enter to exit...`.

## Comment on trouve

1. Ancrage : `strings -el -n 3 FindThePasswordEZByTOMUT.exe` (le heap `#US` .NET stocke les littéraux en UTF-16) donne, entre l'invite et les messages, la seule chaîne qui ressemble à un secret : `TihiyOmut_Secret_2026`.
2. Confirmation par décompilation (`~/.dotnet/tools/ilspycmd -p -o analysis/source <exe>`, `decompiledotnet` n'était pas dans le PATH du shell non interactif) :

```csharp
namespace Password;
internal class OhLookUFoundPasswordYesItsASecretCommentTihiyOmutEZCrack {
    private static void Main() {
        ...
        Console.Write("Enter password: ");
        if (Console.ReadLine() == "TihiyOmut_Secret_2026")   // op_Equality sur string
            Console.WriteLine("\n good boy! You found the password and its correct");
        else
            Console.WriteLine("\n bro r u serious? You cant even find the password?");
        Console.WriteLine("\nPress Enter to exit...");
        Console.ReadLine();
    }
}
```

Comparaison de string en clair, aucune transformation. Pièges : la couche ZIP double chiffrée, et le nom de classe-troll (« SecretComment ») qui n'est pas le password.

## Vérification

Ni Wine ni mono sur cette machine : l'exe (IL pur, `mscorlib` seul) a été exécuté avec le runtime `dotnet` 8 en lui fournissant un `runtimeconfig.json` temporaire (c'est ce que fait `--check`).

```text
$ printf 'TihiyOmut_Secret_2026\n\n' | dotnet FindThePasswordEZByTOMUT.exe
Enter password:
 good boy! You found the password and its correct
$ printf 'petik\n\n' | dotnet FindThePasswordEZByTOMUT.exe
Enter password:
 bro r u serious? You cant even find the password?
```

`ezftp-solve.py --check` → `OK: True KO(petik): True`. Pas de GDB/x64dbg/IDA utilisés (reverse 100 % statique + exécution managée).

## Notes

- Le binaire dans le ZIP interne n'a pas été placé sous `original/` (qui reste le `download.bin` brut) mais extrait sous `analysis/extracted/`.
- Premier crackme de l'auteur, très simple.
