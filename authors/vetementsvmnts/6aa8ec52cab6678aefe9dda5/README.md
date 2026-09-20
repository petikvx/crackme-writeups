# vetementsvmnts's My First crackme

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aa8ec52cab6678aefe9dda5) · id `6aa8ec52cab6678aefe9dda5`

Crackme **ELF64** console, C, non strippé. Auteur : [vetementsvmnts](https://crackmes.one/user/vetementsvmnts) · diff. site **1.0**.

| Fichier | Rôle |
|---|---|
| [`original/my_crackme`](original/my_crackme) | binaire |
| [`tools/my-first-crackme-solve.py`](tools/my-first-crackme-solve.py) | password / `--check` |

## Réponse

| | |
|---|---|
| **Password** | `my_first_crackme` |
| OK | `Access Granted! You solved it.` |

```bash
python3 tools/my-first-crackme-solve.py -q
printf '%s\n' my_first_crackme | ./original/my_crackme
```

## Premier regard / prédicat

`strcmp` contre la chaîne en clair `.rodata` : `my_first_crackme`.

## Vérification

```text
Enter password: Access Granted! You solved it.
```
