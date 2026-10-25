# nag_screen_1 (CrackMe1.exe) by kcom

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c33a`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c33a) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (kcom) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 GUI, MSVC 6, 3 Ko |
| **SHA-256 (zip)** | `5b4cd2269c36cf359ea03f113b994a0028d7daba326d35329e40de24bd9cd428` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme1.zip` | archive d'origine (mot de passe `crackmes.one`), contient `CrackMe1.exe` |
| `analysis/x/CrackMe1.exe` | copie extraite (non patchée) |
| `analysis/CrackMe1.patched.exe` | copie patchée (générée) |
| `tools/nag-screen-1-solve.py` | patcher + `--check` (Wine/xvfb) |

## Réponse

Il n'y a pas de serial : le but est de **se débarrasser du nag screen** (`GET RID OF ME!`). Patch : remplacer par des `NOP` les 20 octets `VA 0x40101e–0x401031` (offset fichier `0x41e`) = les 4 `push` + `call MessageBoxA`.

```bash
python3 tools/nag-screen-1-solve.py          # écrit analysis/CrackMe1.patched.exe
python3 tools/nag-screen-1-solve.py --check  # + preuve live Wine/xvfb
```

## Premier regard

- `file` : PE32 GUI i386, pas de packer ; 4 sections, 216 octets de `.rsrc`.
- Imports : `GetModuleHandleA`, `DialogBoxParamA`, `EndDialog`, `MessageBoxA`.
- `strings` : `GET RID OF ME!` / `Get Rid OF ME!!!!` ; ressource dialogue 0x65 titrée `Crackme!` avec un static `this is so fun!`.

## Flow

Tout le code tient dans 0x50 octets (`objdump -d -M intel --start-address=0x401000`).

## Comment on trouve

Entry point `0x40101b` :

```asm
40101b: push ebp ; mov ebp,esp
40101e: push 0               ; uType = MB_OK
401020: push 0x403000        ; "GET RID OF ME!"
401025: push 0x403010        ; "Get Rid OF ME!!!!"
40102a: push 0               ; hWnd
40102c: call [0x40200c]      ; MessageBoxA   <-- le nag
401032: push 0 ; push 0x401000 ; push 0 ; push 0x65   ; dwInitParam, DlgProc, hWndParent, template 0x65
40103d: push 0 ; call [0x402000]   ; GetModuleHandleA(NULL)
401045: push eax ; call [0x402008] ; DialogBoxParamA(hInst, 0x65, ...)
```

La procédure de dialogue (`0x401000`) ne fait que : si `msg == 0x10` (`WM_CLOSE`) → `EndDialog`. Aucune vérification : le « crackme » consiste uniquement à supprimer la MessageBox qui s'affiche avant le dialogue. Le bloc `push×4 + call` est contigu (20 octets, `6a00 6800304000 6810304000 6a00 ff150c204000`), donc on le NOPe en entier : la pile reste équilibrée (les arguments ne sont plus poussés, et `MessageBoxA` est stdcall donc aucun nettoyage manquant).

Piège : ne NOPer que le `call` laisserait 16 octets sur la pile (inoffensif ici, mais sale).

## Vérification

`--check` lance l'original et le patché sous `xvfb-run -a wine` puis liste les fenêtres (`xwininfo -root -tree`, pas de window manager donc `wmctrl` est inutilisable) :

```
original : "GET RID OF ME!"            (MessageBox, bloque le dialogue)
patché   : "Crackme!"                  (dialogue directement)
OK
```

Cas KO/contrôle : avec l'original, le dialogue `Crackme!` n'apparaît qu'après un `Return` sur la MessageBox (testé avec `xdotool key Return`).

## Notes

- Pas de GDB/x64dbg utilisé : reverse 100 % statique + preuve Wine.
- `original/` n'est pas modifié ; le patch est généré dans `analysis/`.
