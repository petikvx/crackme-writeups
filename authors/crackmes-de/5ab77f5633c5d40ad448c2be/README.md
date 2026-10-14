# full_patchme by qhf (crackmes.de)

- Origine : [ORIGIN.yml](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2be)
- Auteur : **qhf** (archive crackmes.de, publié sur crackmes.one par `crackmes.de`)
- Plateforme : Windows x86, PE32 **GUI** (boîte de dialogue Win32), MinGW gcc 3.4.5, 8,5 Ko
- Difficulté site : 1.0
- Type : **patchme** (pas de serial) — six objectifs listés dans `original/rules.txt`

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/patchme.zip` | archive d’origine (password `crackmes.one`) |
| `original/patchme.exe` | PE extrait (non modifié) |
| `original/rules.txt` | les 6 objectifs de l’auteur |
| `analysis/patchme_patched.exe` | binaire patché produit par le solveur |
| `analysis/dlgproc.objdump.txt` | désassemblage de la DialogProc principale (`0x401390`) |
| `analysis/check.txt` | vérification live Wine : original (KO) vs patché (OK) |
| `tools/full_patchme-solve.py` | patcher (vérifie les octets d’origine avant d’écrire) |
| `tools/chk.c`, `tools/mchk.c` | petits clients Win32 (mingw) qui pilotent / inspectent la fenêtre sous Wine |

## Réponse

Huit patches d’octets (4 dans `.text`, 4 dans `.rsrc`), tous de même longueur :

| # | Offset fichier | Avant → après | Objectif |
|---|---|---|---|
| 1 | `0x086b` (VA `0x40146b`) | `75 c4` → `eb c4` | nag de **début** supprimé (`jne` → `jmp`) |
| 2 | `0x0810` (VA `0x401410`) | `0f 84 d3 00 00 00` → `90×6` | nag de **fin** (WM_CLOSE / bouton Exit) supprimé |
| 3 | `0x08e9` (VA `0x4014e9`) | `c7 04 24 00 00` → `e9 32 ff ff ff` | menu File→Exit : `jmp 0x401420` (EndDialog direct, sans nag) |
| 4 | `0x0988` (VA `0x401588`) | `74 5c` → `eb 5c` | bouton **Add ListItem** fonctionnel |
| 5 | `0x1b10` (MENU 104) | flags `0x0002` → `0x0000` | **File→Save activé** (retire `MF_DISABLED`) |
| 6 | `0x1b14` (MENU 104) | `Save (Registered Version Only)` → `Save (patched by petik)` + espaces | **texte de Save** changé |
| 7 | `0x1ba4` (DIALOG 101) | `…(Unregistered Version)` → `…(Registered Version)  ` | **caption** changée |
| 8 | `0x1dbc` (DIALOG 102) | `UNREGISTERED VERSION` → `REGISTERED VERSION!!` | **About** sans « unregistered » |

```bash
./tools/full_patchme-solve.py            # écrit analysis/patchme_patched.exe
./tools/full_patchme-solve.py -q original/patchme.exe -o /tmp/patched.exe
```

## Premier regard

```console
$ file original/patchme.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386 (stripped to external PDB), 6 sections
$ strings -n 4 original/patchme.exe
Trial
This is an unregistered version. Please buy it.
This feature is only available in the Full Version!!
Save
Good job. Did you change the item's text yet?
Good job. How are you doing with the rest?
```

Imports USER32 : `DialogBoxParamA`, `EndDialog`, `MessageBoxA`, `SendDlgItemMessageA`, `SendMessageA`, `ReleaseCapture`. Tout passe par des boîtes de dialogue : pas de fenêtre « classique », pas de check de serial.

`rules.txt` :

```text
Patch the beginning and the end nags
Enable the File->Save option
Change the File->Save text
Patch so the listbox button works
Patch the about to something other than unregistered
Change Caption
```

## Flow

`WinMain` (`0x401620`) appelle `DialogBoxParamA(hInst, 101, NULL, DlgProc=0x401390)`. La DialogProc gère :

- `WM_INITDIALOG` (0x110) → nag *Trial / This is an unregistered version* ;
- `WM_CLOSE` (0x10) → même nag puis `EndDialog` ;
- `WM_COMMAND` (0x111) → table de saut à `0x4030d0` indexée par `id - 1001` ;
- `WM_LBUTTONDOWN` (0x201) → `ReleaseCapture` + `SendMessage(WM_NCLBUTTONDOWN, HTCAPTION)` (déplacer la fenêtre en cliquant n’importe où).

Table `0x4030d0` (ids → handlers) :

| id | Contrôle | Handler |
|---|---|---|
| 1001 | bouton *Add ListItem* | `0x401581` |
| 1002 / 1009 | bouton *Rules* / menu Help→Rules | `0x401518` (dialogue 103) |
| 1003 / 1008 | bouton *About* / menu Help→About | `0x401558` (dialogue 102) |
| 1004 | bouton *Exit* | `0x4013d5` (chemin WM_CLOSE) |
| 1006 | menu File→Save | `0x4015ad` : MessageBox *Good job. Did you change the item's text yet?* |
| 1007 | menu File→Exit | `0x4014e9` : nag puis EndDialog |

## Comment on trouve les patches

### 1–3. Les nags : un octet `.bss` jamais écrit

```asm
; WM_INITDIALOG (0x401440)
401440  cmp  byte [0x404013],1 ; je 0x401420   ; 4 flags .bss 0x404010..13
...                                            ; (toujours 0 : .bss, jamais écrits)
401464  cmp  byte [0x404014],0                 ; « registered » ?
40146b  jne  0x401431                          ; ← patch 1 : jne → jmp (eb c4)
40146d  MessageBoxA(0, "This is an unregistered version…", "Trial", MB_ICONHAND)

