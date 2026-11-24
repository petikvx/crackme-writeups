# zitadokm's Get Flag

| | |
|---|---|
| **ID** | [`69b1acfd6793d479be018d2c`](https://crackmes.one/crackme/69b1acfd6793d479be018d2c) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | zitadokm |
| **Plateforme** | Windows, .NET WinForms (PE32, Mono/.Net assembly), obfusqué (Costura/Fody + flux de contrôle) |
| **SHA-256** | `40c598157613ea4dc2495b9a3faadcf1812bc33a625b46cdbc261c24a5dc1a4a` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Crackme.exe` | binaire d'origine (intact) |
| `tools/zitadokm-solve.py` | décode le flag ; `--check <exe>` le retrouve en mémoire du process sous Wine |
| `analysis/Form1.cs`, `analysis/decryptor-luluGMoeF.cs` | sources ilspycmd (obfusquées) |

## Réponse

Il n'y a **aucune saisie** : la fenêtre affiche juste `hello world` (leurre). Le « flag » est le champ privé `flag` de `Form1`, chiffré :

```
sajd2908jdklajdklaj9012u90askldjas90213sadasdasd90i2
```

```bash
python3 -I tools/zitadokm-solve.py -q
python3 -I tools/zitadokm-solve.py --check original/Crackme.exe   # preuve live (Wine + xvfb)
```

(Pas de username : l'exemple `petik` ne s'applique pas.)

## Premier regard

- `file` : PE32 GUI, .NET. Fenêtre `Form1`, un `Label` « CrACK mE » et un `TextBox` pré-rempli « hello world ».
- `strings` : rien d'utile (chaînes chiffrées).

## Comment on trouve

1. Décompilation : `~/.dotnet/tools/ilspycmd -p -o src Crackme.exe` (l'alias `decompiledotnet` n'était pas dispo en shell non interactif). Le code est noyé dans des `switch (num % 4)` à prédicats opaques : on les ignore.
2. Dans `Form1` (`analysis/Form1.cs:11-24`) deux champs initialisés par `fDQKcKxlXNggQrcWJKGdlYnnbCT.luluGMoeF(byte[], int)` :
   - `akar` (11 octets, clé `1185505503`) → `hello world`, affiché dans `textBox1` ;
   - `flag` (52 octets, clé `701385128`) → jamais affiché ni comparé.
3. Le déchiffreur (`analysis/decryptor-luluGMoeF.cs`) est un XOR : `out[i] = in[i] ^ (key >> ((i % 4) * 8))`, soit la clé int32 LE répétée.
4. Le label et le titre utilisent le même schéma (`CrACK mE`, `Form1`), ce qui valide le décodage.
5. `flag` = `sajd2908jdklajdklaj9012u90askldjas90213sadasdasd90i2`.

Piège : les octets chiffrés ne sont pas contigus dans le fichier (ils sont construits par l'IL), donc chercher la chaîne chiffrée dans l'exe ne marche pas.

## Vérification

Preuve live : `--check` lance `Crackme.exe` sous `xvfb-run wine`, attend 15 s, balaie `/proc/<pid>/mem` et y trouve le flag en UTF-16LE (le champ est initialisé dès la construction de `Form1`). Résultat : `OK : flag trouvé en mémoire du process live`. Cas KO : un décodage avec une autre clé (p. ex. celle de `akar`) donne du bruit, pas la chaîne trouvée en mémoire.

## Notes

- Il n'existe pas de champ de saisie ni de validation : le « flag » est à extraire (statique ou mémoire).
- Aucun GDB / x64dbg / IDA utilisé.
