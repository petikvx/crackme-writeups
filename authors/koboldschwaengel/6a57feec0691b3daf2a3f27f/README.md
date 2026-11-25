# koboldschwaengel's APicturePerfectPassword

| | |
|---|---|
| **ID** | [`6a57feec0691b3daf2a3f27f`](https://crackmes.one/crackme/6a57feec0691b3daf2a3f27f) ([ORIGIN.yml](ORIGIN.yml)) |
| **Auteur** | koboldschwaengel |
| **Plateforme** | Windows x64, console, C++ (MSVC 2022, non strippé de noms mais sans symboles) |
| **SHA-256 (zip)** | `7a1318eb20948b2db5cd15722f18ffdb03e972cc8960783fd4cb2fd976915ec7` |
| **SHA-256 (exe)** | `d534b66de232a61cb7186ec147bd0df9d01ebe698ac9a0e195b43464889ab343` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/APicturePerfectPassword.zip` | archive d'origine (mdp zip `crackmes.one`), intacte |
| `analysis/extract/` | zip extrait (exe + `Readme.txt` de l'auteur) |
| `tools/apicture-solve.py` | solveur (lit le zip, `-q`, `--check` via Wine) |

## Réponse

**Mot de passe : `426371`**

```bash
python3 -I tools/apicture-solve.py        # Password : 426371
python3 -I tools/apicture-solve.py -q --check
```

(pas de login dans ce challenge, donc pas d'exemple `petik`.)

## Premier regard

- `file` : PE32+ console x86-64 ; DIE : MSVC 19.43, CRT dynamique.
- `strings` : `Password has to be 6 digits long`, `Please use only digits`, `BMP data too small`, `Only 32 Bit BMP supported`, `All Bmp must be 100x100`, `You did it!`.
- `Readme.txt` de l'auteur : le programme « IMAGEnes » le mot de passe et la solution ; `solution_data` est presque la solution ; indice : un BMP fait avec des octets hexa, comme les chiffres 0-9.
- ~650 Ko de `.rdata` : ce sont 10 BMP embarqués (signature `BM`, 100×100, 32 bits, 40138 octets chacun) + un gros blob.

## Flow

1. Lit une ligne sur stdin (`cin`), exige 6 caractères (sinon *6 digits long*) et que des chiffres (`isdigit`).
2. Pour chaque caractère `c`, prend le BMP `table[c-'0']` (table de 10 entrées de 16 octets en `.data`, VA `0x1400a40c0`).
3. Fonction `0x140002450` : vérifie 100×100, puis construit une image 600×100 en collant, ligne par ligne, les 6 lignes de pixels (400 octets chacune) des 6 BMP (un `memcpy` de `0x190` octets par chiffre et par ligne, 100 lignes ; tailles `0x258`=600 et `0x3a980`=600·100·4 en dur).
4. `memcmp(solution_data, image_pixels, 0x3a980)` (VA `0x140002a5e`, `solution_data` = `0x1400674a0`). Égal → `You did it!`, sinon silence.

## Comment on trouve

- **Ancrage** : `strings` donne les messages d'erreur (VA `0x140005428`/`0x140005450`), `objdump -d -M intel` → xrefs dans la fonction `main` `0x1400012a0` ; la boucle en `0x140001361`-`0x1400014e9` lit `s[0..5]-0x30`, multiplie par 16 (`shl r8,4`) et indexe `0x1400a40c0` : table de 10 pointeurs BMP.
- **Pas d'obfuscation de calcul** : juste un compositing d'image (le « weird way » de l'auteur). En `0x140002a4f-0x140002a63` : `memcmp(rdx=0x1400674a0, rcx=image, r8=taille)` + `test eax,eax; sete bl`.
- **`solution_data`** : en `.rdata` à l'offset fichier `0x662a0` ; pas de header BMP, 240000 octets de pixels bruts (600×100×4) — donc comparaison pixel à pixel, ordre des lignes identique à celui des BMP sources (le programme ne retourne rien).
- **Décodage** : on extrait les 10 BMP via la table `.data`, et pour chaque slot `k` (0..5) on cherche le chiffre `d` tel que, pour chacune des 100 lignes `r`, `solution[r*2400 + k*400 : +400] == bmp[d][r*400 : +400]`. Un seul chiffre convient par slot : `4 2 6 3 7 1`.
- **Piège** : l'ordre des BMP dans `.rdata` n'est pas 0..9 — toujours passer par la table de `.data` ; et `strings` ne sert à rien sur la solution (pixels), il faut comparer les blocs.

## Vérification (Wine, binaire d'origine)

```text
$ echo 426371 | wine APicturePerfectPassword.exe
You did it!
$ echo 426372 | wine APicturePerfectPassword.exe      # (aucune sortie)
$ echo 123456 | wine APicturePerfectPassword.exe      # (aucune sortie)
$ echo 12345  | wine APicturePerfectPassword.exe
Password has to be 6 digits long
Please use only digits
$ echo abcdef | wine APicturePerfectPassword.exe
Please use only digits
```

Pas de GDB ni de debugger live : reverse 100 % statique (`objdump`) + preuve Wine.

## Notes

- Le crackme ne cache rien dans un calcul : le « hash » est l'image elle-même.
- Le solveur a besoin seulement du zip d'origine (ne modifie pas `original/`).
