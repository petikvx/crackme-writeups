# hidewindow — devoney (crackmes.de, réimport crackmes.one)

| | |
|---|---|
| Page | [crackmes.one/crackme/5ab77f5333c5d40ad448c10b](https://crackmes.one/crackme/5ab77f5333c5d40ad448c10b) |
| Plateforme | Windows PE32 GUI, C/C++ (Bloodshed Dev-C++ / MinGW) |
| Difficulté | 2.0 |
| Binaire | `original/CrackMe_#4.zip` → `CrackMe #4/MainApp.exe` |
| Solveur | [`tools/hidewindow-solve.py`](tools/hidewindow-solve.py) |

## Objectif

Le ReadMe : *« Unlock the menu item "Hide Window" by filling in the right password »*, avec un indice : un « trick » autour de `GetDlgItemInt`.

## Comment on trouve

1. `objdump -p` : imports `GetDlgItemInt`, `GetWindowTextA`, `CharNextA`, `lstrcatA`, `atoi`, `EnableMenuItem`. Le binaire garde ses symboles MinGW : `__Z15WindowProcedureP6HWND__jjl@16`.
2. `objdump -d -M intel` sur `WindowProcedure`, branche `WM_COMMAND` (0x111) — extrait dans [`analysis/wndproc-wm_command.asm`](analysis/wndproc-wm_command.asm) :
   - **id 0x8801 (bouton)** :
     ```asm
     call _GetDlgItemInt@16          ; edit 0x8802
     cmp  dword [0x406144], 0x34ea090 ; 55484560
     jne  bad
     cmp  [ebp-4], 0x15b8             ; 5560
     jne  bad
     ... EnableMenuItem(GetMenu(hwnd), 0x6d, MF_ENABLED)
     bad: inc dword [0x406028] ; cmp ...,1 ; je ExitProcess(0)
     ```
     Donc : le nombre dans la case doit valoir **5560**, une variable globale doit valoir **55484560**, et **le premier essai faux ferme le programme**.
   - **id 0x8802, notification `EN_CHANGE` (HIWORD = 0x400)** : à chaque modification du texte, le code lit le texte (`GetWindowTextA` dans un buffer `VirtualAlloc`), calcule `CharNextA(p) - 1 + len - 1` = pointeur sur le **dernier caractère**, le concatène (`lstrcatA`) à un buffer global `0x406040` (en `.bss`, donc vide au départ), puis `0x406144 = atoi(0x406040)`.
3. Le « trick » : la variable comparée à 55484560 n'est pas le mot de passe, c'est **l'historique des derniers caractères** après chaque changement. Il faut que cet historique soit `5 5 4 8 4 5 6 0` alors que le texte final vaut `5560`.

## Solution

Saisie (une seule fois, sans erreur) :

| Action | Texte de l'edit | Caractère ajouté | Buffer |
|---|---|---|---|
| taper `5` | `5` | 5 | `5` |
| taper `5` | `55` | 5 | `55` |
| taper `4` | `554` | 4 | `554` |
| sélectionner le `4`, taper `8` | `558` | 8 | `5548` |
| sélectionner le `8`, taper `4` | `554` | 4 | `55484` |
| sélectionner le `4`, taper `5` | `555` | 5 | `554845` |
| sélectionner le `5` final, taper `6` | `556` | 6 | `5548456` |
| taper `0` | `5560` | 0 | `55484560` |

Puis cliquer le bouton : `GetDlgItemInt` = 5560 et `atoi(buffer)` = 55484560 → le menu **Hide Window** est activé.

Attention : un Retour arrière ou toute frappe parasite ajoute aussi un caractère au buffer (il faut alors relancer le programme), et un mauvais clic quitte l'appli.

```bash
python3 tools/hidewindow-solve.py
```

## Vérification

Preuve **statique** : l'appli est un GUI Win32 piloté au clavier (sélection + remplacement), pas pilotable ici de façon fiable. Le solveur rejoue exactement la logique désassemblée (concaténation du dernier caractère à chaque `EN_CHANGE`, `atoi`, comparaison aux deux constantes) et valide la séquence. Pas de patch de `original/`.
