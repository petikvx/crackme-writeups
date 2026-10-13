# crackmes.de's crackme_5 by fr1c

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c249`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c249) — voir [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (crackme de **Fr1c**, 2000, « Croatian Cracking Force ») |
| **Plateforme** | Windows PE32 GUI, **Visual Basic 5** compilé en **natif** (`MSVBVM50.DLL`) — listé « Unspecified/other » sur le site |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `952adf02dd12e8d5c3286a137c628f808950498f4e6b7356bef9f82a39d053a4` |
| **SHA-256 (`CrackMe5.exe`)** | `cb26a85de9b9eb98165fbffeed22ab375f9723c4e8d91e1ef38410298d883806` |

Pas de nom ni de serial : la fenêtre affiche **10 cases à cocher** (1…10), un bouton **Check** et un label
rouge `UNREGISTERED`. Il faut trouver la bonne combinaison de cases.

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme5_1.zip` | archive crackmes.one |
| `original/CrackMe5.exe` | contenu extrait |
| `analysis/command1_click-test.asm` | bloc de test de `Command1_Click` (`objdump`) |
| `analysis/wine-ok.png`, `analysis/wine-ko.png` | preuve live wine (bonne / mauvaise combinaison) |
| `tools/crackme5-solve.py` | solveur **statique** : relit les 10 tests dans l'exe et en déduit les cases |
| `tools/verify-wine.sh` | pilotage xdotool sous wine/Xvfb (coche les cases, clique Check, capture) |

## Réponse

Pas de nom à saisir (l'exemple `petik` ne s'applique pas) : la « clé » est la combinaison

```text
cocher : 3 4 7 8 10
laisser vides : 1 2 5 6 9
```

Vue comme un nombre binaire (case 1 = bit 0) : `0b1011001100` = **716**.

```bash
./tools/crackme5-solve.py        # Cases à cocher : 3 4 7 8 10
xvfb-run -a -s "-screen 0 800x600x24" bash tools/verify-wine.sh ok "3 4 7 8 10"
```

## Reconnaissance

```text
$ file CrackMe5.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386, 5 sections
$ diec CrackMe5.exe
PE32  Compiler: Microsoft Visual Basic(5.0)
```

Imports `MSVBVM50.DLL` avec `_adj_fdiv_*`, `_CIsin`… → **VB natif**, lisible à l'`objdump`.
Contrôles (`strings`) : `Command1` (Check), `Command2` (Exit), `Check1`…`Check10`, `Label1` (`UNREGISTERED`).
Chaînes UTF-16 : `REGISTERED`, `Good, now send tutorial to me on franjos@usa.net`, `UNREGISTERED`.
Aucun `__vbaStrCmp` : la vérification porte uniquement sur l'état des cases.

## Analyse de `Command1_Click` (`0x402c10`)

### Lecture des 10 cases

Dix blocs identiques, un par getter de contrôle de la Form (`[Me+0x2fc]` … `[Me+0x320]`) :

```asm
402cc2  mov   eax, [ebx+0x2fc]       ; getter Check1
402cce  call  eax
402cdb  call  edi                    ; __vbaObjSet
402cdf  lea   ecx, [ebp-0xc0]        ; destination
402ced  call  [edx+0xe0]             ; CheckBox.Value (get) -> [ebp-0xc0]
...      (idem +0x300 -> [ebp-0xc4], +0x304 -> [ebp-0xc8], …, +0x320 -> [ebp-0xe4])
```

| Getter | Local | Case |
|---|---|---|
| `+0x2fc` | `[ebp-0xc0]` | 1 |
| `+0x300` | `[ebp-0xc4]` | 2 |
| `+0x304` | `[ebp-0xc8]` | 3 |
| `+0x308` | `[ebp-0xcc]` | 4 |
| `+0x30c` | `[ebp-0xd0]` | 5 |
| `+0x310` | `[ebp-0xd4]` | 6 |
| `+0x314` | `[ebp-0xd8]` | 7 |
| `+0x318` | `[ebp-0xdc]` | 8 |
| `+0x31c` | `[ebp-0xe0]` | 9 |
| `+0x320` | `[ebp-0xe4]` | 10 |

