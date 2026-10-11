# crackme_2 by fireworx

| | |
|---|---|
| **ID** | [`5ab77f5433c5d40ad448c182`](https://crackmes.one/crackme/5ab77f5433c5d40ad448c182) |
| **Auteur (site)** | crackmes.de (FireWorx) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Win32 GUI, Borland Delphi 4 (non packé) |
| **Difficulté** | 1.0 |
| **SHA-256** | `2a7b390fbaa97a0e618d0ff556b8f68faddde113bf96bca7795814996265fd1a` |

ZIP password : `crackmes.one`. Voir [`ORIGIN.yml`](ORIGIN.yml).

## TL;DR

```
serial = nom + nom + "625g72"
petik  -> petikpetik625g72
```

Solveur : [`tools/crackme2-solve.py`](tools/crackme2-solve.py).

## Comment on trouve

1. `diec` : PE32 GUI, Borland Delphi 4, **pas de packer** (contrairement aux crackme_12/13/15 de la même série, packés ASPack).
2. `strings` donne `Right Code` / `Wrong Code` : on cherche ces chaînes dans le fichier. Juste avant elles se trouvent les constantes Delphi (`AnsiString` précédées de refcount `-1` et longueur) `"625"`, `"g"`, `"72"`, et juste avant encore le code de `Button1Click` (`0x4416EC`, nom publié dans la table des méthodes RTTI de `TForm1`).
3. La table des champs de `TForm1` (RTTI) donne les offsets : `Edit1` = `+0x2C4`, `Edit2` = `+0x2C8`, `Button1` = `+0x2CC`.
4. Désassemblage ([`analysis/Button1Click.asm`](analysis/Button1Click.asm)) :

```asm
lea  edx,[ebp-4] ; mov eax,[ebx+0x2c8] ; call GetText   ; Edit2 -> s4 (serial)
push [ebp-4]
lea  edx,[ebp-0xc]; mov eax,[ebx+0x2c4] ; call GetText  ; Edit1 -> sC
push [ebp-0xc]
lea  edx,[ebp-0x10]; mov eax,[ebx+0x2c4]; call GetText  ; Edit1 -> s10
push [ebp-0x10]
push "625" ; push "g" ; push "72"
lea  eax,[ebp-8] ; mov edx,5 ; call LStrCatN            ; s8 = Edit1+Edit1+"625"+"g"+"72"
mov  edx,[ebp-8] ; pop eax ; call LStrCmp               ; Edit2 == s8 ?
jne  wrong ; ... MessageBox "Right Code" (Information)
```

Donc le serial attendu est simplement le nom (Edit1) répété deux fois suivi de `625g72`.

## Vérification

Live sous Wine (`xvfb-run`, saisie via `xdotool`, script [`tools/verify-wine.sh`](tools/verify-wine.sh)) :

- `petik` / `petikpetik625g72` → boîte **Information** « Right Code »
- `petik` / `wrong123` → boîte **Error** « Wrong Code »

```bash
xvfb-run -a bash tools/verify-wine.sh petik petikpetik625g72
```
