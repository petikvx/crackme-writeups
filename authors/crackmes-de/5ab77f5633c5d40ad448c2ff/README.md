# CrackMe #1 (`MiB.CrkMe#1_fixed`) by MiSSiNG iN ByTES

- ID : [`5ab77f5633c5d40ad448c2ff`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2ff) — voir [`ORIGIN.yml`](ORIGIN.yml)
- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2ff (auteur site : crackmes.de, vrai auteur : MiSSiNG iN ByTES, 2004)
- Plateforme : Windows PE32 GUI, VC++ 6 + **MFC42D (debug)**, packé UPX 1.24
- ZIP password : `crackmes.one`

| Fichier | Rôle |
|---|---|
| `original/mib.crkme1_fixed.zip` | archive d'origine (exe + `.nfo` + `.diz`) |
| `analysis/crkme1.unpacked.exe` | exe dépacké (`tools/upx-3.96 -d`) |
| `analysis/full.asm` | `objdump -d -M intel` de l'exe dépacké |
| `analysis/emu-results.txt` | sortie des preuves unicorn (OK / KO) |
| `tools/mib-crkme1-solve.py` | keygen |
| `tools/mib-crkme1-emu.py` | exécute le **vrai handler** du bouton sous Unicorn |

## Réponse

Le `.nfo` : « *Only a keygen is an acceptable solution!* ». Le serial dépend du nom **et de la machine** :

```
serial = "%d" % (S*4)  +  "-"  +  "%x" % volser  +  "-weloveyour"  +  label_du_volume
```

