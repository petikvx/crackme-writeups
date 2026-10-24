# crackmes.de's crackme07 by attilhaz

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c322`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c322) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (AttilhaZ, 2004) |
| **Plateforme** | Windows PE32 GUI, Visual Basic 6 **natif** (MSVBVM60) |
| **SHA-256 (zip)** | `c00ec3aa92835a002f24ca0174fb7748b96b35adeca2a63f125a372f65afdeb0` |
| **SHA-256 (`Crackme07.exe`)** | `d8c24efc72cdb4ab997ad7ec9b41b33eb1e39faed119badb09bac5d401ac5653` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme07.zip` | archive d'origine (mot de passe `crackmes.one`) : `Crackme07.exe` + `Readme.txt` |
| `analysis/x/` | zip extrait (copie de travail, `Crackme07.exe` non modifié) |
| `analysis/dis.txt` | `objdump -d -M intel Crackme07.exe` complet |
| `analysis/enable-controls.exe` | helper de preuve (build de `tools/enable-controls.c`) : `EnableWindow(TRUE)` sur les contrôles |
| `analysis/screenshot-disabled.png` | état initial : Check / Text / OK grisés |
| `analysis/screenshot-menu.png` | menu `?` (About / Rulez) |
| `analysis/screenshot-enabled.png` | après `enable-controls.exe` |
| `analysis/screenshot-typed-wrong-order.png`, `screenshot-ko.png` | essai dans le mauvais ordre → « invalid » |
| `analysis/screenshot-ok.png` | bon serial → « Great!!! » |
| `tools/crackme07-solve.py` | solveur + `--check` (Xvfb + Wine + xdotool, cas OK **et** KO) |
| `tools/enable-controls.c` | source du helper (mingw) |

## Réponse

Le `Readme.txt` dit : *« Enable the button and the check, then find the serial! You can patch it! »*.
Il n'y a **pas de nom** : une seule zone de saisie, serial **constant** (donc pas d'exemple `petik`).

| Serial |
|---|
| **`MnKtRkmoopgHmKif`** |

```bash
python3 tools/crackme07-solve.py          # serial=MnKtRkmoopgHmKif (lu dans le binaire)
python3 tools/crackme07-solve.py -q
python3 tools/crackme07-solve.py --check  # Xvfb + Wine : bon serial -> « Great!!! », mauvais -> « Error »
```

À la main : les trois contrôles sont **désactivés** dans le formulaire (voir plus bas). Il faut soit patcher une copie du
`.exe` (flag `Enabled` du form), soit les réactiver de l'extérieur (`tools/enable-controls.c`), puis cocher *Check me*,
taper le serial, **OK**.

## Premier regard

```bash
unzip -P crackmes.one original/crackme07.zip -d analysis/x
file analysis/x/Crackme07.exe      # PE32 GUI, 3 sections (.text .data .rsrc), import MSVBVM60.DLL
strings -n 4 analysis/x/Crackme07.exe
strings -el -n 3 analysis/x/Crackme07.exe
objdump -d -M intel analysis/x/Crackme07.exe > analysis/dis.txt
```

- Imports : uniquement `MSVBVM60.DLL` (`__vbaStrCat`, `__vbaStrCmp`, ordinal `595` = MsgBox, ordinal `100` = ThunRTMain, `__vbaObjSet`, `__vbaNew2`…) → VB6 **natif**, 20 Ko.
- `strings -el` (UTF-16) :
  `About me`, `Sign the check!!!`, `Error`, **`MnKt`**, **`Rkmoop`**, **`gHmKif`**,
  `The serial you have entered is invalid. Try again!!!`, `You have solved the crackme. Now send me your solution!!!`,
  `Great!!!`, `No rulez. You can patch the crackme.`, `Rulez`.
- `MnKt` / `Rkmoop` / `gHmKif` ne sont pas des mots : ce sont les trois morceaux du serial.
- Au lancement (`xvfb-run -a wine`, ou `Xvfb` + `wine`) : fenêtre « Cracme07 » 201×105, menus `File > Exit`, `? > About / Rulez`,
  mais **case, champ et bouton grisés** (`analysis/screenshot-disabled.png`). Les menus ne les activent pas.

## Flow

| Fonction (VA) | Rôle |
|---|---|
| `0x4022c0` | menu **About** : MsgBox `Sign the check!!!` (style `0x40`), titre `About me` |
| **`0x4023e0`** | **`Command1_Click`** (bouton OK), `ret 4` en `0x4026ee` |
| `0x402720` | menu Exit |
| `0x4027f0` | menu **Rulez** : MsgBox `No rulez. You can patch the crackme.` (style `0x30`) |

Aucun `Form_Load` : l'état « désactivé » ne vient donc pas du code, mais des **données du formulaire** (propriété `Enabled`).

`Command1_Click` :

1. `If Check1.Value <> 1` → MsgBox `Error` (style `0x10`) ;
2. `Text1.Text` est comparé à la concaténation de trois constantes ;
3. égal → MsgBox `Great!!!` (style `0x40`), sinon → MsgBox `Error` / `The serial you have entered is invalid...`.

## Comment on trouve

**Ancrage.** Les 4 seuls handlers « utilisateur » sont `0x4022c0`, `0x4023e0`, `0x402720`, `0x4027f0` (prologues `55 8b ec` ; tout
ce qui précède en `0x401031…0x401079` est le stub VB `ThunRTMain`). Le seul qui lit une TextBox (`call [edx+0xa0]` = `Text`,
après `call [edx+0x300]` = `Me.Text1`) et appelle `__vbaStrCat` + `__vbaStrCmp` est `0x4023e0`.