(L'ordre getter → libellé à l'écran a été confirmé sous wine : l'hypothèse inverse `+0x2fc = Check10`
donne la combinaison 1 3 4 7 8, qui est refusée — voir `analysis/wine-ko.png`.)

### Le test (`0x402f97`)

Chaque comparaison produit un booléen VB (`sete` puis `neg` → 0 / -1), tous combinés par `and` :

```asm
402f97  mov   eax, 1
402f9e  cmp   word [ebp-0xe4], ax    ; Check10 == 1
402fac  cmp   word [ebp-0xdc], ax    ; Check8  == 1
402fba  xor   ecx, ecx
402fbc  cmp   word [ebp-0xe0], cx    ; Check9  == 0
402fcc  cmp   word [ebp-0xc4], cx    ; Check2  == 0
402fdc  cmp   word [ebp-0xc8], ax    ; Check3  == 1
402fec  cmp   word [ebp-0xc0], cx    ; Check1  == 0
402ffc  cmp   word [ebp-0xd4], cx    ; Check6  == 0
40300c  cmp   word [ebp-0xd8], ax    ; Check7  == 1
40301c  cmp   word [ebp-0xcc], ax    ; Check4  == 1
403028  xor   eax, eax               ; piège : ax vaut maintenant 0 !
40302c  cmp   word [ebp-0xd0], ax    ; Check5  == 0
403044  mov   [ebp-0x138], edx       ; résultat
403073  cmp   word [ebp-0x138], 0
40307b  je    0x4033e6               ; False -> rien (reste UNREGISTERED)
403091  push  0x401ed8               ; True  -> Label1.Caption = "REGISTERED"
4030e7  ...   0x401f18               ;         MsgBox "Good, now send tutorial to me on franjos@usa.net"
403135  ...                          ; puis remet les 10 cases à 0 (Value = 0, vtable +0x94)
```

Le seul détail à ne pas rater est le `xor eax, eax` glissé avant la dernière comparaison : le registre `ax`
change de valeur, donc `Check5` doit être **décoché** (et non coché comme les autres tests sur `ax`).

Équivalent VB :

```vb
Private Sub Command1_Click()
    If Check10.Value = 1 And Check8.Value = 1 And Check9.Value = 0 And Check2.Value = 0 _
       And Check3.Value = 1 And Check1.Value = 0 And Check6.Value = 0 And Check7.Value = 1 _
       And Check4.Value = 1 And Check5.Value = 0 Then
        Label1.Caption = "REGISTERED"
        MsgBox "Good, now send tutorial to me on franjos@usa.net"
        Check1.Value = 0: Check2.Value = 0: ' … Check10.Value = 0
    End If
End Sub
```

`tools/crackme5-solve.py` refait cette lecture directement sur les octets (`8B 83 off32` / `8D 8D|95 disp32`
pour les getters, `66 39 85|8D disp32` pour les tests, suivi de `B8 01 00 00 00` / `33 C0` pour la valeur de `ax`).

## Vérification (wine 10, Xvfb)

Runtime : `winetricks -q --force vb5run` (`msvbvm50.dll` dans `syswow64`).
`tools/verify-wine.sh` clique les cases demandées (colonne gauche x=288, droite x=423, pas de 32 px) puis **Check** :

| Cases cochées | Résultat |
|---|---|
| `3 4 7 8 10` | Label → **REGISTERED** + MsgBox **« Good, now send tutorial to me on franjos@usa.net »** — [`analysis/wine-ok.png`](analysis/wine-ok.png) |
| `1 3 4 7 8` (mapping inversé) | rien, reste **UNREGISTERED** — [`analysis/wine-ko.png`](analysis/wine-ko.png) |

## Leçon

En VB natif, les contrôles d'une Form sont accessibles par des getters à offsets consécutifs
(`[Me+0x2fc+4*i]`) ; il suffit de relier chaque getter à son local puis de lire la chaîne de `cmp/sete/and`,
en surveillant la valeur réelle du registre comparé.

## Status

- [x] reverse
- [x] write-up
- [x] solveur
