# crackmes.de's KeygenmeNasm (rezk2ll)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6533c5d40ad448cb73) · id `5ab77f6533c5d40ad448cb73`

Keygenme **ELF32** NASM, non strippé. Auteur : **rezk2ll**.

| Fichier | Rôle |
|---|---|
| [`original/KeygenmeNasm.zip`](original/KeygenmeNasm.zip) | archive site |
| [`original/keygenme`](original/keygenme) | ELF |
| [`original/note.txt`](original/note.txt) | brief |
| [`tools/keygenmenasm-solve.py`](tools/keygenmenasm-solve.py) | keygen |
| [`analysis/ok.txt`](analysis/ok.txt) | `good work :)` |

## Réponse

| Champ | Exemple (`khaled`) |
|---|---|
| Username | **`khaled`** (longueur corps 3..13) |
| Password | **`okimme`** |

```bash
python3 tools/keygenmenasm-solve.py -q --user khaled
# khaled:okimme

python3 tools/keygenmenasm-solve.py --check --user khaled
```

> Les deux `read()` enchaînés : envoyer username puis password en **deux écritures** (sinon le 1er `read` avale tout le pipe).

---

## Prédicat

1. `|username|` ∈ (3, 14] octets lus (typiquement corps + `\n`).
2. `|password|` == `|username|`.
3. Sur le corps (sans le `\n` final du compteur interne `len-1`) :

```text
al = 5
for c in username:
    out = c | al
    al = c
```

4. `password == out` (byte à byte, y compris `\n`).

## Notes

- Symbole `cipher` / `again` visibles (non strippé).
- Échec username trop court/long → `mmmmm , this doesn't seem like a username`.
