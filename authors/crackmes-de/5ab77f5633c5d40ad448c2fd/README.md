# crackmes.de's nelix_crackme_1 by nelix

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2fd`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2fd) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (nelix) |
| **Plateforme** | Windows, .NET WinForms (CLR 4.0, x86) |
| **SHA-256 (zip)** | `9d80b14b4b9cabb92ec2efcb6d09f5f6b1e0875fb3a17929b055a506ee2a1dd5` |
| **Règles** | afficher « Congratulation! Good job! » ; keygen préféré (`rules.txt`) |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/Nelix_CrackMe_1.zip` | archive d'origine (mot de passe `crackmes.one`) : `Nelix_CrackMe_1.exe` + `rules.txt` |
| `analysis/x/` | contenu dézippé (hors `original/`) |
| `analysis/src/` | C# décompilé (`ilspycmd -p`) |
| `tools/nelix-crackme1-solve.py` | keygen / `--check` |
| `tools/live-wine.sh` | preuve live : wine-mono + Xvfb + xdotool |

## Réponse

Serial = `hex( MD5(name) XOR K )` en 32 caractères hex, avec  
`K = 0F 3A 8F 32 43 3D A4 35 23 F4 B2 3C 58 5D 4D 17`.

| Name | Serial |
|---|---|
| `petik` | **`C2FCC399D9645CD0B34B702811275377`** |

```bash
python3 tools/nelix-crackme1-solve.py --name petik        # keygen
python3 tools/nelix-crackme1-solve.py -q --name petik
python3 tools/nelix-crackme1-solve.py --name petik --check C2FCC399D9645CD0B34B702811275377
```

## Premier regard

```bash
unzip -P crackmes.one original/Nelix_CrackMe_1.zip -d analysis/x
file analysis/x/*.exe      # PE32 GUI, Mono/.Net assembly
diec analysis/x/*.exe      # .NET CLR 4.0, VS, pas de packer
strings -n 5 analysis/x/*.exe   # checkSerial, genCode, BuildMethod, System.Reflection.Emit...
```

Les noms (`genCode`, `BuildMethod`, `MethodBuilder`, `genRandomNames`) trahissent le piège : le contrôle de serial n'est **pas** une méthode du binaire, il est **généré à l'exécution** par `Reflection.Emit` sous un nom de type/méthode aléatoire. Un décompilateur ne montre donc pas `if (hash == serial)` ; il faut lire l'émission d'IL.

## Flow

`MainForm()` → `genRandomNames()` + `genCode()` construit un assembly dynamique avec une méthode statique `bool f(string name, string serial)`. `button_check_Click` l'appelle par `InvokeMember` ; si elle lève, « Not this way! ».

Dans l'IL généré, tout est dans un `try` : l'échec (`throw new Exception("Arrays not equal!")`) est attrapé dans la méthode elle-même → MessageBox « Try again! ». Le succès affiche `"Congratulation!\nGood job!\nRegisterd to: " + name` avec le titre `Nelix CrackMe`.

## Comment on trouve le prédicat

**Ancrage** : `ilspycmd -p -o analysis/src analysis/x/Nelix_CrackMe_1.exe` (le wrapper `decompiledotnet` n'était pas dispo, ilspycmd direct). Tout est dans `CrackMe.net/MainForm.cs`, méthode `BuildMethod`, qui est une longue suite de `iLGenerator.Emit(...)`. Il suffit de lire ces `Emit` comme un listing IL.

1. **Clé en dur** : un `byte[16]` (local 1) rempli par `ldc.i4 idx / ldc.i4 val / stelem.i1` :
   `[0]=15 [1]=58 [2]=143 [3]=50 [4]=67 [5]=61 [6]=164 [7]=53 [8]=35 [9]=244 [10]=178 [11]=60 [12]=88 [13]=93 [14]=77 [15]=23`.
2. **Piège anti-lecture** : au milieu (après `K[12]=88`) il y a `br label2` suivi de `not / nop / nop / starg.s 19263 / nop` (octets morts jamais exécutés, destinés à casser les désassembleurs linéaires). À `label2`, la pile contient encore `ldloc.1` empilé juste avant le `br` : les `ldc 13 / ldc 93 / stelem` qui suivent sont donc bien `K[13]=93`. Il ne faut pas lire ces instructions mortes, ni le premier `br label` initial qui saute `pop / ldc.i4.0`.
3. **MD5 du nom** : `MD5.Create()` → `Encoding.Default.GetBytes(name)` → `ComputeHash` → local 3 (16 octets).
4. **Parsing du serial** : boucle `for (i=0; i<serial.Length; i+=2) S[i/2] = byte.Parse(serial.Substring(i,2), NumberStyles.AllowHexSpecifier)` (`512` = `0x200` = `AllowHexSpecifier`), `S` = local 4 (16 octets). → le serial est de l'hexa, 2 caractères par octet.
5. **Combinaison** : `for (i=0; i<md5.Length; i++) buf[i] = S[i] ^ K[i]` (local 0).
6. **Comparaison** : `buf[i] == md5[i]` pour tout `i`, sinon exception.

Donc `S[i] = md5[i] ^ K[i]` ; c'est un keygen direct, sans brute force.

Exemple `petik` :

```
MD5("petik") = CDC64CAB9A59F8E590BFC214497A1E60
         XOR   K = 0F3A8F32433DA43523F4B23C585D4D17
         →       C2FCC399D9645CD0B34B702811275377
```
(longueur exacte requise : 32 hex ; plus long → `Substring` hors bornes, plus court → octets restants à 0 ≠ MD5.)

**Pièges** : `Encoding.Default` dépend de la machine (ANSI sous Windows, UTF-8 sous Mono/Wine) → identique pour un nom ASCII ; pas de `.ToUpper()` imposé, l'hexa est accepté en minuscules ou majuscules. Aucune GDB/x64dbg/IDA utilisés (reverse 100 % statique + preuve live).

## Vérification

```bash
python3 tools/nelix-crackme1-solve.py --name petik --check C2FCC399D9645CD0B34B702811275377   # OK
tools/live-wine.sh petik C2FCC399D9645CD0B34B702811275377   # fenêtres : « Nelix Crackme #1 » + « Nelix CrackMe » (succès)
tools/live-wine.sh petik 00000000000000000000000000000000   # KO : seule la fenêtre principale, pas de dialogue « Nelix CrackMe »
```

Sous wine-mono + Xvfb, `live-wine.sh` saisit name/serial via xdotool et liste les titres de fenêtres : la MessageBox de succès a le titre `Nelix CrackMe` (distinct de la fenêtre principale `Nelix Crackme #1`), absente avec un mauvais serial.

## Notes

- Le serial dépend du nom ; la clé `K` est constante.
- `original/` n'est pas modifié ; le binaire est dézippé sous `analysis/x/`.
