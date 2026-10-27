# DotNet Series #1 (jim_dotnet_series_1) — JiM~

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c38a`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c38a) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (JiM~) |
| **Plateforme** | Windows PE32 GUI, .NET (WinForms), x86 |
| **SHA-256 (zip)** | `0489eec57349d4f61417ae3b61d25e54639c0247b7f457093d7725f22bb48500` |
| **Règles (readme.txt)** | « no patching. no self-keygen. » |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/jim_dotnet_series_1.zip` | archive d'origine (mot de passe `crackmes.one`) : `jim_dotnet_series_1.exe` + `readme.txt` |
| `analysis/x/` | contenu extrait (copie de travail) + `analysis/x/src/` = C# décompilé (ilspycmd 8.2, `-p`) |
| `tools/jim-dotnet-series-1-solve.py` | keygen (`--user`, `-q`, `--check`) |
| `tools/verify-dotnet/` | harnais .NET 8 qui charge l'exe d'origine par réflexion et rejoue le check avec la vraie `_.SuperString` |

## Réponse

Le crackme a **3 entrées** : `name`, `key` (hex) et 6 cases `A..F` (« code »). La clé dépend aussi du **nom d'utilisateur Windows** (`Environment.UserName`) de la machine qui lance le crackme (sous Wine : `box` ici).

| name | UserName | key | cases à cocher |
|---|---|---|---|
| `petik` | `box` | **`626F7858504554494B`** | **A, C** (1+4 = 5 = len) |
| `petik` | `alice` | `616C69636558504554494B` | A, C |

```bash
python3 tools/jim-dotnet-series-1-solve.py petik --user box     # name=petik user=box key=626F7858504554494B cases=AC
python3 tools/jim-dotnet-series-1-solve.py -q petik             # key seule (user = getpass.getuser())
python3 tools/jim-dotnet-series-1-solve.py petik --user box --check 626F7858504554494B   # OK
```

## Premier regard

```bash
unzip -P crackmes.one original/jim_dotnet_series_1.zip -d analysis/x
file analysis/x/jim_dotnet_series_1.exe   # PE32 GUI, Intel i386 Mono/.Net assembly
ilspycmd -p -o analysis/x/src analysis/x/jim_dotnet_series_1.exe   # (wrapper decompiledotnet absent sur cette machine)
```

Fenêtre « JiM~ DotNet Series #1 » : `textBox1` (name), `textBox2` (key), six `CheckBox` `cb1..cb6` (A..F), boutons Check / About. Pas d'obfuscation : 2 classes utiles, `frm` et `_.SuperString`.

## Flow

`frm.btnCheck_Click` :

1. rejette si name vide, key vide ou **longueur de key impaire** (`Invalid. Try again.`) ;
2. `s1 = SuperString(name)`, `s2 = SuperString(key)` puis `s2.expand()` ;
3. `s3 = SuperString(s1) + SuperString(Environment.UserName)` ;
4. `num7 = cb1 + 2·cb2 + 4·cb3 + 8·cb4 + 16·cb5 + 32·cb6` ;
5. succès (`Valid! Good work! Now show me a keygen ;)`) ssi `s3.Equals(s2)` **et** `num7 == name.Length`.

## Comment on trouve le prédicat

**Ancrage** : décompilation C# (`analysis/x/src/jim_dotnet_series_1/frm.cs`, méthode `btnCheck_Click`, et `analysis/x/src/_/SuperString.cs`). Tout le sens est dans `SuperString`, dont les noms sont trompeurs :

- `SuperString(SuperString s)` : constructeur « copie » qui fait en réalité `s.str.ToUpper()` → `s1` copié = **nom en majuscules** (le `s1` d'origine, lui, garde sa casse : c'est pour ça que la longueur testée est celle du nom brut).
- `expand()` : lit la chaîne par **paires hexadécimales** (`int.Parse(sub(i,2), HexNumber)` → `char`). Donc `key` = hex ASCII de la chaîne attendue. Piège : la boucle `i <= len-2` ignore silencieusement un éventuel caractère final, mais la longueur paire est déjà imposée.
- `operator +(a, b)` (a = nom MAJ, b = UserName) :
  ```csharp
  for (i = 1; i < a.Length; i++) a = a.Substring(i) + a.Substring(0, i);                 // rotation GAUCHE de i
  for (i = 1; i < b.Length; i++) b = b.Substring(b.Length-i) + b.Substring(0, b.Length-i); // rotation DROITE de i
  return b + "X" + a;
  ```
  Les rotations sont **cumulées** (1, puis 2, …, len-1) ; on les rejoue simplement dans le solveur sans chercher de formule fermée. Ordre du résultat : `b'` (user) **avant** `a'` (nom), séparés par `X` (0x58).

