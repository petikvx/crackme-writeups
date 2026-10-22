# crackme12 — attilhaz (crackmes.de)

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c309`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c309) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | attilhaz (importé via crackmes.de) |
| **Plateforme** | Windows PE32 GUI, Visual Basic 6 (code natif, `MSVBVM60.DLL`) |
| **SHA-256 du ZIP** | `e00b6948d8eaf1f49f1eb9a682ffef3bbbde8039f5c12adcf699769a89a06179` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme12.zip` | archive d'origine (mot de passe `crackmes.one`), intacte |
| `analysis/extracted/` | `Crackme12.exe` + `Readme.txt` extraits du ZIP (SHA-256 exe : `8650b5075347c41e5aed0e7845c0e90f13ea0849082d6823561fb53bc5bd4a7e`) |
| `analysis/screenshot-ok.png` / `screenshot-ko.png` | preuve Wine : « Registered » / « Unregistered » |
| `tools/crackme12-solve.py` | génère le `keyfile.dat` valide (`-q`, `-o DIR`, `--check EXE`) |

## Réponse

Le `Readme.txt` de l'auteur : *« Register it without patching. This crackme use a keyfile. »*

Il faut donc un fichier **`keyfile.dat`** dans le répertoire courant de l'exe, contenant **exactement** :

```text
abcx-rmno-fdas-fass
```

(19 octets, sans CR/LF final). Pas de nom d'utilisateur ici (donc pas de `petik`) : la clé est constante.

```bash
python3 -I tools/crackme12-solve.py -o <dossier_de_Crackme12.exe>
# -q : n'affiche que la clé
```

## Premier regard

```bash
file Crackme12.exe   # PE32 GUI, Intel i386, 3 sections
diec Crackme12.exe   # Linker MS 6.0 ; Compiler: Visual Basic 6.00.8041 [Native]
strings -el -n 3 Crackme12.exe
```

Les chaînes **UTF-16** (BSTR VB) donnent le squelette de la logique :
`keyfile.dat`, `abcx-rmno-fdas-fass`, `Registered` / `Good`, `Unregistered` / `Bad`,
`Register this crackme without patch it!!!`. Imports VB utiles : `__vbaFileOpen`,
`__vbaFileClose`, `__vbaStrCmp`. (`strings` ASCII classique ne voit rien : il faut `-el`.)

## Flow

1. Au lancement, `MessageBox` « Register this crackme without patch it!!! ».
2. Ouverture de `keyfile.dat` (chemin relatif → répertoire courant), lecture de tout le contenu dans une string.
3. Fermeture du fichier, puis comparaison avec la constante ; message « Registered » (icône info) ou « Unregistered » (icône erreur).

## Comment on trouve

- **Ancrage** : `.text` à `0x401000`. Le code VB natif du handler est vers `0x401cb0–0x402160`
  (`objdump -d -M intel --start-address=0x401b78 --stop-address=0x402538 Crackme12.exe`).
  Le début de `.text` n'est que la table des thunks IAT (`jmp [0x4010xx]`) et les structures VB (ProjectInfo, Form1).
- **Lecture du handler** (extrait commenté) :

```asm
401dcd  mov  edx, 0x4019b0          ; BSTR L"keyfile.dat"
401dd5  call [__vbaStrCopy-like]     ; copie dans la variable locale [ebp-0x24]
401de2  mov  edx,[ebp-0x24]
401de5  push edx                     ; nom du fichier
401de6  push 1 / push -1 / push 1    ; mode Input, n° de canal 1 ...
401dec  call [0x401078]              ; __vbaFileOpen("keyfile.dat", #1)
401df9  push 1
401dfb  call [0x40107c]              ; LOF(#1) -> taille
401e08  call [0x401018]              ; Input(LOF, #1) -> variant
401e12  call [0x40100c] / 0x4010a4   ; conversion variant -> string [ebp-0x28]
401e35  call [0x401048]              ; __vbaFileClose(#1)
401e42  mov  edx,[ebp-0x28]          ; contenu lu
401e46  push 0x4019cc                ; BSTR L"abcx-rmno-fdas-fass"
401e4b  call [0x401050]              ; __vbaStrCmp
401e51  test eax,eax
401e53  jne  0x401f1e               ; != -> branche "Unregistered"
```

- **Décodage** : `objdump -s` sur `0x4019b0` et `0x4019cc` donne de l'UTF-16LE
  (`6b00 6500 7900 …` = `keyfile.dat` ; `6100 6200 6300 7800 2d00 …` = `abcx-rmno-fdas-fass`).
  La seconde est la valeur de comparaison, en clair dans l'exe : pas de calcul, pas de dérivation.
- **Piège** : comme la lecture est `Input(LOF(1),1)`, le fichier doit faire exactement la longueur de la clé :
  un retour à la ligne final (`echo` sans `-n`) casse `StrCmp`. Le solveur écrit les octets sans CRLF.
  Le fichier est cherché dans le **cwd** du processus (pas à côté de l'exe).
- Les imports `_CIcos`, `_adj_fptan` ne servent qu'au runtime VB, pas au prédicat.

## Vérification

Analyse statique + Wine (aucun GDB / debugger utilisé, donc pas de section « Debug GDB »).

```bash
mkdir run && cp analysis/extracted/Crackme12.exe run/
python3 -I tools/crackme12-solve.py -o run
cd run && xvfb-run -a wine Crackme12.exe      # appuyer sur Entrée au 1er MessageBox
```

| Cas | `keyfile.dat` | Résultat |
|---|---|---|
| OK | `abcx-rmno-fdas-fass` | « Registered » ([screenshot-ok.png](analysis/screenshot-ok.png)) |
| KO | `wrong` | « Unregistered » + icône erreur ([screenshot-ko.png](analysis/screenshot-ko.png)) |

(Captures prises avec `xvfb-run` + `ffmpeg -f x11grab`, après `xdotool key Return` sur le premier message.)

## Notes

- Aucun patch : l'exe d'origine (extrait du ZIP, non modifié) affiche « Registered » avec le bon keyfile.
- Ce n'est **pas** un keygen : une seule valeur valide, constante.
