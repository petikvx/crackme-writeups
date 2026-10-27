# crackmes.de's crackme1_thomas.openmod.org by thomas.idpz.net

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3a1`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3a1) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (thomas, openmod.org) |
| **Plateforme** | Windows PE32 GUI, Visual Basic 6 **natif** (`MSVBVM60.DLL`) |
| **SHA-256 (zip)** | `f3fa272c79fbc2025bfa518662f0e5a19fe9e703bd5a44a3f82fb56ba984c9cf` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme1_thomas.zip` | archive d'origine (contient `crackme1.exe`, 32 768 o) — non modifiée |
| `analysis/crackme1.exe` | copie dézippée pour l'analyse / Wine |
| `analysis/screenshot-ok.png`, `screenshot-ko.png`, `screenshot-short-name.png` | preuves live Wine |
| `tools/crackme1-thomas-solve.py` | keygen (`-q`, `--date`, `--check`) |
| `tools/wine-drive.sh` | pilote Xvfb + Wine + xdotool (utilisé par `--check`) |

## Réponse

**serial = (Σ Asc(name[i])) × JJMMAAAA(date du jour)** — le serial change chaque jour.

| Nom | Date | Serial |
|---|---|---|
| `petik` | 27/10/2026 (`27102026`) | **`14662196066`** (541 × 27102026) |

```bash
python3 tools/crackme1-thomas-solve.py                       # petik, date du jour
python3 tools/crackme1-thomas-solve.py -q --date 27102026    # 14662196066
python3 tools/crackme1-thomas-solve.py --check               # vérifie sous Wine
```

Nom : au moins 5 caractères.

## Premier regard

```text
$ diec crackme1.exe   → Microsoft Linker 6.0, Visual Basic 6.00.8041 [Native]
$ strings -el …
  "Name must be more than 5 caracters"   "ddmmyyyy"
  "good cracker, now keygen it"          "try again ! :-)"
  "find the correct serial, make a keygen and write a solution :-)"
```

Fenêtre : `Name`, `Serial`, boutons `check !` et `about`. Les imports (`__vbaVarAdd`, `__vbaVarMul`, `__vbaVarForInit/Next`, `__vbaVarTstEq`, ordinaux 516/631/660/546…) trahissent du VB6 compilé en code natif avec **Variants** — pas de P-code, donc on lit de l'asm x86 « à la VB ». La chaîne `ddmmyyyy` annonce déjà un serial lié à la date.

## Flow

Handler du bouton `check !` : `0x403af0` (~`0x404092`). `Text1` (nom) = `[vtbl+0x304]`, `Text2` (serial) = `[vtbl+0x300]`.

1. `Len(Text1)` → `VarTstLt(len, 5)` ; si vrai → MsgBox « Name must be more than 5 caracters ».
2. Boucle `For i = 1 To Len(name)` (`__vbaVarForInit` `0x403d03`, `__vbaVarForNext` `0x403e8a`, retour à `0x403d15`).
3. Comparaison finale `__vbaVarTstEq` (`0x403efe`) entre le Variant calculé (`[ebp-0x54]`) et `Text2` → « good cracker, now keygen it » ou « try again ! :-) ».

## Comment on trouve le prédicat

**Ancrage** : `objdump -d -M intel crackme1.exe` puis recherche des `call [0x4010xx]` — table d'import (`objdump -p`) : `0x401010=__vbaLenBstr`, `0x40106c=__vbaVarMul`, `0x4010a0=__vbaVarAdd`, `0x401058=__vbaVarTstEq`, `0x4010bc=__vbaVarForNext`, `0x40109c=__vbaI4Var`, `0x401024` = ordinal 660 (`rtcFormat…`, formatage), `0x4010b8` = ordinal 546 (`Date`), `0x40104c` = ordinal 631 (`Mid$`), `0x40101c` = ordinal 516 (`Asc`).

