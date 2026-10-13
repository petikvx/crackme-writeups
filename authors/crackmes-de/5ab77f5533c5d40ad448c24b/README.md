# crackmes.de's crackme_6 by fr1c

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c24b`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c24b) — voir [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (crackme de **Fr1c**, 2000, dF / TCC, « Croatian Cracking Force ») |
| **Plateforme** | Windows PE32 GUI, **Visual Basic 5** compilé en **natif** (`MSVBVM50.DLL`) |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `f55b292697fbcb67283b9c4e996154b827ae296aaa7af09558bcee6d80b25c54` |
| **SHA-256 (`CrackMe6.exe`)** | `5bded056342ff67b09e071238fe4bd0dc35d57835020dbda5cd30a8bfb3869be` |

`ReadMePlz.txt` : « *You need to remove nag, enable check key button, find real key (no patching) and if you can make keygen.* »
Au lancement, une MessageBox **nag** (« Try to kill this fu******* nag! »), puis une Form **Name / Key**
avec un bouton **Check key** grisé (`Enabled = False`) et un label `UNREGISTERED`.

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme6_1.zip` | archive crackmes.one |
| `original/CrackMe6.exe`, `ReadMePlz.txt` | contenu extrait (non modifié) |
| `analysis/command1_click-402c20.asm` | début de `Command1_Click` (`objdump`) : boucle + comparaison |
| `analysis/verify-wine.txt` | sortie de la vérification live |
| `tools/crackme6-solve.py` | **keygen** |
| `tools/vbdrive.c` | pilote Win32 : ferme le nag, remplit Name/Key, réactive et clique « Check key », lit la MessageBox |
| `tools/verify-wine.sh` | vérif. wine/Xvfb (bonne clé, clé en minuscules, clé fausse) |

## Réponse

```text
Name : petik
Key  : 706574696B
```

La clé est le nom écrit en **hexadécimal majuscule**, octet par octet (`p`=70 `e`=65 `t`=74 `i`=69 `k`=6B).

```bash
./tools/crackme6-solve.py petik            # petik -> 706574696B
xvfb-run -a bash tools/verify-wine.sh petik
# == petik / 706574696B  -> MessageBox : Very good! If you are done in this crackme , send email ...
# == petik / 706574696b  -> MessageBox : Wrong key!
# == petik / 1234        -> MessageBox : Wrong key!
```

## Reconnaissance

```text
$ file CrackMe6.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386, 5 sections
$ diec CrackMe6.exe
PE32  Compiler: Microsoft Visual Basic(5.0)
```

Contrôles (`strings`) : `Text1` (Name), `Text2` (Key), `Text3` (invisible), `Frame1` « Registration : »,
`Command1` « Check key », `Command2` « Exit », `Label3` « UNREGISTERED ».
Chaînes UTF-16 : `Very good! …` (`0x401f1c`), `REGISTERED` (`0x402010`), `Wrong key!` (`0x40204c`),
`Try to kill this fu******* nag!` (`0x402068`).

Imports par ordinal de `MSVBVM50` utiles : 516 `rtcAnsiValueBstr` (= `Asc`), 595 `rtcMsgBox`,
631 `rtcMidCharBstr` (= `Mid$`), 573 `rtcHexVarFromVar` (= `Hex`).

## Analyse de `Command1_Click` (`0x402c20`)

Le seul xref de `Very good!` / `Wrong key!` est dans ce handler.

```asm
402c63  mov  edi,[edi+0x308]          ; getter Text1 (Name)
402cc3  call [edx+0xa0]               ; TextBox.Text (get)
402ce3  call __vbaLenBstr             ; n = Len(Name)
402d28  call __vbaVarForInit          ; For i (Me+0x34) = 1 To n
; --- corps de boucle
402d9a  call __vbaI4Var(i)
402da5  call rtcMidCharBstr           ; Mid$(Name, i, 1)
402db7  call rtcAnsiValueBstr         ; Asc(...)        -> Integer
402dcc  call rtcHexVarFromVar         ; Hex(...)        -> Variant String
402dda  call __vbaVarMove             ; Me+0x44 = Hex(Asc(c))
402e18  call __vbaVarCat              ; Me+0x54 = Me+0x54 & Me+0x44
402e43  call __vbaVarForNext / jmp 402d44
; --- après la boucle
402e59  mov  eax,[eax+0x304]          ; getter Text2 (Key)
402e7b  call [ecx+0xa0]               ; Text2.Text
402eb3  call __vbaVarTstEq            ; Me+0x54 = Key ?
402ee8  je   403026                   ; non -> MsgBox "Wrong key!"
402f1a  call rtcMsgBox("Very good! …")
402f59  call [edx+0x54]               ; Label3.Caption = "REGISTERED"
402f8f  call [ecx+0x8c] (0)           ; ... désactive/masque des contrôles
```

En VB :

```vb
Private Sub Command1_Click()
    For i = 1 To Len(Text1.Text)
        tmp = Hex(Asc(Mid$(Text1.Text, i, 1)))
        cle = cle & tmp
    Next
    If cle = Text2.Text Then
        MsgBox "Very good! ..." : Label3.Caption = "REGISTERED"
    Else
        MsgBox "Wrong key!"
    End If
End Sub
```

`Hex()` ne met pas de zéro de tête et sort des **majuscules** ; la comparaison `__vbaVarTstEq` est
binaire (sensible à la casse) : `706574696b` est refusé (vérifié sous wine).

## Pièges

- **`cle` n'est jamais remise à zéro** (variable de module `Me+0x54`) : la clé n'est valable qu'au
  **premier** clic sur « Check key ». Au 2ᵉ clic, la chaîne attendue devient `706574696B706574696B`, etc.
  `verify-wine.sh` relance donc une instance fraîche par essai.
- **Bouton grisé** : `Check key` est `Enabled = False` à l'ouverture (`IsWindowEnabled = 0` relevé par le
  pilote). Sans patcher l'exe, le pilote fait `EnableWindow(btn, TRUE)` puis poste `BM_CLICK`
  (n'importe quel outil type WinSpy / Resource Hacker sur la fenêtre ferait pareil).
- **Nag** : MessageBox au démarrage (code vers `0x40329c`), simplement fermée par le pilote (`IDOK`).
  Les objectifs « remove nag » / « enable button » par patch ne sont pas traités ici : le dépôt garde le
  binaire d'origine et vise la vraie clé + keygen.
- Nom accentué : `Asc` renvoie le code ANSI (cp1252), d'où l'encodage `cp1252` dans le keygen.

## Vérification live (wine)

`tools/vbdrive.c` (compilé avec `i686-w64-mingw32-gcc`) : ferme le nag, trouve la Form
« CrackMe 6 by Fr1c », trie les `ThunderRT5TextBox` par ordonnée (Name puis Key ; `Text3` est invisible),
`WM_SETTEXT` sur les deux champs, réactive « Check key », `BM_CLICK`, puis lit le `Static` de la MessageBox.
Nécessite le runtime VB5 (`msvbvm50.dll`).
