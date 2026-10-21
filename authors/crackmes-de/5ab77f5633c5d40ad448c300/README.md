# crackmes.de's crackme_extreme_v1.0 by the_rapture

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c300`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c300) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | the_rapture (famille locale `crackmes-de`) |
| **Plateforme** | Windows PE32, VB.NET (WinForms) |
| **SHA-256 (zip)** | `dcf8dbef9a37cd15eaf79f93b91d449cea946ca876708f7519de02859c0e89c6` |
| **SHA-256 (exe)** | `40f67738fd4784af098aced3223e8c4b536f77fdfd97ae60551643fd2e4b1d89` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/CrackMe_Extreme_v1.0.zip.zip` | archive d'origine (contient `CrackMe Extreme v1.0.exe`, `readme.txt`, un fichier `Name+Serials.txt`) |
| `tools/extreme-solve.py` | extrait les deux serials directement de l'assembly (`-q`, `--check`) |

## Réponse

| Étape | Saisie |
|---|---|
| Bouton **Serial** → *Check The Serial* | **`c60r4a26c4k89m6e3-rapture`** |
| Bouton **Serial/Name** (ouvert ensuite) | Name : `petik` (n'importe quoi, non vérifié) — Serial : **`r2a6p4t8u9r6e3`** |
| Nags | 3 `MsgBox` "Remove Me Number 1/2/3" au démarrage (`Form1_Load`) — à patcher si on veut les supprimer |

```bash
python3 -I tools/extreme-solve.py          # affiche les deux serials
python3 -I tools/extreme-solve.py -q       # serials seuls
python3 -I tools/extreme-solve.py --check  # assert sur les littéraux extraits du binaire
```

## Premier regard

```
file CrackMe\ Extreme\ v1.0.exe  → PE32 GUI, Mono/.Net assembly
```

Règle affichée dans l'appli (`Form3`) : « get the right serials and also wipe out the nag screens ». Hint (`Form5`) : « The End Tag For The Serial Is -rapture ».
Le zip contient aussi un fichier `Name+Serials.txt` de l'auteur ; on l'a ignoré pour reverser et on ne s'en sert que pour comparer à la fin.

## Flow

1. `Form1` (menu) : `Form1_Load` affiche 3 MsgBox (nags). Boutons : *Serial* → `Form4`, *About/Rules* → `Form2`, *Close*.
2. `Form4.checkbtn_Click` : compare la saisie à un littéral ; si OK → MsgBox « cracked this part » puis `Form6.Show()`.
3. `Form6.checkbtn2_Click` : compare le serial à un 2e littéral → « This CrackMe is Officially Solved ».

## Comment on trouve

- **Ancrage** : assembly .NET → `ilspycmd -p -o src "CrackMe Extreme v1.0.exe"` (équivalent du wrapper `decompiledotnet`, qui est absent du shell non interactif ici). Pas besoin d'IDA/GDB/x64dbg.
- **Lecture** (`Form4.cs`) :

  ```csharp
  string text  = serialtxt.Text;
  string text2 = "c60r4a26c4k89m6e3-rapture";          // littéral en dur
  if (Operators.CompareString(text, text2, false) == 0) { ... Form6.Show(); }
  ```

  `Form6.cs` : même schéma avec `"r2a6p4t8u9r6e3"`. Le nom lu (`nametxt.Text`) est affecté à `"rapture-crackme"` dans une variable locale **jamais utilisée** : il n'intervient pas dans le test.
- **Confirmation IL** (`ilspycmd -il`) : `ldstr "c60r4a26c4k89m6e3-rapture"` suivi du `call Operators::CompareString` ; idem pour `"r2a6p4t8u9r6e3"`.
- **Décodage** : rien à décoder. Le serial 1 a la structure `c60 r4 a26 c4 k89 m6 e3` = lettres de « cracke » intercalées avec des nombres, + le suffixe `-rapture` annoncé par le hint ; le 2e = `r2 a6 p4 t8 u9 r6 e3` (lettres de « rapture » + chiffres). Pur obscurcissement visuel.
- **Solveur** : `tools/extreme-solve.py` parse le ZIP, la table de métadonnées .NET (`#US` heap) et cherche les `ldstr` suivis d'un `call` MemberRef (CompareString) ; il prend le littéral qui précède chaque message de succès.
- **Pièges** : l'exe est une appli WinForms : les `Form*` partagent un `Form1_Load` à 3 nags, qui ne sont pas liés aux serials.

## Vérification

- `--check` : OK (littéraux extraits du binaire d'origine = les deux serials ci-dessus) ; cohérent avec le décompilé C# et l'IL.
- **Pas de preuve GUI live** : sous `xvfb-run -a wine` l'appli ne présente aucune fenêtre visible dans cet environnement (aucune fenêtre X sauf la racine après 20 s, wine-mono présent) ; vérification par lecture du décompilé / IL et extraction automatique des littéraux.
- Cas KO : toute autre saisie → MsgBox « Wrong Serial » / « Wrong Serial/Name » (`CompareString` ≠ 0).
- Comparaison finale avec le `Name+Serials.txt` de l'auteur : mêmes valeurs (`c60r4a26c4k89m6e3-rapture`, `r2a6p4t8u9r6e3`).

## Notes

- Comparaison **sensible à la casse** (`CompareString(..., false)`).
- Le nom du 2e écran est décoratif (`rapture-crackme` n'est qu'une affectation morte).
