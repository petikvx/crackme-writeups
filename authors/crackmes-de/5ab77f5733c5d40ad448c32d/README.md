# crackmes.de's KeygenMe #1 by boonz

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c32d`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c32d) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (crackme de *Boonz*, 26/07/2006) |
| **Plateforme** | Windows PE32 GUI (dialogue), MSVC 6 / MASM-like, musique XM (minifmod) + skin |
| **SHA-256 (zip)** | `13098f0aa6cfb62b77151b2a90dbbe95ed0f768567540f5e0df5e21adb786c56` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/KeygenMe_1_by_boonz.zip` | archive d'origine (non touchée) : `ReadMe.tXt` + `keygenme1.exe` |
| `analysis/ex/` | contenu extrait du zip |
| `analysis/exe.dis.txt` | `objdump -d -M intel` complet |
| `analysis/screenshot-ok.png` / `screenshot-ko.png` | preuve Wine (Goodboy / Badboy) |
| `tools/keygenme1-solve.py` | keygen (`-q`, `--name`, `--check EXE` via xvfb + wine + xdotool) |

## Réponse

Le crackme demande un *name* (4 à 50 caractères) puis un *serial*.

| Name | Serial |
|---|---|
| `petik` | **`Bon-FFFFFE60-FBB58000-41720F48`** |

```bash
python3 -I tools/keygenme1-solve.py --name petik     # name=petik serial=Bon-FFFFFE60-FBB58000-41720F48
python3 -I tools/keygenme1-solve.py --check analysis/ex/keygenme1.exe
```

Formule (`%lX` = hexa majuscules, 32 bits) :

```
A = -Σ(c − 0x19)           (c = octets du name)
serial = "Bon-" + hex(A) + "-" + hex(A³) + "-" + hex(0x40E0F8·(0x40E0F8 − 1))
```

Le dernier bloc est **constant** (`41720F48`) : voir « Pièges ».

## Premier regard

```text
$ file keygenme1.exe  → PE32 executable (GUI), Intel i386, 4 sections
$ diec keygenme1.exe  → Microsoft Linker 5.12 / Visual C/C++ 12.00
$ strings            → imports DialogBoxParamA, GetDlgItemTextA, lstrcmpA, wsprintfA, waveOut*
```

`ReadMe.tXt` : pas de patch, écrire un keygen. Le binaire embarque un module FastTracker XM (`.data` @0x405000, lecteur minifmod : gros bloc de code `0x4013xx+`, sans intérêt) et une fenêtre skinnée (boutons CHECK / ABOUT / EXIT dessinés).

## Flow

Dialog proc @ `0x4010b6` (WM_COMMAND = `0x111`) :

- bouton `0x3f3` (CHECK) : `GetDlgItemTextA(0x3ee → 0x40dcf8)` (name), `GetDlgItemTextA(0x3ef → 0x40def8)` (serial), appelle `0x401208`, puis affiche le résultat dans le champ `0x3ef` (`SetDlgItemTextA`, buffer `0x40dff8`) ;
- `0x3f0` = ABOUT, `0x3f2` = EXIT.

Pas de MessageBox : le verdict s'écrit **dans le champ serial** (`Hello, Mr. Goodboy!` / `Hello, Mr. Badboy!`).

## Comment on trouve

**Ancrage.** `objdump -d -M intel` + table d'imports (`pefile`) : les thunks `jmp [IAT]` de `0x401380..0x4013b0` donnent `lstrlenA`=`0x401392`, `lstrcmpA`=`0x40138c`, `wsprintfA`=`0x401398`, `lstrcatA`=`0x401386`. Les seuls appelants de `lstrcmpA` mènent à `0x401208` — la routine de check.

**Lecture** (`0x401208`, buffers : name `0x40dcf8`, serial saisi `0x40def8`, sorties `0x40e0f8`/`0x40e1f8`/`0x40e2f8`, serial calculé `0x40ddf8`). Format `0x40dbf8 = "%lX"`, `0x40dbfc = "Bon-"`, `0x40dc01 = "-"` (vus dans `.data`, offset fichier via `pefile`).

```asm
call lstrlenA(name) ; 4 <= len <= 0x32 sinon "Name must be 4 - 50 chars long!"
; --- bloc 1
movzx eax,[ecx+edi] ; sub eax,0x19 ; sub ebx,eax      ; ebx = -Σ(c-0x19)  = A
wsprintfA(0x40e0f8,"%lX",ebx)
; --- bloc 2   (eax=ecx=edx=0)
add eax,ebx ; imul eax,ebx ; ... ; imul ebx,eax        ; eax=A², ebx=A·A² = A³
wsprintfA(0x40e1f8,"%lX",ebx)
; --- bloc 3
mov eax,0x40e0f8 ; add ebx,eax ; xor ecx,ebx ; imul ecx,ebx ; sub ecx,eax
                                                       ; ecx = P² − P, P = 0x40E0F8
wsprintfA(0x40e2f8,"%lX",ecx)
; assemblage : "Bon-" + b1 + "-" + b2 + "-" + b3  (lstrcatA ×5) puis lstrcmpA(calculé, saisi)
```

**Assemblage pour `petik`** :

1. Σ octets = 112+101+116+105+107 = 541 ; Σ(c−0x19) = 541 − 5·25 = 416 = `0x1A0` ; `A = −0x1A0 = 0xFFFFFE60`.
2. `A³ mod 2³² = 0xFBB58000`.
3. `P = 0x40E0F8` → `P² − P mod 2³² = 0x41720F48`.
4. Serial : `Bon-FFFFFE60-FBB58000-41720F48`.

**Pièges.**

- `mov eax,0x40e0f8` est une **adresse immédiate** (celle du buffer du bloc 1), pas son contenu : le 3ᵉ bloc ne dépend donc pas du nom. Le binaire n'a pas de relocation/ASLR (image base `0x400000` fixe), donc la constante est stable.
- Le nom est en octets bruts (`movzx`), pas de casse imposée ; `%lX` donne des majuscules sans zéros de tête (`A` négatif → 8 chiffres).
- Le gros du code (`0x4013xx+`) est le lecteur XM : ne pas s'y perdre.

## Vérification

Live sous Wine/Xvfb (`xdotool` clique le champ name, le champ serial, puis CHECK ; `ffmpeg x11grab` capture) :

| Cas | Capture |
|---|---|
| `petik` / `Bon-FFFFFE60-FBB58000-41720F48` → **Hello, Mr. Goodboy!** | [`analysis/screenshot-ok.png`](analysis/screenshot-ok.png) |
| `petik` / `Bon-FFFFFE60-FBB58000-41720F49` (dernier digit modifié) → **Hello, Mr. Badboy!** | [`analysis/screenshot-ko.png`](analysis/screenshot-ko.png) |

```bash
python3 -I tools/keygenme1-solve.py --check analysis/ex/keygenme1.exe   # écrit /tmp/keygenme1-check.png
```

## Notes

- Reverse 100 % statique + preuve Wine ; pas de session GDB (pas de section dédiée), pas de debugger MCP actif sur ce binaire.
- Autre exemple : `abcd` → `Bon-FFFFFEDA-FE7C3DA8-41720F48`.
- Non patché ; `original/` intact (le zip n'est pas modifié, extraction sous `analysis/ex/`).
