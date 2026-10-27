# jammmie999s_crackme (CrackMe2) — jammmie999

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c392`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c392) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de / jammmie999 |
| **Plateforme** | Windows PE32 GUI, .NET 2.0 (WinForms), lib tierce *SoftwareLocker* (TrialMaker) |
| **SHA-256** | `36e42627af65495275de5e816cfa4150b6929aab0883a462267837c3de455a22` (zip, mot de passe `crackmes.one`) |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/CrackMe2.zip` | archive d'origine (non modifiée) : `CrackMe.exe`, `SoftwareLocker.dll`, `SerialBoxes.dll`, `FilterControls.dll` |
| `analysis/x/` | contenu dézippé + sources C# décompilées (`src-*`, `ilspycmd`) |
| `analysis/vectors.json` | vecteurs ID→serial produits par la **vraie** `SoftwareLocker.dll` |
| `tools/jammmie999-solve.py` | keygen (port Python de `Encryption.MakePassword`) |

## Réponse

Le serial **dépend de la machine** : la boîte de dialogue affiche un champ **ID** (25 caractères A-Z0-9, dérivé du CPU / carte mère / BIOS / disque) et le serial est une fonction déterministe de cet ID (identifier `"999"`). Il n'y a pas de user : `petik` n'a pas de sens ici.

```bash
python3 tools/jammmie999-solve.py <ID affiché>          # -> serial
python3 tools/jammmie999-solve.py -q <ID>
python3 tools/jammmie999-solve.py --check               # vecteurs de la vraie DLL
```

| ID (exemple) | Serial |
|---|---|
| `KKIKKEIKTIPIETPTTTEEPPIPE` | `W@WBKWKBGKGKBBGK@BG@W@WG@` |
| `ABCDEFGHIJKLMNOPQRSTUVWXY` | `PYVWUSKGLNIEXCOBM@DFAJTHZ` |

(`--demo` génère un ID à partir de `PETIK` répété, uniquement pour la démonstration.)

Saisir le serial dans « Serial » puis **OK** → « Password is correct » → `CrackMe` affiche « Congratulations… ». Le bouton « Trial Run » mène à « Sorry, still in Trial Mode ».

## Premier regard

```bash
unzip -P crackmes.one original/CrackMe2.zip -d analysis/x
file analysis/x/*        # 4 assemblies .NET 2.0 (1 exe + 3 DLL)
diec analysis/x/CrackMe.exe   # CLR 2.0, Visual Studio
~/.dotnet/tools/ilspycmd -p -o analysis/x/src-CrackMe analysis/x/CrackMe.exe   # idem SoftwareLocker.dll, SerialBoxes.dll, FilterControls.dll
```

(`decompiledotnet` n'était pas disponible dans le shell agent : `ilspycmd -p` direct.) Le .NET → pas d'IDA/GDB.

## Flow

`Program.Main` crée un `TrialMaker("CrackMe", RegFile.reg, %APPDATA%\TMSetp.dbf, …, 5 jours, 10 lancements, Identifier = "999")`, règle une clé 3DES, puis `ShowDialog()` :

1. `CheckRegister()` : relit `RegFile.reg` (3DES, IV nul) et le compare à `_Password` → `Full` si égal ;
2. sinon `frmDialog` affiche `_BaseString` (« ID ») ; `btnOK_Click` compare `_Pass == sebPassword.Text`, `MessageBox "Password is correct"` et `DialogResult.OK` → `MakeRegFile()` écrit le mot de passe → `RunTypes.Full` → `Form1(isTrial=false)`.

Piège à noter : le constructeur `Form1(bool isTrial)` **n'affecte jamais** le champ `isTrial` (reste `false`), donc `Form1_Load` affiche toujours « Congratulations » même en Trial Run (bug de l'auteur, sans incidence sur le serial).

## Comment on trouve le serial

**Ancrage** : `SoftwareLocker.TrialMaker` (ctor → `SetDefaults()` → `MakeBaseString()` + `MakePassword()`), et `Encryption.MakePassword(st, "999")`.

