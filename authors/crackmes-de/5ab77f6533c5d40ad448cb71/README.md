# crackmes.de's crackme_nasm / CrackMe_ASM (rezk2ll)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6533c5d40ad448cb71) · id `5ab77f6533c5d40ad448cb71`

Crackme **ELF32** NASM, non strippé. Auteur : **rezk2ll**.

| Fichier | Rôle |
|---|---|
| [`original/CrackMe_ASM.zip`](original/CrackMe_ASM.zip) | archive |
| [`original/CrackMe_ASM`](original/CrackMe_ASM) | ELF |
| [`original/blah.txt`](original/blah.txt) | note |
| [`tools/crackme-nasm-solve.py`](tools/crackme-nasm-solve.py) | solveur |
| [`analysis/ok.txt`](analysis/ok.txt) | `you are correct !` |

## Réponse

| Input | Valeur |
|---|---|
| Flag / password | **`S3CrE+Fl4G!`** |

```bash
python3 tools/crackme-nasm-solve.py -q
printf 'S3CrE+Fl4G!\n' | ./original/CrackMe_ASM
# Flag : you are correct !
```

## Prédicat

Après le prompt, le binaire **écrit** dans le BSS la constante :

```text
S 3 C r E + F l 4 G !
```

Puis :

```asm
mov ecx, dword [expected]   ; "S3Cr"
mov ebx, dword [input]
cmp ecx, ebx
```

Seul le **premier dword** est comparé — `S3Cr…` suffit techniquement ; la chaîne complète est le password « officiel » construit par le code.

## Notes

- Échec → message + `ClearTerminal` (attend `\n`) + reboucle `_start`.
- Symbole source `new.asm` dans la table des symboles.
