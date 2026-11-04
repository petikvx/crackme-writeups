# crackmes.de's crackme_didnt_think_about_a_name (CrackMe.exe) by grzzlwmpf

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3f0`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3f0) |
| **Auteur (site)** | crackmes.de (grzzlwmpf) |
| **Plateforme** | Windows PE32 .NET (CLR 4.0, WinForms), non packé |
| **SHA-256 zip** | `8520b945384e942600a40979348859b319dccc46b67f33e660eddd1d7a2c092b` |

Voir [`ORIGIN.yml`](ORIGIN.yml). Mot de passe du ZIP : `crackmes.one`.

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/CrackMe.zip` | archive d'origine (`CrackMe.exe` + `ReadMe.txt`), intacte |
| `analysis/source/Encryption.cs`, `Form1.cs` | C# décompilé (ilspycmd) |
| `tools/crackme-didnt-think-solve.py` | keygen + `--check` contre le vrai `Encryption.EncryptString` du binaire |

## Réponse

Le `ReadMe.txt` propose 4 voies : lire la MsgBox d'échec, patcher, keygen, ou backdoor.

| name | serial |
|---|---|
| **`petik`** | **`WEGcZUQrn9fMXYkv+GElMw==`** |
| `Grzzlwmpf` | `y+cVLuEDBhoz/Hm0UDtZldcqeXilBs04kbDgIKUl7Os=` |
| *backdoor* | name=`Grzzlwmpf`, serial=`backdoor` |

```bash
python3 tools/crackme-didnt-think-solve.py            # petik
python3 tools/crackme-didnt-think-solve.py petik -q
python3 tools/crackme-didnt-think-solve.py petik --check
```

## Premier regard

```bash
unzip -P crackmes.one original/CrackMe.zip -d /tmp/cm3     # hors du dépôt
file /tmp/cm3/CrackMe.exe   # PE32 GUI, Mono/.Net assembly
diec  /tmp/cm3/CrackMe.exe  # .NET Framework CLR 4.0.30319, Visual Studio
```

Les `strings` montrent aussi une DLL embarquée « DarkFire » (rootkit/anti-sandbox) dans les ressources : leurre/bruit, jamais appelée par le chemin de vérification.

## Flow

Fenêtre « CrackMe » : `textBox1` (Name), `textBox2` (Serial), bouton **Check!** → `Form1.button1_Click`.

## Comment on trouve

Décompilation (l'alias `decompiledotnet` est absent de cette machine, appel direct) :

```bash
ilspycmd -p -o /tmp/cm3/src /tmp/cm3/CrackMe.exe     # -> CrackMe/Form1.cs, CrackMe/Encryption.cs
```

`button1_Click` :

```csharp
if (textBox2.Text == Encryption.EncryptString(textBox1.Text, textBox1.Text))   // serial légitime
    MessageBox.Show("Good Job. ...");
if (textBox1.Text == "Grzzlwmpf" && textBox2.Text == "backdoor")                // backdoor
    MessageBox.Show("I see you've found my backdoor. Nice.");
```

Le serial est donc le chiffrement du nom **avec le nom comme mot de passe**. `Encryption.EncryptString(clear, pwd)` :

1. `bytes = UTF-16LE(clear)` ;
2. `PasswordDeriveBytes(pwd, salt)` avec salt = `49 76 61 6e 20 4d 65 64 76 65 64 65 76` = `"Ivan Medvedev"` (hash SHA-1 et 100 itérations par défaut) ;
3. `key = GetBytes(32)`, `iv = GetBytes(16)` ; `Rijndael.Create()` = AES-128-bloc, CBC, PKCS7 ;
4. résultat en Base64.

Le serial est donc forcément un Base64 de 24/44/… caractères dérivé du nom.

### Reproduire `PasswordDeriveBytes` en Python (piège)

C'est la seule difficulté. L'algorithme (PBKDF1 « étendu ») :

- `base = SHA1^(99)(pwd || salt)` ;
- `b0 = SHA1(base)` (= PBKDF1 classique, 100 hashs) ; `bN = SHA1(str(N) || base)` pour N ≥ 1.

Première tentative naïve : flux continu `b0||b1||b2…`, key = octets 0‥31, IV = octets 32‥47. Résultat **faux** (serial différent du binaire). En instrumentant `PasswordDeriveBytes("petik", salt)` sous dotnet :

```
key = 4D11D965 72180C4A C2EAC61A 67CFE816 0CF71E16 | 36357017 48AE8C06 1147A351
iv  = C2EAC61A 67CFE816 | 07B94291 BA06EF2E
```

- `key = b0 (20 octets) || b1[:12]` : conforme ;
- mais `iv = b0[8:16] || b2[:8]` : les 8 octets restants de `b1` ne sont pas réutilisés, un morceau périmé de `b0` est servi à la place (bug connu de `PasswordDeriveBytes` .NET sur deux `GetBytes` consécutifs), puis le bloc suivant `b2`.

Étape par étape pour **`petik`** : `base` → `b0 = 4d11d965…1e16`, `b1 = 36357017…`, `b2 = 07b94291…` → key/iv ci-dessus → AES-256-CBC de `70 00 65 00 74 00 69 00 6b 00` (+ padding PKCS7 → 16 octets) → Base64 `WEGcZUQrn9fMXYkv+GElMw==`.

## Vérification

`--check` compile un petit harnais dotnet qui charge **le vrai `CrackMe.exe`** par reflection et appelle `CrackMe.Encryption.EncryptString(name, name)` — c'est exactement le membre droit de la comparaison de `button1_Click`. (L'assembly est marqué 32BITREQUIRED : le solveur en fait une **copie temporaire** avec ce flag effacé pour la charger dans un dotnet x64 ; `original/` n'est jamais touché.)

```text
$ python3 tools/crackme-didnt-think-solve.py petik --check
name=petik
serial=WEGcZUQrn9fMXYkv+GElMw==
binaire : WEGcZUQrn9fMXYkv+GElMw==
CHECK OK
```

Aussi OK pour `Grzzlwmpf`, `a longer name here!`, `x`, `é`. Cas KO : un serial différent (ex. celui de `petik` avec le nom `x`) ne peut pas égaler la sortie ci-dessus → « Nope. Guessing is not allowed. ». La GUI n'a pas été lancée sous Wine : la preuve porte sur la fonction de comparaison réelle, pas sur un clic dans la fenêtre.

## Notes

- Pas de GDB ni de debugger utilisé : reverse 100 % statique + exécution du code .NET d'origine.
- `Form1.Memory.flood()` (allocation infinie de 13×9 Mo) n'est jamais appelé.
- Le nom est utilisé comme mot de passe en UTF-8 par `PasswordDeriveBytes(string, …)` ; le solveur fait pareil (testé avec `é`).
