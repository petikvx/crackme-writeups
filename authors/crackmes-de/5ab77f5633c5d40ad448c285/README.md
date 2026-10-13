# hypercrackme2 by thehyper

- Origine : [ORIGIN.yml](ORIGIN.yml) · [crackmes.one `…c285`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c285)
- Auteur : thehyper (mirror crackmes.de) · Plateforme : Windows PE32, Win32ASM (MASM 6.14), packé **UPX 1.20**
- Difficulté annoncée : 1.0 (« expected level 1-2-3 »)

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/hypercrackme2.zip` | archive crackmes.one (mot de passe `crackmes.one`) |
| `original/HyperCrackme2.exe` | binaire d’origine (UPX) |
| `original/crack.nfo` | nfo : *« You don't have to type anything :) »* |
| `analysis/HyperCrackme2.unpacked.exe` | sortie de `upx -d` |
| `analysis/decrypt.py` | reproduit le déchiffrement XOR 0xFF de la routine de check |
| `analysis/check-routine-decrypted.txt` | désassemblage commenté-ready de la routine déchiffrée + `sub_401365` |
| `analysis/wine-driver.c` | driver Win32 (mingw) qui clique les boutons par `WM_COMMAND` et lit la mémoire du process |
| `tools/hypercrackme2-solve.py` | solveur (`-q`, `--check N`) |

## Réponse

On ne tape rien : on **clique** les boutons chiffres `0`…`9` puis le bouton de vérification.

**Serial minimal : `1509970`** (= lcm(370, 371, 407)) — tout multiple de 1509970 tenant dans 31 bits marche (`3019940`, `4529910`, …).

```
$ python3 tools/hypercrackme2-solve.py -q
1509970
```

Après le check réussi, un item de menu **« Register »** (ID 50) est inséré dans la barre de menus ; le cliquer affiche
*« Good job, send serial to 'the_hyper_world@yahoo.com' www.crackmes.de »*.

## Premier regard

```
$ diec HyperCrackme2.exe
PE32  Linker: Microsoft Linker(5.12)  Compiler: MASM(6.14.8444)  Packer: UPX(1.20)[NRV, best]
$ upx -d HyperCrackme2.exe -o unpacked.exe      # UPX standard, 6656 -> 7680 octets
$ strings -n 3 unpacked.exe
DLGCLASS  Register HyperCrackMe2
Objective:   Just keep clicking buttons  :)
Hint: There are two ways of registering this crackme
Good job, send serial to 'the_hyper_world@yahoo.com'  www.crackmes.de
FirstMenu  Register
```

Imports intéressants : `CreateDialogParamA`, `GetMenu`, **`InsertMenuItemA`**, **`DrawMenuBar`**, `MessageBoxA`. Le nom `Register` + `InsertMenuItemA` laisse deviner qu’un menu apparaît dynamiquement.

## Flow

1. `WinMain` (0x401031) : **déchiffre** en place les octets `0x401287..0x40131D` (`xor bl,0FFh`, boucle 0x401051–0x4010A0), puis `CreateDialogParamA("DLGCLASS")`, `GetMenu` → handle stocké en `[0x403159]`.
2. `WndProc` (0x401144), `WM_COMMAND` :
   - venant d’un **bouton** (`lParam != 0`, `HIWORD(wParam) == 0`) :
     - IDs `0x65..0x6E` → ajoute le caractère `'0'..'9'` au buffer `0x4031A8` (`lstrcat` maison 0x401470) ;
     - ID `0x6F` → **check** (zone chiffrée) ;
     - ID `0x70` → `RtlZeroMemory(buf, 100)` (clear).
   - venant d’un **menu** (`lParam == 0`) : `0x7D00` = about (deux MessageBox), `0x7D01` = quitter, **`0x32` = « Register » → MessageBox « Good job »** (et remet le compteur `[0x40315D]` à 0).

## Comment on trouve le prédicat

Dans le dump de `.text`, le handler `0x6F` appelle `sub_401430` puis enchaîne sur du « code » absurde (`jl`, `(bad)`, `into`, `hlt`…) à partir de **0x401287** : c’est exactement le début de la zone que WinMain XORe :

```asm
40104c: mov  eax, 401287h
401051: mov  bl, [eax]
401061: xor  bl, 0FFh
40106a: mov  [eax], bl
40106c: inc  eax
401082: cmp  eax, 40131Eh
401087: jne  ...            ; boucle jusqu’à 0x40131E
```

`analysis/decrypt.py` applique le même XOR au fichier dé-UPXé ; `objdump` donne alors (extrait, cf. `analysis/check-routine-decrypted.txt`) :

```asm
40127d: push 4031A8h            ; buffer des chiffres cliqués
401282: call sub_401430         ; atoi maison -> eax = N
401287: cmp  eax, 0
40128a: jbe  fail               ; N == 0 -> échec
401290: mov  [403163h], eax     ; N
401295: mov  ebx, 300           ; for b = 300 .. 1000
40129c: mov  eax, [403163h]
4012a1: cdq
4012a2: idiv ebx                ;   N % b
4012a4: or   edx, edx
4012a6: jne  next               ;   b doit diviser N
4012a8: push ebx
4012a9: call sub_401365         ;   et être un nombre d'Armstrong
4012ae: cmp  eax, 1
4012b1: jne  next
4012b3: add  dword [40315Dh], 1 ;   compteur++
4012ba: inc  ebx
4012bb: cmp  ebx, 1000
4012c1: jle  40129c
4012c3: cmp  dword [40315Dh], 3 ; il en faut EXACTEMENT 3
4012ca: jne  fail
4012cc: ... MENUITEMINFO : wID = 0x32, dwTypeData = "Register" (0x403150)
401303: call InsertMenuItemA(hMenu, 1, TRUE, &mii)
40130b: call DrawMenuBar(hWnd)
401310: RtlZeroMemory(buf, 100) ; dans tous les cas
```

`sub_401365(b)` (non chiffrée) :

```asm
40136b: mov  dword [403167h], 0   ; s = 0
401377: mov  eax, [ebp+8] / cdq / mov ecx,10 / idiv ecx
401382: mov  [ebp+8], eax         ; b /= 10
401385: mov  ecx, edx             ; r = b % 10
401387: imul edx, edx / imul edx, ecx   ; r^3
40138d: add  [403167h], edx       ; s += r^3
40139e: pop  ebx / cmp eax, ebx   ; return s == b_original
```

→ test de **nombre d’Armstrong** (narcissique) à 3 chiffres.

`sub_401430` : atoi décimal 32 bits (`ecx = ecx*10 + (c-'0')` via deux `lea`), avec un préfixe `0x02` qui inverserait le signe (inaccessible depuis les boutons).

## Prédicat consolidé

```
valid(N)  <=>  N != 0  et  #{ b ∈ [300,1000] : b | N  et  b = Σ chiffre(b)^3 } == 3
```

Nombres d’Armstrong à 3 chiffres : 153, 370, 371, 407 ; dans [300, 1000] il ne reste que **370, 371, 407** — donc « exactement 3 » = « tous les trois ».
N doit être multiple de lcm(370 = 2·5·37, 371 = 7·53, 407 = 11·37) = 2·5·7·11·37·53 = **1 509 970**.

## Vérification (Wine)

La GUI est pilotée par `analysis/wine-driver.c` (compilé avec `i686-w64-mingw32-gcc`) : il lance le crackme, envoie `WM_COMMAND` (IDs `0x65+chiffre`, puis `0x6F`) avec `lParam = hwnd` (comme un vrai bouton), lit `[0x40315D]` (compteur de diviseurs Armstrong) via `ReadProcessMemory`, puis poste `WM_COMMAND 0x32` (l’item « Register ») et lit le texte de la MessageBox.

```
$ xvfb-run -a wine drv.exe HyperCrackme2.exe 1509970
armstrong_divisors=3                         -> InsertMenuItem("Register") exécuté
msgbox title='Register HyperCrackMe2' text='Good job, send serial to ...'
$ xvfb-run -a wine drv.exe HyperCrackme2.exe 3019940
armstrong_divisors=3
$ xvfb-run -a wine drv.exe HyperCrackme2.exe 1510070     # KO (370 ne divise pas)
armstrong_divisors=0                         -> pas de menu
```

(Le test de la MessageBox seule ne prouve rien : le handler `0x32` n’a aucune garde, d’où la vérification par le compteur.)

## Notes

- **« Two ways of registering »** : (1) le vrai serial ci-dessus ; (2) déclencher directement la commande de menu ID 50 (`WM_COMMAND 0x32`, `lParam = 0`) — le handler n’est pas protégé, seule l’absence de l’item dans le menu l’empêche.
- **« Strange shit, restart »** : le compteur `[0x40315D]` n’est remis à 0 que par la commande « Register ». Un premier essai raté avec 1 ou 2 diviseurs Armstrong (ex. `370`) laisse le compteur pollué ; un bon serial donne alors 4 ou 5 ≠ 3 → il faut relancer le programme.
- Le chiffrement XOR 0xFF ne sert qu’à masquer la routine au désassemblage statique.
