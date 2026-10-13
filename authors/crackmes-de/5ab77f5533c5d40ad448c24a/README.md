# crackmes.de's crackme_8 by fr1c

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c24a`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c24a) — voir [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (crackme de **Fr1c**, 2000, team NC) |
| **Plateforme** | Windows PE32 GUI, **MFC / Visual C++ 6** (build *Debug*, MFC liée statiquement), packé **UPX 1.02** |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `d3d735beaa2a76326698b756e3876bddf0962cd63ddd604fe2bec0eb389e25d2` |
| **SHA-256 (`crackme.exe`)** | `92668e3bce3c4adfee95d129a1f62050e75f6e184a3c97b435a740ad27da79ff` |

`ReadMe.txt` : « *mission is to code a working keygenerator* […] *You will see that exe file is packed. That's all.* »
Un dialogue **Name / Serial** et un bouton **Crack it!**.

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme8_1.zip` | archive crackmes.one |
| `original/crackme.exe`, `ReadMe.txt`, `NC.nfo` | contenu extrait (exe **packé UPX**, non modifié) |
| `analysis/onok-4018f0.asm` | handler du bouton « Crack it! » (`objdump` sur l'exe dépaqueté) |
| `analysis/verify-wine.txt` | sortie de la vérification live |
| `tools/crackme8-solve.py` | **keygen** |
| `tools/dlgdrive.c` | pilote Win32 (WM_SETTEXT + WM_COMMAND, lit la MessageBox) |
| `tools/verify-wine.sh` | vérif. wine/Xvfb : bon serial puis faux serial |

## Réponse

```text
Name   : petik
Serial : 1023704942Q_W65
```

```bash
./tools/crackme8-solve.py petik        # petik -> 1023704942Q_W65
xvfb-run -a bash tools/verify-wine.sh petik
# == petik / 1023704942Q_W65
# MessageBox : Nice, you done it! Now, write tutorial and send me solution
# == petik / 123Q_W65
# pas de MessageBox Alert! (serial refusé)
```

## Reconnaissance

```text
$ file crackme.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386, UPX compressed, 3 sections
$ diec crackme.exe
Linker: Microsoft Linker(5.12.8034)  Compiler: Microsoft Visual C/C++(12.00.8447)[C++]  Packer: UPX(1.02)[NRV, brute]
```

UPX standard, non altéré : `upx -d` suffit (268 Ko → 1,3 Mo, MFC en statique + CRT debug, d'où les
`rep stos 0xCCCCCCCC` et les `call __chkesp` partout).

```bash
upx -d -o /tmp/crackme-unpacked.exe original/crackme.exe
strings -n 5 /tmp/crackme-unpacked.exe | grep -i name
# Name must have at least 4 chars!
```

La chaîne est en `0x5123d0` ; une seule xref (`push 0x5123d0` en `0x40197f`) mène au handler `0x4018f0`.

## Analyse du handler (`0x4018f0`)

### Lecture des champs

```asm
40193b  push 0x64 / lea eax,[ebp-0x68] / push 0x3e9   ; GetDlgItemText(0x3e9 = Name, buf, 100)
401949  call CWnd::GetDlgItemTextA
40194e  push 0x32 / lea ecx,[ebp-0xd0] / push 0x3ea   ; GetDlgItemText(0x3ea = Serial, buf, 50)
401968  call strlen(name)          -> len  [ebp-0xd8]
401976  cmp  len, 4 / jge ok       ; sinon SetDlgItemText(0x3e9, "Name must have at least 4 chars!")
```

### Calcul

```asm
; sum = Σ movsx name[i]                         [ebp-0xd4]   (octets SIGNÉS)
4019dc  mov ebx, sum
4019e2  add ebx, len
4019e8  xor ebx, len
4019ee  shr ebx, 1                ; x = ((sum+len) ^ len) >> 1
4019f0  add [x], ebx              ; x part de 0
401a05  x -= len-2
401a1d  x -= 0x61a8               ; 25000
401a35  x  = x + len + 4          ; lea ecx,[eax+edx+4]
401a4e  x -= len-2
401a62  x  = x + len + 2
401a72  x -= 0xc350               ; 50000
401a84  rol ebx,1 / shr ebx,2     ; x = rol32(x,1) >> 2   (logique, non signé)
401a95  x -= 0x2faf080            ; 50 000 000
401aa7  x += sum - 0x41
```

Les termes en `len` s'annulent presque : avant la rotation, `x = ((sum+len)^len)>>1 + 10 - 75000`.

### Construction et comparaison du serial

```asm
401ab6  push x / push "%d" / lea ecx,[ebp-0x9c] / call sprintf
401ad9  lstrcatA(buf, "Q_W")
401af4  lstrcatA(buf, "65")
401b0f  call strcmp(serial_saisi, buf)
401b17  test eax,eax / jne fin
401b2a  MessageBox("Nice, you done it! Now, write tutorial and send me solution", "Alert!")
```

Donc **serial = `"%d" % int32(x)` + `"Q_W65"`** ; comparaison exacte (sensible à la casse). Pas de
message d'échec : un mauvais serial ne fait simplement rien.

### Exemple `petik`

| étape | valeur |
|---|---|
| `len`, `sum` | 5, `0x70+0x65+0x74+0x69+0x6b` = 541 |
| `((541+5)^5)>>1` | `(546^5)>>1` = 551>>1 = 275 |
| `+10-75000` | -74715 = `0xFFFEDC25` |
| `rol 1` puis `>>2` | `0xFFFDB84B >> 2` = `0x3FFF6E12` = 1073704466 |
| `-50000000 + (541-0x41)` | 1073704466 - 50000000 + 476 = **1023704942** |

→ `1023704942Q_W65`.

## Keygen

`tools/crackme8-solve.py` reproduit les opérations en arithmétique 32 bits (masque `0xFFFFFFFF`,
`movsx` pour les octets ≥ 0x80, résultat ré-interprété signé pour le `%d`).

## Vérification live (wine)

`tools/dlgdrive.c` (compilé avec `i686-w64-mingw32-gcc`) trouve le dialogue (contrôles `0x3e9`/`0x3ea`),
remplit les deux champs par `WM_SETTEXT`, poste `WM_COMMAND 0x3e8` (bouton « &Crack it! ») puis cherche
une fenêtre « Alert! » et lit son `Static`. Le bon serial affiche le message de réussite, un faux serial
(`123Q_W65`) ne produit rien. L'exe testé est l'original **packé** (non patché).

## Pièges

- Le binaire est packé UPX, mais aucun anti-debug (l'auteur renvoie au crackme #7 pour ça).
- `movsx` : un nom accentué (Latin-1 ≥ 0x80) compte négativement dans la somme.
- `shr` (pas `sar`) après le `rol` : le résultat est toujours < 2³⁰, puis décalé de -50 000 000 ; il peut
  devenir négatif pour certains noms, d'où le `%d` signé dans le keygen.
