# crackmes.de's keygenme_1 by toma6868

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c330`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c330) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | toma6868 (via crackmes.de) |
| **Plateforme** | Windows PE32 GUI, **VB.NET** (CLR 2.0, WinForms) |
| **SHA-256 (zip)** | `6592f786d9d70b55a86db1b273678d47e0a0c61505c8bb03349fd12d2651a131` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/CrackMe_1.zip` | archive d'origine (password `crackmes.one`) : `KeyGenMe_1.exe` + `Readme.txt` |
| `analysis/extract/` | zip extrait (hors `original/`) |
| `analysis/src/` | C# décompilé (`ilspycmd -p`) |
| `tools/keygenme1-toma6868-solve.py` | keygen (`-q`, `--check`) |
| `tools/vbchk-P.cs` | mini-harnais .NET 8 qui rejoue l'algo avec le vrai runtime `Microsoft.VisualBasic` |

## Réponse

| Name | Serial |
|---|---|
| `petik` | **`B696475607`** |

```bash
python3 tools/keygenme1-toma6868-solve.py --name petik     # name=petik serial=B696475607
python3 tools/keygenme1-toma6868-solve.py -q               # B696475607
```

## Premier regard

```bash
unzip -P crackmes.one original/CrackMe_1.zip -d analysis/extract
file analysis/extract/KeyGenMe_1.exe   # PE32 GUI, Mono/.Net assembly
diec  analysis/extract/KeyGenMe_1.exe  # Compiler: VB.NET, .NET CLR 2.0
```

`Readme.txt` : « find a valid name/serial (no patching), find the algorithme, make a KeyGen, write a Tuto ». Fenêtre « KeyGenMe_1 By Toma6868 » : champs Name / Sérial, boutons *Valider* / *Réinitialiser*.

## Flow

`Button1_Click` : nom < 4 caractères → « The Name is too short ! » ; sinon serial attendu = `Envers(AscEncode(name))`, comparé en `CompareString` binaire (sensible à la casse) au champ serial → MsgBox « Bravo… » ou « Dommage… ».

## Comment on trouve

.NET → pas besoin d'IDA/GDB : décompilation directe.

```bash
~/.dotnet/tools/ilspycmd -p -o analysis/src analysis/extract/KeyGenMe_1.exe
# (le wrapper `decompiledotnet` n'était pas dispo en shell non interactif)
sed -n 304,360p analysis/src/KeyGenMe_1/Form1.cs
```

Extraits (`KeyGenMe_1/Form1.cs`) :

```csharp
string str  = AscEncode(text);        // text = nameBox
string text3 = Envers(str);
if (CompareString(serialBox.Text, text3, false) == 0) -> Bravo
```

- `AscEncode` : pour i = 1..Len, `Hex(Asc(Mid(s,i,1)))` concaténé → chaque caractère donne son code ASCII en **hexadécimal majuscule** (`Conversion.Hex`), sans padding (les codes imprimables font toujours 2 chiffres).
- `Envers` (« à l'envers ») : boucle `For i = Len To 1 Step -1` concaténant `Mid(s,i,1)` → **inversion de la chaîne** (pas des octets : c'est l'inversion des *caractères hex*, donc les nibbles sont aussi permutés).

Assemblage, `petik` :

```
p=0x70 e=0x65 t=0x74 i=0x69 k=0x6B
AscEncode -> "706574696B"
Envers    -> "B696475607"          <- serial
```

Piège : inverser par octets donnerait `6B69746570` (faux) ; il faut inverser la chaîne de caractères hex.

## Prédicat consolidé

```python
serial = "".join("%X" % ord(c) for c in name)[::-1]     # len(name) >= 4
```

## Vérification

- Solveur : `petik → B696475607`.
- Harnais `tools/vbchk-P.cs` (projet .NET 8 temporaire, `dotnet run -- petik`) : reprend `Strings.Len/Mid/Asc` et `Conversion.Hex` du vrai runtime VB comme dans le binaire → sortie `B696475607`, identique au solveur.
- **Limite honnête** : la preuve GUI live n'a pas pu être faite. `wine`/`xvfb-run` lance `KeyGenMe_1.exe` mais wine-mono plante dans cet environnement (`err:virtual:virtual_setup_exception stack overflow`), aucune fenêtre ne s'affiche (`--check` du solveur est donc fourni mais non concluant ici ; un préfixe win32 neuf n'a pas de wine-mono). Le .NET WinForms ne tourne pas non plus sous le runtime Linux. La logique est lue directement dans le C# décompilé du binaire d'origine, et rejouée avec les fonctions VB réelles.
- Cas KO : nom `abc` (< 4) → « The Name is too short ! » ; serial `706574696B` (non inversé) → « Dommage… » (par lecture du code).

## Notes

- Aucun GDB / x64dbg / IDA utilisé (analyse 100 % statique du C# décompilé).
- Pas de piège anti-debug ; comparaison stricte, donc hex en **majuscules** (`B`, pas `b`).