| Entrée | Valeur |
|---|---|
| nom | `petik` |
| volser / label / desktop (valeurs d'exemple) | `1234abcd` / `PETIK` / `0xa1b2c4` |
| **serial** | `880189860-1234abcd-weloveyourPETIK` |

```bash
python3 tools/mib-crkme1-solve.py petik --volser 1234abcd --label PETIK --desktop a1b2c4
python3 tools/mib-crkme1-solve.py -q          # défauts = l'exemple ci-dessus
```

`--volser` / `--label` : serial et nom du volume du lecteur courant (`vol` sous Windows) ;
`--desktop` : valeur du pointeur `CWnd*` du bureau (voir plus bas, non déterminable hors de la machine cible).

## Premier regard

```bash
file original/*.exe          # PE32 GUI, UPX
diec MiB.CrkMe#1.exe         # UPX(1.24), MSVC 6, MFC(4.2)[debug]
./tools/upx-3.96 -d -o analysis/crkme1.unpacked.exe MiB.CrkMe#1.exe
strings -n 5 analysis/crkme1.unpacked.exe
```

Strings utiles : `User name must be more than 3 chars!`, `Serial accepted! Type a keygen!`, `Wrong serial!`, `-weloveyour`, `%x`, `-`, `%d`.
Imports : `GetVolumeInformationA`, `GetUserDefaultLangID`, `wsprintfA`, `strcat`, `strcmp`, MFC42D par ordinaux.
Le message de succès est un clin d'œil : il faut écrire un keygen.

## Flow

Handler du bouton OK = `0x401ca0` (`__thiscall`, `ecx` = dialogue). Les contrôles : `0x3e8` = nom, `0x3e9` = serial, `0x3ec` = zone de message.
Les thunks MFC par ordinal : `0x4022d8` = `GetDlgItemText(id, buf, n)`, `0x4022d2` = `SetDlgItemText(id, txt)`.

## Comment on trouve le prédicat

Ancrage : on cherche les références aux strings (`push 0x4152dc` = message nom trop court, etc.) dans `objdump` de l'exe dépacké.

1. **Nom** (`0x401cc3…0x401cf7`) : `GetDlgItemText(0x3e8, buf, 0x32)`, `len < 4` → « User name must be more than 3 chars! ».
2. **Boucle** (`0x401d25…0x401d72`), pour chaque octet `c` du nom :
   ```asm
   mov cl,[ebp+i-0x38] ; add cl,1 ; mov [..],cl     ; c1 = c+1 (octet)
   movsx ecx,[..] ; add edx(=len),ecx ; mov [..],dl  ; b = (len + sext8(c1)) & 0xff
   movsx edx,[..] ; add [ebp-0x2b8],edx              ; S += sext8(b)
   ```
3. **Piège n°1 : `S` n'est jamais initialisé.** `[ebp-0x2b8]` est dans la zone de 0x2f8 octets remplie de `0xCCCCCCCC` par le prologue debug (`rep stos` avec `eax=0xcccccccc`, `/GZ`). La somme commence donc à `0xCCCCCCCC`.
4. **Piège n°2 : la constante globale `[0x4169f0]`** (`0x401d74 : add [S], [0x4169f0]`) est posée à la fin de `OnInitDialog` (`0x401993…0x40199a`) : `call 0x402254 ; shr eax,1 ; mov [0x4169f0],eax`. `0x402254` est un thunk vers l'ordinal MFC42D `0x976` = **2422 = `CWnd::GetDesktopWindow()`**, qui renvoie un `CWnd*` temporaire (adresse heap). La valeur dépend donc de l'OS / du tas MFC : paramètre `--desktop` du keygen.
5. `S = (S + g) << 2` puis `wsprintfA(buf, "%d", S)` (**signé**).
6. **Concaténation** (`0x401dab…0x401e45`) : `strcat(buf,"-")` ; `GetVolumeInformationA(NULL, nomVolume[0x14], 0x14, &volser, 0,0,0,0)` (lecteur courant) ; `wsprintfA(tmp,"%x",volser)` ; `strcat(buf,tmp)` ; `strcat(buf,"-weloveyour")` ; `strcat(buf,nomVolume)`.
7. Serial saisi (`0x3e9`, ≥ 4 car.) comparé par `strcmp` ; `0` → « Serial accepted! Type a keygen! ».
   (`GetUserDefaultLangID` n'intervient qu'à l'init d'une autre routine, sans effet sur le serial.)

### Exemple `petik` (len = 5), `desktop = 0xa1b2c4` → `g = 0x50d962`

| c | c+1 | (5 + sext(c+1)) & ff | |
|---|---|---|---|
| p | 0x71 | 0x76 (118) | |
| e | 0x66 | 0x6b (107) | |
| t | 0x75 | 0x7a (122) | |
| i | 0x6a | 0x6f (111) | |
| k | 0x6c | 0x71 (113) | |

`Σ = 118+107+122+111+113 = 571 = 0x23b` ; `S = 0xCCCCCCCC + 0x23b = 0xCCCCCF07` ;
`S += g` → `0xCD1DA869` ; `S << 2` → `0x3476A1A4` = **880189860** (positif ici ; le `%d` est signé en général).
Serial : `880189860` + `-` + `1234abcd` + `-weloveyour` + `PETIK`.

## Vérification

`MFC42D.DLL` / `MSVCRTD.dll` (runtime debug, non redistribuable) sont absentes de wine : `xvfb-run -a wine MiB.CrkMe#1.exe` ne produit aucune fenêtre exploitable. Comme pour les autres crackmes MFC42D du dépôt, `tools/mib-crkme1-emu.py` exécute **le vrai handler `0x401ca0`** du binaire dépacké sous Unicorn, en simulant seulement `GetDlgItemText`, `SetDlgItemText`, `GetVolumeInformationA`, `wsprintfA`, `strcat`, `strcmp`, `_chkesp` et en posant le global `0x4169f0` :

```bash
python3 tools/mib-crkme1-emu.py analysis/crkme1.unpacked.exe petik "$(python3 tools/mib-crkme1-solve.py -q)"
```

| Cas | Résultat (`analysis/emu-results.txt`) |
|---|---|
| `petik` + serial du keygen | `Serial accepted! Type a keygen!` |
| même serial + `x` | `Wrong serial!` |
| nom `pet` | `User name must be more than 3 chars!` |
| `Alexander`, volser `DEADBEEF`, label `My Disk`, desktop `12345678` | accepté (`1469836248-deadbeef-weloveyourMy Disk`) |

Pas de session GDB (analyse statique + émulation).

## Notes

- Le serial est lié à la machine (volume + pointeur heap MFC) : un keygen « universel » doit lire ces valeurs sur la machine cible (`vol`, et valeur de `[0x4169f0]` sous débogueur) ; c'est le sens du « *Type a keygen* ».
- Le label est tronqué à 19 caractères (buffer de 0x14 octets).
- Le point sournois est la somme non initialisée (`0xCCCCCCCC`) due au build debug.
