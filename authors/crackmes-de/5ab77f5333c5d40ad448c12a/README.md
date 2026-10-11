# sennin1 by sennin

| | |
|---|---|
| **ID** | [`5ab77f5333c5d40ad448c12a`](https://crackmes.one/crackme/5ab77f5333c5d40ad448c12a) |
| **Auteur (site)** | crackmes.de |
| **Auteur (local)** | crackmes-de |
| **Auteur (crackme)** | sennin |
| **Plateforme** | Windows PE32 GUI (MASM32) |
| **Difficulté** | 1.0 (site) — « 0/10 » selon `info.txt` |
| **Publié** | 2018-03-25 (réimport crackmes.de) |
| **SHA-256** | `77df897e56723ec75b7da6dd0493c4105a9ec5d28ba2beab5f7bdb82558b365e` |

## Origine

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c12a
- Download : https://crackmes.one/download/crackme/5ab77f5333c5d40ad448c12a
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Réponse

```
YES_G200!!
```

(une famille de serials : `d0 ∈ {YES_, mESR}`, `d1` = beaucoup de valeurs, fin `!!`)

## Premier regard

```bash
7z x -pcrackmes.one original/seNNin#1.zip
file seNNin#1.exe     # PE32 GUI i386
diec seNNin#1.exe     # MASM 6.14 / MASM32, non packé
strings -n5 seNNin#1.exe
```

Petit dialogue (`DialogBoxParamA`) : un champ **serial**, boutons OK / About / Close. Chaînes : `Nice job young cracker:)`, `Serial is... NOT valid:(` / `Wrong serial`, `Write serial number!!` / `Empty serial`. `info.txt` : « Coded in MASM, not packed, Difficulty 0/10 ».

## Comment on trouve

`objdump -d -M intel` suffit (≈ 0x250 octets de code).

### DlgProc (`0x40102e`)

`WM_COMMAND` (0x111), bouton **0x3E9** (OK) :

```asm
push 0x10 / push 0x403124 / push 0x3eb / push hDlg
call GetDlgItemTextA          ; buffer 0x403124, 16 octets max
mov  ds:0x403142, al          ; longueur retournée
call 0x4010f3                 ; check longueur
cmp  eax,-1 / je fin
call 0x401155                 ; check dword 0
```

Le dword `ds:0x403112` (dans `.data`, juste après `"About"`) vaut `0x00403124` : c’est **un pointeur vers le buffer saisi**. Les trois checks enchaînés lisent donc `s[0:4]`, `s[4:8]`, `s[8:10]`.

### 1. Longueur (`0x4010f3`)

```asm
cmp byte [len],0 → "Empty serial" ; cmp byte [len],0xa / ja → Wrong
mov al,[len] ; xor eax,0xdb ; add eax,0x23 ; bswap eax
add eax,0x456f ; cmp eax,0xf400456f
```

`bswap(x) = 0xF4000000` → `x = 0xF4` → `len ^ 0xDB = 0xD1` → **len = 10**.

### 2. Dword 0 (`0x401155`) — point fixe

```asm
mov eax,[esi] ; bswap eax ; add eax,0x6c6f7665 ; xor eax,0x111
shr eax,2 ; add eax,0x35000035 ; xor eax,0x393e7733
cmp eax,[0x403124]           ; doit retomber sur d0 lui-même
```

Il faut `f(d0) == d0`. Brute force sur 4 octets imprimables (94⁴ ≈ 78 M, < 1 s en C) : deux points fixes, **`YES_`** et `mESR`. `YES_` est clairement la réponse voulue par l’auteur (`0x6c6f7665` = `"evol"` en little-endian, clin d’œil).

### 3. Dword 1 (`0x4011a9`)

```asm
mov eax,[esi+4] ; rol eax,4 ; sar eax,3 ; and eax,0x45f ; cmp eax,0x40e
```

Seuls 7 bits sont contraints → énormément de solutions ; la première en `[0-9A-Z]` est **`G200`** (`G201`, `W300`… marchent aussi).

### 4. Deux derniers octets (`0x4011e1`)

```asm
mov ax,[esi+8] ; mov dl,al ; shr eax,8 ; cmp al,dl ; jne bad
add eax,edx ; cmp eax,0x42
```

`s[8] == s[9]` et `2·s[8] = 0x42` → `s[8] = s[9] = '!'` → MessageBox **`Good` / « Nice job young cracker:) »**.

## Solveur

[`tools/crackmes-de-sennin1-solve.py`](tools/crackmes-de-sennin1-solve.py) — réimplémente les 4 prédicats (`--check SERIAL`) et imprime `YES_G200!!`.

```bash
python3 tools/crackmes-de-sennin1-solve.py              # YES_G200!!
python3 tools/crackmes-de-sennin1-solve.py --check 'mESRW300!!'   # OK
```

## Vérification live (Wine)

Sous `Xvfb` + `wine` + `xdotool` (clic dans le champ, saisie, clic **OK**) :

- `YES_G200!!` → fenêtre **`Good`** « Nice job young cracker:) Send solution to www.crackmes.de » ([`analysis/good-YES_G200.png`](analysis/good-YES_G200.png))
- `NOPE_AAAA!` → fenêtre **`Wrong serial`** ([`analysis/bad.png`](analysis/bad.png))

Reverse 100 % statique (pas de session GDB / débogueur).