; WM_CLOSE (0x4013d5)
401409  cmp  byte [0x404014],0
401410  je   0x4014e9                          ; ← patch 2 : NOP×6 → tombe sur 0x401420
401420  EndDialog(hDlg, 0)
4014e9  MessageBoxA(… nag …) ; jmp 0x401420     ; ← patch 3 : jmp 0x401420 dès 0x4014e9
```

`0x404014` est dans `.bss` (taille brute 0) : on ne peut pas l’initialiser à 1 dans le fichier, d’où les patches de sauts. Le patch 3 couvre l’entrée de menu File→Exit (id 1007), qui saute directement sur le bloc nag.

Saut relatif du patch 3 : `0x401420 − (0x4014e9 + 5) = −0xce` → `e9 32 ff ff ff`.

### 4. Bouton Add ListItem

```asm
401581  cmp  byte [0x404014],1
401588  je   0x4015e6        ; ← patch 4 : je → jmp (eb 5c)
40158a  MessageBoxA(… "This feature is only available in the Full Version!!" …)
4015e6  SendDlgItemMessageA(hDlg, 1, LB_ADDSTRING(0x180), 0, "Good job. How are you doing with the rest?")
```

### 5–8. Ressources (menu et dialogues)

Dump avec `pefile` (offsets fichier dans `.rsrc`, raw `0x1a00`) :

```text
MENU 104   @0x1b00 : File / [flags 0x0002, id 1006] "Save (Registered Version Only)" / Exit / Help / About / Rules
DIALOG 101 @0x1b8c : caption "qHF's PatchMe (Unregistered Version)", menu 104, Add ListItem / LISTBOX / Rules / About / Exit
DIALOG 102 @0x1cfc : About, static "About\n\nPatchMe by qHF\n\nUNREGISTERED VERSION"
```

Dans un `MENUITEMTEMPLATE`, l’item Save commence à `0x1b10` : `02 00` (flags = `MF_DISABLED`) `ee 03` (id 1006), puis la chaîne UTF-16. On met les flags à 0.

Piège : menus et dialogues sont des **templates séquentiels** (chaque champ suit le précédent). Raccourcir une chaîne décalerait tout ce qui suit → on garde **exactement la même longueur** (padding d’espaces, ou `REGISTERED VERSION!!` = 20 caractères comme `UNREGISTERED VERSION`).

## Vérification

Sous Wine (`xvfb-run`), `tools/chk.exe` (mingw) se lance à côté de la cible, retrouve la fenêtre, poste les `WM_COMMAND` et lit les contrôles ; `tools/mchk.exe` charge le MENU 104 du fichier (`LoadMenu` sur `LOAD_LIBRARY_AS_DATAFILE`), car Wine ne renvoie pas le sous-menu d’une fenêtre d’un autre process. Extrait de `analysis/check.txt` :

```text
== patchme.exe (original, KO)
main=00010058 nag_trial=00010068                 ← nag au démarrage
caption=[qHF's PatchMe (Unregistered Version)]
after AddListItem: nag=00010086 listbox_count=0  ← « only available in the Full Version »
about_child=[About … UNREGISTERED VERSION]
after close: nag=000400a0 main_alive=1           ← nag de fin
patchme.exe: Save=[Save (Registered Version Only)] state=0x2   ← MF_DISABLED

== patchme_patched.exe (OK)
main=00010058 nag_trial=00000000
caption=[qHF's PatchMe (Registered Version)  ]
after AddListItem: nag=00000000 listbox_count=1
item0=[Good job. How are you doing with the rest?]
after Save: fg=[Save]  static=[Good job. Did you change the item's text yet?]
about_child=[About … REGISTERED VERSION!!]
after close: nag=00000000 main_alive=0           ← fermeture directe
patchme_patched.exe: Save=[Save (patched by petik)       ] state=0x0
```

Commande :

```bash
cd analysis && CAP="qHF's PatchMe (Registered Version)  " \
  xvfb-run -a sh -c 'wine patchme_patched.exe & sleep 2; wine ../tools/chk.exe'
```

(`chk.exe` / `mchk.exe` : `i686-w64-mingw32-gcc -o chk.exe tools/chk.c`.)

## Notes

- Aucun serial : c’est un pur patchme ; le solveur est un patcher qui **vérifie les octets d’origine** avant d’écrire.
- Le message de File→Save (*Did you change the item's text yet?*) est atteignable même dans l’original en postant `WM_COMMAND 1006` : le vrai verrou est le flag `MF_DISABLED` du menu, d’où le patch de ressource plutôt que de code.
- Les quatre flags `.bss` `0x404010..13` testés au début de `WM_INITDIALOG` / `WM_CLOSE` ne sont jamais écrits : code mort, inutile d’y toucher.