**Pré-test sur la case** (`0x40245a`…`0x4024a5`) :

```asm
40246c  call [ecx+0xe0]            ; Check1.Value  -> word [ebp-0xa8]
40248c  cmp  word [ebp-0xa8],1
402497  sete bl / neg ebx          ; bx = -1 (True) si Value = 1
4024a2  cmp  bx,si / jne 40252d    ; coché -> on saute le MsgBox d'erreur
```

**Le test du serial** (extrait commenté) :

```asm
40253c  call [edx+0x300]           ; Me.Text1
402556  call [ecx+0xa0]            ; Text1.Text -> BSTR [ebp-0x18]
402574  mov  eax,[ebp-0x18]
40257d  push eax                   ; (le texte saisi, repoussé sous les 2 args suivants)
40257e  push 0x401f60              ; L"MnKt"
402583  push 0x401f70              ; L"Rkmoop"
402588  call __vbaStrCat           ; -> "MnKt" & "Rkmoop"
402595  push eax                   ;   (résultat 1)
402596  push 0x401f84              ; L"gHmKif"
40259b  call __vbaStrCat           ; -> résultat 1 & "gHmKif"
4025a9  call __vbaStrCmp           ; (concat, Text1.Text) ; 0 si égaux
4025b4  neg edi / sbb edi,edi / neg edi / neg edi  ; edi = 0 si égaux, -1 sinon
4025e3  test di,di
4025f2  je   402649               ; égal -> « Great!!! » (0x402080, style 0x40)
                                  ; différent -> « Error » / « The serial you have entered is invalid » (style 0x10)
```

**Décodage.**

- Les constantes sont des **BSTR UTF-16** : VA `0x401f60` = offset fichier `0x1f60 - 0x1000 + 0x1000 = 0x1f60` (section `.text` : VA
  `0x401000` ↔ offset `0x1000`). Octets `4d 00 6e 00 4b 00 74 00` = `MnKt`, `52 00 6b 00 6d 00 6f 00 6f 00 70 00` = `Rkmoop`,
  `67 00 48 00 6d 00 4b 00 69 00 66 00` = `gHmKif` (la longueur en octets est un `dword` juste avant : `0x0c` pour 6 caractères).
- Pas d'algorithme : `strcat` direct, **aucune transformation** du texte saisi.

**Piège : l'ordre de concaténation.** À la lecture naïve (`push 0x401f70` est au sommet de pile, donc « premier argument »), on
construit `gHmKif` + `Rkmoop` + `MnKt`. C'est **faux** : `analysis/screenshot-typed-wrong-order.png` + `screenshot-ko.png` montrent
`invalid`. Avec `__vbaStrCat`, l'argument au sommet de pile est l'**opérande de droite** : `MnKt` & `Rkmoop` puis `& gHmKif`
→ **`MnKtRkmoopgHmKif`**, confirmé en live.

**Piège : contrôles désactivés.** `Check1`, `Text1`, `Command1` ont `Enabled = False` dans la table de propriétés du formulaire
(format VB compressé, `0x12da`…`0x13ef` dans `Crackme07.exe`, non décodé octet par octet ici : des essais de flip d'octets avant
chaque `ff 03` n'ont rien activé, ou ont décalé le layout). Plutôt que de deviner le bit, la preuve utilise un petit helper
extérieur (`tools/enable-controls.c`) : `FindWindowA("Cracme07")` + `EnumChildWindows` + `EnableWindow(h, TRUE)`.
**Aucun patch** de `original/` ni même de copie ; le binaire tourne tel quel, seule l'UI est réactivée. Le crackme invite à
patcher, mais le serial est de toute façon lisible statiquement.

**Piège VB6 / xdotool.** `Ctrl+A` ne sélectionne pas tout dans une TextBox VB6 (le texte d'amorce `Enable me and find…` reste) ;
le solveur utilise `End` puis `Shift+Home` avant de taper.

## Prédicat consolidé

```text
Check1.Value == 1  AND  Text1.Text == "MnKt" & "Rkmoop" & "gHmKif"
serial = MnKtRkmoopgHmKif
```

## Debug GDB / x64dbg / IDA

Non utilisés : reverse 100 % statique (`objdump`) + preuve live Wine ; pas de session GDB à documenter, pas de MCP debugger ni IDA.

## Vérification

```bash
python3 tools/crackme07-solve.py --check
# serial=MnKtRkmoopgHmKif
# [OK] serial=MnKtRkmoopgHmKif fenêtres=['Crackme07', 'Cracme07', 'Great!!!'] -> ok
# [KO] serial=fiKmHgpoomkRtKnM fenêtres=['Crackme07', 'Cracme07', 'Error'] -> ok
# CHECK OK
```

- OK : `analysis/screenshot-ok.png` — « You have solved the crackme. Now send me your solution!!! » (titre `Great!!!`).
- KO : `analysis/screenshot-ko.png` — « The serial you have entered is invalid. Try again!!! » (titre `Error`) avec `gHmKifRkmoopMnKt` ; le solveur teste aussi le serial inversé.
- Wine : `msvbvm60.dll` **natif** requis (override `native`), comme pour les autres VB6 du dépôt ; `wine`, `Xvfb`, `xdotool` dans le `PATH`.
  Prefix utilisé ici : win32 neuf + `msvbvm60.dll` copiée dans `system32`.

## Notes

- Crackme à deux niveaux d'après l'auteur : « enable » (patch/hack d'UI) puis serial. Le serial n'a pas besoin du patch pour être trouvé.
- Pas de nom/login : l'exemple `petik` ne s'applique pas.
- Pas d'anti-debug, pas de packer (PE VB6 natif brut, 20 Ko).
