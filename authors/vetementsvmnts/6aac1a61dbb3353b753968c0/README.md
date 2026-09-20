# vetementsvmnts's Tricky challenge or is it ?

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aac1a61dbb3353b753968c0) · id `6aac1a61dbb3353b753968c0`

ELF64 console, C, strippé + `ptrace` anti-debug. Diff. site **1.2**.

| Fichier | Rôle |
|---|---|
| [`original/hard_crackme`](original/hard_crackme) | binaire |
| [`tools/tricky-challenge-solve.py`](tools/tricky-challenge-solve.py) | password / `--check` |

## Réponse

| | |
|---|---|
| **Password** | `supersecret123` |
| OK | `Access Granted! You are a master.` |

```bash
python3 tools/tricky-challenge-solve.py -q
printf '%s\n' supersecret123 | ./original/hard_crackme
```

## Prédicat

1. `ptrace` → exit si debugger.
2. Mot de passe reconstruit sur la pile (2× `movabs`) puis **XOR `0x55`** octet par octet, `strcmp` avec l’entrée.

## Vérification

```text
Enter the secret password: Access Granted! You are a master.
```
