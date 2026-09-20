# acheylate's Find the password

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aac1a0c585e8875bcbec009) · id `6aac1a0c585e8875bcbec009`

ELF64 **Rust** strippé. Diff. site **2.0**.

| Fichier | Rôle |
|---|---|
| [`original/crackme-01`](original/crackme-01) | binaire |
| [`tools/find-password-solve.py`](tools/find-password-solve.py) | password / `--check` |

## Réponse

| | |
|---|---|
| **Password** | `HVUHADN` |
| OK | `Correct Password` |

```bash
python3 tools/find-password-solve.py -q
printf '%s\n' HVUHADN | ./original/crackme-01
```

## Prédicat

Le mot de passe n’est pas une C-string unique : deux immediates **u32 LE** dans le check (`HVUH` / suite `…ADN`) assemblées en `HVUHADN`.

## Vérification

```text
Enter the password: Correct Password
```
