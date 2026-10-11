# nts_crackme2 by cyclops (crackmes.de)

| | |
|---|---|
| Page | [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c15d) |
| Plateforme | Windows 32 bits, GUI (MASM32) |
| Difficulté | 1.0 |
| Objectif | « Fish the serial » (bonus : patcher / loader) |

## Solution

Serial : **`Serial`** (sensible à la casse, pas de nom demandé).

## Comment on trouve

1. `diec` : MASM 6.14 / MASM32, binaire minuscule. Imports : `DialogBoxParamA`, `GetDlgItemTextA`,
   `lstrcmpA`, `MessageBoxA`. `strings` sort `Serial` et `Registered!!!` côte à côte.
2. `objdump` : la DialogProc est en `0x401028`. Sur `WM_COMMAND` (0x111) avec le bouton `0x3EB` :

```asm
push 0xa / push 0x403044 / push 0x3e9 / push hwnd
call GetDlgItemTextA          ; serial saisi (9 car. max) -> 0x403044
push 0x403000                 ; "Serial"
push 0x403044
call lstrcmpA
or   eax,eax
jne  fin                      ; différent -> rien
MessageBoxA(0, "Registered!!!", "Project PolyPhemous - NTS - Crackme2", 0)
```

   La chaîne de référence en `.data:0x403000` est littéralement `Serial` : le texte qu'on prenait
   pour un libellé est la réponse. Le solveur la relit directement dans le PE.
3. Bonus patcher : remplacer le `jne 0x401085` (`75 17` en `0x40106c`) par deux `nop` accepte tout.

## Vérification

GUI : on exécute **la vraie DialogProc** du binaire sous Unicorn (`analysis/emulate_dlgproc.py`),
avec `GetDlgItemTextA` / `lstrcmpA` / `MessageBoxA` émulés :

```
$ python3 analysis/emulate_dlgproc.py Crackme2.exe Serial
MessageBox : ['Registered!!!']
$ python3 analysis/emulate_dlgproc.py Crackme2.exe petik
MessageBox : aucune
```
