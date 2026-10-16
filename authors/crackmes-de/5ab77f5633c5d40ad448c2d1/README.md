# crackmes.de's crackme_1.75 by bullet

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2d1`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2d1) |
| **Auteur (site)** | crackmes.de (BuLLeT / TOL'98) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 GUI, Visual Basic 5 (p-code, `MSVBVM50.DLL`) |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `b918edd435be14f3c56a0d6dd16a28d8e9570c0ba410ae6f3e31021773df28e4` |
| **SHA-256 (`BRK175.EXE`)** | `135919347df5f950a87d10be2428cd1628b1ae7e50238b4bc234618e19870531` |

## Solution

Mot de passe : **`2hard4u2crackm8`** (constant, pas de nom / serial).

```bash
tools/brk175-solve.py                     # lit la BSTR dans le PE
tools/brk175-solve.py --check 2hard4u2crackm8
# live : wine BRK175.EXE → saisir le mot de passe → « Check it ! »
#   mauvais → TextBox « Nope. That's not the one! »
#   bon     → pas de rejet (TextBox conserve le mot de passe)
```

## Premier regard

```text
$ file original/BRK175.EXE
PE32 executable for MS Windows 4.00 (GUI), Intel i386, 5 sections
$ diec original/BRK175.EXE
Compiler: Microsoft Visual Basic(5.0)
```

ZIP interne `tol_b175.zip` (31/05/98) : `BRK175.EXE` + `FILE_ID.DIZ` + `TOL98.NFO`
(groupe **THE OUTLAWS** / BuLLeT). UI minimale : Image ANSI cyan, TextBox
« Enter your guess here :) », bouton `Command1` « Check it ! ».

## Reverse

VB5 p-code : pas de `.text` natif utile. Les chaînes UTF-16 du pool de
`Command1_Click` suffisent :

```text
$ strings -el original/BRK175.EXE
A*\AC:\Programmer\VB5\BuLLeT\Crackme175\Project1.vbp
2hard4u2crackm8
BuL_LeT@hotmail.com
Nope. That's not the one!
```

Offset `0xf550` : juste après le nom d’événement `Command1_Click`, la BSTR
`2hard4u2crackm8`, puis l’e-mail de l’auteur, puis le message d’échec. Pattern
classique difficulty 1.0 : comparaison directe TextBox ↔ littéral.

Pseudo-code reconstruit :

```vb
Private Sub Command1_Click()
  If Text1.Text = "2hard4u2crackm8" Then
    ' succès (e-mail / Image2 — pas de MsgBox « Congrats » visible)
  Else
    Text1.Text = "Nope. That's not the one!"
  End If
End Sub
```

## Vérification live (wine + MSVBVM50)

Sous `DISPLAY=:1` + runtime VB5 déjà présent dans le préfixe wine :

1. Mauvais essai → le TextBox affiche **`Nope. That's not the one!`**.
2. Après clear (BackSpace) + saisie de **`2hard4u2crackm8`** + clic
   **Check it !** → le TextBox **conserve** le mot de passe (pas de rejet).

Captures : `analysis/password-entered.png`, `analysis/after-check.png`.

## Notes

- Même auteur que `crackme_2.75` (`…c2d0`, abandonné : Mid/concat non vérifié
  à temps). Ici le password est en clair dans le pool — beaucoup plus simple.
- Dépendance runtime : `MSVBVM50.DLL` (wine + winetricks/`vb5run` ou copie
  syswow64).
