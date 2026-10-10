# crackme_1 — rith (Rith CrackMe #1, crackmes.de, réimport crackmes.one)

| | |
|---|---|
| Page | [crackmes.one/crackme/5ab77f5333c5d40ad448c111](https://crackmes.one/crackme/5ab77f5333c5d40ad448c111) |
| Plateforme | Windows PE32 GUI, Visual C++ 6 / MFC 4.2 (diec) |
| Difficulté | 2.0 |
| Binaire | `original/rith_crackme1.zip` → `Rith CrackMe 1.exe` |
| Solveur | [`tools/rith_crackme1-solve.py`](tools/rith_crackme1-solve.py) |

## Objectif

Boîte de dialogue *Name / Serial* + bouton **Check It!** ; message `Well done cracker!` / `Congratulations!` si le serial est bon. But : un keygen.

## Comment on trouve

1. `diec` : MSVC 6 + MFC42 (imports par ordinal, donc peu de noms utiles). `strings` sur `.data` donne les deux chaînes de succès et une constante suspecte : `31415926535897932384` (les 20 premiers chiffres de π) à `0x403048`.
2. La seule fonction qui référence `0x403048` est `0x401590` (handler du bouton). Désassemblage dans [`analysis/check-serial.asm`](analysis/check-serial.asm) :
   - construit un `CString` depuis la chaîne π, appelle `UpdateData(TRUE)` (ordinal MFC) → nom en `[this+0x60]`, serial en `[this+0x64]` ;
   - longueurs (`[str-8]`, champ longueur du `CString`) : `5 ≤ len(nom) ≤ 20` et `len(serial) == len(nom)` ;
   - boucle sur chaque caractère :
     ```asm
     movsx ebp, byte [pi+i]     ; diviseur = code ASCII du chiffre de π ('3'=0x33…)
     movsx eax, byte [nom+i]
     cdq / idiv ebp             ; edx = nom[i] % pi[i]
     shl  eax(=edx), 1          ; e = 2*reste
     cmp e,0x7b / jle  → sinon e -= 0x1a
     cmp e,0x41 / jge  → sinon e  = 0x82 - e
     0x5b < e < 0x61            → e = e % 10 + 0x30
     cmp byte [serial+i], e     ; doit être égal
     ```
   - succès → `MessageBox("Well done cracker!", "Congratulations!")`.

## Keygen

```text
pour i : e = 2 * (nom[i] mod π[i])        (π[i] = code ASCII du i-ème chiffre)
         si e > 0x7b          : e -= 0x1a
         si e < 0x41          : e = 0x82 - e
         si 0x5b < e < 0x61   : e = e % 10 + 0x30
serial[i] = e
```

```bash
$ python3 tools/rith_crackme1-solve.py petik
petik -> n|jt€  (6e7c6a7480)
```

Pour `petik`, le dernier octet vaut `0x80` (`'k'=107 mod '5'=53 = 1` → `2` → `0x82-2`), soit `€` en cp1252 : on le tape avec **Alt+0128**. Un nom qui ne donne que des caractères imprimables : `Rithy` → `Dtjvd`.

## Vérification

Preuve **statique** : GUI MFC non pilotable ici ; le solveur reproduit la boucle désassemblée (y compris le reste signé de `idiv`). Pas de patch de `original/`.
