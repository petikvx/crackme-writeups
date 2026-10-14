# gulcrackme_1 by gul

| | |
|---|---|
| Page | [crackmes.one/crackme/5ab77f5633c5d40ad448c2b0](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2b0) |
| Auteur | crackmes.de / gul |
| Plateforme | Windows x86, C (MSVC 6), GUI dialog |
| Difficulté | 2.0 |
| Type | patchme avec contrôle d’intégrité (hash de `.text`) |
| Statut | **résolu** — patch + recalcul des constantes, vérifié sous Wine |

## Solution

Le binaire affiche « If you can patch me, I will show you my secret. ;) ». Le code qui révèle le secret existe mais n’est jamais atteint, et il est protégé par un hash de `.text` qui sert aussi à calculer son adresse. Le patch qui marche :

| VA | Offset fichier | Avant | Après |
|---|---|---|---|
| `0x40135E` | `0x135E` | `B9 01 00 00 00` (`mov ecx,1`) | `B9 00 00 00 00` (`mov ecx,0`) |
| `0x402064` | `0x2064` | `0x0AB0A870` | `0x0B8BA810` (nouveau hash de `.text`) |
| `0x402068` | `0x2068` | `0x0AF0B9B1` | `0x0BCBB9D1` (= hash ⊕ `0x4011C1`) |

```bash
python3 tools/gulcrackme_1-solve.py original/gulcrkme1.exe gulcrkme1-patched.exe
xvfb-run -a wine gulcrkme1-patched.exe     # « Well done. Congratz! =D » + image
```

## Reconnaissance

- `original/gulcrkme1.zip` → `original/gulcrkme1.exe` (57 Ko, PE32 GUI, MSVC 6, non packé ; `.text` ne fait que 0x410 octets, le reste est du `.rsrc`).
- Imports révélateurs : `FindResourceA` / `LoadResource` / `LoadBitmapA` et surtout **`IsBadCodePtr`**.
- Aucune chaîne utile en clair : elles sont chiffrées dans `.rdata`.

Désassemblage complet : `objdump -d -M intel original/gulcrkme1.exe` → `analysis/gulcrkme1.objdump.txt`.

## Les fonctions

| VA | Rôle |
|---|---|
| `0x401000` | `elf_hash(ptr, len)` : hash PJW/ELF classique (`h = (h<<4)+c ; g = h & 0xF0000000 ; h ^= g>>24 ; h &= ~g`) |
| `0x40106D` | déchiffre une chaîne : XOR avec une clé de 7 octets lue à `ImageBase+0x53`, jusqu’au `\0` |
| `0x4010EA` | même XOR, sur un buffer de longueur donnée |
| `0x40115B` | `show(enc)` : déchiffre puis `SetDlgItemTextA(dlg, 1000, …)` |
| `0x4011C1` | **le secret** : `FindResourceA(…, 0x6A, RT_BITMAP)`, déchiffre 0x6436 octets du bitmap, `LoadBitmapA`, l’affiche dans le contrôle 1001 (`STM_SETIMAGE`) et écrit « Well done. Congratz! =D » |
| `0x4012A8` | WinMain |

La clé des chaînes est amusante : `ImageBase+0x53` tombe au milieu du stub DOS « This **program** cannot be run in DOS mode », donc la clé vaut `program`. Chaînes déchiffrées :

- `0x40206C` : `If you can patch me,\nI will show you my secret. ;)`
- `0x4020A0` : `Well done. Congratz! =D`
- `0x4020B8` : `Are you trying to mess with me?\nI don't like that! ;)`

## Le chemin mort dans WinMain

```asm
40134c  mov  ds:0x40341c, eax          ; hDlg
401351  push 0x40206c                  ; "If you can patch me..."
401356  call 0x40115b
40135e  mov  ecx, 1                    ; <-- toujours 1
401363  test ecx, ecx
401365  je   0x401369                  ; jamais pris
401367  jmp  0x4013c6                  ; -> boucle de messages
401369  push 0x1000
40136e  mov  edx, ds:0x403418          ; ImageBase
401374  add  edx, 0x1000               ; .text
40137b  call 0x401000                  ; h = elf_hash(.text, 0x1000)
401389  cmp  eax, ds:0x402064          ; hash attendu
40138f  je   0x40139e
401391  push 0x4020b8                  ; "Are you trying to mess with me?"
401396  call 0x40115b
40139e  mov  ecx, ds:0x402068
4013a4  xor  ecx, [ebp-4]              ; ptr = [0x402068] ^ h
4013ae  call IsBadCodePtr
4013b6  jne  0x4013c6
4013bb  cmp  dword [eax], 0x83ec8b55   ; prologue "55 8B EC 83" ?
4013c3  call [ebp-0x4c]                ; -> 0x4011C1 si tout va bien
```

Avec le binaire d’origine, `elf_hash(.text) = 0x0AB0A870 = [0x402064]` et `0x0AB0A870 ⊕ 0x0AF0B9B1 = 0x004011C1` : la constante est donc l’adresse de la routine secrète, masquée par le hash du code.

## Le piège

Passer `ecx` à 0 suffit pour entrer dans le bloc, mais ce patch modifie `.text`, donc le hash. Résultat :

1. le `cmp` échoue → « Are you trying to mess with me? I don't like that! ;) » ;
2. le pointeur `[0x402068] ⊕ h` ne vaut plus `0x4011C1` → `IsBadCodePtr` ou le test de prologue bloque l’appel.

Les deux constantes sont dans `.rdata`, **hors** de la zone hashée (`0x401000..0x401FFF`). On peut donc les recalculer après le patch :

$$ h' = \text{elf\_hash}(\texttt{.text}') = \mathtt{0x0B8BA810},\qquad [\mathtt{0x402064}] = h',\qquad [\mathtt{0x402068}] = h' \oplus \mathtt{0x4011C1} = \mathtt{0x0BCBB9D1} $$

(Une autre solution serait de laisser les constantes et de compenser le hash avec des octets de padding en fin de `.text`, puisque l’ELF hash n’est pas cryptographique.)

## Vérification (Wine)

Trace `WINEDEBUG=+relay` filtrée sur `SetDlgItemTextA` :

- binaire patché par le solveur (`analysis/wine-relay-patched.txt`) : `IsBadCodePtr(004011c1)`, `LoadBitmapA(…, 0x6a)`, puis **`"Well done. Congratz! =D"`** ;
- contre-épreuve, patch naïf de `mov ecx,1` seul (`analysis/wine-relay-naive.txt`) : `"Are you trying to mess with me?\nI don't like that! ;)"` et pas de bitmap.

Le « secret » est le bitmap 256×96 de la ressource `0x6A`, chiffré avec la même clé `program`. C’est une photo pour adultes : elle n’est pas reproduite dans ce dépôt.

## Fichiers

- `original/gulcrkme1.zip`, `original/gulcrkme1.exe` — d’origine, non modifiés
- `analysis/gulcrkme1.objdump.txt` — désassemblage de `.text`
- `analysis/wine-relay-*.txt` — traces Wine de vérification
- `tools/gulcrackme_1-solve.py` — patcher (patch + recalcul du hash et du pointeur)
