# salazans_keygenme_0001 — salazan (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c0e3
- Plateforme : Windows PE32 GUI, Borland Delphi 6, non packé · difficulté 2.0 · publié le 2018-03-25 (réimport crackmes.de)
- Premier keygenme de salazan (« It's very simple »).

## Réponse

Nom `petik` (ou n'importe quel nom d'au moins 3 caractères) → serial **`OOOOQ-OOOOP-OOOOT-OOOOL-OOOOJ`**

Le nom n'est **pas** utilisé dans le calcul. Le serial doit faire exactement 29 caractères, et les blocs de 5 caractères aux positions 1, 7, 13, 19 et 25 doivent avoir pour somme ASCII `0x18d` (397), `0x18c` (396), `0x190` (400), `0x188` (392) et `0x186` (390). Les caractères 6, 12, 18 et 24 ne sont pas vérifiés (on y met `-`).

Keygen : `python3 tools/salazans_keygenme_0001-solve.py`.

## Comment on trouve

1. `diec` : Delphi 6. La RTTI de `TForm1` donne `Button1Click` → **`0x456178`** (`analysis/objdump-button1click.txt`).
2. `Button1Click` :
   - lit `Edit1` (`+0x2f8`, le nom) et `Edit2` (`+0x2fc`, le serial) ; si l'un fait moins de 3 caractères, `ShowMessage('Min. 3 char in name/serial!')` ;
   - appelle `0x455d18(serial)` **avec le serial seul** ;
   - si `al != 0`, le texte de la barre d'état devient `Congr! You are real cracker!` (`0x45627c`), sinon il est vidé.
3. `0x455d18` (`analysis/objdump-check.txt`) :
   - `Length(serial) == 0x1d` (29), sinon échec ;
   - `Copy(serial, 0, 5)` (index 0 traité comme 1), `Copy(serial, 7, 5)`, `13`, `19`, `25` ;
   - pour chaque bloc, la somme des octets est comparée à `0x18d`, `0x18c`, `0x190`, `0x188`, `0x186` ;
   - retour = ET des cinq drapeaux.
4. Avec `O` = 79, on a 4×79 = 316, donc le 5ᵉ caractère vaut 397−316 = 81 (`Q`), 80 (`P`), 84 (`T`), 76 (`L`) et 74 (`J`).

## Vérification

- Le solveur réimplémente la vérification (`check`) et fait un `assert` sur le serial généré.
- GUI Delphi non pilotée en live dans le temps imparti : **la preuve est statique** (chemin complet `Button1Click` → `0x455d18` désassemblé ci-dessus), pas de test live.

## Fichiers

- `analysis/objdump-button1click.txt`, `analysis/objdump-check.txt`
- `tools/salazans_keygenme_0001-solve.py`
