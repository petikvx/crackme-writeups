# crackme1_by_cr4ckd0r — CrackMe by cr4ckd0r

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c33f`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c33f) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | cr4ckd0r (site : crackmes.de) — sorti le 02/04/2015 |
| **Plateforme** | Windows PE32 GUI, VB.NET (CLR 4.0), WinForms |
| **SHA-256 (zip)** | `ad069adc01f683847ed97d109b26bc559a06608ccf6821a2b8f23c2609aee6b0` |
| **SHA-256 (exe)** | `23ebebf7bc60c43c59cc25171a2f2d8d72aa0c01e23b0a3aa7f5dc5d4420afe4` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme.zip` | archive d'origine (mot de passe `crackmes.one`) : `CrackMe by cr4ckd0r.exe` + `ReadMe.txt` |
| `analysis/extracted/crackme/` | contenu dézippé (copie de travail) |
| `analysis/extracted/src/` | projet C# décompilé (`ilspycmd -p`) |
| `tools/crackme1-cr4ckd0r-solve.py` | solveur + preuve live (`--check`) |

## Réponse

Pas de keygen possible : le nom **et** le serial sont des constantes.

| Name | Serial |
|---|---|
| `cr4ckd0r` | `Crack me if you can!!!` |

```bash
python3 tools/crackme1-cr4ckd0r-solve.py          # affiche la paire
python3 tools/crackme1-cr4ckd0r-solve.py -q       # serial seul
python3 tools/crackme1-cr4ckd0r-solve.py --check  # preuve Wine + Xvfb + xdotool
```

Contrainte : l'utilisateur d'exemple `petik` est **refusé** (le nom est comparé à une constante).

## Premier regard

```text
$ file "CrackMe by cr4ckd0r.exe"
PE32 executable for MS Windows 4.00 (GUI), Intel i386 Mono/.Net assembly, 4 sections
$ diec ...  -> Compiler: VB.NET, Library: .NET Framework (CLR 4.0.30319), Microsoft Linker 8.0
```

Le `ReadMe.txt` demande « solve my crackme, write a keygen and tutorial ». `strings` ne montre que
les métadonnées .NET : les littéraux sont en UTF-16 dans le heap `#US`, donc invisibles à `strings -n`
par défaut. Il faut décompiler.

## Flow

Fenêtre avec `Name:` (TextBox1), `Serial:` (TextBox2) et les boutons `Check It!`, `Exit`, `About`.
Seul `Check It!` (`Button1_Click_1`) fait un test ; `Button1_Click`, `Button4_Click` et
`TextBox1_TextChanged` sont des handlers vides (leurres de l'éditeur VS).

## Comment on trouve

Ancrage : le binaire est du .NET, donc pas d'IDA/GDB — décompilation C# :

```bash
cd analysis/extracted/crackme
ilspycmd -p -o ../src "CrackMe by cr4ckd0r.exe"   # (l'alias decompiledotnet est absent sur cette machine)
grep -n 'CompareString' ../src/WindowsApplication1/Form1.cs
```

Le check, dans `WindowsApplication1/Form1.cs` (`Button1_Click_1`) :

```csharp
if (Operators.CompareString(TextBox1.Text, "cr4ckd0r", false) == 0)            // binaryCompare = false => comparaison binaire, sensible à la casse
{
    if (Operators.CompareString(TextBox2.Text, "Crack me if you can!!!", false) == 0)
        Interaction.MsgBox("Solved! Now write a keygen and tutorial!", 64, "good boy...");
}
else
    Interaction.MsgBox("Wrong! Try Again!", 64, "bad boy...");
```

Rien d'autre : pas de calcul dépendant du nom, donc « keygen » = deux constantes.

Pièges :

- **Asymétrie des branches** : si le nom est bon mais le serial faux, **aucune** MsgBox n'apparaît
  (le `else` n'est rattaché qu'au test du nom). Un nom faux affiche « bad boy... » quel que soit le serial.
- Le 3ᵉ argument de `CompareString` est `False` : casse et espaces comptent, les trois `!` sont obligatoires.
- Ordre de tabulation : TextBox1 → TextBox2 → `Check It!`, utile pour piloter la GUI avec `xdotool`.

## Vérification (Wine + Xvfb, binaire d'origine dézippé depuis `original/crackme.zip`)

`--check` lance l'exe sous Xvfb, tape les valeurs avec `xdotool` et lit le titre de la MsgBox :

```text
Name   : cr4ckd0r
Serial : Crack me if you can!!!
'cr4ckd0r'   'Crack me if you can!!!'   -> good boy...     (OK)
'petik'      'Crack me if you can!!!'   -> bad boy...      (KO : mauvais nom)
'cr4ckd0r'   'wrong'                    -> NO-MSGBOX        (KO : bon nom, mauvais serial, silence)
```

Les trois cas collent au code décompilé. (Au 2ᵉ/3ᵉ essai Xvfb signale « server already running » —
le serveur du cas précédent n'était pas encore arrêté — sans effet sur les résultats.)

Pas de session GDB/x64dbg/IDA : reverse 100 % statique (décompilation C#) + preuve live Wine.

## Notes

- Le nom d'auteur du crackme est la solution du champ Name ; le serial est la phrase de défi.
- Aucun patch de `original/` ; l'exe est dézippé hors du dossier `original/`.
