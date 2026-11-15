# jeffli6789 — RE CTF 2026 : FLRSCRNSVR (screensaver)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/69a28c267a778cfffbfb67be) · id `69a28c267a778cfffbfb67be`

Auteur : [jeffli6789](https://crackmes.one/user/jeffli6789) · Plateforme : Windows PE64 (écran de veille `.SCR`, MSVC 2022)

| Fichier | Rôle |
|---|---|
| [`original/download.bin`](original/download.bin) | ZIP (mdp `crackmes.one`) contenant `FLRSCRNSVR.SCR` (ZIP imbriqué dans le ZIP du site) |
| `analysis/x/FLRSCRNSVR.SCR` | binaire extrait (`unzip -P crackmes.one original/download.bin`) |
| `analysis/full.asm` | `objdump -d -M intel` complet |
| [`tools/flrscrnsvr-solve.py`](tools/flrscrnsvr-solve.py) | solveur (inverse de la transformation) + `--check` |
| [`tools/flrscrnsvr-emu.py`](tools/flrscrnsvr-emu.py) | preuve : émule la **vraie** fonction `0x140001300` sous unicorn |

## Réponse

Texte à saisir dans la boîte de config de l'écran de veille (champ « Enter: ») :

```text
CMO{frogt4s7ic_r3vers1ng}
```

```bash
python3 tools/flrscrnsvr-solve.py -q        # flag seul
python3 tools/flrscrnsvr-solve.py --check   # ré-applique la transformation
python3 tools/flrscrnsvr-emu.py             # preuve sur le code d'origine -> MATCH
```

Pas de username dans ce challenge (exemple `petik` : refusé, longueur ≠ 25, voir Vérification).

## 1. Premier regard

- `original/download.bin` est un **ZIP** (pas un exécutable) : `unzip -P crackmes.one` → `FLRSCRNSVR.SCR` (PE64, 484 352 o, `diec` : MSVC 14.44, pas de packer). PDB : `…\crackmesone\screensaver\i\love\it\thank\you\xoxoxox.pdb`.
- Strings : `Software\FLRSCRNSVR`, valeurs `Text`, `Quak`, `Crackmes.one` (texte par défaut), `Keep Calm and FLARE On`, dialogue « Screensaver Configuration / Enter: ».
- Deux alphabets étranges dans `.rdata` : `abc…zABC…NOP`+`QRS…Z0-9}_{=-` et son miroir `-={_}9876543210ZYX…Aza…a`.
- Imports « bruit » (`IsDebuggerPresent`, `GetTickCount`, `FindFirstFileW *.dll`, `GetComputerNameW`, `SetLastError(rand)`, boucles de délai inutiles) : leurres/anti-analyse sans effet sur le prédicat.

## 2. Flow

1. Boîte de config (DialogProc `0x140001f30`) : OK (`IDOK`) → `GetDlgItemTextW(0x3e9)` puis écrit la saisie dans `HKCU\Software\FLRSCRNSVR\Text` ; elle écrit aussi `Quak` (tableau constant).
2. `0x140001ae0` (appelé à l'init et au démarrage du screensaver) relit `Text` (défaut `Crackmes.one`), **exige `wcslen == 0x19`** (`cmp rax,0x19` en `0x140001d9b`), puis :
   - `0x140001300(buf)` : transforme la saisie ;
   - `0x140001890(buf2)` : récupère la référence (valeur `Quak`, sinon tableau constant `0x1400064d0`) ;
   - comparaison wchar par wchar (`0x140001e41`) ; si égal → `byte [0x140008898] = 1` (état « débloqué » du screensaver, grenouilles animées).

## 3. Comment on trouve

Ancrage : `objdump -d -M intel` + recherche des appels IAT (`call [rip+x]  # 0x140006208` = `GetDlgItemTextW` en `0x140002032`), puis lecture de `0x140001ae0` → `0x140001300` / `0x140001890`. (Pas d'IDA dispo sur la machine : `objdump` + unicorn.)

**Transformation `0x140001300`** (les nombreux `GetTickCount`/`RegOpenKeyEx`/boucles `sub rcx,1` sont du bruit) :

```asm
; (1) substitution : tbl = wcscpy(0x140006560)+wcscat(0x1400065b8)  = a-zA-Z0-9}_{=-  (67)
;                   rev = wcscpy(0x1400065f0)+wcscat(0x140006640)  = -={_}9-0Z-A z-a   (67)
14000151b: call wcschr(tbl, c)            ; si trouvé : c = rev[idx]
; (2) clé : dwords 0x4c0046,0x520041,0x520045,0x4c0041,0x46 sur la pile = L"FLARERALF" (len 9)
140001754: div r12                        ; rdx = i % 9
14000175a: add ax, key[rdx]  (ax = i)     ; ax = i + key[i%9]  (16 bits)
14000175f: xor [buf+i*2], ax
; (3) reverse de la chaîne (échange rsi / r14-1-rsi)  140001780..140001855
```

Référence `0x1400064d0` (25 wchar) :
`3c 51 6a 09 02 07 25 03 30 08 04 29 68 24 01 24 18 6b 77 0f 70 36 02 0e 0b`.

**Inversion** (le solveur) : reverse du tableau → `x[i] = ref_rev[i] ^ ((i + KEY[i%9]) & 0xffff)` → substitution inverse (`rev[idx]` → `tbl[idx]`). Exemple début : `ref_rev[0]=0x0b`, `i=0`, `KEY[0]='F'=0x46` → `0x0b^0x46=0x4d 'M'` → `rev.index('M')` = 28 → `tbl[28]='C'`… on retombe sur `CMO{…}` (le format `CMO{}` des CTF de l'auteur).

Pièges : le ZIP dans le ZIP ; la clé XOR est construite par immédiats de pile (`mov DWORD [rsp+0x30],0x4c0046` → `F`,`L` en UTF-16LE) donc invisible dans `strings` ; les `wcsncmp`/boucles de délai sont des leurres.

## 4. Debug GDB / live

Pas de session GDB ; analyse statique + **émulation unicorn** de la fonction réelle (IAT stubée : `wcschr`, `wcscpy_s`, `wcscat_s`, reste → `ret`).

## 5. Vérification

```text
$ python3 tools/flrscrnsvr-emu.py
entrée    : CMO{frogt4s7ic_r3vers1ng}
transformé: [0x3c, 0x51, 0x6a, 0x9, 0x2, 0x7, 0x25, 0x3, 0x30, 0x8, 0x4, 0x29, 0x68, …, 0xb]
attendu   : [0x3c, 0x51, 0x6a, 0x9, 0x2, 0x7, 0x25, 0x3, 0x30, 0x8, 0x4, 0x29, 0x68, …, 0xb]
MATCH
$ python3 tools/flrscrnsvr-emu.py petik | tail -1
NO MATCH
```

Wine : le screensaver tourne sous `xvfb-run -a wine FLRSCRNSVR.SCR /s` avec `HKCU\Software\FLRSCRNSVR\Text` posé via `wine reg add` ; le rendu (grenouilles + « Keep Calm and FLARE On ») est animé et aléatoire, il n'a pas permis de distinguer visuellement OK/KO en capture — la preuve reste l'émulation du vrai code.

## Notes

- Ce n'est pas un serial lié à un nom : une seule valeur valable (25 caractères).
- L'émulation prouve le prédicat de `0x140001300` + la référence ; la longueur 25 est vérifiée à part (`cmp rax,0x19`).
