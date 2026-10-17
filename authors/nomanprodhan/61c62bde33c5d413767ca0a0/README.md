# NomanProdhan — License Checker 0x02

| | |
|---|---|
| **ID** | [`61c62bde33c5d413767ca0a0`](https://crackmes.one/crackme/61c62bde33c5d413767ca0a0) |
| **Auteur** | NomanProdhan |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `c89c95b1c8d0df2898c1f24aef8e8d0408bc6bf04b1a85231f26a231b76b9eb5` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/license_checker_2` | binaire d'origine |
| `tools/license2-solve.py` | fournit le nom et la clé (`-q`, `--check`) |

## Réponse

| Argument | Valeur |
|---|---|
| `argv[1]` (nom) | `NomanProdhan` |
| `argv[2]` (clé) | `KS-LICENSE-KEY-2021-REV-2` |

**Exception à la convention `petik`** : le nom est codé en dur et doit être **exactement** le pseudo de l'auteur ; aucune variante n'est acceptée.

```bash
./license_checker_2 NomanProdhan "KS-LICENSE-KEY-2021-REV-2"
python3 tools/license2-solve.py --check
```

## Premier regard

`strings` : `NomanProdhan`, `KS-LICENSE-KEY-2021-REV-2`, `Congratulations %s, premium service has been activated for you.`, deux messages d'échec distincts (nom vs clé).

## Flow

`main` @ `0x1159` : exige `argc == 3` ; `strcmp(argv[1], "NomanProdhan")` (sinon « you don't have a license ») ; puis `strcmp(argv[2], "KS-LICENSE-KEY-2021-REV-2")` (sinon « invalid license ») ; les deux bons → message de félicitations.

## Comment on trouve

Les deux constantes sont en clair dans `.rodata`, directement lisibles par `strings`. `objdump -d -M intel --no-show-raw-insn original/license_checker_2 | awk '/<main>:/,/ret/'` confirme l'ordre des deux `strcmp`.

## Vérification

```text
$ ./license_checker_2 NomanProdhan "KS-LICENSE-KEY-2021-REV-2"  -> Congratulations NomanProdhan, ...
$ ./license_checker_2 petik "KS-LICENSE-KEY-2021-REV-2"        -> you don't have a license.
$ ./license_checker_2 NomanProdhan wrong                        -> invalid license.
```

## Notes

- Reverse statique + essais live ; pas de GDB.
