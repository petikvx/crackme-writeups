# your_first_crack by korbut

| | |
|---|---|
| **ID** | [`5ab77f5433c5d40ad448c1ae`](https://crackmes.one/crackme/5ab77f5433c5d40ad448c1ae) |
| **Auteur (site)** | crackmes.de (réimport, crackme de korbut / Dr. rED mEAT) |
| **Plateforme** | Windows PE32, MASM 6.14 (GUI) |
| **Difficulté** | 1.0 |
| **SHA-256 zip** | `ab3977c217c34ad6f7cec0e31f4c88160ed6299fd974931e9c2ca7e656c35b55` |

## TL;DR

Keygen : le serial (nombre décimal) ne dépend que du **premier caractère** du nom.

```
serial = Σ_{b = nom[0]}^{255} movsx( (b+1) xor 0x17 )   (mod 2^32, lu en non signé)
```

Exemple : nom `petik` → serial **`4294960616`**.

## Comment on trouve

1. `diec` : PE32, MASM 6.14, linker 5.12. Petit binaire, pas de packer.
2. Imports utiles : `GetDlgItemTextA`, `GetDlgItemInt`, `MessageBoxA`. On cherche les `call` vers ces thunks (`0x401420` = GetDlgItemTextA, `0x40141a` = GetDlgItemInt) : une seule routine à `0x401327`.
3. La routine (voir [`analysis/check.asm.txt`](analysis/check.asm.txt)) :
   - `GetDlgItemTextA(hDlg, 0x7D0, 0x4032F0, 0x3C)` lit le nom ; vide → « Vous devez entrer un nom quand meme !!! ».
   - `GetDlgItemInt(hDlg, 0x7D1, &ok=0x4032E6, FALSE)` lit le serial en **non signé** ; si `ok == 0` → « Le serial ne doit comporter que des chiffres ».
   - Boucle :
     ```asm
     xor  esi, esi
     l:  mov al, [0x4032F0]   ; toujours le 1er octet du nom !
         test al, al / je fin
         inc al / xor al, 0x17
         movsx eax, al / add esi, eax
         inc byte [0x4032F0]  ; on incrémente ce même octet
         jmp l
     fin: pop ebx / cmp esi, ebx / je bravo
     ```
4. Le piège : la boucle ne parcourt pas le nom, elle incrémente le **premier octet** jusqu'à ce qu'il déborde à 0. Le reste du nom est ignoré, et la somme est négative pour les lettres usuelles, d'où un serial proche de 2³² une fois relu en `unsigned` (le signe `-` est refusé par `GetDlgItemInt` non signé).

## Solveur

- [`tools/your_first_crack-solve.py`](tools/your_first_crack-solve.py) : `python3 tools/your_first_crack-solve.py petik` → `petik 4294960616`.
- [`tools/your_first_crack-emu.py`](tools/your_first_crack-emu.py) : émulation Unicorn du vrai code de vérification (`0x401353` → `cmp esi, ebx`) chargé depuis `original/crackme.exe`.

## Vérification

GUI à fenêtre custom (région, bitmap) non pilotée ici : la vérification est faite par **émulation Unicorn du vrai code de la routine** du binaire, nom écrit à `0x4032F0`, serial dans `eax` : `petik / 4294960616` → égalité `esi == ebx` (branche « bravo »), `petik / 1` → échec ; `A / 4294965002` → OK aussi.
