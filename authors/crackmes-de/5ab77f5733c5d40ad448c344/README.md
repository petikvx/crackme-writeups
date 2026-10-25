# crackmes.de's optimise by obnoxious

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c344`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c344) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (obnoxious) |
| **Plateforme** | Windows PE32 GUI, .NET (WinForms, Mono/.Net assembly) |
| **SHA-256 (zip)** | `2b06a009e3cf819bbfd54c9870881f09d3b5de4849c8225e7fe34cabe700c3af` |
| **SHA-256 (`optimise.exe`)** | `e399120df89ef4332d64d5bc60ccf4437ccef9837a6af09f98712a88027d01dc` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/optimise.zip` | archive d'origine (mot de passe `crackmes.one`) |
| `analysis/extracted/optimise.exe` | exe extrait du zip (hors `original/`) |
| `analysis/extracted/optimise-src/` | projet C# décompilé (`ilspycmd -p`) |
| `tools/optimise-solve.py` | keygen (`-q`, `--check A B C D`) |
| `tools/optimise-harness.cs` | harnais .NET : `getkey` / `checkkey` / `button1_Click` repris tels quels du décompilé |

## Réponse

Formulaire : `Name` + 4 champs numériques (a, b, c, d).

| Name | a | b | c | d |
|---|---|---|---|---|
| **`petik`** | **974** | **3** | **499** | **2240** |

```bash
python3 tools/optimise-solve.py            # --name petik par défaut
python3 tools/optimise-solve.py -q         # 974 3 499 2240
python3 tools/optimise-solve.py --check 974 3 499 2240
```

`d` dépend du nom ; `a`, `b`, `c` sont constants (une solution parmi beaucoup, voir plus bas).

## Premier regard

```bash
unzip -P crackmes.one original/optimise.zip -d /tmp/x
file optimise.exe        # PE32 ... Mono/.Net assembly
strings -e l optimise.exe
```

Les chaînes UTF-16 donnent déjà les messages (`Hurray....you did it!!!!`, `Try,Try,Try......and Try again!`), les libellés `Name:` / `Key:`, cinq `textBox` et une chaîne suspecte : `16171011420002113600122240013020625` (le « tableau de coefficients »).

## Flow

1. Les 5 champs doivent être non vides, sinon « How about filling in the details ».
2. `num = getkey(Name)` ; `textBox2..5` convertis en `int` (exception → silence).
3. Succès ssi `checkkey() && textBox5 == num`.

## Comment on trouve

Ancrage : `ilspycmd -p -o analysis/extracted/optimise-src analysis/extracted/optimise.exe` (le wrapper `decompiledotnet` n'était pas disponible dans le shell agent), fichier `optimise/Form1.cs`, méthodes `button1_Click`, `getkey`, `checkkey`.

**`getkey(name)`** : MD5 de `Encoding.ASCII.GetBytes(name)`, puis **somme des 16 octets** du hash (pas de hex). Pour `petik` : `sum(hashlib.md5(b"petik").digest()) = 2240` → 4ᵉ champ (`textBox5`).

**`checkkey()`** : `text = "16171011420002113600122240013020625"` découpé en `Substring`, avec `a=textBox2`, `b=textBox3`, `c=textBox4` (le 4ᵉ `num4` lu mais jamais utilisé) :

| Contrainte | Découpage | Valeur |
|---|---|---|
| 1 | `16·a + 17·b + 10·c == 20625` | `[0:2]`,`[2:2]`,`[4:2]`, résultat `[30:5]` |
| 2 | `0·a + 1·b + 4·c <= 2000` | `[5]`,`[6]`,`[8]` (le `[7]` est sauté), borne `[9:4]` |
| 3 | `2·a + 1·b + 1·c <= 3600` | `[13]`,`[14]`,`[15]`, borne `[16:4]` |
| 4 | `1·a + 2·b + 2·c <= 2400` | `[20]`,`[21]`,`[22]`, borne `[23:4]` |
| 5 | `1 <= 30` | `[27]` ≤ `[28:2]`, toujours vrai |

Il faut que les 5 passent (`num5 == 5`). C'est un petit problème d'« optimisation » linéaire (d'où le nom). Les entiers sont signés, donc on peut aussi trouver des solutions négatives ; le solveur cherche en entiers ≥ 0 et prend celle qui maximise `a+b+c` (le crackme ne dit pas lequel choisir, toute solution valide passe) : `c=499`, `b=3` → `a = (20625 − 51 − 4990)/16 = 974`. Vérif : `3+1996=1999 ≤ 2000`, `1948+3+499=2450 ≤ 3600`, `974+6+998=1978 ≤ 2400`.

Piège : l'ordre des champs est `textBox2→a`, `textBox3→b`, `textBox4→c`, `textBox5→d` (hash) — le 4ᵉ champ n'entre pas dans `checkkey`.

## Vérification

- Le crackme **n'a pas pu être lancé sous Wine** dans cet environnement : `wine optimise.exe` sort en `rc=1` avec `err:virtual:virtual_setup_exception stack overflow` dans `libmono` (prefix par défaut), et un prefix neuf n'a pas Wine-mono. Pas de preuve live, donc pas de screenshot.
- Preuve de remplacement : `tools/optimise-harness.cs` reprend **verbatim** les 3 méthodes décompilées (seuls `TextBox` et `MessageBox` sont remplacés par des stubs), compilé avec `dotnet` 8 :

```text
$ dotnet h.dll petik 974 3 499 2240   → Hurray....you did it!!!!
$ dotnet h.dll petik 974 3 499 2241   → Try,Try,Try......and Try again!   (KO : mauvais hash)
$ dotnet h.dll petik 1000 3 499 2240  → Try,Try,Try......and Try again!   (KO : contrainte 1 fausse)
```

## Notes

- Ce n'est ni un patch ni une vérification du nom en clair : seule la somme des octets MD5 compte, et les trois premiers champs sont indépendants du nom.
- Pas de GDB/x64dbg/IDA utilisés (reverse 100 % statique sur le C# décompilé).
