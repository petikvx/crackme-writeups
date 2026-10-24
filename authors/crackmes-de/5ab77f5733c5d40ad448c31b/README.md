# crackmes.de's crackme08 by attilhaz

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c31b`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c31b) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (AttilhaZ, 2004) |
| **Plateforme** | Windows PE32 GUI, Visual Basic 6 **natif** (MSVBVM60) |
| **SHA-256 (zip)** | `30d2fe9666481b4103c705f1c3d88438cee0ab2170b7cc2aa48bc37550850deb` |
| **SHA-256 (`Crackme08.exe`)** | `8955bd69cf5bd2ff733a80affcdef1adb9c7a0cdbfd45fb2f94f11d5a802b1c7` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme08.zip` | archive d'origine (mot de passe `crackmes.one`) : `Crackme08.exe` + `Readme.txt` |
| `analysis/x/` | zip extrait (copie de travail, `original/` intact) |
| `analysis/dis.txt` | `objdump -d -M intel` de `.text` (recon) |
| `analysis/crackme08-patched.exe` | exe patché généré par le solveur |
| `tools/crackme08-solve.py` | patcheur + `--check` (preuve live Wine, cas OK et KO) |

## Réponse

Aucun serial : le `Readme.txt` dit *« Crackme with 3 levels. You must enable all level! You can patch it! »*. Le crackme est un **patch** : 3 contrôles sont désactivés dans la Form1, il faut les activer.

| Offset fichier | Avant | Après | Effet |
|---|---|---|---|
| `0x1322` | `00` | `01` | `Command1` (« Enable Me  - Level01 ») : `Enabled = False` → `True` |
| `0x138e` | `05` | `07` | menu **Level02** : bit « enabled » |
| `0x13c5` | `05` | `07` | sous-menu **Level03 ▸ Enable me03** : bit « enabled » |

```bash
python3 tools/crackme08-solve.py          # écrit analysis/crackme08-patched.exe
python3 tools/crackme08-solve.py --check  # Xvfb + Wine : patché -> 3 MsgBox, origine -> aucune
```

Pas de nom d'utilisateur dans ce crackme (donc pas d'exemple `petik`).

## Premier regard

```bash
unzip -P crackmes.one original/crackme08.zip -d analysis/x
diec analysis/x/Crackme08.exe      # PE32, MS Linker 6.0, Visual Basic 6.00.8041 [Native]
strings -el -n 3 analysis/x/Crackme08.exe
```

- `strings -el` (UTF-16) : `Level01 complete!!!`, `Level02 complete!!!`, `Level03 complete!!!`, `No rulez. You can patch me!!!` (titre `Rulez`), `About`, `by AttilhaZ - attilhaz@yahoo.it - …`.
- `strings` ASCII (noms de contrôles de la Form) : `Text1`, `Command1`, `Enable Me  - Level01`, `Line1`, `Level02`, `Level03`, `Enable me03`, `About`, `Rulez`.
- Lancé sous Wine (`xvfb-run`) : fenêtre 212×104 avec menus `File | Level02 | Level03 | ?`, un bouton `Enable Me  - Level01` et un `Text1` (« Written by AttilhaZ »). Le bouton et `Level02` sont **grisés** ; `Level03` s'ouvre mais son unique entrée `Enable me03` est **grisée** aussi.

## Flow

Pas de prédicat, pas de saisie testée. Le programme est une Form VB6 avec 6 handlers d'événements (table à `0x401093` : 6 entrées `05 00 08 00 <thunk>`), dont :

| Handler (VMA) | Contrôle | Action |
|---|---|---|
| `0x402120` | menu `?` ▸ About | MsgBox « by AttilhaZ - … » (titre `About`) |
| `0x402240` | `Command1` | MsgBox `Level01 complete!!!` (titre `Level01`) |
| `0x402360` | `Enable me03` | MsgBox `Level03 complete!!!` (titre `Level03`) |
| `0x402480` | `?` ▸ Rulez | MsgBox `No rulez. You can patch me!!!` |
| `0x4025a0` | `Level02` | MsgBox `Level02 complete!!!` (titre `Level02`) |
| `0x4026c0` | `File` ▸ Exit | `Unload`/fermeture de la Form |

*(Le rôle de chaque handler est déduit des chaînes qu'il pousse ; `0x4026c0` — appel d'un objet COM sans MsgBox — est supposé être `File ▸ Exit`, non vérifié.)*

Chaque handler « Level » appelle simplement `rtcMsgBox` avec deux chaînes constantes (voir ci-dessous) : **la validation, c'est de pouvoir cliquer**. D'où « You can patch it ! ».

## Comment on trouve

