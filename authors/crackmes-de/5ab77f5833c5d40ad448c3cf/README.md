# crackmes.de's keywizard_2 by disasmdisease

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3cf`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3cf) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (Disasm Disease) |
| **Plateforme** | Windows PE32, GUI, **VB.NET** (CLR 2.0, `diec` : Microsoft Linker 8.0) |
| **SHA-256 (zip)** | `5c2bd52e4ef84444f3f672fa06c6299442f6bd814734806b972cfd01bfb54235` |
| **Statut** | solved (keygen) |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/KeyWizard_2.zip` | archive d'origine (`KeyWizard 2.exe` + `Rules.txt`), non modifiée |
| `analysis/source/Form1.cs` | `Form1` décompilé (ilspycmd) : `Button1_Click`, `Encrypt`, `Salt` |
| `tools/keywizard2-solve.py` | keygen / `--check` (Python + `cryptography`) |
| `tools/keywizard2-netcheck.cs` + `.csproj` | recopie de `Encrypt` exécutée par le vrai runtime .NET (preuve croisée) |

`Rules.txt` : « Shouldn't be that easy this time · No patching · Make keygen · No use of Reflector · Write tutorial ». Ici on décompile avec **ilspycmd** (convention du dépôt) ; la règle « pas de Reflector » date de 2009, le but est éducatif.

## Réponse

Le nom doit faire **au moins 6 caractères** (`TextLength < 6` → `Form2`, « The name must contain at least 6 characters »). `petik` (5 car.) est refusé ; on prend le plus proche : **`petik1`**.

| Name | Serial |
|---|---|
| `petik1` | **`44xeptjQtrVWhIy/BPcRqQ==`** |

```bash
python3 tools/keywizard2-solve.py              # name='petik1' serial='44xeptjQtrVWhIy/BPcRqQ=='
python3 tools/keywizard2-solve.py -q "Hello World"   # yVhsSWDchWjImDqmT+Pxew==
python3 tools/keywizard2-solve.py --check '44xeptjQtrVWhIy/BPcRqQ==' petik1
```

## Premier regard

```bash
mkdir /tmp/kw2 && cd /tmp/kw2 && unzip -P crackmes.one .../original/KeyWizard_2.zip   # hors du dépôt
file "KeyWizard 2.exe"      # PE32 GUI, Mono/.Net assembly
diec "KeyWizard 2.exe"      # Linker 8.0, VB.NET, .NET CLR 2.0
cp "KeyWizard 2.exe" kw.exe && ilspycmd -p -o src kw.exe
```

