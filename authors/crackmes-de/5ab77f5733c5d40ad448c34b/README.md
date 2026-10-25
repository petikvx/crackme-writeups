# crackmes.de's Parts (axel.net)

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c34b`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c34b) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | crackmes.de (crackme d'*Axel.Net*) |
| **Plateforme** | Windows PE32 GUI, .NET 2.0 (WinForms) |
| **SHA-256 (zip)** | `307ee41f6088b122b2d099107f83844e6ca4a59d1f7e2ba442a1fa38b44b0147` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Parts.zip` | archive d'origine (contient `Parts.exe` + `Rules.txt`), non modifiée |
| `analysis/Parts.exe`, `analysis/Rules.txt` | contenu extrait du zip (SHA-256 exe `f78594e2…5f79`) |
| `analysis/Parts.il` | IL complet (`ilspycmd -il`) |
| `analysis/source/Parts-src/` | C# décompilé (`ilspycmd -p`) |
| `tools/parts-solve.py` | keygen |
| `tools/live-test.sh` | preuve live Wine + Xvfb + xdotool |

## Réponse

Pas de patch nécessaire : un simple keygen suffit (le patch de la « partie 1 » des règles sert seulement à figer `key()`).

```
serial = concat( str(ord(c)) + str(key) )   pour chaque c du Name
```

| Name | key | Serial |
|---|---|---|
| `petik` | 50 | `1125010150116501055010750` |
| `petik` | 89 | `1128910189116891058910789` |

```bash
python3 tools/parts-solve.py petik --key 50      # un serial
python3 tools/parts-solve.py petik --all         # les 40 serials possibles
python3 tools/parts-solve.py petik -q            # serial seul
```

⚠️ `key()` est **re-tiré à chaque clic sur Check** : un serial fixe n'est accepté qu'avec probabilité ~1/40 par clic. Il faut recliquer (ou patcher `key()`, voir Notes).

## Premier regard

```bash
unzip original/Parts.zip -d analysis/
file analysis/Parts.exe      # PE32 GUI, Mono/.Net assembly
diec analysis/Parts.exe      # .NET Framework CLR 2.0, Visual Studio
ilspycmd -p -o analysis/source/Parts-src analysis/Parts.exe
ilspycmd -il analysis/Parts.exe > analysis/Parts.il
```

`Rules.txt` : crackme « pour débutants » en deux parties : (1) patcher 3 éléments (un opcode `br` + 2 paramètres), (2) écrire un keygen. Fenêtre : champs Name / Serial, boutons Check, About, Rules.

## Flow

`Form1.button1_Click` : si Name et Serial non vides → `serial(Name, key())` est comparé (`String.op_Equality`) au champ Serial → « Success!! / Good!! » sinon « Try Again… / MMMM!! ».

## Comment on trouve

Ancrage : le C# décompilé (`Form1.cs`) est court, tout est dans trois méthodes.

```csharp
static string serial(string name, int key) {
    string text = "";
    foreach (char c in name) text = text + (int)c + key;   // "112" + "50" ...
    return text;
}
static int key() {
    int num3 = (DateTime.Now.Second + DateTime.Now.Minute) / 2;
    if (num3 == 0) return num3;                 // seulement à hh:00:00 / hh:00:01 / 00:01:00 → 0
    return new Random().Next(10, 40) + 40;      // sinon 50..89
}
```

- `serial` : pour chaque caractère, le code ASCII en décimal suivi de la clé en décimal. `petik` avec key=50 : `112|50 101|50 116|50 105|50 107|50` → `1125010150116501055010750`.
- `key()` : en IL (`analysis/Parts.il`, IL_0027 `brtrue.s IL_002b`, IL_0034/36 `ldc.i4.s 10`/`40` = bornes de `Next`, IL_0041 `ldc.i4.s 40` = offset). Le test `(s+m)/2 == 0` n'est vrai que dans la première seconde/minute de l'heure (division entière) ; en pratique la clé est 40 + Next(10,40) = **50..89**, nouvelle graine à chaque appel.
- Piège : le crackme semble « non déterministe » ; en réalité l'espace des serials valides est de 40 valeurs par name, d'où le keygen `--all` et le re-clic.

## Vérification

Binaire d'origine (extrait du zip, non patché), Wine-mono sous Xvfb, piloté par xdotool (`tools/live-test.sh analysis/Parts.exe`) : Name `petik`, Serial `1125010150116501055010750` (key=50), clics répétés sur Check.

```
fenetre=14680067
SUCCESS après 12 clics
```

Les 11 clics précédents ont affiché la boîte « MMMM!! » (cas KO : la clé tirée ≠ 50), le 12ᵉ la boîte « Good!! » / « Success!! ».

## Notes

- Patch (partie 1 des règles, **non testé ici**, aucun patch dans `original/`) : fixer `key()`, p.ex. changer la borne haute `ldc.i4.s 40` de `Next(10, 40)` (IL_0036) en `11` → clé toujours 50 → le serial `petik`→`1125010150116501055010750` passe à chaque clic.
- Ce n'est pas un hash ni un chiffrement : simple concaténation décimale, la difficulté est la clé aléatoire.
