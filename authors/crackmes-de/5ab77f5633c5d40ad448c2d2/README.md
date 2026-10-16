# crackmes.de's crackme_4.75 by bullet

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2d2`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2d2) |
| **Auteur (site)** | crackmes.de (BuLLeT / TOL'98) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 GUI, Borland Delphi 4 |
| **Difficulté** | 1.0 |
| **SHA-256 (zip site)** | `9953d94f29119f49869714756341cb4ef58e4352199543e18dcf0ee70be413cf` |
| **SHA-256 (`B-CRK4.EXE` SFX)** | `bd82292ef28a84d86da2282eba4a598e80231ec449827ec23f62333856d485ec` |
| **SHA-256 (`B-Crk475.exe`)** | `047bfff3103ad3c31a8d9bb0759eb4942df96e4486b9e7358fd3369f4dc8d043` |

## Solution

Serial : **`This program must be run under Win32`** (constant, pas de nom).

C’est le message stub classique des PE Delphi, recyclé tel quel comme
littéral de comparaison — blague assumée pour newbies (le `.nFO` dit
« hardcoded serial » et « DON'T EDIT/HIEW/READ »).

```bash
tools/b-crk475-solve.py
tools/b-crk475-solve.py --check 'This program must be run under Win32'
# live : wine original/B-Crk475.exe → saisir le serial → Unlock
#   mauvais → Panel2 « Wrong serial.....try again ;) »
#   bon     → Panel3 « Unlock successfull...read rulez above ! »
```

## Premier regard

```text
$ file original/B-Crk475.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386, 8 sections
$ diec original/B-Crk475.exe
Compiler: Borland Delphi(4)[Enterprise]
Linker: Turbo Linker(2.25)
```

Chaîne d’archives :

1. zip site `b_crk4.zip` (mdp `crackmes.one`) → `B-CRK4.EXE`
2. `B-CRK4.EXE` = SFX WinZip 6.x → `B-Crk475.exe` + `BuLLeT.nFO` (26/10/1998)

UI : Memo d’intro (Hey! / RATING 2/10 / RULEZ de patch), `TEdit` MaxLength 38,
bouton **Unlock**. Deux panels superposés à l’Edit : erreur / succès.

Le crackme a **deux** objectifs (texte Memo) : (1) trouver le serial,
(2) patcher le message d’erreur pour afficher le vrai serial à la place.
Ici on documente (1) — suffisant pour `status: solved`.

## Reverse

`Button1Click` (`Unit1`, VA `0x4408C4`) :

```text
Edit1.Text  →  [ebp-4]          ; getter TControl @ [ebx+0x2D0]
@LStrCmp(eax, 0x44093C)         ; AnsiString littéral
jne → Panel2.Visible := True    ; « Wrong serial.....try again ;) »
je  → Panel3.Visible := True    ; « Unlock successfull...read rulez above ! »
```

Littéral @ `0x44093C` (header Delphi `refcount=-1`, `length=36`) :

```text
This program must be run under Win32
```

Pseudo-code :

```pascal
procedure TForm1.Button1Click(Sender: TObject);
begin
  if Edit1.Text = 'This program must be run under Win32' then
    Panel3.Visible := True
  else
    Panel2.Visible := True;
end;
```

Même auteur que `crackme_1.75` (`…c2d1`, password VB5
`2hard4u2crackm8`) : ici Delphi 4, même niveau « littéral en clair ».

## Vérification live (wine + xvfb)

Sous `DISPLAY=:99` / `xvfb-run` :

1. Mauvais serial → panneau **`Wrong serial.....try again ;)`**.
2. Serial exact → panneau **`Unlock successfull...read rulez above !`**.

Captures : `analysis/startup.png`, `analysis/password-entered.png`,
`analysis/wrong-pass.png`, `analysis/after-unlock.png`.

## Notes

- Le second objectif (patch SoftICE / W32Dasm du message d’erreur) n’est
  pas requis pour valider le serial ; le prédicat est un `@LStrCmp` direct.
- `MaxLength = 0x26` (38) : le serial fait 36 caractères, ça rentre pile.
