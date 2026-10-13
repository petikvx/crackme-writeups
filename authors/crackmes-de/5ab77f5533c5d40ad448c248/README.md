# crackmes.de's crackme_2 by fr1c

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c248`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c248) — voir [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (crackme de **Fr1c**, 2000, « Croatian Cracking Force ») |
| **Plateforme** | Windows PE32 GUI, **Visual Basic 5** compilé en **natif** (`MSVBVM50.DLL`) |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `b68ba26ae1e7e1bb51a07ae8681705eb40a8ae7fef7aebeaeb0deb7a45fc1444` |
| **SHA-256 (`Crackme2.exe`)** | `ab02f4a89cb6cf2634e16abd0096182bd66303fa21d4417f9430c0ad248a9842` |

`readme.txt` : *Welcome to my second crackme! … I made it in vb5! It's very easy to crack it!*

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme2.zip` | archive crackmes.one |
| `original/Crackme2.exe`, `original/readme.txt` | contenu extrait |
| `analysis/form_load.asm`, `analysis/command1_click.asm` | extraits `objdump` commentés ci-dessous |
| `analysis/wine-ok.png`, `analysis/wine-ko.png` | preuve live wine (bon / mauvais serial) |
| `tools/crackme2-solve.py` | solveur (relit la constante dans l'exe et l'affiche) |
| `tools/verify-wine.sh` | pilotage xdotool sous wine/Xvfb |

## Réponse

Le serial est **constant**, le nom n'est pas lu par la vérification :

```text
Name   : petik   (ou n'importe quoi, même vide)
Serial : 988535
```

```bash
./tools/crackme2-solve.py            # Name: petik / Serial: 988535
xvfb-run -a -s "-screen 0 800x600x24" bash tools/verify-wine.sh petik 988535 ok
```

## Reconnaissance

```text
$ file Crackme2.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386, 5 sections
$ diec Crackme2.exe
PE32  Compiler: Microsoft Visual Basic(5.0)
```

Imports `MSVBVM50.DLL` : `__vbaStrCmp`, `__vbaStrCopy`, `__vbaObjSet`, `__vbaVarDup`, `rtcMsgBox` (ordinal)…
et surtout toute la série `_adj_fdiv_*` / `_CIsin` / `_allmul` : c'est la signature d'un exe VB compilé en
**code natif** (pas de P-code), donc lisible directement avec `objdump`.

`strings -el` donne tout le scénario :

```text
Good work! You cracked this! Now , send email with tut to me!
CRACKED
Bad work! Try again!
UNCRACKED
988535
```

Une chaîne purement numérique isolée au milieu des messages : très suspecte.

## Analyse

Il n'y a qu'**un seul** appel à `__vbaStrCmp` (IAT `0x404100`) dans tout le code, en `0x402a21`.

### Form_Load (`0x402d40…`) — initialisation du « secret »

```asm
; Label3.Caption = "UNCRACKED", Text1.Text = "", Text2.Text = ""   (vtable +0x54 / +0xa4)
402e34  mov   edx, 0x401f3c          ; BSTR L"988535"
402e39  lea   ecx, [esi+0x34]        ; membre privé de la Form (Me + 0x34)
402e3c  call  [__vbaStrCopy]         ; m_serial = "988535"
```

La VA `0x401f3c` correspond à l'offset fichier `0x133c` : UTF-16LE `9 8 8 5 3 5`, précédé de sa longueur
BSTR (12 octets) — c'est ce que relit `tools/crackme2-solve.py`.

### Command1_Click (« Check »)

```asm
4029db  mov   eax, [edi+0x308]       ; getter du contrôle Text2 (champ Serial)
4029e7  call  eax
4029ee  call  [__vbaObjSet]
4029fd  call  [edx+0xa0]             ; TextBox.Text (get) -> [ebp-0x18]
402a19  mov   ecx, [ebp-0x18]        ; texte saisi
402a1c  mov   edx, [esi+0x34]        ; m_serial = "988535"
402a20  push  edx
402a21  call  [__vbaStrCmp]          ; 0 si égal
402a27  mov   ebx, eax
402a2c  neg ebx / sbb ebx,ebx / inc ebx / neg ebx   ; bx = (cmp == 0) ? -1 (True) : 0
402a4c  test  bx, bx
402a61  je    0x402ba7               ; False -> "Bad work! Try again!" / UNCRACKED
                                     ; True  -> MsgBox "Good work! …", Label3 = "CRACKED"
```

Équivalent VB :

```vb
Private m_serial As String
Private Sub Form_Load()
    Label3.Caption = "UNCRACKED": Text1.Text = "": Text2.Text = ""
    m_serial = "988535"
End Sub
Private Sub Command1_Click()
    If Text2.Text = m_serial Then
        MsgBox "Good work! You cracked this! Now , send email with tut to me!"
        Label3.Caption = "CRACKED"
    Else
        MsgBox "Bad work! Try again!"
    End If
End Sub
```

`Text1` (Name) n'est jamais lu dans `Command1_Click` : n'importe quel nom passe.

## Vérification (wine 10, Xvfb)

Le runtime VB5 n'est pas fourni par wine : `winetricks -q --force vb5run` (le paquet est marqué « broken »
pour wine 10 mais `msvbvm50.dll` est bien copié dans `syswow64`, ce qui suffit).

`tools/verify-wine.sh` lance l'exe, clique dans les champs Name / Serial, tape les valeurs, clique **Check** et
capture l'écran :

| Saisie | Résultat |
|---|---|
| `petik` / `988535` | MsgBox **« Good work! You cracked this! Now , send email with tut to me! »** — [`analysis/wine-ok.png`](analysis/wine-ok.png) |
| `petik` / `111111` | MsgBox **« Bad work! Try again! »** — [`analysis/wine-ko.png`](analysis/wine-ko.png) |

## Leçon

Comparaison directe d'une chaîne en clair : `strings -el` suffit presque, et en VB natif il suffit de suivre
l'unique `__vbaStrCmp` jusqu'à son second opérande pour le confirmer.

## Status

- [x] reverse
- [x] write-up
- [x] solveur