1. **Ancrage.** `objdump -d -M intel Crackme08.exe --start-address=0x401000 > analysis/dis.txt`. Les handlers `0x402120…` ont tous la même forme (prologue VB6 `push 0x4010f6` = `__vbaExceptHandler`, puis deux `__vbaVarDup` / `0x401074`) :

   ```asm
   4021af: mov  DWORD PTR [ebp-0x5c],0x401928   ; VARIANT.str = texte du message
   4021a4: mov  DWORD PTR [ebp-0x74],ebx        ; ebx=8 -> VT_BSTR
   4021a7: call edi                              ; __vbaVarDup
   4021cd: call DWORD PTR ds:0x40101c            ; rtcMsgBox(msg, 0x40, titre, ...)
   ```

   `0x40` = `vbInformation`. Le décodage des constantes UTF-16 (`0x4019b0` → `Level01 complete!!!`, `0x4019dc` → `Level01`, `0x4019f0` → `Level03 complete!!!`, `0x401a80` → `Level02 complete!!!`, …) donne la correspondance handler ↔ message du tableau « Flow ». Aucun `cmp`/`jcc` conditionnant l'affichage : rien à « calculer ».

2. **Où est la désactivation ?** Pas dans le code : dans la **ressource de la Form** (format binaire VB5!), stockée dans `.text` juste avant `"VB5!"`. Un hexdump autour de `Enable Me` (offset fichier `0x1303`) montre la liste de propriétés de chaque contrôle/menu :

   ```text
   0x1303  "Enable Me  - Level01\0"            ; Caption de Command1
   0x1318  04 78 00 78 00 4f 0b 67 02          ; géométrie
   0x1321  08 00                               ; tag 0x08 (Enabled) = 0 (False)   <-- 0x1322
   0x1323  11 00 00 ff 03 ...
   ...
   0x1386  "Level02\0"  05 00 ff 02 ...        ; flag menu = 05 (désactivé)       <-- 0x138e
   0x13ae  "Level03\0"  07 ff ff 02 ...        ; flag menu = 07 (activé)
   0x13b9  "Enable me03\0" 05 00 ff 03 ...     ; flag menu = 05 (désactivé)       <-- 0x13c5
   0x13d2  "File" / "?" : 07 ...               ; menus activés
   ```

   Comparaison : les menus **actifs** (`File`, `Level03`, `?`) portent le flag `07`, les menus **grisés** (`Level02`, `Enable me03`) portent `05` → le bit 1 est « enabled ». Pour `Command1`, la propriété `Enabled` est sérialisée explicitement (`08 00` = tag + `False`).

3. **Essais (preuve par la capture).** Patchs testés sur des copies (`/tmp`, jamais `original/`) :
   - `0x138e=07`, `0x13c5=07` → `Level02` et `Level03 ▸ Enable me03` deviennent noirs/cliquables ;
   - `0x1322=01` (ou toute valeur ≠ 0 cohérente) → le bouton `Command1` se dégrise ;
   - **Piège** : modifier `0x1320` ou `0x1323` casse le format de la Form → `Invalid file format` (MsgBox d'erreur VB au démarrage). Seul `0x1322` est le bon octet (le `00` de `08 00`).

4. **Assemblage.** 3 octets : `{0x1322: 00→01, 0x138e: 05→07, 0x13c5: 05→07}`. Le solveur vérifie la valeur d'origine de chaque octet (`assert`) avant d'écrire.

## Vérification

```text
$ python3 tools/crackme08-solve.py --check
patché -> …/analysis/crackme08-patched.exe (sha256 3bc405c9d01add01388c9de3900e977d531fa12d3919b7e9af28863e4bae1ecf)
  0x1322: 00 -> 01
  0x138e: 05 -> 07
  0x13c5: 05 -> 07
[patché] Level01: MsgBox OUI ['Crackme08', 'Level01']
[patché] Level02: MsgBox OUI ['Crackme08', 'Level02']
[patché] Level03: MsgBox OUI ['Crackme08', 'Level03']
[origine] Level01: MsgBox non ['Crackme08']      # KO : exe d'origine, contrôles grisés
[origine] Level02: MsgBox non ['Crackme08']
[origine] Level03: MsgBox non ['Crackme08']
CHECK OK
```

Le test lance l'exe sous Xvfb+Wine, clique au bouton / sur `Level02` / sur `Level03 ▸ Enable me03` (xdotool) et lit les titres de fenêtres : `Level01`, `Level02`, `Level03` apparaissent uniquement avec l'exe patché. L'exe d'origine n'est jamais modifié.

## Notes

- Pas de GDB, pas de debug live : reverse statique (`objdump`) + preuve Wine.
- Le « Rulez » du crackme avoue d'ailleurs : *No rulez. You can patch me!!!* — c'est un crackme « patch », pas un keygen.
- Les coordonnées de clic du `--check` supposent la fenêtre à `(294,261)` sous Xvfb 800×600 (position par défaut de Wine).
