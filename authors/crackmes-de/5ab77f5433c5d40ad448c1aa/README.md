# rif_crackme_5 by korbut

| | |
|---|---|
| **ID** | [`5ab77f5433c5d40ad448c1aa`](https://crackmes.one/crackme/5ab77f5433c5d40ad448c1aa) |
| **Auteur (site)** | crackmes.de (auteur original : korbut / rif) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 GUI, MASM |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `e7437420df0bd22b44535b900a3cc17cd73f089be2884e644dbf5080ea27ba25` |

## Résultat

Keygen : pour chaque caractère du nom (index 0-based), avec `i = index + 1` :

`serial += ((c + 1) XOR i) * i`  (arith. 32 bits)

Exemple : nom **`petik`** → serial **`1631`**.

```
$ python3 tools/rif_crackme_5-solve.py petik
petik 1631
```

Vérifié par émulation Unicorn de la boucle réelle (`0x4013ff`–`0x40146b`) : EBX = `1631`. GUI wine non pilotée.

## Comment on trouve

1. Zip imbriqué `ftsii_meat.zip` → `fts II.exe` (PE32 GUI, MASM 6.14).
2. Bouton Check (`0x3e8`) appelle `0x4013b8` : `GetDlgItemTextA` (id `0x7d0`) puis boucle ; `GetDlgItemInt` (id `0x7d1`) ; succès si égalité → MessageBox `U did it old rascal !!!`.
3. Le corps de boucle est après un `jmp` qui saute les chaînes embarquées (`Pas de serial !!!`, etc.) :
   ```
   movsx eax, [name+ecx] ; jz done
   inc eax               ; c+1
   inc ecx               ; i = index+1
   xor eax, ecx
   imul ecx
   add ebx, eax
   jmp loop
   ```
4. Désassemblage : [`analysis/check.asm.txt`](analysis/check.asm.txt).

## Solveur

[`tools/rif_crackme_5-solve.py`](tools/rif_crackme_5-solve.py)

## Status

- [x] reverse
- [x] write-up
- [x] solveur
