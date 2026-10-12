# drpepur_5 by drpepur (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1fc>
- **Plateforme** : Windows **PE32** GUI, **MASM32** — difficulté 1.0
- **Archive** : `original/DrPepUr5.zip` → `DrPepUr5.exe` + `Rules.txt` (« Register the program » + « Unlock all options », tout est permis)
- **SHA-256 zip** : `bbf4ccb5e56dba3d34b1226684fd650d84fa1ce3e5935cc265d652f25a532173`
- **Statut** : résolu (keyfile), vérifié **sous wine** (titre `DrPepUr #5 - [Registered]`, 15/15 fonctions actives)

## Solution

Fichier `DrPepur5.key` (INI) dans le **répertoire courant** du programme :

```ini
[DrPepur #5 Registration]
Name=petik
Serial=IIHIIGGGGIGHIGHHHGIHHHIHHHI820
```

```
python3 tools/drpepur-5-solve.py --name petik --keyfile DrPepur5.key
IIHIIGGGGIGHIGHHHGIHHHIHHHI820
```

Le **nom n’intervient pas** : seul le serial est haché. Le serial doit faire **> 19 caractères** et vérifier

```
H = Σ_{i=1..n} s[i] · 3^(i+2)      (64 bits, edx:eax)
```

| H (edx:eax) | Licence = nb de fonctions débloquées | Exemple (`--type`) |
|---|---|---|
| `0x01ED4257:A089A08E` | **15 (tout)** | `IIHIIGGGGIGHIGHHHGIHHHIHHHI820` |
| `0x00000384:50115549` | 14 | `IIHIIGGGGIGHIGHHHGIW` |
| `0x00000235:23B8C36E` | 12 | `GGHGIHGIHGHGGGIIHH40` |
| `0x00000391:EB4BFB9B` | 4 | `HIIGGHIGGGHGHIGIGIHY` |
| `0x0000029D:0461A03C` | 2 | `HIHIHGGGGHHGHIGIHGG8` |

Vérifiées sous wine : licences **15** et **2**. Les autres lignes viennent de la même formule (non testées). Il existe d’autres constantes (7, 8, 9, 10, et deux comparaisons qui posent aussi 15 mais référencent la chaîne `0x4060c6`), non explorées.

## Comment on trouve

1. Imports : `GetPrivateProfileStringA` / `WritePrivateProfileStringA` + chaînes `\DrPepur5.key`, `DrPepur #5 Registration`,
   `Name`, `Serial` → registration par **keyfile INI**.
2. `0x404520` : `GetCurrentDirectoryA` + `\DrPepur5.key`, lit `Name` → `0x40756d`, `Serial` → `0x4075d1`.
   Le dialogue *Register* (`0x4011ab`) ne fait qu’écrire ce fichier (`0x40445f`) puis relancer la vérif.
3. `WM_INITDIALOG` → `0x401255` : `0x40135b(serial, len)` → `eax`, puis `0x401312` met le titre
   (`[Registered]` / `[Unregistered]`, chaînes chiffrées décodées par `0x404012`), et si `eax == 1` :
   affiche le nom, cache le bouton, supprime le menu *Register* (`0xbbf`) et appelle `0x4045b1(hwnd, licence)`
   qui active les cases `0x2bc…` selon `ds:0x4073c9`.
4. `0x40135b` est **obfusqué** (sauts sur flags hérités, octets poubelle, faux chevauchements), mais le motif est
   clair au `objdump` : `call 0x40183f` puis une série `cmp eax,K1 / cmp edx,K2` → `mov ds:0x4073c9, licence`.
   Le test `cmp [ebp+0xc],0x13 / ja` impose une longueur ≥ 20.
5. `0x40183f` : boucle `i = 1..n`, `pow(3, i)` (`0x4018a7` : part de 3 et multiplie `i+1` fois → `3^(i+2)`),
   `mul64` (`0x401901`) par `s[i]`, accumulation 64 bits dans `0x407b69/0x407b05` (remis à zéro à la fin).
6. Toutes les constantes sont divisibles par 27 ✓. Inversion : `t = H/27 = Σ s[i]·3^(i−1)` → `s[1] ≡ t (mod 3)`,
   `t ← (t − s[1])/3`, etc. Le solveur fait un DFS (alphabet `A-Z0-9`, bornes min/max atteignables à chaque
   profondeur) et prend la plus petite longueur ≥ 20 : 30 caractères pour la licence 15.

## Vérification

```
tools/verify-wine.sh IIHIIGGGGIGHIGHHHGIHHHIHHHI820 petik
# fenêtre: DrPepUr #5 - [Registered]
tools/verify-wine.sh AAAAAAAAAAAAAAAAAAAAAAA
# fenêtre: DrPepUr #5 - [Unregistered]
```

Le script copie l’exe original (non patché) dans un dossier temporaire avec le `DrPepur5.key`, le lance sous
wine/Xvfb et lit le titre de la fenêtre. Captures : [`analysis/registered-type15.png`](analysis/registered-type15.png)
(15 fonctions cochées) et [`analysis/registered-type2.png`](analysis/registered-type2.png) (licence 2 : 2 fonctions).
