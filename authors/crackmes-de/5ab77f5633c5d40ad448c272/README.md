# crackmes.de's mayhems_crackme_3 by mayhem

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c272`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c272) |
| **Auteur (site)** | crackmes.de |
| **Auteur original** | mayhem |
| **Plateforme** | Windows, .NET (CLR 2.0, WinForms) |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `4bcb973ffa3031ddf2a6955fc8a7e478f37dc25c2cf93a356400cbda0bcd8fce` |

## Solution

| Name | Serial |
|---|---|
| `petik` | `107108637445` |

Keygen : [`tools/mayhems_crackme_3-solve.py`](tools/mayhems_crackme_3-solve.py)

```bash
python3 tools/mayhems_crackme_3-solve.py petik
# petik / 107108637445
```

## Recon

```text
$ diec CrackMe3.exe
PE32
    Linker: Microsoft Linker(8.0)
    Library: .NET Framework(CLR 2.0.50727)
    Tool: Microsoft Visual Studio
```

Assembly .NET non obfusqué → décompilation directe :

```bash
ilspycmd original/CrackMe3.exe > dec.cs
```

Un seul formulaire `frmMain` : deux `TextBox` (`txtN` = Name, `txtS` = Serial) et un bouton **Check** (`cmdG`). Les chaînes des `MessageBox` sont en Base64 (méthode `dc()` = `Convert.FromBase64String` + UTF-8) :

| Base64 | Clair |
|---|---|
| `TWF5aGVtJ3MgQ3JhY2tNZSAjMw==` | `Mayhem's CrackMe #3` (titre) |
| `VGhlIG5hbWUgeW91IGVudGVyZWQgaXMgdG9vIHNob3J0LCB0cnkgYWdhaW4u` | `The name you entered is too short, try again.` |
| `V2VsbCBkb25lISBOb3cgd3JpdGUgeW91ciB0dXRvcmlhbC9rZXlnZW4u` / `R29vZCBib3kh` | `Well done! Now write your tutorial/keygen.` / `Good boy!` |
| `U29ycnksIHdyb25nIHNlcmlhbC4gVHJ5IGFnYWluLg==` / `QmFkIGJvaSEgOm8=` | `Sorry, wrong serial. Try again.` / `Bad boi! :o` |

## Anti-patch (frmMain_Load)

Au premier lancement (`Settings.fRun == 1`), le programme calcule le MD5 de son propre `.exe`, le stocke en Base64 dans `Settings.defhash` (user.config) puis passe `fRun` à 0. À chaque lancement il recompare le MD5 courant à `defhash` : si différent → `"Nice try, now undo your changes ;)"` et fermeture. Ça ne gêne qu'un patch **après** le premier lancement ; pour un keygen on n'y touche pas.

## Vérification du serial (cmdG_Click)

Voir [`analysis/cmdG_Click.cs`](analysis/cmdG_Click.cs) et [`analysis/getHash.cs`](analysis/getHash.cs) :

```csharp
if (txtN.Text.Length < 2) { /* "too short" */ return; }
string text = txtN.Text;
string hash = getHash(text);            // SHA512(ASCII(name)) en hexa MAJUSCULE ("X2")
int num = 0;
int length = text.Length;
int num2 = length * 8 + length + 63;    // 9*len + 63
for (int i = 0; i < hash.Length; i++)
    num += hash[i];                     // somme des codes ASCII des 128 caractères hexa
string text2 = string.Concat((int)text[length - 1], num2, 63, num);
if (txtS.Text == text2) /* Good boy! */
```

Le serial est donc la concaténation décimale de 4 morceaux :

1. `ord(name[-1])` — code du dernier caractère du nom ;
2. `9 * len(name) + 63` ;
3. la constante `63` ;
4. la somme des codes ASCII de la représentation hexa **majuscule** du SHA-512 du nom.

Pour `petik` :

| Morceau | Calcul | Valeur |
|---|---|---|
| 1 | `ord('k')` | `107` |
| 2 | `9*5 + 63` | `108` |
| 3 | constante | `63` |
| 4 | Σ ASCII de `SHA512("petik")` (hex MAJ) | `7445` |

→ **`107108637445`**

Attention : la casse compte pour le morceau 4 (`'A'..'F'` = 65..70 ; en minuscules la somme serait différente).

## Vérification live (Wine)

`xvfb-run` + `wine CrackMe3.exe` + `xdotool`. Sous Wine-Mono, la sauvegarde des `Settings` dans `frmMain_Load` lève une exception (« Unhandled exception… ») ; on clique **Continue**, le formulaire s'affiche (titre resté `frmMain`) et le handler du bouton fonctionne normalement :

- `petik` / `107108637445` → `Good boy!` — « Well done! Now write your tutorial/keygen. » ([`analysis/good-petik.png`](analysis/good-petik.png))
- `petik` / `107108637446` → `Bad boi! :o` — « Sorry, wrong serial. Try again. » ([`analysis/bad.png`](analysis/bad.png))

## Status

- [x] reverse
- [x] write-up
- [x] solveur
