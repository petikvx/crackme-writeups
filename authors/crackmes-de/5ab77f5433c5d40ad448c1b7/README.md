# keygenme_1 by korbut (crackmes.de / Dr. rED mEAT W32ASM kEYGENmE #1)

- Page : https://crackmes.one/crackme/5ab77f5433c5d40ad448c1b7
- Plateforme : Windows PE32, MASM 6.14 — difficulté 1.0 — publié 2018-03-25
- Statut : **résolu** (vérifié en live sous wine)

## Solution

| Nom | Serial |
|---|---|
| `petik` | `qfujl` |

Formule : chaque caractère du serial = caractère du nom **+ 1** (`tools/korbut_keygenme1-solve.py`).

## Comment on trouve

1. `diec` : PE32 MASM, pas de packer. Chaînes : `Bien ouej gazier :)` (succès), `Non !!!` (échec), `Tu te fout de ma geule ?` (champ vide).
2. DialogProc : `WM_COMMAND` id `0x6FD` (bouton *..::Check it::..*) → `0x401056`.
3. `GetDlgItemTextA(0xC9)` → serial dans `0x4030DE`, puis `GetDlgItemTextA(0xC8)` → nom dans `0x4030AC` ; `eax` = longueur du nom (un champ vide → message « Tu te fout… »).
4. Boucle `0x401094` sur `len(nom)` caractères :
   ```
   bl = nom[i] ; dl = serial[i] ; inc bl ; cmp dl,bl ; jne Non
   ```
   Donc `serial[i] == nom[i] + 1` (les caractères du serial au-delà de la longueur du nom ne sont pas vérifiés).

Désassemblage : `analysis/check.asm.txt`.

## Vérification

`xvfb-run` + `wine keyme1.exe`, `xdotool` : nom (champ du haut) `petik`, serial (bas) `qfujl`, clic *Check it* → MessageBox **« Bien ouej gazier :) »** (capture `analysis/wine-petik-ok.png`). Contre-tests : champs inversés et `qfujm` → « Non !!! ».
