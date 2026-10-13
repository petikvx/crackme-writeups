# crackmes.de's hysteria_crackme by haiklr

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c25e`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c25e) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (auteur réel : haiklr) |
| **Plateforme** | Windows PE32 GUI, MASM32, x86 |
| **Difficulté** | 2.0 |
| **SHA-256 (zip site)** | `c0c667acb6ca7e1c7a98626a2843ef9efdcda18f4821d1e123a050b180f12782` |
| **SHA-256 (exe)** | `bd4455d3e852fb30c745518d30514f43f5152088c0196622989327569c56bfe0` |

Keygenme « géométrique » + **keyfile** (pas de serial dans l’UI). Bruteforce / patch interdits par le readme.

## Fichiers

| Chemin | Contenu |
|---|---|
| `original/hysteria_CRKME.zip` | archive crackmes.one (mdp `crackmes.one`) |
| `original/Hysteria Crackme.exe` | PE MASM32 (extrait) |
| `original/readme en.txt` | consignes haiklr |
| `tools/haiklr-hysteria-solve.py` | keygen : écrit le keyfile à côté de l’exe |
| `tools/eafb870` | keyfile exemple pour `petik` |

## Réponse

Pour le nom **`petik`** : keyfile **`eafb870`** (24 octets = 6 dwords LE), points  
A=(68,8260), B=(66,8260), C=(1,8260) — P=(67,8260).

name='petik' crc=0eafb851 P=(67,8260)
keyfile=eafb870 A=(68,8260) B=(66,8260) C=(1,8260)
bytes=440000004420000042000000442000000100000044200000

## Premier regard



UI : edit id 8 (nom **et** message), boutons `&About` / `&Check` / `Bye !!`.

## Prédicat

1. `GetDlgItemText` nom (longueur 4..24) → buffer `0x406250`.
2. **CRC32** classique (`zlib.crc32`, table @ `0x40102f`) → `H`.
3. Keyfile : `wsprintf("%x", (H & 0xFFFFFF00) | nom[0])` — le `mov al, nom[0]` après le CRC **garde** les octets hauts de `eax` (pour `petik` : `0x0eafb851` → fichier `eafb870`).
4. Le fichier contient A=(x1,y1), B=(x2,y2), C=(x3,y3) en dwords LE ; chaque coordonnée ≠ 0 ; A, B, C distincts.
5. `P = (r,s)` avec `r = H % 99`, `s = r ^ 0x2007`.
6. Conditions :
   - `(x1-r)*(y1-s) + (x1-x3)*(y1-y3) == 0`
   - `(x2-r)*(y2-s) + (x2-x3)*(y2-y3) == 0`
   - `dist²(P,A) == dist²(P,B)`

Construction simple : A=(r+d,s), B=(r-d,s), C=(c,s) avec d≥1, c≠0, c∉{r±d}.

## Preuve

Sous Wine : `SetDlgItemText(petik)` + `WM_COMMAND` id 6 → edit = `Congratz ! Send me your keygen`.
