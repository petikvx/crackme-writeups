# crackmes.de's keywizard_1 by disasmdisease

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3ce`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3ce) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (Disasm Disease) |
| **Plateforme** | Windows PE32, GUI, **VB.NET** (CLR 2.0, `diec` : Microsoft Linker 8.0) |
| **SHA-256 (zip)** | `d74858ddfe357cbaccf2c06878302e9ee9fe51534a3adfdc99420238aa2d0396` |
| **Statut** | solved (keygen) |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/KeyWizard_1_Ready.zip` | archive d'origine (`Rules.txt` + `KeyWizard 1.exe`), non modifiée |
| `analysis/source/Form1.cs` | `Button1_Click` décompilé (ilspycmd) |
| `tools/keywizard1-solve.py` | keygen / `--check` |
| `tools/keywizard1-vbcheck.cs` | preuve : même suite de `Strings.Replace` / `Chr` / `Right` avec le vrai runtime VB (Wine-Mono) |
| `tools/keywizard1-harness-failed.cs` | tentative (échouée, voir Vérification) d'appeler le vrai `Button1_Click` par réflexion |

`Rules.txt` : « No patching · Make keygen · No use of Reflector » (médaille d'or = keygen). Ici on a décompilé avec **ilspycmd** (convention du dépôt) ; la règle « pas de Reflector » est celle de l'auteur en 2009, le but ici est éducatif.

## Réponse

Le nom doit faire **au moins 6 caractères** (`TextLength < 6` → `Form2`, message d'erreur). `petik` (5 car.) est donc refusé ; on prend le plus proche : **`petik1`**.

| Name | Serial |
|---|---|
| `petik1` | **`WEFHANN1`** |

```bash
python3 tools/keywizard1-solve.py            # name='petik1' serial='WEFHANN1'
python3 tools/keywizard1-solve.py -q "Hello World"   # CAKEAJKH
python3 tools/keywizard1-solve.py --check WEFHANN1 petik1
```

## Premier regard

```bash
unzip original/KeyWizard_1_Ready.zip -d /tmp/kw        # hors du dépôt
file "/tmp/kw/KeyWizard 1.exe"   # PE32 GUI, Mono/.Net assembly
diec  "/tmp/kw/KeyWizard 1.exe"  # Linker 8.0, VB.NET, .NET CLR 2.0
ilspycmd -p -o src kw.exe        # (copie de l'exe dans un dossier de travail)
```

`strings` ne dit rien d'utile (ressources bitmap/icône). Formulaires : `Form1` (Name / Serial / Register / About), `Form2` (nom trop court), `Form3` (mauvais serial), `Form4` (bon serial).

## Flow

`Form1.Button1_Click` (`analysis/source/Form1.cs`) :

1. `len(name) < 6` → `Form2` ;
2. sinon `wstr = transform(name)` ;
3. `wstr = Right(wstr, 8)` ; comparaison **binaire** avec le champ Serial → `Form4` (OK) ou `Form3` (KO).

Le serial est donc simplement la sortie de la transformation : pas de base de données, pas de secret.

## Comment on trouve

**Ancrage** : .NET → décompilation C# ; tout est dans `Button1_Click` (le seul handler non trivial, `Form1.cs` l. 514-565).

**Étape 1 – boucle de décalage.**

```vb
num = 65
Do
  wstr = Replace(wstr, Chr(num), Chr(num - 19), 1, -1, Binary)   ' remplace TOUTES les occurrences
  num += 1
Loop While num <= 255
```

Chaque octet `c ≥ 65` devient `c − 19`. Pas de cascade : le résultat `c−19` est plus petit que l'itération courante, donc jamais re-traité. Les caractères `< 65` (chiffres, espace, `!`…) restent inchangés.
Conséquences : majuscules `A..Z` (65..90) → `.`,`/`,`0-9`,`:`,`;`,`<`,`=`,`>`,`?`,`@`,`A..G` ; minuscules `a..z` (97..122) → `N..g`. Donc **`a..m` deviennent `N..Z`**, ce que l'étape suivante cible.

**Étape 2 – table N..Z.** Treize `Replace` séquentiels (ordre N, O, … Z) remplacent chaque lettre par un bloc de 8 caractères :

| Lettre | Bloc | | Lettre | Bloc |
|---|---|---|---|---|
| N | `7A(C(KAL` | | U | `RAPHHUXA` |
| O | `AC(/3AVK` | | V | `D7A)(HAK` |
| P | `9!?988DA` | | W | `ECMLEKKK` |
| Q | `CAKEAJKH` | | X | `AWEFHANN` |
| R | `CAEK8462` | | Y | `EWJKANBX` |
| S | `TUAIJKEW` | | Z | `NOCPWWXY` |
| T | `AMM(X/78` | | | |

Piège : les remplacements sont **séquentiels sur la chaîne entière**, donc un bloc inséré peut contenir une lettre traitée plus tard (ex. `O`→`AC(/3AVK` contient `V`, remplacé ensuite par `D7A)(HAK` ; `Z`→`NOCPWWXY` contient `N`/`O`/… mais N..Y sont déjà passés, donc inchangé). Le solveur reproduit l'ordre exact, d'où un résultat identique au runtime VB.

**Étape 3 – `Right(wstr, 8)`** : seuls les 8 derniers caractères comptent, donc seuls les derniers caractères du nom influent (un bloc complet de 8 si le dernier caractère est `a..m`).

**Exemple `petik1`** :

| Étape | Résultat |
|---|---|
| shift −19 | `p`(112)→`]`, `e`(101)→`R`, `t`(116)→`a`, `i`(105)→`V`, `k`(107)→`X`, `1` inchangé → `]RaVX1` |
| table | `R`→`CAEK8462`, `V`→`D7A)(HAK`, `X`→`AWEFHANN` → `]CAEK8462aD7A)(HAKAWEFHANN1` |
| `Right 8` | **`WEFHANN1`** |

Limite : `Chr()` pour n > 127 dépend de la page de code ANSI ; le keygen est garanti pour des noms ASCII.

## Vérification

* Tentative live GUI : `wine "KeyWizard 1.exe"` (prefix par défaut) plante (stack overflow, `mscoreei.dll` absent) ; avec un prefix neuf + wine-mono (`xvfb-run -a`) l'exécutable démarre mais lève `System.NotImplementedException` dans `System.Drawing.Font.FromHfont` (limitation de wine-mono) à la création de la fenêtre → **pas de capture ni de clic réel sur Register**. Même échec en instanciant des `TextBox` pour appeler `Button1_Click` par réflexion (`keywizard1-harness-failed.cs`).
* Preuve de repli : `tools/keywizard1-vbcheck.cs` recopie la séquence exacte (`Strings.Replace`/`Chr`/`Right`, `CompareMethod.Binary`) avec la **vraie bibliothèque Microsoft.VisualBasic**, compilée (`mcs`) et exécutée sous Wine-Mono. Sur 8 noms (`petik1`, `petikk`, `Hello World`, `abcdefgh`, `Zorro mn`, `PETIK-2026`, `x9!?zzzzzz`, `mnopqrstuvwxyz`) la sortie est **identique** à `keywizard1-solve.py` (ex. `petik1→WEFHANN1`, `PETIK-2026→A68-2026`, `Zorro mn→OCPWWXY[`).
* KO : nom `petik` (5 car.) → `Form2` ; mauvais serial → `Form3`. Ces dialogs n'ont pas pu être observés sous Wine (cf. ci-dessus), ils sont lus dans le code.

Honnêteté : la validation de bout en bout contre le binaire (dialogue « bon serial ») n'a **pas** été obtenue ; la logique est déduite du décompilé et recoupée avec le runtime VB.

## Notes

* Aucun GDB / x64dbg / IDA utilisé (100 % statique .NET).
* Plusieurs noms donnent le même serial (seuls les ~8 derniers caractères comptent) ; le crackme n'a pas de lien nom↔serial plus fort.
