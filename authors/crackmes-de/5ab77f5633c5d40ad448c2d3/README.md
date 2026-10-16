# crackmes.de's madeinqcs_crackme by madeinqc

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2d3`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2d3) |
| **Auteur (site)** | crackmes.de (auteur réel : **madeinqc**) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 GUI, MASM32 |
| **Difficulté** | 2.0 |
| **SHA-256 (zip)** | `f6a975b7aaef72cdb9dd8cc896a1b333a201da550e6a2fc093026f88baf74a00` |
| **SHA-256 (crackme1.exe)** | `65ec6d343105165b4b178d3eae5c9cd7451e6ca7ac9207997efca3743975dcad` |

## Origine

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2d3
- ZIP password : `crackmes.one`
- Voir [`ORIGIN.yml`](ORIGIN.yml).

## Contenu

```
original/   Madeinqc_crack-me_1.zip, crackme1.exe, README.txt
analysis/   mb-proof.txt (capture MessageBox wine)
tools/      madeinqcs-crackme-solve.py
```

## Énoncé

Le `README.txt` du zip demande de trouver le message **Good Boy**, **sans patch**.
Un tip est caché tout en bas du même fichier :

> TIPS: It's in the Menu

## Reconnaissance

```
$ file crackme1.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386, 4 sections
$ diec crackme1.exe
Linker: Microsoft Linker(5.12) / Compiler: MASM(6.14) / Tool: MASM32
```

Chaînes utiles :

| VA | Texte |
|---|---|
| `0x403018` | titre MessageBox `Madeinqc's crack-me 1` |
| `0x40302e` | **Good Boy** : `Good job! You found the Menu!…` |
| `0x403092` | leurre bouton Info : `You must find the ''Good Boy'' message.` |

Ressources PE :

- **DIALOG** `MADEINQCDIALOG` — classe `DLGCLASS`, bouton **Info** (id=1)
- **MENU** `MADEINQCMENU` — popup `You hacked it!` → item `Good job!` (**id=1**), séparateur, `E&xit` (id=3)

## Analyse

### Ligne de commande → nom du menu

Au démarrage le crackme fait `GetCommandLineA`, avance jusqu’au premier `/`, et
stocke le pointeur **juste après** dans `lpszMenuName` de la `WNDCLASSEX`
(`DLGCLASS`) :

```text
crackme1.exe /MADEINQCMENU
             ^^^^^^^^^^^^
             → lpszMenuName = "MADEINQCMENU"
```

Sans cet argument, aucune barre de menu n’est associée à la classe : seul le
bouton **Info** est visible, et il affiche le message leurre.

### DlgProc (`0x401118`)

Sur `WM_COMMAND` (`0x111`) :

1. Si `lParam == 0` (commande **menu**) et `LOWORD(wParam) == 1` →
   `MessageBoxA` avec le texte Good Boy (`0x40302e`).
2. Si `lParam != 0` (contrôle) et notification `BN_CLICKED` sur id=1 (**Info**) →
   MessageBox leurre (`0x403092`).
3. Autre id menu → `DestroyWindow`.

Donc le « Good Boy » est exactement le clic menu **Good job!** (id 1), ce qui
exige d’avoir chargé `MADEINQCMENU` via la ligne de commande.

## Solution

```bat
crackme1.exe /MADEINQCMENU
```

Puis : menu **You hacked it!** → **Good job!**

Message obtenu :

```text
Good job! You found the Menu!
Now send a mail to madeinqc_cracking@hotmail.com with your tutorial.
```

Aucun patch. Username d’exemple du dépôt : `petik` (non utilisé ici — pas de serial).

## Preuve live

Sous Xvfb + wine : lancement avec `/MADEINQCMENU`, puis `PostMessage(WM_COMMAND, 1, 0)`
vers la fenêtre dialogue (équivalent au clic menu id=1). Capture dans
[`analysis/mb-proof.txt`](analysis/mb-proof.txt) :

```text
MB_TITLE=Madeinqc's crack-me 1
  [Static] Good job! You found the Menu!
Now send a mail to madeinqc_cracking@hotmail.com with your tutorial.
```

```bash
python3 tools/madeinqcs-crackme-solve.py          # vérif statique
python3 tools/madeinqcs-crackme-solve.py --live   # wine + Xvfb
```

## Références

- `objdump -d -M intel` sur `.text` (dlgproc `0x401118`)
- Ressources `.rsrc` : menu `MADEINQCMENU`, dialog `MADEINQCDIALOG`
