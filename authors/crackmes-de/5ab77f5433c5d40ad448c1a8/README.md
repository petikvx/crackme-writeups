# crack_me_or_keygen_me — dragonpxx (réimport crackmes.de)

- **Page** : [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c1a8)
- **Plateforme** : Windows .NET 3.5 (C# WinForms, un démineur 4×4 + 3 DLL), difficulté 1.0
- **Publication** : 2018-03-25
- **readme.txt** : « Compressed serial / disabled buttons / .net 3.5 ».

## Solution

Le serial ne dépend ni du nom ni des ID matériel affichés : c'est une **constante**, à taper en 5 morceaux
(`t1`…`t5`, joints par `-`) :

**`4EC25C03-73D4-484C-AE78-20B3DC0A8457`** → `4EC25C03` | `73D4` | `484C` | `AE78` | `20B3DC0A8457`

Avec le bon serial, `RunTime.dll` écrit `Replay.exe` (un PE stocké en octets décimaux) et le lance, puis tue le jeu.
Script : `tools/crack_me_or_keygen_me-solve.py`. Il n'y a pas de keygen possible : le nom n'intervient pas (d'où le « or »).

## Comment on trouve

1. `7z x` (mot de passe `crackmes.one`) → `Game/Game.exe` + `Crypto.dll`, `RunTime.dll`, `SerialNumber.dll`.
2. `ilspycmd` sur chaque assembly (`analysis/*.cs`). Dans `Game.exe`, le bouton de la fenêtre Register (`but2_Click`)
   concatène `t1-t2-t3-t4-t5` et appelle `Reg.Enter(id, hard, cpu)`.
3. `Reg.Enter` appelle `SerialNumber.Cls1.Check`, qui **renvoie toujours `false`** et dont le résultat est ignoré : leurre
   (les « ID CPU / disque » affichés ne servent à rien).
4. Le vrai test est dans `RunTime.Cls1.Enter` : `crypto.DecryptText("0JcT5U3u…QOLgi") == CID`.
5. `Crypto.DecryptText` = `Rijndael` (bloc 128 bits par défaut, donc AES) en ECB, clé = `MD5(ASCII(Key))` avec
   `Key = "!@#$%^&*(){}?/>.<,\"':;][/*-+~\`"`, padding PKCS7. On déchiffre la constante en Python → le GUID ci-dessus.

## Vérification

La GUI n'a pas été pilotée. Le **vrai `Crypto.dll`** du crackme a été chargé par réflexion dans `dotnet`
(`analysis/verify-Program.cs`), sa méthode `DecryptText` appelée sur la constante de `RunTime.dll`, puis comparée comme
le fait `RunTime.Cls1.Enter` : le serial ci-dessus correspond (un dernier champ faux ne correspond pas). Le `Replay.exe`
largué n'a pas été exécuté.
