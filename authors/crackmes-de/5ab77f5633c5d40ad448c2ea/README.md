# crackmes.de's anonimoser_crackme_v by anonimoser

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2ea`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2ea) |
| **Auteur (site)** | crackmes.de (auteur d'origine : AnonimoSer) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 GUI, Borland Delphi 5, packé UPX |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `8d07b79d89268286dec4c4929e7ab3e9daf1d26982f31201b5a2aa1bc8897dc1` |

## Solution

Keygen. La clé dépend du nom, de l'entreprise et du **numéro de série du volume `C:`** ; l'âge doit être égal à la somme des numéros des cases « Key » cochées.

Exemple sous wine (série `C:` = `4300-0000`) : **Nombre `petik`, Edad `20`, Empresa `petik`, cases 5 et 15 cochées → Contraseña `1082BAICAS1124073472CM5`** (vérifié : les panneaux glissent hors de l'écran ; une clé fausse affiche « ERROR / Datos incorrectos »).

```bash
python3 tools/crackmes-de-anonimoser_crackme_v-solve.py petik petik 20            # série wine par défaut
python3 tools/crackmes-de-anonimoser_crackme_v-solve.py petik petik 20 1A2B3C4D   # série de votre C: (vol c:)
```

## Origine

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2ea
- Download : https://crackmes.one/download/crackme/5ab77f5633c5d40ad448c2ea
- ZIP password : `crackmes.one`

Le zip contient `crackme5.zip` → `AnonimoSer CrackMe V.exe` (le crackme) et `web.exe` (lanceur de la page web de l'auteur, non exécuté). Même famille que [anonimoser_crackme_i](../5ab77f5633c5d40ad448c2e8/).

## 1. Premier regard

```text
file   → PE32 executable (GUI) Intel 80386, UPX compressed
upx -d → OK ; diec → Borland Delphi 5, Turbo Linker 2.25
```

Le DFM de `TForm1` (plein écran, fond noir) contient `Edit1` (« Nombre »), `Edit2` (« Edad », `OnKeyPress = revisaeda` : chiffres seulement), `Edit3` (« Empresa (o grupo cracker) »), `MaskEdit1` (« Contraseña », masqué), quinze `TCheckBox` numérotées 1 à 15 (« Key »), une icône clé `Image2` (`OnClick = revisa`) et un `Timer1` (`OnTimer = lohizo`, animation de fin).

La table des champs publiés donne les offsets utilisés par le code :

| offset | contrôle |
|---|---|
| `+0x2e0` | Edit1 (Nombre) |
| `+0x2e8` | Edit2 (Edad) |
| `+0x2ec` | Edit3 (Empresa) |
| `+0x304` | MaskEdit1 (Contraseña) |
| `+0x308` … `+0x340` | CheckBox1 … CheckBox15 |

La table des méthodes publiées situe `revisa` en `0x45d4b4`.

## 2. `revisa` (0x45d4b4)

1. `call 0x45ccb8` : détection de débogueur (SoftICE) ; si elle répond 1 → `out 0x64, 0xfe` (reboot par le contrôleur clavier). Inoffensif sous wine.
2. Les quatre champs doivent être non vides.
3. `StrToInt(Edad) == 0x45cd28()`. Cette fonction additionne `i` pour chaque `CheckBoxi` cochée (`ebx += 1`, `+2`, … `+15`). Il faut donc cocher des cases dont la somme des numéros vaut l'âge (1 à 120).
4. `n = somme_octets(Nombre) + somme_octets(Empresa)` (`0x45ce90` additionne les codes des caractères).
5. `GetVolumeInformationA("c:\\", …, &serial, …)`.
6. La clé attendue est la concaténation de 5 morceaux (`LStrCatN`, 5) :

```text
IntToStr(n) + lettres(n) + "AS" + IntToStr(Int64(serial)) + "CM5"
```

où `lettres(n)` (`0x45cef8`) remplace chaque chiffre `d` de `IntToStr(n)` par `chr(d + 0x41)` (0→A, 1→B, …).

7. Comparaison `LStrCmp` (trois fois, même test) avec `MaskEdit1.Text`. Succès : `Image2` masquée, `Timer1` activé (`lohizo` fait glisser les panneaux). Échec : compteur en `0x46083c` ; au bout de 3 échecs `ExitWindowsEx(6, 0)` ; la fenêtre « ERROR / Datos incorrectos » est affichée.

## 3. Exemple

`petik` → 112+101+116+105+107 = 541, donc `n = 541 + 541 = 1082`, `lettres = BAIC`. Série wine `0x43000000 = 1124073472`. Âge 20 = cases 5 + 15.

```text
1082 + BAIC + AS + 1124073472 + CM5 = 1082BAICAS1124073472CM5
```

## 4. Vérification

`xvfb-run -a -s "-screen 0 1024x768x24" tools/wine-xdotool-check.sh petik 20 petik 1082BAICAS1124073472CM5 "5 15"` remplit le formulaire, coche les cases et clique sur la clé. Captures dans `analysis/` : `ok-petik.png` (bonne clé : animation, pas d'erreur) et `ko-mauvaise-cle.png` (clé `…CM6` : « ERROR / Datos incorrectos »).

## Contenu

- `original/crackme5.zip` : archive d'origine
- `tools/crackmes-de-anonimoser_crackme_v-solve.py` : keygen
- `tools/wine-xdotool-check.sh` : vérification sous wine
- `analysis/` : captures de vérification
