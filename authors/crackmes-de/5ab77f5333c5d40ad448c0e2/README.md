# salazans_keygenme_0003 — salazan (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c0e2
- Plateforme : Windows PE32 GUI, Borland Delphi 6, non packé · difficulté 2.0 · publié le 2018-03-25 (réimport crackmes.de)
- La fenêtre s'appelle « Salazan KeyGenME! # 0003 » (le readme parle de « second keygenme »).

## Réponse

Nom `petik` → serial **`CCCABA0BC21A10-OOOOP-OOOOO-OOOOS-OOOOK-OOOOI`**

Keygen : `python3 tools/salazans_keygenme_0003-solve.py <nom>`.

Formule :

- `préfixe` = MD5(nom) en hex **majuscule**, dont on ne garde que les caractères `0`,`1`,`2`,`3`,`A`,`B`,`C` (dans l'ordre) ;
- serial = `préfixe` + `-` + `G1-G2-G3-G4-G5`, chaque groupe fait 5 caractères et la somme de leurs codes ASCII vaut respectivement `0x18c` (396), `0x18b` (395), `0x18f` (399), `0x187` (391), `0x185` (389). Ex. `OOOOP` = 4×79+80 = 396.

## Comment on trouve

1. `diec` : Delphi 6. Aucune chaîne de succès en clair : les messages sont construits caractère par caractère (série de `call 0x460210` = `Chr` + concaténation), donc on part de la RTTI.
2. Dans la table des méthodes publiées de `TForm1` on trouve `Button1Click` → adresse lue juste avant le nom : **`0x461088`** (`analysis/objdump-button1click.txt`).
3. `Button1Click` récupère `Edit1` (`+0x2f0`, nom) et `Edit2` (`+0x2f4`, serial) puis appelle `0x4576c4(serial, nom)` ; si `al == 0` on saute au message d'échec, sinon on construit le message de réussite.
4. `0x4576c4` (`analysis/objdump-check.txt`) :
   - serial non vide et `Length(serial) >= 0x1d` (29) ;
   - `p = Pos('-', serial)` (la constante à `0x457964` est la chaîne `-`) ;
   - `Copy(serial, p+1, 5)`, `p+7`, `p+13`, `p+19`, `p+25` : cinq blocs de 5, sommes ASCII comparées à `0x18c, 0x18b, 0x18f, 0x187, 0x185` ;
   - `Copy(serial, 0, p-1)` (index 0 ramené à 1 par `LStrCopy` `0x4047b4`) doit être égal à `0x45760c(nom)` ;
   - le résultat est le ET des six drapeaux.
5. `0x45760c(nom)` : appelle `0x456a84` (MD5 → hex ; on reconnaît `0x67452301`/`0xd76aa478` et les fonctions F/G/H/I à `0x456ae0`, puis `IntToHex(b,2)` en boucle ×16 à `0x457510`, donc majuscules). L'appel est répété 6 fois sur la même entrée (sans effet). Ensuite une boucle sur chaque caractère : `c-0x30 < 4` (chiffres 0-3) ou `c-0x41 < 3` (A-C) → on garde le caractère, sinon on l'ignore.
6. Rien d'autre ne dépend du nom : les séparateurs entre les groupes ne sont même pas vérifiés.

## Vérification

- Le solveur contient une réimplémentation de la vérification (`check`) et fait `assert check(nom, keygen(nom))`.
- GUI Delphi : le test live sous wine (Xvfb + saisie clavier) lance bien la fenêtre mais la saisie n'a pas pu être pilotée de façon fiable dans le temps imparti. **La preuve est statique** (désassemblage complet du chemin de vérification ci-dessus), pas un test live.

## Fichiers

- `analysis/objdump-button1click.txt`, `analysis/objdump-check.txt`
- `tools/salazans_keygenme_0003-solve.py`