1. **ID (base string)** : `SystemInfo.GetSystemInfo("CrackMe")` concatène ProcessorId + BaseBoard.Product + Bios.Version + DiskDrive.Signature (flags de `SetDefaults`), ne garde que `[A-Z0-9]`, rappelle récursivement tant que < 25 caractères, tronque à 25 et met en majuscules. Puis `Boring(InverseByBase(info, 10))`. C'est ce que montre le champ ID ; on n'a **pas besoin** de le recalculer : on le lit à l'écran (le serial n'est fonction que de lui).
2. **Serial** = `Encryption.MakePassword(ID, "999")` :

```csharp
int[] a = {9,9,9};                       // chiffres de l'Identifier
st = Boring(st);                          // permutation : pour i : c=st[i]; remove(i); insert((i*c) % len, c)
st = InverseByBase(st, a[0]);             // inversion par blocs de 9 (x3)
st = InverseByBase(st, a[1]);
st = InverseByBase(st, a[2]);
foreach ch: ChangeChar(ToUpper(ch), a)    // substitution
```

`ChangeChar` avec e = {9,9,9} : `A-H` → `+18` (donne `S-Z`), `I-P` → `-9` (donne `@`..`G`), `Q-Z` → `-9` (`H`..`Q`), `0-4` → `+5`, `5-9` → `-5`. D'où le `@` (0x40) parfois présent dans le serial : `I`(0x49)−9. Le `SerialBox` (`FilterTextBox`, `AcceptableChars = All`, `CaptleLettersOnly` = simple `ToUpper`) accepte bien `@`.

Détails de portage (pièges .NET) :
- `InverseByBase` : longueur du bloc = `base` si `i+base <= len-1` sinon `len-i` (équivalent à un simple découpage par blocs, dernier bloc court inversé aussi) ;
- `Boring` : `Remove(i,1)` puis `Insert(num,c)` avec `num = (i*code) % len` calculé sur la longueur d'origine (`list.pop(i)` / `list.insert(num, c)` en Python).

Exemple pas à pas (`ID = ABCDEFGHIJKLMNOPQRSTUVWXY`) : Boring → permutation, 3× inversion par blocs de 9, puis substitution lettre à lettre → `PYVWUSKGLNIEXCOBM@DFAJTHZ` (identique à la sortie de la vraie DLL, cf. Vérification).

## Vérification

- **Binaire réel (code d'origine)** : harnais .NET 8 (`/tmp`, hors dépôt) qui charge la `SoftwareLocker.dll` d'origine par réflexion et appelle `Encryption.MakePassword(id, "999")` sur 4 IDs ; les 4 résultats sont identiques au solveur (`analysis/vectors.json`, `tools/jammmie999-solve.py --check` → 4× OK). Les IDs ne sont pas forcément matériels, mais la fonction est la même que celle qui vérifie.
- **Wine/xvfb** : `xvfb-run -a wine CrackMe.exe` démarre le process (Wine-mono) mais **aucune fenêtre n'apparaît** (blocage dans `SystemInfo` / requêtes WMI `Win32_Processor` etc., non implémentées dans Wine-mono) ; pas de preuve GUI de bout en bout possible ici. Preuve faite sur la logique d'origine (DLL) plutôt que sur l'UI.
- **Cas KO** : tout autre texte que `MakePassword(ID)` → `Password is incorrect` (comparaison de chaînes exacte `_Pass == text`) ; le serial d'un autre ID est donc refusé (lié à la machine).

## Notes

- Le serial peut aussi être contourné en écrivant `RegFile.reg` (3DES, clé de 24 octets dans `Program.Main`, IV nul, texte + `\0`) : `CheckRegister()` le relit à chaque lancement — mais le solveur propre est le keygen ci-dessus.
- Aucun GDB/x64dbg utilisé : reverse 100 % statique (ilspycmd) + exécution réflexive de la DLL.
