# ORBITZ's BabyDotNet

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ac44fe1cdee6e086a1735ef) · id `6ac44fe1cdee6e086a1735ef`

PE64 **.NET 10** WinForms (apphost + `BabyDotNet.dll`). Diff. site **1.0**. Description : *Get the username and password*.

| Fichier | Rôle |
|---|---|
| [`original/BabyDotNet.exe`](original/BabyDotNet.exe) | apphost natif (.NET 10.0.11) |
| [`original/BabyDotNet.dll`](original/BabyDotNet.dll) | assembly WinForms |
| [`original/BabyDotNet/`](original/BabyDotNet/) | sources C# (projet + `Form1.cs`) |
| [`original/BabyDotNet.sln`](original/BabyDotNet.sln) | solution VS |
| [`tools/baby-dotnet-solve.py`](tools/baby-dotnet-solve.py) | username / password / flag / `--check` |

## Réponse

| | |
|---|---|
| **Username** | `$K1LL` |
| **Password** | `1SSU3` |
| **Flag** | `CMO{$K1LL_1SSU3}` |
| OK | `GG, YOU WIN!!` + `FLAG: CMO{$K1LL_1SSU3}` |
| KO | `Invalid username or password.` |

```bash
python3 tools/baby-dotnet-solve.py
# username $K1LL
# password 1SSU3
# flag     CMO{$K1LL_1SSU3}
python3 tools/baby-dotnet-solve.py -q
# CMO{$K1LL_1SSU3}
python3 tools/baby-dotnet-solve.py --check
```

Login **fixe** (pas un keygen name→serial).

---

## 1. Premier regard

Le ZIP crackmes.one contient un second ZIP `BabyDotNet.zip` : apphost `BabyDotNet.exe` (~158 KiB) + `BabyDotNet.dll` (~8.5 KiB).  
Les sources du check sont dans [`original/BabyDotNet/Form1.cs`](original/BabyDotNet/Form1.cs) (décompilé, tokens ILSpy / RVA).

```text
BabyDotNet.exe  PE32+ GUI x86-64  apphost .NET 10.0.11
                sha256  f4cdefd1965dcd929d0eef9cd93d6dfbd1f1f4ab05f2243a4754343d504d2dec
BabyDotNet.dll  PE32 .NET assembly  TargetFramework v10.0
                sha256  592a21a95a24b9af5deb3d0c239b21d062a2633e745dc1ef85df525a6180b4a8
```

Le runtime **.NET 10 Desktop** n’était pas installé sur la machine d’analyse : lancer l’exe ouvre le dialogue apphost *You must install .NET* (10.0.11). Le prédicat se lit dans `Form1.cs`.

---

## 2. Flow

[`Program.cs`](original/BabyDotNet/Program.cs) :

```csharp
ApplicationConfiguration.Initialize();
Application.Run(new Form1());
```

1. Deux `TextBox` (`Form1.Designer.cs`) : `usernamebox`, `passwordtextbox` (`UseSystemPasswordChar`).
2. Bouton `Enter` → `button1_Click_1`.
3. `PassEnc("\"@@F ")` et `NameEnc("JEsxTEw=")` produisent les valeurs attendues.
4. Égalité des deux champs → flag `CMO{user_pass}` puis `MessageBox`.
5. Sinon → `Invalid username or password.`

---

## 3. Comment on trouve username / password / flag

Ancrage : [`original/BabyDotNet/Form1.cs`](original/BabyDotNet/Form1.cs).

### 3.1 Username — `NameEnc`

```csharp
private string NameEnc(string username)
{
    byte[] array = Convert.FromBase64String(username);
    return Encoding.UTF8.GetString(array);
}
```

Appel : `this.NameEnc("JEsxTEw=")`.

```text
Base64("JEsxTEw=") = 24 4b 31 4c 4c  → UTF-8 "$K1LL"
```

### 3.2 Password — `PassEnc`

```csharp
private string PassEnc(string password)
{
    char[] array = password.ToCharArray();
    for (int i = 0; i < array.Length; i++)
        array[i] ^= '\u0013';   // 19
    return new string(array);
}
```

Appel : `this.PassEnc("\"@@F ")` — cinq caractères : guillemet, `@`, `@`, `F`, espace.

| char | hex | `^ 0x13` | ASCII |
|---|---|---|---|
| `"` | `22` | `31` | `1` |
| `@` | `40` | `53` | `S` |
| `@` | `40` | `53` | `S` |
| `F` | `46` | `55` | `U` |
| ` ` | `20` | `33` | `3` |

→ **`1SSU3`**.

### 3.3 Flag — `button1_Click_1`

```csharp
string text = this.usernamebox.Text;
string text2 = this.passwordtextbox.Text;
string text3 = this.PassEnc("\"@@F ");
string text4 = this.NameEnc("JEsxTEw=");
if (text == text4 && text2 == text3)
{
    // interpolation CMO{ + text4 + _ + text3 + }
    MessageBox.Show("GG, YOU WIN!!\n\nFLAG: " + str);
}
```

Le C# décompilé passe par `DefaultInterpolatedStringHandler` (`CMO{`, user, `_`, pass, `}`) → **`CMO{$K1LL_1SSU3}`**.

### 3.4 Pièges

- `JEsxTEw=` est le Base64, pas le username.
- Le cipher password commence par un guillemet ASCII (`"@@F `).
- `button1_Click` et `textBox2_TextChanged` sont vides (reliquats designer).

---

## 4. Pseudo-code

```python
import base64
user = base64.b64decode("JEsxTEw=").decode("utf-8")       # $K1LL
pw   = "".join(chr(ord(c) ^ 0x13) for c in '"@@F ')       # 1SSU3
flag = f"CMO{{{user}_{pw}}}"                               # CMO{$K1LL_1SSU3}
```

---

## 5. Vérification

```text
$ python3 tools/baby-dotnet-solve.py --check
$K1LL / 1SSU3
CMO{$K1LL_1SSU3}
OK
```

Le solveur recoupe le decode avec les blobs UTF-16 dans `BabyDotNet.dll`.  
L’exe live demande le **Desktop Runtime 10.0.11** si le runtime n’est pas installé.

Cas KO : username `JEsxTEw=` (Base64 brut), password `"@@F ` (cipher), username `K1LL` (sans `$`).

---

## 6. Notes

- Projet : `TargetFrameworkVersion` v10.0 (`BabyDotNet.csproj`).
- x64dbg n’était pas attaché ; le check se lit dans les sources C#.
