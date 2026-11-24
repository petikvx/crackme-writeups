# SimbaHDD's FirstCrackMe

| | |
|---|---|
| **ID** | [`6a160248d7ff92e1214c01ed`](https://crackmes.one/crackme/6a160248d7ff92e1214c01ed) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | SimbaHDD (`simbahdd`) |
| **Plateforme** | Windows, .NET WinForms (PE32, i386 Mono/.Net) |
| **SHA-256** | `ccfdf0777c3d61bba7824387355d2517eade91ded73c4691aca0f7466e64bf5f` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme.exe` | binaire d'origine (non modifié) |
| `analysis/src/` | C# décompilé (`ilspycmd -p -o analysis/src original/crackme.exe`) |
| `tools/firstcrackme-solve.py` | solveur (`-q`, `--check`) |
| `tools/live-check.sh` | preuve live Wine + Xvfb + xdotool |

## Réponse

Pas d'username. Tout mot de **20 caractères contenant `crackme`** est accepté :

```
crackme1111111111111
```

```bash
python3 -I tools/firstcrackme-solve.py -q
```

## Premier regard

`file` : PE32 .NET GUI, une fenêtre « crackme by Simba » avec un TextBox (mot de passe masqué) et un bouton *Enter*. Pas d'obfuscation : `ilspycmd` rend tout `MainForm.Button1Click`.

## Flow

`Button1Click` calcule `text2 = DecryptPassword("wYCPjY+Oi8aOgMqJl4mXjZqCko+Plg==", 90)` (base64 → XOR 90 → `UTF8.GetString`), puis compare l'entrée `text` à `text2` de quatre façons : SHA-256, XOR 90 + base64, base64 brut, et enfin :

```csharp
if (text.Length == text2.Length && text.Contains("crackme")) flag = true;
```

Un seul `flag = true` suffit → `MessageBox` « Congratulations! » (titre *access granted*), sinon *authentication failed*.

## Comment on trouve

1. `ilspycmd -p -o analysis/src original/crackme.exe` → `analysis/src/crackme/MainForm.cs`.
2. Décoder le blob : `base64` puis `^ 90` donne 22 octets `9b da d5 d7 d5 d4 d1 9c d4 da 90 d3 cd d3 cd d7 c0 d8 c8 d5 d5 cc`. **Piège** : ce n'est pas de l'UTF-8 valide, donc ce n'est pas un mot de passe lisible ; `GetString` remplace les octets invalides par U+FFFD. Les trois premières comparaisons (hash/XOR/base64 de `text` vs `text2`) exigeraient de taper ces caractères U+FFFD : irréaliste.
3. La 4ᵉ condition est l'issue réaliste : il faut `text.Length == text2.Length` et la sous-chaîne `crackme`. Longueur de `text2` = nombre de caractères après décodage UTF-8 avec remplacement = **20** (22 octets, 2 paires absorbées dans un remplacement).
4. Réponse : `crackme` + 13 caractères quelconques (`1`) = 20.

Le 20 vient du décodage Python `decode('utf-8','replace')` ; confirmé en live car le comportement .NET peut différer (voir vérification).

## Vérification

Binaire d'origine sous Wine (`xvfb-run`-like : Xvfb + xdotool, `tools/live-check.sh "<mot>"`, lancé depuis ce dossier) :

| Entrée | Longueur | Résultat |
|---|---|---|
| `crackme1111111111111` | 20 | **access granted** |
| `crackme0123456789` | 17 | authentication failed |
| `crackme01234567890123` | 22 | authentication failed |

`python3 -I tools/firstcrackme-solve.py --check` → `OK`.

## Notes

- Aucun GDB / debugger utilisé : reverse 100 % statique + preuve live Wine.
- Le « vrai » mot de passe (`text2`) n'est pas imprimable ; c'est une faille de logique (contrôle de longueur + `Contains`).
