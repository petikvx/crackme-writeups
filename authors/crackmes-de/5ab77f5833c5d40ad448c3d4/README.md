# crackmes.de's kygenme by bikers80 (KeygenMe.exe)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3d4`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3d4) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (crackme original : *THE BIKERS80*) |
| **Plateforme** | Windows PE32 GUI, VB.NET (CLR 2.0) |
| **SHA-256 (zip)** | `30cb9b86433344e8b1407212fcc7784135a96761f1fa67a6a4dbc8d21be9948c` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/KeygenMe.zip` | archive d'origine (non modifiée) ; contient `KeygenMe.exe` |
| `analysis/extracted/KeygenMe.exe` | exe extrait (`unzip`, hors `original/`) |
| `analysis/extracted/KeygenMe-src/` | C# décompilé (`ilspycmd -p`) — voir `WindowsApplication1/Form1.cs` |
| `tools/keygenme-solve.py` | keygen |
| `tools/vbref/` | harnais .NET 8 : `Button1_Click` recopié avec le **vrai** runtime `Microsoft.VisualBasic` |

## Réponse

Le serial dépend du **nom** (TextBox1) **et** de `%ComputerName%` de la machine. Quatre champs (TextBox2..5) :

| ComputerName | name | champ 1 | champ 2 | champ 3 | champ 4 |
|---|---|---|---|---|---|
| `PC` | `petik` | `5043` | `96475607B6` | `7465743434` | `401356` |
| `GROK-BOT-VM-411` | `petik` | `47524` | `96475607B6` | `7465731313` | `401356` |

```bash
python3 -I tools/keygenme-solve.py --name petik --computer "$COMPUTERNAME"   # défaut : nom d'hôte
python3 -I tools/keygenme-solve.py -q --computer PC                          # 4 champs sur une ligne
python3 -I tools/keygenme-solve.py --check 5043 96475607B6 7465743434 401356 --computer PC
```

## Premier regard

```
$ file KeygenMe.exe   → PE32 executable (GUI) Intel 80386 Mono/.Net assembly
$ diec KeygenMe.exe   → Compiler: VB.NET, .NET Framework (CLR 2.0.50727)
```

Fenêtre « KeygenME BY THE BIKERS80 » : un champ *Name*, quatre champs de serial, boutons *Validez* / *Exit* / *Effacer*, un label de résultat (« Bravo :)!!! » / « Essaye encore :| »).
Pas d'obfuscation : un .NET se décompile directement.

## Comment on trouve

Ancrage : `ilspycmd -p -o analysis/extracted/KeygenMe-src analysis/extracted/KeygenMe.exe` (`decompiledotnet` absent de ce shell), puis `Form1.Button1_Click` (`Form1.cs:475`).

1. `text = Environ("ComputerName")` : le nom de la machine entre dans le calcul, donc le serial n'est pas portable d'un PC à l'autre.
2. Deux boucles imbriquées : `i` sur `ComputerName`, `j` sur `name`. Les chaînes `text2/5/10/12` sont **accumulées sans jamais être remises à zéro** : c'est le piège principal. À la fin :
   - `text3 = Mid(text2,1,5)` avec `text2 = Σ Hex(Asc(comp[i]))` → 5 premiers chars du hex du ComputerName → **champ 1** (`PC` = `50 43` → `5043`) ;
   - `text7 = Mid(StrReverse(text5),3,10)` où `text5` = hex de `name` répété `len(comp)` fois, → **champ 2** (`petik` = `70 65 74 69 6B`, concaténé 2×, inversé, on saute 2 chars, on en prend 10 : `96475607B6`) ;
   - `text14 = Mid(text12,5,5) + Mid(text10,1,5)` : `text12` = hex de `StrReverse(name)` répété, `text10` = hex de `StrReverse(comp)` char par char (répété `len(name)` fois) → **champ 3** ;
   - `text15 = Int(len(name)*68 + 401016)` → **champ 4** (`5*68+401016 = 401356`).
3. Comparaison finale des 4 TextBox avec `text3/text7/text14/text15` (`CompareString`) : un seul écart → « Essaye encore :| » et le champ Name est vidé.

Pièges : `Conversion.Hex` donne des majuscules sans padding (tous les caractères ASCII imprimables ≥ 0x20 font 2 chiffres, donc OK) ; `Mid` hors borne renvoie `""` (pour les noms/PC très courts les champs 2/3 sont tronqués, le keygen gère ça pareil) ; les champs vides sont remplacés par `" "` avant comparaison ; `Val(TextBox1.Text)` est calculé mais jamais utilisé.

## Vérification

- **Wine/xvfb : non concluant.** `xvfb-run -a wine analysis/extracted/KeygenMe.exe` plante dans cet environnement (`err:virtual:virtual_setup_exception stack overflow` au démarrage de wine-mono, aucune fenêtre créée) ; la preuve GUI n'a donc pas pu être faite. Wine expose `COMPUTERNAME=GROK-BOT-VM-411` (cf. ligne 2 du tableau).
- **Preuve de remplacement :** `tools/vbref` recopie `Button1_Click` tel que décompilé et l'exécute avec le vrai `Microsoft.VisualBasic` (.NET 8) :

```bash
dotnet build tools/vbref -o /tmp/vbref
dotnet /tmp/vbref/vbref.dll PC petik 5043 96475607B6 7465743434 401356   # Bravo :)!!!
dotnet /tmp/vbref/vbref.dll PC petik 1 2 3 4                             # Essaye encore :|
```

  Keygen testé sur 3 ComputerName × 3 noms (`petik`, `ab`, `Bob K`) : 9/9 « Bravo ». Cela valide le keygen contre la logique décompilée, **pas** contre l'exe lancé.

## Notes

- Pas de GDB ni de debugger MCP utilisé : reverse 100 % statique (décompilation C#).
- Le serial n'est valable que pour la machine dont on donne le `ComputerName` (`--computer`).
