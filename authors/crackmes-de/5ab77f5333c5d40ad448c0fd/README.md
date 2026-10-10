# keygenme_by_d0min4ted — d0min4ted (crackmes.de)

| | |
|---|---|
| Page | [crackmes.one](https://crackmes.one/crackme/5ab77f5333c5d40ad448c0fd) |
| Plateforme | Windows, .NET (WinForms, GUI) |
| Difficulté | 1.5 |
| Statut | résolu (keygen) |

## TL;DR

`serial = int( reverse(hex(nom))[:9] ) * len(nom)^3`

Exemple : `PETI` → **`6045145920`**. Le nom d'exemple `petik` ne marche **pas** : sa chaîne hex
inversée commence par `B` et `Convert.ToInt32` lève une exception (bug du crackme).

## Comment on trouve

1. `file` : `PE32 ... Mono/.Net assembly` → pas d'asm, on décompile (`ilspycmd crackme.exe`, sortie dans
   `original/source/`). Le readme dit « no reflector », mais c'est un write-up éducatif.
2. `Form1` : le bouton *Register* est câblé sur `asd(...)`. Le champ nommé `label2` est en réalité
   un `TextBox` (le nom), `textBox2` le code.
3. `asd` :
   - nom ≥ 4 caractères, code parsable en `double` ;
   - chaque caractère → `{num:X}` (hex majuscule sans padding), concaténé ;
   - la chaîne est **inversée**, tronquée à 9 caractères ;
   - `Convert.ToInt32(text5)` : parse **décimal** → plante si un `A-F` traîne ;
   - attendu = `round(valeur * len(nom)^3)`, comparé en `decimal` au code saisi.
4. Succès : `Thank you for registering notepad.exe!` puis lancement de notepad.

## Exemple à la main (`PETI`)

`P E T I` → `50 45 54 49` → `"50455449"` → inversé `"94455405"` → `94455405 * 4^3 = 6045145920`.

## Solveur

```bash
python3 tools/keygenme_by_d0min4ted-solve.py PETI
```

## Vérification

GUI WinForms non pilotable ici (pas de runtime .NET/mono sur la box) : la preuve est **statique**,
par réimplémentation exacte de `Form1.asd()` décompilée. Pas de GDB.