**Corps de la boucle** (`0x403d1d`–`0x403e8a`), convention VB : `__vbaVarXxx(résultat_tmp, opérande…)` puis `__vbaVarMove(dest, eax)` :

```asm
403d23  call [edx+0x304]         ; Text1.Text (nom)
403d7b  call __vbaI4Var          ; i (compteur de boucle, [ebp-0x34])
403d86  call Mid$                ; Mid$(nom, i)
403d98  call Asc                 ; Asc(...) → code du i-ème caractère  → [ebp-0x44]
403deb  call __vbaVarAdd         ; tmp = Asc + acc    ([ebp-0x44] + [ebp-0x64])
403df6  call esi (VarMove)       ; acc ([ebp-0x64]) = tmp         ⇒ acc += Asc(nom[i])
403dfc  call Date (ord. 546)     ; Date du jour → [ebp-0x80]
403e0e  mov [ebp-0xb8],0x403824  ; chaîne UTF-16 "ddmmyyyy"
403e3a  call Format (ord. 660)   ; Format(Date, "ddmmyyyy") → [ebp-0xa0]
403e52  call __vbaVarMul         ; tmp = acc * "ddmmyyyy"   (la chaîne est convertie en nombre)
403e5d  call esi (VarMove)       ; [ebp-0x54] = tmp
```

À la sortie de boucle :

```asm
403efe  call __vbaVarTstEq       ; [ebp-0x54] == Text2.Text (Variant BSTR, type 0x8008) ?
403f1c  cmp word [ebp-0xfc],0   ; 0 → échec "try again", sinon "good cracker"
```

Donc `serial = Σ Asc(nom) × CLng(Format(Date, "ddmmyyyy"))`. La comparaison Variant numérique ↔ Variant chaîne se fait **numériquement** (VB convertit la saisie), donc le serial s'écrit en entier décimal simple.

**Exemple pas à pas** (`petik`, 27/10/2026) : `p=112 e=101 t=116 i=105 k=107` → Σ = **541** ; `Format(Date,"ddmmyyyy")` = `27102026` ; 541 × 27102026 = **14 662 196 066**.

**Pièges** :
- Le produit est recalculé à chaque itération (acc partiel × date), seul le dernier compte.
- Les adresses `0x4012xx–0x4038xx` désassemblées par objdump sont en majorité des **données VB** (tables, chaînes UTF-16) — le vrai code des handlers commence à `0x403af0`.
- Test de longueur : `abcd` (4) est refusé, `petik` (5) accepté → la condition est `Len < 5` (le message dit « more than 5 », mais 5 passe).
- `ctrl+a` ne sélectionne pas dans le champ VB sous xdotool (le texte s'ajoutait à « Name ») : le script vide avec `BackSpace`.

## Debug GDB / x64dbg

Non utilisés : reverse statique (`objdump`) + preuve live Wine ; le MCP x32dbg n'était pas sollicité (pas de session active sur ce binaire).

## Vérification

```bash
bash tools/wine-drive.sh petik 14662196066 /tmp/ok.png     # Xvfb + wine + xdotool
```

| Cas | Résultat | Capture |
|---|---|---|
| `petik` / `14662196066` (jour 27/10/2026) | « good cracker, now keygen it » | [`screenshot-ok.png`](analysis/screenshot-ok.png) |
| `petik` / `12345` | « try again ! :-) » | [`screenshot-ko.png`](analysis/screenshot-ko.png) |
| `abcd` / `1` | « Name must be more than 5 caracters » | [`screenshot-short-name.png`](analysis/screenshot-short-name.png) |

`python3 tools/crackme1-thomas-solve.py --check` rejoue le cas OK de bout en bout.

## Notes

- Serial **dépendant de la date système** : un serial d'hier est faux aujourd'hui (le keygen utilise la date locale ; `--date JJMMAAAA` pour forcer).
- Le binaire d'origine (`original/`) n'a pas été modifié ; l'exe dézippé est sous `analysis/`.
