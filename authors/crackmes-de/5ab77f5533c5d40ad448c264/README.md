# crackmes.de's mms_crackme by haiklr

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c264`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c264) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (auteur réel : haiklr) |
| **Plateforme** | Windows 2000/XP PE32 GUI, MASM32, x86 |
| **Difficulté** | 2.0 |
| **SHA-256 (zip site)** | `81e6320910b457a8988e1505eb97cc2b9f14055386fed471751e3dc328c25c5b` |
| **SHA-256 (exe)** | `eea0868b096902997341db7b59579c6cc67f3d200866a2b1d88d9cf833e4752b` |

Serialme MASM32 (dialogue construit en mémoire). Readme : *« BRUTEFORCING is forbidden »*.

## Fichiers

| Chemin | Contenu |
|---|---|
| `original/mms-crkme_en.zip` | archive crackmes.one (mdp `crackmes.one`) |
| `original/m&m's crkme.exe` | PE MASM32 + WAV intégré |
| `tools/mms-crackme-solve.py` | serial + `--check` |
| `tools/verify-click.c` / `.exe` | pilote Wine : edit `0x7d0` + bouton `0x3e8` |

## Réponse

```
_!Q$
```

Résultat (texte de l’edit après *Eat Me*) : **`M&M's owned !`**.

## Premier regard

- DIE : MASM32 ; imports `DialogBoxIndirectParamA`, `GetDlgItemTextA`, `SetDlgItemTextA`, `wsprintfA`, `PlaySoundA`.
- Titre fenêtre : ` M&M's Crackme` (espace initial). Edit id `0x7d0`, bouton *Eat Me* id `0x3e8` → `0x401000`.

## Prédicat (`0x401000`)

1. `GetDlgItemTextA(hDlg, 0x7d0, buf@0x4030cc, 0x32)`.
2. Hash rotatif sur le serial brut :
   `ebx = (ebx & ~0xFF) | c ; rol ebx, 8 ; ecx += ebx` pour chaque caractère.
3. `wsprintfA(buf, "%X", ecx)` **écrase** le buffer avec l’hex majuscule du hash.
4. Huit tests sur ce hex (pas sur la saisie) :
   - `buf[0]=='8'`, `buf[2]=='D'`, `buf[4]=='F'`, `buf[7]=='F'`
   - `buf[3]` : `bswap(37·(c+0xA4)) == 0xC91E0000` → `'1'`
   - `buf[5]` : `ror(5·(c^0x66), 7) == 0x3E000003` → `'5'`
   - `buf[1]` : `(c·0x98) ^ ((c·0x98)>>8) == 0x1C9C` → `'0'`
   - `buf[6]` : `~rol(c,7) == 0xFFFFE57F` → `'5'`
5. Donc le hash **doit** valoir `0x80D1F55F` (`%X` → `80D1F55F`).
6. Succès → construction *« M&M's owned ! »* puis `SetDlgItemTextA` sur l’edit.

Aucun bruteforce du champ serial : on inverse les 8 contraintes hex, puis on cherche un préimage du hash (ex. longueur 4 printable `_!Q$`).

## Preuve

```bash
python3 tools/mms-crackme-solve.py --check   # OK _!Q$ 80D1F55F
# sous xvfb :
wine "original/m&m's crkme.exe" &
wine tools/verify-click.exe '_!Q$'
# result.txt : _!Q$ -> M&M's owned !
```
