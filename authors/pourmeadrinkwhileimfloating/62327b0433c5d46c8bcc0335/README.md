# pourmeadrinkwhileimfloating — licesnse_checker_3

| | |
|---|---|
| **ID** | [`62327b0433c5d46c8bcc0335`](https://crackmes.one/crackme/62327b0433c5d46c8bcc0335) |
| **Auteur** | pourmeadrinkwhileimfloating |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256 (zip)** | `70f214bbb8f7175a8127622a833a3a9e94b171c3ffdc3173c34aa0d0dd904353` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/111.zip` | archive d'origine |
| `analysis/x/license_checker_3` | binaire extrait |
| `tools/license3-solve.py` | fournit un code valide (`-q`, `--check`) |

## Réponse

Pas de code unique : toute chaîne de chiffres (passée en `argv[1]`) dont la **somme des chiffres vaut exactement 50** convient.

**Exemple : `999995`** (`9+9+9+9+9+5 = 50`)

```bash
./license_checker_3 999995      # Premium access has been activated !
python3 tools/license3-solve.py --check
```

## Premier regard

`strings` : `Usage : %s <license pass code here [numbers only]>`, `Premium access has been activated !`, `Wrong license code`. L'énoncé précise « numbers only ».

## Flow

`main` @ `0x1179` : exige `argc == 2` ; pour chaque caractère de `argv[1]`, `atoi` d'un buffer d'un seul caractère (donne sa valeur numérique, ou 0 si non-chiffre), somme accumulée ; `somme == 50` → « Premium access has been activated ! ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn license_checker_3 | awk '/<main>:/,/ret/'`.

```asm
11eb: mov [rbp-0x11],al    ; un seul caractère dans un buffer local
11f5: call atoi            ; atoi(ce caractère seul) = sa valeur numérique
11fa: add [rbp-0x10],eax   ; somme += valeur
1219: cmp [rbp-0x10],0x32  ; somme == 50 ?
```

Aucune contrainte sur la longueur ni l'ordre : seule la somme des chiffres compte.

## Vérification

```text
$ ./license_checker_3 999995   -> Premium access has been activated !
$ ./license_checker_3 123456   -> Wrong license code
```

## Notes

- Reverse statique + essais live ; pas de GDB.
