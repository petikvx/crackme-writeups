# NomanProdhan — License Checker 0x01

| | |
|---|---|
| **ID** | [`619eda7b33c5d455dece628d`](https://crackmes.one/crackme/619eda7b33c5d455dece628d) |
| **Auteur** | NomanProdhan |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `8578e1c55baa726d6a49d9d700041e55a9cdf4705651e8668aca3fe737cb8385` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/license_checker_1` | binaire d'origine |
| `tools/license1-solve.py` | lit la clé dans l'ELF (`-q`, `--check`) |

## Réponse

**Clé (argv[1]) : `KS-LICENSE-KEY-2021-REV-1`**

```bash
./license_checker_1 "KS-LICENSE-KEY-2021-REV-1"
python3 tools/license1-solve.py --check
```

## Premier regard

`strings` : `Usage : %s <license key here>`, **`KS-LICENSE-KEY-2021-REV-1`**, `Congratulations ! You have successfully registered your premium service.`, `%s is not a valid license key.`. La clé est en clair.

## Flow

`main` : exige `argc == 2`, `strcmp(argv[1], "KS-LICENSE-KEY-2021-REV-1")` → message de félicitations ou d'échec.

## Vérification

```text
$ ./license_checker_1 "KS-LICENSE-KEY-2021-REV-1"   -> Congratulations ! ...
$ ./license_checker_1 wrong                          -> wrong is not a valid license key.
```

## Notes

- Premier d'une série de 3 (0x01/0x02/0x03) du même auteur, chacun un peu plus élaboré. Celui-ci est le plus simple : clé en clair, pas de transformation.
- Reverse statique + essais live ; pas de GDB.
