# crackme_5 by fireworx

| | |
|---|---|
| **ID** | [`5ab77f5433c5d40ad448c183`](https://crackmes.one/crackme/5ab77f5433c5d40ad448c183) |
| **Auteur (site)** | crackmes.de (FireWorx) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Win32 GUI, Borland Delphi 4 (non packé) |
| **Difficulté** | 1.0 |
| **SHA-256** | `f7e1da85edfa7e6f02f2fdc0c92ef5e369ecb8d6f86c5946f4c272a5c610e0f7` |

ZIP password : `crackmes.one`. Voir [`ORIGIN.yml`](ORIGIN.yml).

## TL;DR

Code d'enregistrement fixe : **`Regcode`** (à taper dans le champ, pas de bouton à cliquer).

Solveur : [`tools/crackme5-solve.py`](tools/crackme5-solve.py).

## Comment on trouve

1. `diec` : PE32 GUI, Borland Delphi 4, non packé. Aucune chaîne « right / wrong » : la fenêtre n'a qu'un champ et un bouton **About**.
2. La RTTI de `TForm1` liste les champs `Edit1` (+0x2C4), `Label1` (+0x2C8), `Timer1` (+0x2CC), `Label2` (+0x2D0), `Button1` (+0x2D4), et les méthodes `Timer1Timer` (`0x4419E8`) et `Button1Click` (`0x441AA0`, simple boîte About).
3. La DFM (ressource `TPF0`) donne : `Label1.Caption = 'Regcode'`, `Label2.Caption = 'Cracked'` (`Visible = False`), `Timer1.Interval = 1`, `OnTimer = Timer1Timer`.
4. `Timer1Timer` ([`analysis/Timer1Timer.asm`](analysis/Timer1Timer.asm)) :

```asm
mov  eax,[ebx+0x2c4] ; call GetText      ; Edit1.Text
push eax
mov  eax,[ebx+0x2c8] ; call GetText      ; Label1.Caption ("Regcode")
pop  eax ; call LStrCmp
jne  fin
xor  edx,edx ; mov eax,[ebx+0x2cc] ; call SetEnabled   ; Timer1.Enabled := False
... MessageBox(Label2.Caption = "Cracked", mtInformation)
```

Toutes les millisecondes, le timer compare le texte saisi à la caption du label affiché à l'écran : il suffit donc de taper littéralement `Regcode` (le mot visible au-dessus du champ).

## Vérification

Live sous Wine (`xvfb-run` + `xdotool`, [`tools/verify-wine.sh`](tools/verify-wine.sh)) : taper `Regcode` ouvre une boîte **Information** « Cracked » ; `Regcodx` ne déclenche rien.