**Assemblage pour `petik` / user `box`** :

1. `a = "PETIK"` : rotations 1+2+3+4 = 10 ≡ 0 mod 5 → `PETIK` inchangé (vérifié en jouant la boucle) ;
2. `b = "box"` : 1+2 = 3 ≡ 0 mod 3 → `box` ;
3. attendu = `boxXPETIK` → hex : `62 6F 78 58 50 45 54 49 4B` → **`626F7858504554494B`** ;
4. `len("petik") = 5 = 0b000101` → cocher **A** (1) et **C** (4).

Exemple où la rotation compte : `abcd` + user `alice` → `aliceXCDAB` (le nom `ABCD` subit 1+2+3 = 6 ≡ 2 mod 4 → `CDAB`).

Limite : `len(name)` doit tenir sur 6 bits → 1..63 caractères.

**Pièges** : (1) la clé est **liée à la machine** via `UserName` (aucune clé universelle ; le keygen prend `--user`) ; (2) `SuperString(SuperString)` n'est pas une copie mais un `ToUpper` ; (3) l'ordre `user + X + nom` est inversé par rapport à l'ordre des opérandes ; (4) casse du nom ignorée pour la clé mais pas pour la longueur.

## Vérification

**Live GUI : impossible ici.** Sous Wine 10 (`xvfb-run`/Xvfb), le wine-mono du prefix plante au démarrage (`err:virtual:virtual_setup_exception stack overflow` dans le process .NET), aucune fenêtre n'apparaît ; pas de `mono` natif ni de .NET Framework réel installable hors-ligne. Cette tentative est notée honnêtement : il n'y a **pas** de screenshot.

**Vérification de remplacement, sur le binaire d'origine** : `tools/verify-dotnet` charge `jim_dotnet_series_1.exe` (via `Assembly.LoadFrom`, runtime .NET 8) et exécute **la vraie `_.SuperString` de l'exe** (ctor, copie MAJ, `expand`, `operator +`, `Equals`) exactement comme `btnCheck_Click` ; seule la partie WinForms (lecture des TextBox / CheckBox, `MessageBox`) est reproduite à la main, la condition `num7 == len` étant calculée par le solveur.

```bash
cd tools/verify-dotnet && ~/.dotnet/dotnet build -o /tmp/verify-out
E=../../analysis/x/jim_dotnet_series_1.exe
K=$(python3 ../jim-dotnet-series-1-solve.py -q petik --user box)
~/.dotnet/dotnet /tmp/verify-out/verify.dll $E petik $K box                  # expected=boxXPETIK equal=True len=5
~/.dotnet/dotnet /tmp/verify-out/verify.dll $E petik ${K}00 box              # equal=False (KO)
~/.dotnet/dotnet /tmp/verify-out/verify.dll $E petik 626F7858504554494C box  # equal=False (dernier octet K→L)
~/.dotnet/dotnet /tmp/verify-out/verify.dll $E abcd $(python3 ../jim-dotnet-series-1-solve.py -q abcd --user alice) alice  # aliceXCDAB equal=True
```

Résultats observés : OK pour `petik`/`box`, `petik`/`alice`, `abcd`/`alice`, `Jim Beam 42`/`box` ; KO pour les clés altérées.

## Notes

- Reverse 100 % statique (décompilation C#) ; ni GDB, ni x64dbg, ni IDA → pas de section « Debug GDB ».
- Ce n'est pas un check de nom/serial classique : la clé change d'une machine à l'autre, et les cases A..F encodent la longueur du nom en binaire.
- Le « no self-keygen » du readme s'entend comme « ne pas faire coder le crackme lui-même » ; le keygen ici est externe.
- `original/` intact (zip non modifié).
