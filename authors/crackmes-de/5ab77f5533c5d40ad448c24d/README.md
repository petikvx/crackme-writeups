# crackmes.de's crackme_3 by fr1c

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c24d`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c24d) — voir [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (crackme de **Fr1c**, 2000, « Croatian Cracking Force ») |
| **Plateforme** | Windows PE32 GUI, **Visual Basic 5** compilé en **natif** (`MSVBVM50.DLL`) |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `efea8013acafb8e4a8ec26ce157e182961f564e35cfe55450d503b605795ce4c` |
| **SHA-256 (`CrackMe3.exe`)** | `9aba0e42865f7c87e308cc7983bc648526fb9220594ca1fb402c8b5bdf004421` |

Fenêtre *Crackme 3 by Fr1c* : un champ `Text1` (sert d’affichage REGISTERED / UNREGISTERED),
boutons **Check key** / **Exit**. Pas de saisie de serial : la clé est dans un **fichier**.

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme3_1.zip` | archive crackmes.one |
| `original/CrackMe3.exe` | binaire extrait |
| `analysis/form_load.asm`, `command1_click.asm` | extraits `objdump` |
| `analysis/verify-wine.txt`, `wine-ok.png`, `wine-ko.png` | preuve live |
| `tools/crackme3-solve.py` | crée `crackme3.key` avec la constante |
| `tools/drive.c` / `verify-wine.sh` | lit `Text1` via `WM_GETTEXT` sous wine |

## Réponse

Créer le fichier **`crackme3.key`** dans le répertoire de travail de l’exe, contenant :

```text
98765432112345
```

Le nom `petik` n’est pas demandé. Au `Form_Load` (et de nouveau sur **Check key**),
le label/`Text1` passe à **REGISTERED**.

```bash
./tools/crackme3-solve.py petik          # écrit original/crackme3.key
xvfb-run -a bash tools/verify-wine.sh
# with key    -> EDIT_TEXT='REGISTERED'
# without key -> EDIT_TEXT='UNREGISTERED' (+ MessageBox "Can't find crackme3.key")
```

## Reconnaissance

```text
$ file CrackMe3.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386, 5 sections
$ diec CrackMe3.exe
PE32  Compiler: Microsoft Visual Basic(5.0)
```

Imports utiles : `__vbaFileOpen`, `__vbaInputFile`, `__vbaFileClose`, `__vbaVarTstEq`,
`__vbaOnError`. Chaînes UTF-16 :

```text
crackme3.key
98765432112345
REGISTERED / UNREGISTERED
Can't find crackme3.key
Author of this crackme: Fr1c! …
```

## Analyse (`Form_Load` @ `0x402740` et `Command1_Click` @ `0x402af0`)

Les deux handlers font la même chose :

```asm
; On Error Resume Next
push -1 ; call __vbaOnError
; Open "crackme3.key" For Input As #1
push offset aCrackme3_key          ; 0x401e54
push 1 / push -1 / push 1
call __vbaFileOpen
; Input #1, Me.serial (offset +0x34)
lea  edx,[Me+0x34]
push edx / push 1 / push format
call __vbaInputFile
call __vbaFileClose
; If serial = "98765432112345" Then
mov  [var], offset a98765432112345 ; 0x401e7c
lea  eax,[Me+0x34] / push eax / lea ecx,var / push ecx
call __vbaVarTstEq
test edx,edx
je   bad
; Text1 = "REGISTERED"
push offset aREGISTERED            ; 0x401ea0
call TextBox.put_Text
jmp  done
bad:
; Text1 = "UNREGISTERED" (+ MsgBox sur Form_Load)
push offset aUNREGISTERED
…
```

Donc le prédicat est : **fichier `crackme3.key` présent et contenu égal à `98765432112345`**
(après `Input #`, typiquement une ligne ASCII). Aucune dépendance au nom.

## Preuve live

```text
== with key ==
EDIT_TEXT='REGISTERED'
== without key ==
EDIT_TEXT='UNREGISTERED'
```
