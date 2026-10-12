# korbut_misc._crackme_1 by korbut

| | |
|---|---|
| **ID** | [`5ab77f5433c5d40ad448c1b2`](https://crackmes.one/crackme/5ab77f5433c5d40ad448c1b2) |
| **Auteur (site)** | crackmes.de (réimport, « $KORBUT Misc_Crackme #1 », RIF 2003) |
| **Plateforme** | Windows PE32, MASM32 (GUI) |
| **Difficulté** | 2.0 |

## TL;DR

Pas de nom/serial : le bouton de vérification passe en **REGISTERED :)** quand les trois conditions sont réunies :

1. un fichier **`_KESKYA`** existe dans le dossier courant avec des attributs exactement `0x20` (archive seul) ;
2. le presse-papiers (CF_TEXT) commence par **`²)='/+,:`** (octets `b2 29 3d 27 2f 2b 2c 3a`, la touche `²` du clavier AZERTY) ;
3. la valeur `ComputerName` de `HKLM\System\CurrentControlSet\Control\ComputerName\ComputerName` commence par **`[ RIF 2k3 ]`**.

Sinon : « UNREGISTERED :( » (ou un MessageBox + sortie si le fichier n'existe pas).

## Comment on trouve

1. `diec` : MASM32, aucun packer. Les imports sont parlants : `GetFileAttributesA`, `OpenClipboard`/`GetClipboardData`, `RegOpenKeyExA`/`RegQueryValueExA`, `SetDlgItemTextA`. Aucune chaîne secrète en clair dans `.data` : les chaînes sont **construites octet par octet** (`mov bl,0x5f ; mov [eax],bl ; sub bl,0x14 ; inc al ; ...`).
2. La routine `0x401000` (appelée depuis le WndProc sur `WM_COMMAND`, voir [`analysis/check.asm.txt`](analysis/check.asm.txt)) :
   - construit `_KESKYA` à `0x403168`, `GetFileAttributesA` doit renvoyer `0x20`, sinon « Shit, i'm a bad cracker ;p » + `ExitProcess` ;
   - copie le texte du presse-papiers à `0x40315E` puis teste deux DWORD :
     `rol(d1 ^ 0x17891789, 1) == 0x61687C76` et `ror(d2 ^ 0x89891717, 0x17) == 0x4A787167`.
     On inverse : `d1 = ror(0x61687C76,1) ^ 0x17891789 = 0x273D29B2`, `d2 = rol(0x4A787167,0x17) ^ 0x89891717 = 0x3A2C2B2F`, soit les 8 octets `²)='/+,:` ;
   - construit `[ RIF 2k3 ]` à `0x403152`, lit `ComputerName` dans le registre et compare octet par octet sur la longueur de `[ RIF 2k3 ]` (le `lstrcmpA` juste avant est un leurre, son résultat est ignoré).
3. Au démarrage, une autre chaîne construite, `GENERATION`, est testée : si ce fichier existe avec les attributs `0x23`, c'est une boucle de MessageBox « FUCK ME PLEASE ;p » puis sortie. Ça ne fait pas partie de l'enregistrement.

## Solveur

- [`tools/korbut_misc1-solve.py`](tools/korbut_misc1-solve.py) recalcule les trois secrets.
- [`tools/korbut_misc1-emu.py`](tools/korbut_misc1-emu.py) émule avec Unicorn la vraie routine `0x401000` d'`original/skor_misc1.exe`, en simulant les API (fichier, presse-papiers, registre).

## Vérification

Changer le nom de machine et piloter le presse-papiers dans la GUI n'a pas été fait ici : la vérification est une **émulation Unicorn du vrai code** du binaire. Avec les trois conditions, le texte posé par `SetDlgItemTextA` est `REGISTERED :)` ; avec un mauvais presse-papiers (`petik`) ou un autre nom de machine, `UNREGISTERED :(` ; sans fichier, MessageBox + sortie.
