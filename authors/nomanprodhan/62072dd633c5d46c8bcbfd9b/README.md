# NomanProdhan — License Checker 0x03

| | |
|---|---|
| **ID** | [`62072dd633c5d46c8bcbfd9b`](https://crackmes.one/crackme/62072dd633c5d46c8bcbfd9b) |
| **Auteur** | NomanProdhan |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `29412589df288184ca00159c8275e8218a5d103899cf63954edd97b6c931c2eb` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/license_checker_3` | binaire d'origine |
| `tools/license0x03-solve.py` | fournit un code valide (`-q`, `--check`) |

## Réponse

**Même binaire, octet pour octet** (SHA-256 identique) que [licesnse_checker_3 de pourmeadrinkwhileimfloating](../../pourmeadrinkwhileimfloating/62327b0433c5d46c8bcc0335/) — republié sous un autre compte / un autre titre.

Pas de code unique : toute chaîne de chiffres (`argv[1]`) dont la **somme vaut 50** convient. Exemple : **`999995`**.

```bash
./license_checker_3 999995      # Premium access has been activated !
python3 tools/license0x03-solve.py --check
```

## Premier regard / Comment on trouve

Identique à [l'analyse de pourmeadrinkwhileimfloating](../../pourmeadrinkwhileimfloating/62327b0433c5d46c8bcc0335/README.md) : `main` @ `0x1179` somme les chiffres de `argv[1]` (un `atoi` par caractère) et compare le total à `0x32 = 50`.

## Vérification

```text
$ ./license_checker_3 999995   -> Premium access has been activated !
$ ./license_checker_3 123456   -> Wrong license code
```

## Notes

- SHA-256 identique à `authors/pourmeadrinkwhileimfloating/62327b0433c5d46c8bcc0335/analysis/x/license_checker_3` : republication du même challenge.
- Reverse statique + essais live ; pas de GDB.
