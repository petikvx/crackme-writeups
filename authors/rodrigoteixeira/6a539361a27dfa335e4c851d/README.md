# RodrigoTeixeira's Encrypted Password

| | |
|---|---|
| **ID** | [`6a539361a27dfa335e4c851d`](https://crackmes.one/crackme/6a539361a27dfa335e4c851d) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | RodrigoTeixeira |
| **Plateforme** | Windows PE32 console (MinGW GCC 6.3.0) |
| **SHA-256 (`original/download.bin`)** | `b3e0542377f40269726bf1acae5c39c2aaefa77d64d6a01beb49347f10d1a865` |

| Fichier | Rôle |
|---|---|
| `original/download.bin` | archive du site, **non modifiée** : ZIP (pass `crackmes.one`) contenant un second `crackme.zip` |
| `analysis/crackmes.exe`, `analysis/libmingwex-0.dll` | contenu extrait du `crackme.zip` interne (`unzip -P crackmes.one`) |
| `tools/encrypted-password-solve.py` | déchiffre le mot de passe ; `--check` le teste sous Wine |

## Réponse

**Mot de passe : `Password\0`** — littéral, 10 caractères : `Password`, un backslash, puis le chiffre `0` (pas un octet NUL).

```bash
python3 -I tools/encrypted-password-solve.py [-q] [--check]
```

Pas de username : exemple `petik` → refusé (`Wrong password`), seul le mot de passe unique passe.

## Premier regard

- `strings` ne révèle aucun message (« Enter the password », « Wrong password »…) : tout est chiffré et reconstruit sur la pile dans `main` (VA `0x4021e0`).
- Seule chaîne claire utile : `%99s` (`0x404064`, format du `scanf`).
- Le `.rdata` contient 19 octets chiffrés en `0x404069` : le message de succès.

## Flow

1. Déchiffre « Enter the password: » et l'affiche (`printf`).
2. `scanf("%99s", buf)` (`buf` = `esp+0x4c`).
3. Déchiffre le mot de passe attendu (`esp+0x19`), le compare octet par octet à la saisie.
4. OK → déchiffre le message en `.rdata` ; sinon « Wrong password » ; `puts`.

## Comment on trouve

Ancrage : `objdump -d -M intel analysis/crackmes.exe`, fonction `_main`.

Les chaînes sont posées par `mov DWORD PTR [esp+X], imm32` (octets en LE), p. ex. pour le mot de passe :

```asm
402260: mov DWORD PTR [esp+0x19],0x01531150   ; 50 11 53 01
40227b: mov DWORD PTR [esp+0x1d],0x0caec9ed    ; ed c9 ae 0c
402272: mov WORD  PTR [esp+0x21],dx            ; dx=0xf02c -> 2c f0
402283: mov BYTE  PTR [esp+0x23],0             ; terminateur
402288: mov ecx,0x11                           ; multiplicateur initial
```

Puis la boucle (la même, instanciée 4 fois avec un multiplicateur initial différent : 0x96, 0x11, 0xde, et `b[1]` pour le message de `.rdata`) :

```asm
402290: or   eax,1          ; acc |= 1
402293: add  edx,1          ; p++
402296: imul eax,ecx        ; acc *= mult
402299: mov  [edx],al       ; b[i] = acc & 0xff   (écrase l'octet chiffré)
40229b: movzx ecx,BYTE PTR [edx+1] ; mult = octet chiffré SUIVANT
40229f: test cl,cl / jne    ; fin au 0
```

Soit `b[i] = ((acc|1) * b_chiffré[i+1]) & 0xff` avec `b[0]` conservé tel quel
(ici `0x50 = 'P'`). Piège : `ecx` est rechargé avec l'octet *chiffré* du rang suivant, pas avec la valeur décodée ; seul l'octet bas de `acc` compte, donc la simulation en Python 8 bits suffit.

Exemple (mot de passe) : `P` (0x50) → 0x51×0x11… etc., ce qui donne `P a s s w o r d \ 0`. Les 3 autres blobs décodent en `Enter the password: `, `Wrong password`, `That is correct :)` (confirmé par le solveur), ce qui valide la routine. L'avant-dernier octet décodé est `\` (0x5c) et le dernier `0` (0x30) : c'est bien le texte `\0` et non un NUL — le `scanf %99s` ne pourrait d'ailleurs pas saisir un NUL.

## Vérification (Wine, binaire d'origine extrait)

```text
$ echo 'Password\0' | xvfb-run -a wine crackmes.exe
Enter the password: That is correct :)
$ echo petik | xvfb-run -a wine crackmes.exe
Enter the password: Wrong password
```

(`tools/encrypted-password-solve.py --check` rejoue ces deux cas.)

## Notes

- Aucune session GDB / debugger live : reverse 100 % statique + preuve Wine.
- Piège : le mot de passe contient la séquence littérale `\0`, facile à confondre avec un terminateur C si on lit la sortie du déchiffrement avec `repr`.
