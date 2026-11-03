# crackmes.de's keygenme_by_bikers80 (KeygenMe.exe)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3d6`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3d6) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (crackme de *Bikers80*) |
| **Plateforme** | Windows PE32 GUI, VB.NET (CLR 2.0, `diec` : Microsoft Linker 8.0 / VB.NET) + `GabMatrix.dll` (contrôle d'affichage) |
| **SHA-256 (zip)** | `8ef9e52ab10791b7692ebe75d2c09f0955d663c06a6427f9058858bf7b93115a` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/KeygenMe.zip` | archive d'origine (non modifiée, mot de passe `crackmes.one`) |
| `analysis/extract/` | `KeygenMe.exe` + `GabMatrix.dll` (`unzip -P crackmes.one`, hors `original/`) |
| `analysis/src/exe/` | C# décompilé : `ilspycmd -p -o analysis/src/exe KeygenMe.exe` (`KeygenMe/Form1.cs`, `O1.cs`) |
| `analysis/KeygenMe.il` | IL (`ilspycmd -il`) pour vérifier les `CompareString` binaires |
| `tools/keygenme-bikers80-solve.py` | keygen (+ `--check`) |
| `tools/keygenme-harness.cs/.exe` | harness : charge le **vrai** `KeygenMe.exe`, remplit `TextBox1/2` et appelle `Form1.var3()` (le check du bouton) |

## Réponse

Le serial dépend du **nom** et de **`Environment.Version`** du CLR qui exécute le crackme.

| name | CLR | Serial |
|---|---|---|
| `petik` | `4.0.30319.1` (Wine-Mono, celui de la preuve) | **`3423-JZIQ-8027-AF58`** |

```bash
python3 tools/keygenme-bikers80-solve.py                    # petik
python3 tools/keygenme-bikers80-solve.py -q --user petik    # serial seul
python3 tools/keygenme-bikers80-solve.py --clr 2.0.50727.3053   # autre CLR (cf. Notes)
python3 tools/keygenme-bikers80-solve.py --check            # preuve sous wine + vrai exe
```

## Premier regard

```text
$ diec analysis/extract/KeygenMe.exe   → PE32, Compiler: VB.NET, .NET Framework (CLR 2.0.50727)
$ bash -ic 'decompiledotnet …' / ilspycmd -p …  → projet C#
```

`strings` sur les ressources : bitmaps, `Unregistered :(`, `Name`, `Sérial`, MsgBox `Good Job … Now Créate a keygen`. `Form2` n'est que l'About ("Find a Sérial and créate a keygen").

## Flow

`Button1_Click` → `var3()` ; si vrai : « Registered :) » + MsgBox. `var3` :

1. `TextBox1` (Name) vide → MsgBox « Enter your Name ».
2. `var2b()` calcule le serial attendu intermédiaire `esp1` (`XXXX-XXXX-XXXX-XXXX`, chiffres).
3. `var4(esp1)` calcule `esp2` (SHA-256 → lettres).
4. `O1.var01(esp1, esp2)` mélange les deux → serial attendu ; comparé à `TextBox2` par **`Like`** (`LikeString`).

## Comment on trouve

**Ancrage** : `ilspycmd -p` puis lecture de `Form1.cs` (`var3` l. ~451, `Var1`, `Var2`, `varc`, `var4`, `var6`) et de `O1.cs`. Le nom des fonctions est volontairement pauvre (`var`, `varb`, `varc`, `Var1`…).

### 1. Anti-Reflector (chaînes obfusquées)

```csharp
// var("[nounl}x{") : chaque char - 9
'['-9='R' 'n'→'e' 'o'→'f' 'u'→'l' 'n'→'e' 'l'→'c' '}'→'t' 'x'→'o' '{'→'r'   // "Reflector"
// varb("075101121103101110077101") : paquets de 3 chiffres décimaux → Chr()
075 101 121 103 101 110 077 101  →  K e y g e n M e  =  "KeygenMe"
```

`Var2` renvoie `0` (donc check KO) si **exactement un** process `Reflector` tourne (`UBound(...)==0`) **ou** si le titre de la fenêtre ≠ `"KeygenMe"` (comparaison binaire, vérifiée dans l'IL : `CompareString(..., false)`). Piège : `103` = `g` minuscule. Rien à faire en usage normal (le titre vaut `KeygenMe`, pas de Reflector).

### 2. `Var1` : texte → chiffres

```csharp
for each char c: text3 += Hex(Asc(c));   // "petik" → 70 65 74 69 6B → "706574696B"
keep only chars matching [1-9]           // on jette '0' et A-F → "76574696"
if len > 12 : keep first 12 (as long)
```

Même fonction pour la version du CLR : `"4.0.30319.1"` → `34 2E 30 2E 33 30 33 31 39 2E 31` → `342E302E33303331392E31` → (sans `0`, `E`) → `342323333331`.

### 3. `Var2` / `varc` : `esp1`

```csharp
nb1  = Var1(name)                              // 76574696
nb2  = Var1(Environment.Version.ToString())    // 342323333331
text = (nb1 + nb2).ToString() + varc();        // "342399908027" + "1244"
esp1 = Mid(text,1,4)-Mid(text,5,4)-Mid(text,9,4)-Mid(text,13,4);   // 3423-9990-8027-1244

varc() = ToInteger( Mid( Val(Mid(e,1,4)) + Val(Mid(e,5,4)) + Val(Mid(e,7,4)) , 1, 4) )
// e = Var1(name) ; blocs 5-8 et 7-10 se chevauchent
// petik : 7657 + 4696 + 96 = 12449 → Mid(…,1,4) = 1244
```

### 4. `var4` : `esp2`

```csharp
h = SHA256( UTF-16LE(esp1) )               // UnicodeEncoding
b = Base64(h).ToUpper()
f = chars de b dans [1-Z]  (Like binaire : '1'..'Z', donc '=' (0x3D) passe, '0' '+' '/' non)
esp2 = f[0:16] découpé 4-4-4-4 avec '-'      // petik : TL8S-JZIQ-JGJD-AF58
```

### 5. Assemblage (`O1.var01`)

```csharp
Mid(esp1,1,4) + "-" + Mid(esp2,6,4) + "-" + Mid(esp1,11,4) + "-" + Mid(esp2,16,4)
```

Les positions 6, 11, 16 tombent pile sur les groupes (tirets en 5, 10, 15) :

```text
esp1 = 3423-9990-8027-1244  →  groupes 1 et 3 : 3423 , 8027
esp2 = TL8S-JZIQ-JGJD-AF58  →  groupes 2 et 4 : JZIQ , AF58
serial = 3423-JZIQ-8027-AF58
```

Le groupe 2 de `esp1` et les groupes 1 et 3 de `esp2` ne servent qu'à alimenter le hash.

## Vérification

Pas d'outil GUI nécessaire : `tools/keygenme-harness.exe` (compilé avec Roslyn contre les libs Wine-Mono 4.5) charge le **vrai** `KeygenMe.exe` d'origine (extrait du zip), instancie `Form1`, remplit les deux `TextBox` et appelle `var3()` — la méthode exacte du bouton OK.

```text
$ python3 tools/keygenme-bikers80-solve.py --check
CLR 4.0.30319.1
petik / 3423-JZIQ-8027-AF58 -> True   esp1=3423-9990-8027-1244 esp2=TL8S-JZIQ-JGJD-AF58
petik / 3423-JZIQ-8027-AF50 -> False                                   # cas KO (dernier char altéré)
OK (True puis False sur serial altéré)
```

Autres noms testés de la même façon (True + KO) : `Bikers80` → `7692-HKXB-6064-1HPQ`, `a` → `3423-EE64-3392-WFCL`, `Jean Dupont` → `8079-MCX1-8088-J7NF`.

## Notes

- Le serial **dépend de `Environment.Version`** (la partie `nb2`). Sous le CLR 2.0 d'époque (`2.0.50727.xxxx`) le serial change : utiliser `--clr 2.0.50727.<build>`. Ici la preuve est faite avec le CLR de Wine-Mono (`4.0.30319.1`).
- `Like` est utilisé pour comparer : un serial contenant `?`, `*`, `#` ou `[` serait interprété comme motif ; le serial légitime n'en contient pas.
- Pas de GDB / x64dbg / IDA dans ce reverse : 100 % statique (IL décompilé) + exécution du vrai code sous Wine-Mono.
- `original/` non modifié.
