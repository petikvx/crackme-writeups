# nts_crackme8 — cyclops (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5433c5d40ad448c156
- Plateforme : Windows PE32 GUI (MSVC 6 / MFC 4.2), non packé
- Difficulté : 2.0 — type **keygen** (nom → serial), « Understand the krypto basics and algos »

## Solution

Le nom doit faire au moins 7 caractères (donc `petik` seul est refusé). Pour `petikpetik` :

```
4565D7C272B88E40
```

Keygen : `python3 tools/crackmes-de-nts_crackme8-solve.py petikpetik`

Formule : `H = SHA-256(nom)` découpé en 8 mots big-endian `H0..H7`, puis
`serial = "%08X%08X" % (H1+H3+H5+H7, H0+H2+H4+H6)` (sommes modulo 2^32).

## Comment on trouve

1. **Repérage.** `diec` : MSVC 6 + MFC 4.2, pas de packer. Chaînes utiles : `Serial is Correct!!!` et un format `%08X%08X`.
2. **Xrefs.** On cherche dans l'image les adresses de ces chaînes : `0x40706c` (message) est référencée en `0x4056d2`, `0x407060` (format) en `0x4053f5`.
3. **Handler du bouton (`0x405690`).** Deux `GetDlgItemText` (id `0x3e8` nom max 0x21, id `0x3e9` serial max 0x12). Conditions : longueur du nom > 6, longueur du serial > 10, puis `check(nom, serial)` en `0x405410` ; si vrai → MessageBox « Serial is Correct!!! ».
4. **Reconnaître le hash.** `check` appelle `0x401150` qui écrit dans le contexte `0x6a09e667, 0xbb67ae85, 0x3c6ef372, …, 0x5be0cd19` : ce sont les valeurs initiales de **SHA-256**. `0x405280` = update (copie par blocs de 64 octets), `0x405340` = final (padding `0x80`, longueur en bits en big-endian sur 8 octets : padding SHA-2 classique).
5. **Le formatage.** À la fin de `0x405340`, au lieu de sortir le digest, le code additionne les mots d'état : `[+0x0c]+[+0x14]+[+0x1c]+[+0x24]` (H1+H3+H5+H7) et `[+0x08]+[+0x10]+[+0x18]+[+0x20]` (H0+H2+H4+H6), puis `sprintf("%08X%08X", impairs, pairs)`. `check` fait ensuite un `strcmp` entre ce texte et le serial saisi (donc majuscules obligatoires).

## Vérification

C'est un dialogue MFC qu'on ne pilote pas en headless, donc pas de clic réel. À la place, `tools/crackmes-de-nts_crackme8-emu.py` exécute **la vraie routine `0x405410`** du binaire sous Unicorn (SHA-256 du programme compris), en simulant seulement `sprintf`. Résultat : `OK` pour `petikpetik` / `4565D7C272B88E40` (`analysis/emu-petikpetik.txt`), `KO` avec un serial faux, `OK` aussi pour `Cyclops1428` avec son serial généré.
