# crackme_3 by fireworx

- **Page** : [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c189)
- **Auteur** : FireWorx (réimport crackmes.de)
- **Plateforme** : Windows, Win32 GUI, Delphi 4, non packé
- **Difficulté** : 1.0
- **Type** : mot de passe fixe

## Solution

Mot de passe : **`RIDERSINTHENIGHT`** (insensible à la casse, `ridersinthenight` marche aussi).

## Comment on trouve

1. `diec` : Delphi 4. La fiche `TForm1` (ressource DFM `TPF0`) contient deux boutons, `&Register` (`Button1Click`) et `&About`, et un composant tiers `TAHMPasswordDlg` nommé `passwd`.
2. `Button1Click` (`0x44591c`) appelle juste la méthode virtuelle `Execute` du dialogue (`call [edx+0x30]`).
3. Les propriétés du composant sont stockées en clair dans le DFM :
   `Password = 'RIDERSINTHENIGHT'`, `Scramble = 9d 94 8f 90 …`, `NoOfRetries = 3`.
4. Les infos RTTI donnent les setters : `SetPassword` (`0x4452b8`) fait `UpperCase` puis remplit `Scramble` avec `chr(c + 0x4B)` (`'R'` 0x52 + 0x4B = 0x9D, cohérent). La vérification (`0x4454bd`) fait `UpperCase(saisie)` puis `CompareStr` avec le champ `Password` (`[ebx+0x98]`) et appelle `OnRightPassword` (« U have entered a good serial »).

Le solveur `tools/crackmes-de-crackme_3_fireworx-solve.py` extrait le mot de passe du binaire et contrôle la cohérence avec `Scramble`.

## Vérification

Lancé sous wine (Xvfb + xdotool) : clic sur Register, saisie `ridersinthenight`, Entrée → boîte « Information : U have entered a good serial » (capture `analysis/wine-good-serial.png`). Un mot de passe faux donne la boîte « Error ».
