# crackmes.de's crackme_2 by cosh — keygen

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3b0`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3b0) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (cosh) |
| **Plateforme** | Windows PE32 GUI, MSVC 6 + MFC 4.2 (dialogue Name / Serial / CHECK / QUIT) |
| **SHA-256 (zip)** | `0f6c7edad3822e5eede25b029b8ec0ef7481da9efa35fc1c4160f2f5ee8bc864` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/cosh2.zip` | archive d'origine (contient `crackme2.exe` + `HarvestR.nfo`, simple nfo décoratif) |
| `tools/cosh2-solve.py` | keygen ; `--check` relit le préfixe dans l'exe, `--live` preuve Wine |

## Réponse

| Name | Serial |
|---|---|
| `petik123` | **`6287-A-petik123`** |

Règle : `len(Name) > 5`, `len(Serial) > 5` et `Serial` commence par `6287-A` (le reste est libre, le serial ne dépend pas du nom).
Le nom `petik` (5 car.) est **refusé** (longueur > 5 exigée) : on utilise donc `petik123`.

```bash
python3 -I tools/cosh2-solve.py            # Name : petik123 / Serial : 6287-A-petik123
python3 -I tools/cosh2-solve.py --check --live
```

## Premier regard

```bash
unzip original/cosh2.zip -d /tmp/c2         # hors du dépôt
file crackme2.exe   # PE32 executable for MS Windows 4.00 (GUI), Intel i386, 4 sections
diec crackme2.exe   # MSVC 6.0 (12.00.8168), MFC 4.2, pas de packer
strings -n 5 crackme2.exe
```

Strings utiles (`.data`, `0x403020`+) : `YOU DID IT`, `Well done,`, `One of the Details you entered was wrong`, `ERROR`.
Le dialogue (ressource `.rsrc`, titre `Crackme2 - By CoSH`) contient deux `EDIT` : id `0x3e8` (sous le label « Name ») et id `0x3e9` (sous « Serial »), plus `CHECK` / `QUIT`.

## Flow

Message map MFC → handler du bouton CHECK en `0x4014B0`. Les imports MFC42 sont par ordinal, d'où les `jmp [iat]` opaques ; les ordinaux (`0x402180`→3874, `0x402184`→3876) correspondent à `CWnd::GetWindowText(CString&)` / `GetWindowTextLength`.

## Comment on trouve le prédicat

**Ancrage** : les messages d'erreur (`0x403038`, `0x403064`) ne sont référencés que par le handler `0x4014B0` (`objdump -d -M intel --no-show-raw-insn crackme2.exe`).

```asm
4014ce  lea  edi,[esi+0xa0]        ; CString associé à l'edit 0x3e8 (Name)
4014d6  call GetWindowTextLength   ; (0x40184a)
4014e1  cmp  eax,5
4014e4  jle  ERROR                 ; Name : len <= 5 => ERROR
4014e6  lea  ebp,[esi+0x60]        ; CString de l'edit 0x3e9 (Serial)
4014eb  call GetWindowTextLength
4014f0  cmp  eax,5
4014f3  jle  ERROR                 ; Serial : len <= 5 => ERROR
...     GetWindowText(edi -> [esi+0xe0]) ; copie Name
        GetWindowText(ebp -> [esi+0xe4]) ; copie Serial
401511  mov  eax,[edi]             ; eax = buffer du serial
401513  cmp  BYTE PTR [eax],0x36   ; '6'
401518  cmp  BYTE PTR [eax+1],0x32 ; '2'
40151c  cmp  BYTE PTR [eax+2],0x38 ; '8'
401524  cmp  BYTE PTR [eax+3],0x37 ; '7'
40152a  cmp  BYTE PTR [eax+4],0x2d ; '-'
401530  cmp  BYTE PTR [eax+5],0x41 ; 'A'
401534  je   OK (0x40154d)
401536  ... MessageBox("One of the Details...", "ERROR")
```

**Décodage** : les six immediates `36 32 38 37 2d 41` = ASCII `6287-A`.

**OK** (`0x40154d`) : `sprintf`-like (`CString::Format`) avec le format `0x40302c` (`"Well done,"`) et le **nom** (`[esi+0xe0]`) puis `MessageBox(..., "YOU DID IT")`. Le nom n'intervient donc que dans le message final ; aucune dérivation nom→serial.

**Assemblage** : `petik123` (8 > 5) + serial `6287-A` + suffixe libre (`-petik123` par convention du keygen) = `6287-A-petik123` (15 > 5).

**Pièges** : (1) les ordinaux MFC rendent les `call` illisibles : se repérer aux `cmp eax,5` et aux 6 `cmp BYTE PTR` ; (2) vérifier quel edit est Name/Serial via le template de dialogue (positions y `0x17` → id `0x3e8`, `0x36` → id `0x3e9`) ; (3) la longueur est testée avec `jle`, donc 6 caractères minimum, pas 5.

## Vérification

Preuve live sous Wine 10 (`xvfb-run` + `xdotool` : clic dans chaque edit, saisie, Tab + Entrée sur CHECK, lecture des titres de fenêtres) — reproduite par `--live` :

| Name | Serial | Résultat |
|---|---|---|
| `petik123` | `6287-A-petik123` | fenêtre **`YOU DID IT`** (OK) |
| `petik123` | `6287-A` | `YOU DID IT` (suffixe libre) |
| `petik` | `6287-A-petik` | **`ERROR`** (nom trop court) |
| `petik123` | `6287-B-petik123` | **`ERROR`** (mauvais préfixe) |

Pas de capture d'écran (aucun outil de capture dispo sur le serveur headless) ; la preuve est la sortie des titres de fenêtres.

## Notes

- Aucun GDB / x64dbg / IDA utilisé : reverse 100 % statique (`objdump`) + preuve Wine ; pas de section GDB.
- Ce n'est **pas** un keygen name→serial : le serial est constant au préfixe près.
- `original/` non modifié (l'exe est extrait dans `/tmp`).
