# crackmes.de's crackme_1_1 by fr1c

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c24c`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c24c) — voir [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (crackme de **Fr1c**, ~2000, premier programme C++ Builder) |
| **Plateforme** | Windows PE32 GUI, **Borland C++ Builder** (Turbo Linker 2.25) |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `5598c9eb1fdd8d4be5c9684d82e8f324da65a5affb44f26c14331fca942b7af0` |
| **SHA-256 (`CrackME.exe`)** | `f39873d3c27cffafb2551806aca0583c5a8aa31367d549437ce410cde0490616` |

Au lancement, une MessageBox d’accueil : *Hello! This is my first C++ Builder program! Try to crack it*.
Puis une Form **CrackMe by Fr1c** avec un seul champ `Edit1`, un bouton **Check**, et le label `UNREGISTERED`.

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme_1.zip` | archive crackmes.one |
| `original/CrackME.exe` | binaire extrait (non modifié) |
| `analysis/button1click.asm` | `Button1Click` (`objdump`) |
| `analysis/verify-wine.txt` | preuve live wine (bon / mauvais serial) |
| `tools/crackme1_1-solve.py` | solveur (relit la constante dans l’exe) |
| `tools/drive.c` / `verify-wine.sh` | pilotage TEdit/TButton sous wine/Xvfb |

## Réponse

Le serial est **constant** ; il n’y a pas de champ nom :

```text
Name   : petik   (non demandé / ignoré)
Serial : F988f91
```

```bash
./tools/crackme1_1-solve.py petik     # Name: petik (non utilisé) / Serial: F988f91
xvfb-run -a bash tools/verify-wine.sh F988f91
# MessageBox : Very good!
xvfb-run -a bash tools/verify-wine.sh wrong
# MessageBox : Try again!
```

## Reconnaissance

```text
$ file CrackME.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386, 8 sections
$ diec CrackME.exe
PE32  Linker: Turbo Linker(2.25)  Compiler: Borland C++
```

Contrôles (DFM / `strings`) : `Edit1`, `Button1` (« Check »), `Label1` (`UNREGISTERED`),
handler `Button1Click`. Chaînes utiles en `.data` :

```text
0x431445  F988f91
0x43144d  Very good!
0x431468  REGISTERED
0x431473  Try again!
0x43148e  Hello!This is my first C++ Builder program!Try to crack it
```

## Analyse de `Button1Click` (`0x40145a`)

Un seul xref vers `Very good!` / `Try again!` :

```asm
401476  lea  eax,[ebp-4]
401479  call 0x40159c              ; init AnsiString locale
401486  mov  eax,[Form+0x1cc]      ; Edit1
40148c  call 0x40a3d4              ; Edit1.Text -> [ebp-4]
401495  mov  edx,0x431445          ; "F988f91"
40149d  call 0x40eed0              ; LStrFromPChar -> [ebp-8]
4014a9  call 0x40f210              ; LStrCmp(Edit1.Text, "F988f91")
4014d0  test cl,cl
4014d2  je   try_again             ; -> MessageBox "Try again!"
; succès :
4014db  push 0x43144d              ; "Very good!"
4014e2  call MessageBox
4014ed  mov  edx,0x431468          ; "REGISTERED" -> Label1.Caption
40151d  xor  edx,edx
401528  call EnableWindow(Button1, False)
401538  call EnableWindow(Edit1, False)
```

Donc la vérification est un simple **`strcmp`** contre la constante **`F988f91`**
(aucune dépendance au nom, à la date, au HWID…). Après succès, le label passe à
`REGISTERED` et les contrôles sont désactivés.

## Preuve live

```text
=== GOOD F988f91 ===
MessageBox : Very good!
=== BAD wrong ===
MessageBox : Try again!
```
