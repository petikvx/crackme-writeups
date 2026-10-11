# yowmo_keygenme1 by yowmo

| | |
|---|---|
| **ID** | [`5ab77f5433c5d40ad448c1a9`](https://crackmes.one/crackme/5ab77f5433c5d40ad448c1a9) |
| **Auteur (site)** | crackmes.de (auteur original : yowmo) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 GUI, assembleur |
| **Difficulté** | 2.0 |
| **SHA-256 (zip)** | `18ce2f2a37d3f5b99b1ee1b613947178e055b5e03fc988cfc725e958681a323f` |

## Résultat

Keygen **Level I** (combo `CB_GETCURSEL == 0`). Exemple : nom **`petik`** → serial **`DCDBC68E`**.

```
$ python3 tools/yowmo_keygenme1-solve.py petik
petik DCDBC68E
```

Vérifié par émulation Unicorn du vrai code de vérif Level I (`0x401a7f`–`0x401a99`, XOR + format `%X`) : EDI final `0xDCDBC68E`. GUI wine non pilotée (dialogue + combo).

## Comment on trouve

1. `diec` / `file` : PE32 GUI i386, pas de packer. Imports utiles : `GetDlgItemTextA` (via `SendDlgItemMessageA` 0x0d), `lstrcmpA`, `GetComputerNameA`, `wsprintfA`.
2. Le handler de bouton Check lit la combo (`SendMessage` `CB_GETCURSEL = 0x147` sur le contrôle en `0x403244`) : index `0` → Level I (`[0x403248]=0`), sinon Level II.
3. **Level I** (`0x4019ed`) :
   - nom (edit `0x3e9`) longueur 5..25, pas dans la blacklist ASCII en `0x4030e2` (`matrixba`, `Ciwata`, …) ;
   - serial (edit `0x3ea`) exactement 8 caractères ;
   - `EDI = 0xDEADBEEF`, puis pour `ebx = 0 .. len-3` : `EDI ^= dword little-endian` lu à `name[ebx]` (chevauchement d’un octet) ;
   - `wsprintfA(buf, "%X", EDI)` puis `lstrcmpA` avec le serial.
4. Pour `petik` (len 5) : trois XOR → `0xDCDBC68E`.
5. Level II (index combo ≠ 0) mélange `GetComputerNameA` et des contraintes sur les 5 premiers octets du serial (`TTcc` + `0x1a` + hex) ; non nécessaire pour la soluce Level I.

Désassemblage du check : [`analysis/verify.asm.txt`](analysis/verify.asm.txt).

## Solveur

[`tools/yowmo_keygenme1-solve.py`](tools/yowmo_keygenme1-solve.py)

## Contenu

```
original/   # zip + exe
analysis/   # désassemblage verify
tools/      # keygen Level I
```

## Status

- [x] reverse
- [x] write-up
- [x] solveur
