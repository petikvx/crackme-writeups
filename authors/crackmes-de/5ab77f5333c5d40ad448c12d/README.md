# 4f.crackme_2 by ximus

| | |
|---|---|
| **ID** | [`5ab77f5333c5d40ad448c12d`](https://crackmes.one/crackme/5ab77f5333c5d40ad448c12d) |
| **Auteur (site)** | crackmes.de |
| **Auteur (local)** | crackmes-de |
| **Auteur (crackme)** | ximus (4F) |
| **Plateforme** | Windows PE32 GUI (MSVC 7.0) — `crk2.exe` (PELock) + `crackme.dll` |
| **Publié** | 2018-03-25 (réimport crackmes.de) |
| **SHA-256** | `65a41c3d0c723c967325a99c3b0719a98a2a345716abe89816acf5f68fe2d985` |

## Origine

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c12d
- Download : https://crackmes.one/download/crackme/5ab77f5333c5d40ad448c12d
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Réponse

```
020p99L-100J68z
```

(un serial parmi beaucoup : seules des **sommes de paires** d’octets sont contraintes)

## Premier regard

```bash
7z x -pcrackmes.one original/crackme2.zip   # crk2.exe, crackme.dll, rEadme.txt
diec crk2.exe       # MSVC 7.0 + PELock 2.x
diec crackme.dll    # MSVC 7.0, non protégé
```

`rEadme.txt` : « FIND R!GHT SERIAL ». Les imports de `crk2.exe` montrent `crackme.dll!Check` (seul export de la DLL, RVA `0x1000`) + `GetDlgItemTextA` / `SetWindowTextA` / `PlaySoundA`. Inutile de toucher à l’exe protégé par PELock : **tout le prédicat est dans la DLL en clair**.

## Comment on trouve

```bash
objdump -d -M intel crackme.dll --start-address=0x10001000 --stop-address=0x10001150
```

`Check(char *s)` :

```asm
strlen(s) == 0 → 0 ; strlen(s) != 0xf → 0
cmp byte [esi+7], 0x2d        ; '-'
movsx ecx,[esi+0xa] ; movsx eax,[esi+0xc] ; add → fild
fld qword [0x1000b100]        ; 2.0
call 0x10001270               ; pow(x, y) (CRT _CIpow)
call 0x100011b0               ; _ftol
...
sub edi,0x3308239f ; neg edi ; sbb edi,edi ; inc edi   ; edi = (A == const)
...
sub ebx,0x2722dcb0 ; neg ebx ; sbb ebx,ebx ; inc ebx
and edi,ebx ; mov eax,edi ; ret
```

Constantes `.rdata` : `0x1000b0f0 = 4.0`, `0x1000b0f8 = 3.0`, `0x1000b100 = 2.0`. Le prédicat complet :

| bloc | formule | cible |
|---|---|---|
| B | `(s[10]+s[12])² + (s[9]+s[13])³ + (s[8]+s[14])⁴ + s[11]` | `0x3308239F` = 856 171 423 |
| A | `(s[2]+s[5])² + (s[1]+s[4])³ + (s[0]+s[3])⁴ + s[6]` | `0x2722DCB0` = 656 596 144 |

Résolution « à la main » : racine 4ᵉ de la cible pour la puissance 4, puis cube, puis carré, le reste doit être un caractère :

- A : `160⁴ = 655 360 000`, reste 1 236 144 → `107³ = 1 225 043`, reste 11 101 → `105² = 11 025`, reste **76 = `L`**
- B : `171⁴ = 855 036 081`, reste 1 135 342 → `104³ = 1 124 864`, reste 10 478 → `102² = 10 404`, reste **74 = `J`**

On découpe ensuite chaque somme en deux caractères alphanumériques (`160 = '0'+'p'`, `107 = '2'+'9'`, …).

## Solveur

[`tools/crackmes-de-4f.crackme_2-solve.py`](tools/crackmes-de-4f.crackme_2-solve.py) — réimplémente `Check` (`--check SERIAL`) et génère `020p99L-100J68z`.

## Vérification live (Wine)

`Xvfb` + `wine crk2.exe` + `xdotool` (saisie, clic **chEck**), avec `WINEDEBUG=+relay` pour voir la réaction (en cas de succès la fenêtre se ferme) :

```
020p99L-100J68z :
Call user32.SetWindowTextA(00020058,004050f4 "Congratulations!!! Right serial!!!") ret=00401094
Call winmm.PlaySoundA(00000073,00000000,00040004) ret=004010a3
Call user32.PostQuitMessage(00000000) ret=004010ab

020p99L-100J68y (faux) :
Call winmm.PlaySoundA(00000070,00000000,00040005) ret=004010bc
Call user32.SetDlgItemTextA(00020058,000003e9,004050f0 "") ret=004010cd   ; champ vidé
```

Capture du cas faux : [`analysis/bad.png`](analysis/bad.png). Reverse statique (pas de GDB).
