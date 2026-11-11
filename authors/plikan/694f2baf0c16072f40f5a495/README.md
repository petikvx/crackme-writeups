# plikan's Ez Crackme (WinForms)

| | |
|---|---|
| **ID** | [`694f2baf0c16072f40f5a495`](https://crackmes.one/crackme/694f2baf0c16072f40f5a495) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | plikan |
| **Plateforme** | Windows, .NET WinForms (`windowsformsapp10.exe`, 9 216 octets) |
| **SHA-256** (`download.bin`) | `bb46d0bd6bac28b6fc18ae11d00bc695d72e914e61acb6c6f3d04fbd8c5216a3` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP (mdp `crackmes.one`) contenant `windowsformsapp10.exe` |
| `analysis/windowsformsapp10-src/` | sources C# décompilées (`ilspycmd -p`) |
| `tools/ez-crackme-2-solve.py` | solveur / keygen (`-q`, `--date`, `--check`) |

## Réponse

Le code attendu dépend de la **date du jour** : `int(AAAAMMJJ) + 4777`.

```bash
python3 tools/ez-crackme-2-solve.py        # ex. 2026-11-11 -> 20265888
python3 tools/ez-crackme-2-solve.py -q
python3 tools/ez-crackme-2-solve.py --date 2026-11-11
```

| Jour | Code |
|---|---|
| 2026-11-11 | `20265888` |

Il n'y a pas de champ user/login : `petik` ne s'applique pas ici.

## Premier regard

- `download.bin` n'est pas un exécutable mais un ZIP chiffré (mot de passe `crackmes.one`) ; `strings` ne montre que `windowsformsapp10.exe` + du bruit deflate.
- Après extraction : PE .NET (marqueur `BSJB` présent), donc décompilation C# plutôt que désassemblage.
- Fenêtre « Very Ez Crackme By plikan » : une TextBox (pré-remplie avec le leurre `жёсткий_пароль_2001`) et un bouton « проверить свою ориентацию ».

## Flow

Clic sur le bouton → `button1_Click` lit la TextBox, la parse en `int` et la compare à une valeur calculée à partir de la date. Égalité : message de félicitations (russe, injurieux) ; sinon message d'échec. Un texte non numérique lève une `FormatException` (pas de try/catch).

## Comment on trouve

1. Extraction : `unzip -P crackmes.one original/download.bin` (dans un dossier vide sous `analysis/`).
2. Décompilation : `ilspycmd -p -o analysis/windowsformsapp10-src windowsformsapp10.exe` (l'alias `decompiledotnet` n'était pas disponible en shell non interactif).
3. `WindowsFormsApp10/Form1.cs`, `button1_Click` :

```csharp
DateTime today = DateTime.Today;
string text = "sobaka=pidoras1499";          // leurre, jamais utilisé
int num  = int.Parse(today.ToString("yyyyMMdd"));   // ex. 20261111
int num2 = num + 2777;                        // inutilisé
int num3 = num + 4777;                        // <-- la valeur attendue
int num4 = num + 3777;                        // inutilisé
int num5 = int.Parse(textBox1.Text);
if (num5 == num3) -> succès
```

Seul `num3` est comparé ; `num2`, `num4` et la chaîne `sobaka=…` sont des leurres. Confirmation dans l'IL brut (`ldc.i4` = `0x20` + imm32 LE) :

```
0920 d90a0000 58 1304   ; num2 = num + 0x0AD9 (2777)
0920 a9120000 58 1305   ; num3 = num + 0x12A9 (4777)
0920 c10e0000 58 1306   ; num4 = num + 0x0EC1 (3777)
... 1107 1105 fe01      ; ldloc num5 ; ldloc num3 ; ceq
```

Exemple : 2026-11-11 → `20261111 + 4777 = 20265888`.

## Vérification

- `python3 tools/ez-crackme-2-solve.py --check` : retrouve dans l'exe d'origine les trois `ldc.i4` (2777/3777/4777) et le format `yyyyMMdd` → OK.
- **Limite** : ni Wine ni Mono n'étaient disponibles sur la machine de travail, et un exe WinForms ne tourne pas sous `dotnet` Linux ; la preuve live (saisie dans la fenêtre) n'a donc **pas** pu être faite. La solution repose sur la lecture du C# décompilé et de l'IL. Cas KO attendu : toute autre valeur (ex. le texte par défaut → `FormatException`, `20261111` → « не пидорас »).

## Notes

- Le code change chaque jour ; utiliser `--date` pour un autre jour.
- Pas de GDB / debugger utilisé (reverse 100 % statique).
