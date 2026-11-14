# Elzzie's winkeygenme

| | |
|---|---|
| **ID** | [`6a21ed4d266afadcd56fabd9`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a21ed4d266afadcd56fabd9) |
| **Auteur** | Elzzie |
| **Plateforme** | Windows x86-64, apphost .NET 8 + WPF |
| **SHA-256** (`original/download.bin`, en fait un ZIP) | `91da585aeed478358e5ef620df095d9795623443754de0257b6049af11b1e0fd` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (contient `Cr4ckM3.exe`), non modifié |
| `analysis/extracted/Cr4ckM3.exe` | exe extrait du ZIP (SHA-256 `90ceeaeb…f136e3`) |
| `analysis/Cr4ckM3.dll` | assembly .NET carvée dans l'overlay de l'exe |
| `analysis/Cr4ckM3-src/` | C# décompilé (`ilspycmd -p`) |
| `tools/winkeygenme-solve.py` | keygen |

## Réponse

Le login doit faire **au moins 6 caractères** : `petik` (5) est refusé, on prend donc `petik1`.

| User | Key |
|---|---|
| `petik1` | **`VFSAN-RRP8D-EXWTX-YASD9-N6AHZ`** |

```bash
python3 tools/winkeygenme-solve.py            # petik1
python3 tools/winkeygenme-solve.py -q "mon user"
python3 tools/winkeygenme-solve.py --check VFSAN-RRP8D-EXWTX-YASD9-N6AHZ   # OK / KO
```

## Premier regard

- `download.bin` est un ZIP (mot de passe site `crackmes.one` ; ici l'archive s'ouvre directement) → `Cr4ckM3.exe`.
- `diec` : PE64, MSVC 14.43, « .NET Core (Loader) » → c'est un **apphost** .NET 8 (`App host version: 8.0.19`), pas le code du crackme.
- `strings` de l'exe : uniquement du texte du host (`hostfxr.dll`, « You must install .NET Desktop Runtime… ») et le nom `Cr4ckM3.dll`. Mais l'exe fait 163 924 octets alors que les sections s'arrêtent à 150 016 : il y a un **overlay**.

## Comment on trouve

1. Les sections PE (`.rsrc` finit à l'offset 0x24A00 = 150016) ne couvrent pas tout le fichier. Dans l'overlay : un `MZ` à 151552 (0x25000) et la signature métadonnées `BSJB` à 153088 → une assembly managée complète, avec des chaînes lisibles (`Username must be at least 6 characters long.`, `Activation successful!`, `ABCDEFGHJKLMNPQRSTUVWXYZ23456789`, `mainwindow.baml`).
2. Carving : `python3 -c "d=open('Cr4ckM3.exe','rb').read();open('Cr4ckM3.dll','wb').write(d[151552:])"`.
3. Décompilation : `ilspycmd -p -o Cr4ckM3-src Cr4ckM3.dll` (`decompiledotnet` absent du shell agent). Tout est dans `Cr4ckM3/MainWindow.cs` ; les noms sont obfusqués (`F04`, `F06`, `V01`…) mais le code est lisible.
4. Handler du bouton `F04` :
   - `text = V03.Text` (user), `len < 6` → « Username must be at least 6 characters » ;
   - `V04.Text.Trim().ToUpper() == F06(user)` → « Activation successful! ».
5. `F06(user)` (générateur de clé) :
   ```csharp
   h = SHA256(UTF8(user));                 // 32 octets
   h[i] = V01[h[i]]                        // S-box 256 octets (permutation)
   // flux de bits -> groupes de 5 bits -> alphabet 32 car. (sans I, O, 0, 1)
   key25 = base32(h)[0..25]
   return key25 découpé en 5 groupes de 5 séparés par '-'
   ```
   `F07` (TextChanged) ne fait que formater la saisie (retire `-`, majuscules, tronque à 25, remet un `-` tous les 5).
6. La table `V01` est une permutation de 0..255 (vérifiée, 256 valeurs distinctes) ; je l'ai relue directement dans le DLL (recherche de ses premiers octets, offset 8816) pour ne pas dépendre de l'affichage du décompilateur.
7. Exemple `petik1` : SHA-256 → 32 octets → S-box → 256 bits ; les 125 premiers bits en 25 symboles de 5 bits : `VFSAN RRP8D EXWTX YASD9 N6AHZ`. Seuls 125 des 256 bits servent ; le reste est ignoré.

Pièges : le « binaire » est un ZIP ; l'exe n'est qu'un apphost dont la DLL est cachée dans l'overlay (le `Cr4ckM3.dll` n'est pas à côté, donc l'exe seul ne démarre pas sans bidouille) ; `petik` est trop court.

## Vérification

- Pas de GDB / x64dbg / IDA utilisés (reverse 100 % statique .NET) → pas de section Debug GDB.
- **Limite honnête** : l'exe n'a pas pu être lancé ici (ni Wine ni Linux n'ont le Windows Desktop Runtime / WPF ; `xvfb-run -a wine Cr4ckM3.exe` ne démarre pas). La preuve est donc un **oracle C# exécuté sur .NET 8** : la méthode `F06` et la table `V01` copiées verbatim depuis la sortie ilspy dans un projet console (`dotnet run -- petik1 "Elzzie user"`), comparées au solveur Python :

| User | Oracle C# `F06` | Solveur Python |
|---|---|---|
| `petik1` | `VFSAN-RRP8D-EXWTX-YASD9-N6AHZ` | idem |
| `Elzzie user` | `XTX2F-QMJTJ-6TDSP-E5LL9-46Y7H` | idem |
| `abcdef` | `CR89L-7R7N4-LSSE5-UBAN8-DXGUJ` | idem |

- `--check` : bonne clé → `OK` ; `AAAAA-AAAAA-AAAAA-AAAAA-AAAAA` → `KO`.
- KO côté binaire : `petik` (5 car.) → « Username must be at least 6 characters long. ».

## Notes

- La comparaison est insensible à la casse et aux espaces autour (`Trim().ToUpper()`), les `-` doivent être présents (`F07` les insère automatiquement en tapant).
- Aucun secret par machine : keygen pur, déterministe.
