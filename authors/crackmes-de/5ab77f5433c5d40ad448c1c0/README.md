# szi_keygenme by revme (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5433c5d40ad448c1c0>
- **Plateforme** : Windows PE32 GUI, MinGW gcc-4.4.1 (C++ / Win32 API) — difficulté 1.0
- **Archive** : `original/revme-crackme-szi.zip` (mot de passe `crackmes.one`) → `Crackme.exe` + `readme.txt`
- **Statut** : résolu (keygen), vérifié par **reconstruction du prédicat** (`objdump`) + clé d’exemple auteur `t58-6t8-y24`

## Solution

Le serial a le format `XXX-XXX-XXX` (11 caractères, tirets aux positions 3 et 7). Il **ne dépend pas du nom** : l’algo mélange deux chaînes figées puis lie 4 positions du serial à 4 autres.

```
python3 tools/szi-keygenme-solve.py petik     ->  spc-eyt-2ik
python3 tools/szi-keygenme-solve.py 56824     ->  t58-6t8-y24   (exemple auteur)
python3 tools/szi-keygenme-solve.py --check t58-6t8-y24   -> OK
```

Positions libres : 1, 4, 6, 9, 10. Positions dérivées : 0, 2, 5, 8.

## Comment on trouve

1. `diec` : MinGW gcc-4.4.1, pas de packer. `readme.txt` donne déjà un serial valide (`t58-6t8-y24`) et demande un keygen.
2. `strings` : `ibetthatyoucantcrackthis`, `1234567890`, `gratz !!`, `now keygen it !`.
3. Handler du bouton Check (`WM_COMMAND` id `0x65`) : lit l’edit, construit une `std::string`, appelle `sub_4017d0`.
4. `sub_4017d0` exige `length == 11`, `key[3] == '-'` et `key[7] == '-'`, puis construit le charset en intercalant `ibet…` et `1234567890` →  
   `i1b2e3t4t5h6a7t8y9o0ucantcrackthis` (34 chars).
5. `sub_40154c(n, &charset)` renvoie `charset[n % 34]` (n en unsigned 32-bit). Les 4 tests (extrait `analysis/check.asm.txt`) :
   - `key[0] == f(key[1] + 0x1337)`
   - `key[2] == f(key[4] - 0x1337)`
   - `key[5] == f(4919 * key[6])`  (le `4919` vient de `lea/shl/sub` sur le caractère)
   - `key[8] == f(key[9])`
6. Le keygen choisit les 5 positions libres et calcule les 4 autres.

## Vérification

- `python3 tools/szi-keygenme-solve.py --check t58-6t8-y24` → **OK** (clé publiée par l’auteur dans `readme.txt`).
- Le même prédicat régénère cette clé à partir des libres `56824`.
- GUI MinGW sous wine/xvfb : fenêtre non pilotée ici ; la preuve reste le prédicat binaire + l’exemple auteur.
