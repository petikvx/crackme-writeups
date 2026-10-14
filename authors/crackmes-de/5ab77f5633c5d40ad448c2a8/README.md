# cryxenet_0.01a by tfb

| | |
|---|---|
| Page | [crackmes.one/crackme/5ab77f5633c5d40ad448c2a8](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2a8) |
| Auteur | crackmes.de / tfb |
| Plateforme | Windows x86, VB.NET (CLR 1.1), Dotfuscator |
| Difficulté | 2.0 |
| Type | UnpackMe .NET (protecteur « Cryxe ») + keygenme nom / Customer ID / serial |
| Statut | **résolu** — unpack statique + keygen |

## Solution

| Nom | Customer ID | Serial |
|---|---|---|
| `petik` | `1337` | **`vZTpXAO4f3DA2UcpwcWRZg==`** |
| `John` | `12345` | `LoIU/pD/OxK2M8p70D2cCQ==` |

```bash
python3 tools/cryxenet_0.01a-solve.py petik 1337
python3 tools/cryxenet_0.01a-solve.py --unpack original/Release/cryxed.dll analysis/cryxed-decrypted.exe
```

## Contenu de l’archive

`original/Release.zip` → `original/Release/` :

- `unpackme.EXE` — le **loader** Cryxe (14 Ko, VB.NET, Dotfuscator) ;
- `cryxed.dll` — en fait **l’assembly protégée chiffrée** (`file` : `data`) ;
- `readme.txt` / `todo.txt` — consignes : dépacker, puis patcher ou keygenner le keygenme pour obtenir le good boy.

Fonctions annoncées du protecteur : chiffrement d’assembly, anti-dumper, anti-Reflector, obfuscation, anti-debug, chaînes chiffrées.

## 1. Le loader `unpackme.EXE`

Décompilation : `ilspycmd -o analysis/loader-src original/Release/unpackme.EXE`
(`decompiledotnet` dans un shell interactif).

Le formulaire « Protected With Cryxe » affiche une nag et un bouton **Open**. Son handler `b(object, EventArgs)` est noyé sous du code mort (`num4 = 99; num6 = 89; num7 = num4*num6; …` répété) ; une fois nettoyé il reste :

```csharp
int key = int.Parse(37.ToString("x"), NumberStyles.HexNumber); // "25" -> 0x25
if (IsDebuggerPresent() + 99 == 99) {                             // anti-debug kernel32
    // lit cryxed.dll entièrement dans d[]
    for (j = 0; j < len; j++) {
        int v = d[j] - 1;
        v ^= key;                                                 // ^ 0x25
        if (v > 255) v -= 256;
        if (v < 0)   v += 256;
        d[j] = (byte)v;                                           // (e[]/f[] = leurres)
    }
    Close();
    new Thread(c).Start();      // c() : Assembly.Load(d).EntryPoint.Invoke(null, null)
    Thread.Sleep(1000);
    Array.Clear(d)…             // efface le buffer (anti-dump), toujours entouré de code mort
} else
    MessageBox.Show(a("kom/Wb1q…", "1357924680"));
```

Piège de lecture : la chaîne `"25"` vient de `37.ToString("x")`, donc la clé XOR est **0x25** et non 0x37.

La chaîne chiffrée du `else` utilise la même routine AES que le keygenme (voir § 2) avec la clé `1357924680` complétée par des `X` : elle vaut `Debugger detected! Please close it and restart the application!`.

### Unpack

Le déchiffrement tient en une ligne, par octet :

$$ b' = ((b - 1) \bmod 256) \oplus \mathtt{0x25} $$

Résultat : `analysis/cryxed-decrypted.exe`, un PE32 .NET (`MZ\x90\x00…`, 4 sections) directement lisible par ilspycmd → `analysis/inner-src/`. Aucune exécution n’est nécessaire, donc l’anti-debug et l’effacement mémoire n’ont aucun effet sur cette approche statique.

## 2. Le keygenme interne « CryxeNet 0.01a Unpackme »

Trois champs : `TextBox1` (« Enter name here »), `TextBox2` (« Enter Customer ID here »), `TextBox3` (« Enter serial here ») et un bouton **Check** :

```csharp
if (StringType.StrCmp(TextBox1.Text,
        DecryptString128Bit(TextBox3.Text, TextBox2.Text), false) == 0)
    MessageBox.Show("The serial is correct!");
else
    MessageBox.Show("Serial is incorrect");
```

`DecryptString128Bit(serial, customerId)` :

- clé = Customer ID tronqué à 32 caractères, ou complété avec des `X` jusqu’à 32 → **AES-256** (`RijndaelManaged`, bloc 128, CBC, PKCS7 par défaut) ;
- IV fixe `79 F1 0A 01 84 4A 0B 27 FF 5B 2D 4E 0E D3 16 3E` ;
- le serial est décodé en **Base64**, déchiffré, puis débarrassé de ses `\0` (`StripNullCharacters`).

Toute exception (Base64 invalide, padding faux) tombe dans le `catch` et donne « Serial is incorrect ».

### Keygen

Le chiffrement est réversible, il suffit de chiffrer le nom :

$$ \text{Serial} = \text{Base64}\big(\text{AES-256-CBC}_{K,\,IV}(\text{Nom})\big),\quad K = \text{pad}_X(\text{CustomerID}, 32) $$

`tools/cryxenet_0.01a-solve.py` fait ça avec `cryptography` et vérifie l’aller-retour.

## Vérification

- `tools/cryxenet_0.01a-solve.py` : `check : True` pour `petik`/`1337` et `John`/`12345`.
- `tools/verify-dotnet/` : petit programme .NET 8 contenant une copie fidèle de `DecryptString128Bit` (mêmes `RijndaelManaged` / `CryptoStream` .NET) ; avec `petik` / `1337` / `vZTpXAO4f3DA2UcpwcWRZg==` il affiche `The serial is correct!`, et avec le Customer ID `1338` il affiche `Serial is incorrect` (sortie dans `analysis/verify-dotnet.txt`).
- Limite : l’assembly d’origine est un exécutable WinForms 1.1, et son type `Form1` ne se charge pas par réflexion sous .NET 8 Linux (`ReflectionTypeLoadException`, pas de `System.Windows.Forms`). La GUI n’a pas été pilotée sous Wine ; la preuve repose sur le prédicat décompilé exécuté par le runtime .NET.

## Suggestions pour le protecteur (demandées par l’auteur)

- La clé XOR d’un octet et le `-1` se retrouvent en clair dans le loader : il faudrait une vraie clé dérivée (et pas stockée à côté) et un chiffrement fort de l’assembly.
- `Assembly.Load(byte[])` livre l’assembly complète en mémoire : un hook ou un simple dump suffit, effacer le buffer après 1 s ne protège pas.
- Le code mort `num4/num6/num7` est trivial à filtrer et ne change pas le flux.

## Fichiers

- `original/Release.zip`, `original/Release/` — archive et fichiers d’origine (non modifiés)
- `analysis/loader-src/` — loader décompilé (ilspycmd)
- `analysis/cryxed-decrypted.exe` — assembly déchiffrée
- `analysis/inner-src/` — keygenme interne décompilé
- `analysis/verify-dotnet.txt` — sortie de vérification
- `tools/cryxenet_0.01a-solve.py` — unpacker + keygen
- `tools/verify-dotnet/` — vérificateur .NET 8 (`dotnet run -- <nom> <cid> <serial> <assembly>`)
