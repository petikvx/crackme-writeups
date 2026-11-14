# s4r's zouave

| | |
|---|---|
| **ID** | [`5aa9b4e233c5d40a63746b21`](https://crackmes.one/crackme/5aa9b4e233c5d40a63746b21) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | s4r |
| **Plateforme** | Windows PE32 (GoLink, ASM pur, dialogue Win32) |
| **SHA-256** | `c5ddd33df9a95cedc3274ee76693b8548c9b827250fd55824cd8f44346d5ccea` (`download.bin`) |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | en réalité un **ZIP chiffré** (password `crackmes.one`) contenant `zouave.exe` |
| `analysis/extract/zouave.exe` | l'exécutable extrait (SHA-256 non utilisé comme clé, `original/` reste intact) |
| `analysis/screenshot-ok.png` / `screenshot-ko.png` | preuve Wine : « well done » / « maybe next time » |
| `tools/zouave-solve.py` | keygen |
| `tools/zouave-wine-check.sh` | pilote le vrai exe sous Wine + Xvfb + xdotool et capture l'écran |

## Réponse

Keygen : `python3 tools/zouave-solve.py --name petik [-q]`

| User | Serial |
|---|---|
| **`petik`** | **`CDC64CAB9A59F8E5-0E211B5B8351918AB21A0E17BEA49F83-06E1A794412CFB09`** |

Format : `HEX16 - KEY32 - HEX16` (66 caractères, hex en **majuscules**), user de 3 à 15 caractères.

## Premier regard

```bash
python3 -I -c "import zipfile;zipfile.ZipFile('original/download.bin').extractall('analysis/extract',pwd=b'crackmes.one')"
diec analysis/extract/zouave.exe     # PE32, GoLink
strings -n 6 analysis/extract/zouave.exe   # "well done", "maybe next time", "zouave", DialogBoxParamA, GetDlgItemTextA…
objdump -h analysis/extract/zouave.exe     # .code 0x401000 (0xab0), .data 0x402000, .rsrc énorme (le logo S4R + dialogue)
```

Le `download.bin` n'est pas un binaire : `file` absent, mais les premiers octets `PK` + `zouave.exe` dans `strings` le trahissent. Le `.rsrc` fait 770 Ko (bitmap), le code est minuscule (2,7 Ko) : tout se lit en `objdump -d -M intel`.

## Flow

- `0x401783` : `DialogBoxParamA(…, 0x539, …, dlgproc=0x4017b0)`.
- `WM_INITDIALOG` (`0x40186f`) : met l'icône, **et** stocke `PEB->BeingDebugged` (`fs:[0x18]→[+0x30]→[+2]`) dans `0x40202d` (« `dbg` »). Voir pièges.
- Bouton `0x3f9` (Check) : lit le user (`0x3f5`, max 0x40) dans `0x402064`, le serial (`0x3f6`, max 0x43) dans `0x4020a4`, puis
  - `0x4018b7` : contrôle de longueur ;
  - `0x4018f7` : contrôle du serial ;
  - MessageBox « well done » (`0x40200c`) ou « maybe next time » (`0x402016`).

## Comment on trouve le prédicat

### 1. Longueur du nom (`0x4018b7`)

```asm
4018bf mov ebx,[eax] ; add eax,1 ; cmp bl,0 ; jne   ; strlen → ebx = len, stocké en 0x402004
4018da cmp ebx,2 ; jbe fail          ; len > 2
4018df shr ebx,4 ; jne fail          ; len < 16
```
⇒ `3 ≤ len(user) ≤ 15`.

### 2. MD5 reconnu par ses constantes (`0x401000`)

Le début de la fonction écrit `67452301 efcdab89 98badcfe 10325476` puis les `lea …-0x28955b88` (= `0xd76aa478`) : c'est **MD5** du nom. Digest brut (16 octets) à `0x402054`.

### 3. Hex majuscule (`0x4016f0`, `0x401743`)

- `0x4016f0(src, n, dst)` : octet → 2 chiffres, nibble haut d'abord. `cmp eax,0xa ; sbb ; adc ; lea [eax+edx*8+0x37]` donne `n+0x30` si `<10`, sinon `n+0x37` ⇒ `A–F` **majuscules**.
- `0x401743(src, dst)` : décodeur inverse (`c-0x37`, `+7` si `c<0x40`), s'arrête au premier caractère invalide (ici le `-`).

### 4. Découpage du hex MD5 (`0x4019ba`)

`0x4021a4` = hex(MD5) (32 caractères) est coupé en deux :
```
0x4021e4[i] = h[i]        i = 0..15   (moitié haute, dans l'ordre)
0x402204[i] = h[31 - i]   i = 0..15   (moitié basse, À L'ENVERS)
```
(ebx part de `h+31` et décrémente ; la soustraction supplémentaire de `dbg` vaut 0 hors debugger.)

### 5. Vérification du serial (`0x4018f7`)

```asm
40193c cmp byte [serial+0x10],'-'   ; 0x4020a4+0x10
401944 cmp byte [serial+0x31],'-'   ; +0x21
40194c cmp byte [serial+0x42],0     ; +0x11 → longueur exacte 66
401959 call 0x401743(serial+0x11 → 0x402034)   ; hex-decode des 32 car. du milieu : K (16 octets)
401964 call 0x4019f8                           ; transforme K → 0x402224
401975 cmp16(0x402054 = MD5 brut , 0x402224)   ; (1)
40198b cmp16(serial[0..16]       , 0x4021e4)   ; (2) moitié haute du hex
4019a5 cmp16(serial+0x32         , 0x402204)   ; (3) moitié basse inversée
```

### 6. Transformation de la clé (`0x4019f8`) en SSE

```
xmm0 = [k3, k2, k1, k0]                         ; dwords LE de K pris en ordre inversé (push/movdqu)
xmm1 = [baadf00d, b16b00b5, cafebabe, deadbeef] ; basse → haute adresse
xmm0 = ~(xmm0 ^ xmm1)                           ; xorps + andnps avec 0xffffffff
chaque dword : ror 16
```
Donc, pour `D = MD5(name)` en dwords LE : `D[i] = ror16(~(k[3-i] ^ C[i]))`, soit en inversant
`k[3-i] = ~ror16(D[i]) ^ C[i]` (ror16 est une involution). La clé du milieu est donc **calculable**, pas besoin de brute-force.

### 7. Assemblage pour `petik`

```
MD5("petik")           = CDC64CAB9A59F8E5 | 90BFC214497A1E60   (hex majuscule)
partie 1  = CDC64CAB9A59F8E5
partie 3  = reverse("90BFC214497A1E60") = 06E1A794412CFB09
partie 2  = K calculé             = 0E211B5B8351918AB21A0E17BEA49F83
serial    = CDC64CAB9A59F8E5-0E211B5B8351918AB21A0E17BEA49F83-06E1A794412CFB09
```
(Le solveur recalcule tout ; voir `serial()` dans `tools/zouave-solve.py`.)

## Pièges

- `download.bin` = ZIP chiffré, pas un exe.
- **Anti-debug discret** : `BeingDebugged` (1 sous débogueur) décale à la fois le pointeur de lecture de K (`0x402034 + dbg`) et l'indice d'inversion de la moitié basse ⇒ sous debugger le serial « OK » du keygen est refusé et la comparaison dévie. Il faut compter avec `dbg = 0`.
- Hex **majuscule** obligatoire : le décodeur ne gère pas `a–f`.
- Le dialogue pré-remplit « User » / « Serial » : lors du test automatisé, sélectionner (`Home`, `shift+End`) avant de taper, sinon le texte s'insère au milieu.
- Pas de GDB : analyse 100 % statique (`objdump`) + preuve Wine ; pas de section GDB.

## Vérification

```bash
python3 -I tools/zouave-solve.py --name petik -q
tools/zouave-wine-check.sh petik <serial> analysis/screenshot-ok.png      # via xvfb-run -a wine
```

| Cas | Résultat | Capture |
|---|---|---|
| `petik` + serial du keygen | « well done » | [`screenshot-ok.png`](analysis/screenshot-ok.png) |
| `petik` + même serial, 1er caractère `C→D` | « maybe next time » | [`screenshot-ko.png`](analysis/screenshot-ko.png) |

## Notes

- Ce n'est pas un simple « MD5 = serial » : les trois comparaisons (digest brut contre clé transformée, et les deux moitiés de l'hex) imposent un serial entièrement déterminé par le nom.
- Pas de patch, `original/` intact.
