# crackmes.de's basic_logic (eholzbach)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5f33c5d40ad448c7bd) · id `5ab77f5f33c5d40ad448c7bd`

ELF32 NASM strippé. Auteur : **eholzbach**.

| Fichier | Rôle |
|---|---|
| [`original/logic.tgz`](original/logic.tgz) | archive |
| [`original/logic/logic`](original/logic/logic) | ELF |
| [`original/readme.txt`](original/readme.txt) | brief |
| [`tools/basic-logic-solve.py`](tools/basic-logic-solve.py) | solveur PTY |
| [`analysis/ok.txt`](analysis/ok.txt) | `password is correct!` |

## Réponse

| Input | Formule |
|---|---|
| Password | **`str(getpid()) + str(time(NULL))`** (décimal, ordre naturel) |

Exemple (dépend du process) : `23020521787421186`.

```bash
python3 tools/basic-logic-solve.py --check
```

## Prédicat

1. `getpid` → chiffres décimaux.
2. `time` → chiffres décimaux.
3. Concaténation = password attendu.
4. Lecture caractère par caractère sur **fd 1** (stdout) → **PTY obligatoire** (pipe classique échoue).
5. `ptrace(TRACEME)` anti-debug (GDB ⇒ échec anticipé + `unlink` argv0).

## Notes

- ioctl `TCGETS`/`TCSETS` pour masquer l’écho.
- Ne pas patcher le message « correct » : le readme demande d’apprendre la logique.
