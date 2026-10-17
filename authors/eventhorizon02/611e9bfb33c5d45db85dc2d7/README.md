# eventhorizon02 — super_easy

| | |
|---|---|
| **ID** | [`611e9bfb33c5d45db85dc2d7`](https://crackmes.one/crackme/611e9bfb33c5d45db85dc2d7) |
| **Auteur** | eventhorizon02 |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (`check_pass`, `is_prime`) |
| **SHA-256** | `cc8163e9f82317c395bda93cafbc6d394b407775ff0fac7c65e05b60685cc959` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/linux_64_bit` | binaire d'origine |
| `tools/super_easy-solve.py` | fournit un code valide (`-q`, `--check`) |

## Réponse

Gabarit : `argv[1]` doit avoir une **longueur multiple de 3** et sa valeur numérique doit être **première**. Exemple : **`101`** → `flag{101}`.

```bash
./linux_64_bit 101      # congratulations you have cracked the code / flag{101}
python3 tools/super_easy-solve.py --check
```

## Premier regard

`strings` : `congratulations you have cracked the code`, `flag{%s}`, `access denied, wrong password, try again`. Symboles `check_pass`, `is_prime` ; import `sqrt`.

## Flow

`main` @ `0x78a` : `check_pass(argc, argv[1])` ; si vrai → affiche le flag `flag{argv[1]}`, sinon refus.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/linux_64_bit | awk '/<check_pass>:/,/ret/'`.

```asm
811: call strlen            ; len(argv[1])
820: call atoi               ; valeur numérique
828..845: réduction de force ; len % 3 == 0 ?  sinon échec
850: call is_prime           ; is_prime(valeur) == true ?
```

`is_prime` (division d'essai jusqu'à `sqrt(n)`) est un test de primalité classique. `101` : longueur 3 (`3 % 3 == 0`), premier.

## Vérification

```text
$ ./linux_64_bit 101   -> congratulations you have cracked the code / flag{101}
$ ./linux_64_bit 100   -> access denied, wrong password, try again   (100 pas premier)
```

## Notes

- Reverse statique + essais live ; pas de GDB.