Formulaires : `Form1` (Name / Serial / Register / About), `Form2` (nom trop court), `Form3` (« The serial you entered is not valid. »), `Form4` (« Nice, you did it! Now make a keygen. »), `Form5` (About).
(`decompiledotnet` n'était pas disponible dans le shell agent → `ilspycmd -p` directement.)

## Flow

`Form1.Button1_Click` (`analysis/source/Form1.cs`, l. 524) :

1. `len(name) < 6` → `Form2` ;
2. sinon `wstr = Encrypt(TextBox1.Text, TextBox1.Text)` — le nom sert **à la fois de donnée et de mot de passe** ;
3. `wstr == TextBox2.Text` (comparaison texte) → `Form4` (bon) ; sinon `Form3`.

Le serial est donc directement la sortie de `Encrypt(name, name)`. Rien n'est caché dans les ressources : le « pas si facile » de l'auteur = une vraie crypto au lieu d'un `Replace` (cf. KeyWizard 1).

## Comment on trouve

**Ancrage** : .NET → décompilation C#. Tout est dans `Form1.cs` : `Button1_Click` (l. 524), `Encrypt` (l. 549), le tableau statique `Salt` (l. 67). `Decrypt` et `HashPassword` (SHA1) sont du code de snippet inutilisé.

**`Encrypt` lu ligne par ligne :**

```csharp
var kdf = new Rfc2898DeriveBytes(Password, Salt);   // PBKDF2-HMAC-SHA1, 1000 itérations (défaut .NET)
var aes = Rijndael.Create();                         // AES, bloc 128, CBC + PKCS7 par défaut
aes.Key = kdf.GetBytes(32);                          // octets 0..31  du flux PBKDF2 -> clé AES-256
aes.IV  = kdf.GetBytes(16);                          // octets 32..47 (GetBytes continue le flux !) -> IV
... CryptoStream(... CreateEncryptor(), Write) ; Write(Encoding.Default.GetBytes(Data), 0, Data.Length)
return Convert.ToBase64String(ms.ToArray());
```

Points à ne pas rater :

* **Sel** = 32 octets constants : `64 56 22 35 0b e0 91 7b ed d5 0c 7c 2d 41 47 7f 87 a5 ea a4 7f ea e7 d3 0a 09 72 ea 2c 3f 4b 0c` (valeurs décimales dans la source, recopiées dans le solveur).
* `Rfc2898DeriveBytes(string, byte[])` : **SHA-1, 1000 itérations** (valeurs par défaut du constructeur) ; en Python `hashlib.pbkdf2_hmac('sha1', pw, salt, 1000, 48)`, puis clé = `[:32]`, IV = `[32:48]`. Les deux `GetBytes` consécutifs lisent un **flux continu**, pas deux dérivations séparées.
* Le mot de passe est encodé en UTF-8 par `Rfc2898DeriveBytes`, la donnée en `Encoding.Default` (ANSI) — identiques pour de l'ASCII. Le keygen est garanti pour des noms ASCII.
* Le texte clair fait `len(name)` octets, rembourré PKCS7 ; pour un nom de 6 à 15 car. → un seul bloc → serial Base64 de 24 car. (`==` final).

**Exemple `petik1`** : mot de passe/donnée `petik1` (6 octets) → PBKDF2 → AES-256-CBC → bloc de 16 octets `e3 8c 5e a6 d8 d0 b6 b5 56 84 8c bf 04 f7 11 a9` (hex) → Base64 **`44xeptjQtrVWhIy/BPcRqQ==`**.

Piège : on pourrait croire qu'il faut inverser quelque chose (le crackme est présenté comme plus dur) ; en fait, comme le serial n'est qu'une fonction directe du nom, il suffit de **rejouer** `Encrypt` — aucune clé n'est à retrouver.

## Vérification

* **Wine / binaire d'origine : non obtenu.** Dans cet environnement Wine ne démarre aucun exécutable (même un `h.exe` .NET 4.8 trivial lancé via `xvfb-run -a wine` reste bloqué sans sortie jusqu'au timeout). Comme pour KeyWizard 1, la GUI VB.NET sous Wine-Mono est de toute façon peu fiable. Les dialogues `Form2/3/4` ne sont donc **pas observés en live** ; ils sont lus dans le code.
* Preuve de repli : `tools/keywizard2-netcheck.cs` recopie **textuellement** `Encrypt` + `Salt` du décompilé et l'exécute avec le vrai runtime .NET 8 (`dotnet run -- petik1 "Hello World" abcdef`). Sortie **identique** au solveur Python :

| Nom | Serial (.NET) | Serial (`keywizard2-solve.py`) |
|---|---|---|
| `petik1` | `44xeptjQtrVWhIy/BPcRqQ==` | `44xeptjQtrVWhIy/BPcRqQ==` |
| `Hello World` | `yVhsSWDchWjImDqmT+Pxew==` | `yVhsSWDchWjImDqmT+Pxew==` |
| `abcdef` | `budwCV2DKf1nUJZ7CG0yWg==` | `budwCV2DKf1nUJZ7CG0yWg==` |

* KO : nom `petik` (5 car.) → `Form2` ; serial incorrect → `Form3` (lu dans `Button1_Click`).

Honnêteté : la validation de bout en bout contre l'exe (dialogue « Nice, you did it! ») n'a **pas** pu être faite ; la logique vient du décompilé et est recoupée avec le runtime .NET. Seule différence possible : `Encoding.Default` (code page ANSI de Windows) pour les noms non ASCII.

## Notes

* Aucun GDB / x64dbg / IDA utilisé (100 % statique .NET).
* Chaque nom a son propre serial (pas de collision structurelle comme KeyWizard 1) ; `PKCS7` fait varier la longueur du Base64 : 24 car. pour 6–15 car., 44 pour 16–31, etc.
