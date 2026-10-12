# little_man_1.45 by bswap (crackmes.de)

« Little Man 1.45 » de Bswap (Hollande, 2008), « 100% written in ASM, try to oversee it ». Difficulté annoncée 1.
Goal : *make a key generator, it is so easy*.

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c213> · [`ORIGIN.yml`](ORIGIN.yml)
- **Auteur** : crackmes.de (mirror) / bswap
- **Plateforme** : Windows **PE32** GUI (MASM 6.14, non packé) — difficulté 1.0
- **Archive** : `original/LittleMan145.zip` → `LittleMan145/LittleMan.exe` + `NFO.txt`
- **Statut** : résolu (keymaker), vérifié **sous wine/Xvfb** sur le binaire original : titre « Little Man 1.45 (Registered) »

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/LittleMan145/LittleMan.exe` | binaire d’origine (non patché) |
| `tools/littleman145-solve.py` | keymaker + `--check` (réimplémentation du test) |
| `tools/dlgdrive.c` | petit outil Win32 (mingw) : met la clé, envoie le clic « Register », relit titre et statut |
| `tools/verify-wine.sh` | preuve live : wine + Xvfb + `dlgdrive.exe` |
| `analysis/registered-petik-8S.png` / `analysis/ko-petik.png` | captures OK / KO |

## Réponse

Un seul champ, « Your Key » (contrôle `0xc9`). Pas de nom : la clé se valide seule.

| Clé | Résultat (wine) |
|---|---|
| **`petik-8S`** | Registered |
| `petik-xS` | Registered (un seul des deux suffit) |
| `petik-xx` | Unregistered |
| `petik` | Unregistered |

Règle : `key[5] == '-'` **et** (`key[6] == '8'` **ou** `key[7] == 'S'`). Keymaker : `XXXXX-8S` avec n’importe quel préfixe
de 5 caractères.

```
$ python3 tools/littleman145-solve.py petik
Key = petik-8S  (OK)
$ tools/verify-wine.sh petik-8S
avant : Little Man 1.45 (Unregistered)
apres : Little Man 1.45 (Registered) | ctrl 0xca : (Registered), post your solution please.
```

## Premier regard

```
$ file original/LittleMan145/LittleMan.exe   → PE32 executable (GUI) Intel 80386, 4 sections
$ diec …                                     → MASM 6.14 / MASM32, Microsoft Linker 5.12
```

Chaînes : « Little Man 1.45 (Registered) / (Unregistered) », « Your are Registered! », « Good Work! »,
« Your code must be at least one byte! ». Imports : un seul `GetDlgItemTextA`, des `SetTimer` / `KillTimer`.

## Comment on trouve

1. **Ancrage** : table des thunks `jmp [IAT]` (capstone + pefile) → `GetDlgItemTextA` = `0x401d06`, appelé une seule
   fois, en `0x4014a6`, dans la branche `cmp [ebp+0x10], 0x12e` (bouton Register).

2. **Le clic est un leurre** :

   ```asm
   401426 mov [0x40334b],0 / [0x403330],0 / [0x40332c],0 ...   ; remise à zéro du buffer clé
   4014a6 GetDlgItemTextA(hDlg, 0xc9, 0x40332c, 0x1e)
   40151c call 0x4019e9            ; fild/fbstp : dword clé → chaîne BCD (bruit)
   401537 xor eax,eax
   40153f pushal / 0xdead, 0xbeef, bswap ×2 / popal              ; bruit
   401557 or  al,1
   401559 or  eax,eax / jne 0x4015f0                             ; TOUJOURS pris : jamais « Registered » ici
   ```

   Le code « Registered » (`0x401585` MessageBox « Your are Registered! », `0x401598` EnableWindow + titre) est juste
   derrière, mais inatteignable par ce chemin. Désassemblage linéaire piégé : chaînes intercalées entre des `jmp`
   courts (`0x4014b4`, `0x401563`…), à suivre saut par saut.

3. **Le vrai test est dans `WM_TIMER`** (`cmp [ebp+0xc], 0x113`, `0x40165b`). Le timer `0x2bd` (100 ms) armé au
   `WM_ACTIVATE` relit à chaque tick le dword `key[4..7]` resté dans `0x403330` :

   ```asm
   401692 mov eax,[0x403330]            ; al=key[4] ah=key[5] … 
   401699 mov bl,[0x403331]             ; bl = key[5]
   40169f cmp bl,'-'  / jne fin
   4016a4 cmp al,'1'  / je ok1 ; cmp ah,'-' / jne fin    ; ah = key[5] = '-' → toujours vrai
   4016ad bswap eax                     ; al=key[7] ah=key[6]
   4016af cmp al,'S'  / je ok ; cmp ah,'8' / jne fin
   4016b8 mov [0x403330],0 / jmp 0x401598                ; → EnableWindow + titre « (Registered) »
   ```

   D’où la règle. Le saut vers `0x401598` passe **après** le MessageBox : en vrai, l’enregistrement est silencieux,
   seuls le titre et le contrôle `0xca` changent (« (Registered), post your solution please. »).

## Vérification live (wine)

`tools/dlgdrive.c` met la clé dans `0xc9` (`WM_SETTEXT`), envoie `WM_COMMAND 0x12e` puis attend 3 s que le timer
passe, et relit le titre et `0xca`. Binaire original non modifié. `petik-8S` et `petik-xS` donnent « Little Man 1.45
(Registered) » ; `petik-xx` et `petik` restent « Unregistered ».
