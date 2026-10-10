# light_keygenme — salazan (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c0e1
- Plateforme : Windows PE32 GUI, Borland Delphi 6 · difficulté 2.0 · publié le 2018-03-25 (réimport crackmes.de)
- Consigne (`readme.txt`) : « Try to keygen it... less then in ten minutes :) »

## Réponse

Nom `petik` → serial **`24`** (MD5(`petik24`) = `56080337010BD9FA…`).

Keygen : `python3 tools/light_keygenme-solve.py <nom>` (essaie 1, 2, 3… jusqu'à ce que la condition passe, ~2,3 % de chances par essai).

## Comment on trouve

1. `diec` : Delphi 6, pas de packer. `strings` donne `Serial %s is OK!` et `Serial %s is wrong!`.
2. La chaîne OK est à `0x452b4c` ; un seul `mov eax,0x452b4c` dans le désassemblage, à `0x452981`, au milieu du handler du bouton (`0x4527e8`, voir `analysis/objdump-button-check.txt`).
3. Le handler :
   - lit `Edit1` (champ `+0x2f0`, le nom ; s'il est vide on sort) puis `Edit2` (`+0x2f4`, le serial) ;
   - concatène `nom + serial` (`LStrCat` à `0x404524`) ;
   - appelle `0x451a7c` : c'est `MD5String` (`0x45257c`, on y reconnaît les constantes `0x67452301`, `0xd76aa478`… et les fonctions F/G/H/I à `0x451ad8`) puis `0x452508` qui convertit les 16 octets en hex **majuscule** via `IntToHex(b,2)` ;
   - copie le résultat dans une ShortString de longueur max **8** (`mov cl,8` puis `0x402ce0`) → on garde les 8 premiers caractères ;
   - dans un bloc `try` : `Random(99999)` (résultat ignoré, leurre), puis `StrToInt` (`0x408468`) sur ces 8 caractères, puis `Format('Serial %s is OK!', [serial])` ;
   - le `except` (`0x4529ae`) affiche `Serial %s is wrong!`.
4. Donc il n'y a aucune comparaison : le serial est bon **si et seulement si `StrToInt` ne lève pas d'exception**, c.-à-d. si les 8 premiers caractères hex de MD5(nom+serial) sont tous des chiffres `0-9`. Probabilité (10/16)^8 ≈ 2,3 %, un brute-force sur un compteur suffit.

## Vérification

- Solveur : `python3 tools/light_keygenme-solve.py petik` → `petik 24 56080337…`.
- GUI Delphi non pilotable depuis les scripts de la box : la preuve est **statique** (MD5 standard reconnu par ses constantes, troncature à 8, seul chemin vers le message OK = `StrToInt` sans exception). Pas de test live.

## Fichiers

- `analysis/objdump-button-check.txt` : handler du bouton.
- `analysis/objdump-md5hex.txt` : wrapper MD5 + conversion hex.
- `tools/light_keygenme-solve.py` : keygen.
