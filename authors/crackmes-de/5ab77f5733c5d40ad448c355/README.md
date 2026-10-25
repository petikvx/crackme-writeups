# crackmes.de's keygenme_1_v2.1_final by haspor

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c355`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c355) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (haspor) |
| **Plateforme** | Windows PE32 GUI (TASM32 / Turbo Linker 2.25), dialogue `DialogBoxParamA` |
| **SHA-256 (zip)** | `3b6832a5676c62137e34149672c3a946b814207ad723f11a9114b5e9a42f9a16` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/keygenme1_v21.zip` | archive d'origine (mot de passe `crackmes.one`) → `keygenme1_v2.1.exe` (8192 o) |
| `tools/keygenme1-v21-solve.py` | keygen + `--check` (réimplémentation du prédicat) |
| `analysis/screenshot-ok.png` / `screenshot-ko.png` | preuve live Wine/xvfb |

## Réponse

Pas de nom : le serial est seul. Il en existe un grand nombre (≈ 2^64 valides) ; exemple vérifié :

> **`MDAX-UU9D-W7VJ-FLCY`**

```bash
python3 -I tools/keygenme1-v21-solve.py            # serial aléatoire valide (--seed N pour reproduire)
python3 -I tools/keygenme1-v21-solve.py -q --seed 2   # → MDAX-UU9D-W7VJ-FLCY
python3 -I tools/keygenme1-v21-solve.py --check MDAX-UU9D-W7VJ-FLCY
```

(Un nom comme `petik` n'est pas demandé par ce crackme.)

## Premier regard

```bash
unzip -P crackmes.one original/keygenme1_v21.zip -d /tmp/kg     # ne pas toucher à original/
file /tmp/kg/*.exe     # PE32 GUI i386, 5 sections
diec /tmp/kg/*.exe     # TASM32 / Turbo Linker 2.25 (pas packé)
strings -n 6 /tmp/kg/*.exe
```

Strings utiles : titre `KeygenMe 1 v2.1 [Final version] :)`, **alphabet**
`23456789ABCDEFGHJKLMNPQRSTUWVXYZ` (32 symboles : pas de `0 1 I O`, et `W` avant `V`),
`Good serial!!` / `Bad serial, try again`. Dans `.data` (VA `0x402000`) une table de 256 dwords
`0, 0xC0C1, 0xC181, 0x4001, …` : c'est la table **CRC-16/ARC** (poly `0xA001` réfléchi).

## Flow

`objdump -d -M intel --start-address=0x401000 --stop-address=0x401470 keygenme1_v2.1.exe`

- `0x401025` : DlgProc. `WM_INITDIALOG` mémorise les handles `0x3e9` (champ serial, `[0x402468]`) et `0x3e8` (statut, `[0x40246c]`) ; `WM_COMMAND` id `0x3eb` (bouton *Try*) → `0x4010ad`.
- `0x4010ad` : `GetWindowText` (max 0x19) dans `0x402470` ; exige **longueur 0x13 = 19** et des `-` aux offsets 4, 9, 14 ; puis
  `0x40117c` (décodage), `0x401296` (vérif CRC) ; `[0x4024c9]==1` → « Good serial!! ».

## Comment on trouve le prédicat

### 1. Décodage (`0x40117c`)

Pour chaque caractère non `-` : recherche de son index `v` (0..31) dans l'alphabet (`0x402423`, boucle `cmp ebx,0x20`, hors alphabet → échec), puis empaquetage **5 bits par caractère, LSB d'abord** dans un tampon de 10 octets `0x402489` :

```asm
4011d6  and esi,0x80000007     ; esi = bitpos & 7 (ebp = 5*i)
4011f2  shl dl,cl              ; octet bas : v << (bitpos&7)
401205  cmp esi,3 / jle        ; si > 3 bits débordent :
40121c  sar ebx,cl             ; cl = 8-esi → v >> (8-esi) dans l'octet suivant
401246  add ebp,5
```

Le serial devient un entier de 80 bits `V = Σ v_i << 5i` (16 caractères). Garde-fou : `V` ne doit pas être nul (`0x40126c-0x401288`).

### 2. Vérification (`0x401296`)

Boucle `ebp = 0..63` sur les 64 premiers bits de `V`, avec le masque 64 bits
`M = 0x258410C1_03108904` (`ecx=0x3108904`, `edx=0x258410c1` à `0x4012cb-0x4012d4`, le `1<<ebp` 64 bits venant de `0x40142d` = `shl` 64 bits avec `shld`). 16 bits sont à 1 dans M : positions `p_0 < … < p_15`.

- bit `ebp` **hors masque** (`0x4012e7`) : si `V[ebp]` → bit `ebp` de **D** (64 bits, `0x40249d`).
- bit `ebp` **dans le masque** (`0x40132b`), `j` = rang (compteur `[0x4024c5]`) :
  - si `V[ebp]` → bit `15-j` de **C** (16 bits, `[0x4024b1]`, `[0x4024b5]` démarre à 15 et décrémente) ;
  - si `V[64+j]` (`add eax,0x40` à `0x401392`) → bit `ebp` de **D**.

Donc `D` = bits libres de V hors masque + 16 bits issus de `V[64..79]` placés aux positions du masque, et `C` = bits de V aux positions du masque.

Puis (`0x4013f4-0x401416`) CRC-16/ARC sur les 8 octets de `D` (little-endian), init 0 :

```asm
401404  xor edx,esi            ; edx = octet ^ (crc & 0xff)
401406  shr eax,8
401409  mov edx,[edx*4+0x402000]   ; table CRC16 0xA001
401410  xor eax,edx
```

et `cmp C, crc` (`0x40141e`) → `[0x4024c9]=1`.

### 3. Construction du serial (keygen)

1. choisir 48 bits libres hors masque + 16 bits `m` (= `V[64..79]`) au hasard ;
2. `D` = libres | `m` placés aux 16 positions du masque ; `crc = CRC16/ARC(D en 8 o LE)` ;
3. poser `V[p_j] = crc[15-j]` ; 4. découper V en 16 groupes de 5 bits → alphabet, tirets tous les 4.

Piège : le CRC dépend des bits `m` mais pas de `V[p_j]` (les bits de masque de V ne font que *porter* le CRC) → pas de point fixe à chercher, la construction est directe.

## Vérification

Wine sous Xvfb, saisie via `xdotool` dans le champ du bas (le champ du haut est le statut), clic sur *Try* ; capture `ffmpeg x11grab`.

| Serial | Résultat | Capture |
|---|---|---|
| `MDAX-UU9D-W7VJ-FLCY` | **Good serial!!** | [`screenshot-ok.png`](analysis/screenshot-ok.png) |
| `MDAX-UU9D-W7VJ-FLCZ` (dernier char modifié) | Bad serial, try again | [`screenshot-ko.png`](analysis/screenshot-ko.png) |

`--check` du solveur donne `OK` / `KO` identique. Aucune session GDB / debugger : reverse statique + preuve Wine.

## Notes

- La table à `0x402000` est du CRC-16/ARC standard (le solveur recalcule bit à bit, sans lire la table).
- Le serial est sans lien avec un nom d'utilisateur ; tous les serials générés par le solveur sont valides (re-testés avec `decode`).
