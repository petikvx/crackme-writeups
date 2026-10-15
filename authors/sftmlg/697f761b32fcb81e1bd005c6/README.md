# sftmlg — Quite a simple crackme

| | |
|---|---|
| **ID** | [`697f761b32fcb81e1bd005c6`](https://crackmes.one/crackme/697f761b32fcb81e1bd005c6) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | sftmlg |
| **Plateforme** | Linux ELF64 PIE, non strippé, C++ (libstdc++), console |
| **Difficulté** | 1.1 |
| **SHA-256 (zip)** | `36ac421beb5dfb8e0bcba172ee7629c0b4ffd6eb5fde38e6df252e46427f58e4` |
| **SHA-256 (exe)** | `ef8dcc92aff4d96f2bea80f2b1b6cb5ea29cae1d32e92113e665347b2f91e908` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme-noletters.zip` | archive d'origine |
| `original/extracted/c++crackme` + `readme.md` | binaire + indice de l'auteur (ZIP imbriqué extrait) |
| `tools/quite-simple-solve.py` | mot de passe |

## Réponse

```bash
python3 tools/quite-simple-solve.py -q
# @!#-3~&,$;7?/.:%42+`
./original/extracted/c++crackme <<< '@!#-3~&,$;7?/.:%42+`'
# Right password
```

## Premier regard

Le `readme.md` fourni par l'auteur donne l'indice (et le titre du ZIP, `crackme-noletters.zip`) :

> *Stored in plain text, does not contain any letters uppercase, or lowercase*

```bash
file original/extracted/c++crackme   # ELF64 PIE, non strippé, C++
strings -n 6 original/extracted/c++crackme
# @!#-3~&,$;7?/.:%42+`
# Enter the password:
# Right password / Wrong password
```

Le mot de passe apparaît **en clair** dans `strings`, sans transformation — exactement comme annoncé : aucune lettre, uniquement symboles et chiffres.

## Flow

```bash
./c++crackme
# Console crackme written with C++, made by sftmlg on crackmes.one! Change this string if you can.
# Enter the password: <saisie>
# Right password | Wrong password
```

## Comment on trouve

**Ancrage.** `strings -n 6` suffit : une seule chaîne de 20 caractères composée uniquement de symboles/chiffres (`@!#-3~&,$;7?/.:%42+\``) tranche nettement avec le reste des chaînes C++ (symboles de la libstdc++) — c'est la seule candidate plausible, confirmée par l'indice du `readme.md`.

**Vérification.** Testée directement contre le binaire, aucune analyse statique supplémentaire nécessaire :

```bash
./c++crackme <<< '@!#-3~&,$;7?/.:%42+`'
# Right password
```

**Pièges.**
- Le mot de passe contient un **backtick** (`` ` ``) en dernier caractère — bien l'échapper/guillemeter en shell (apostrophes simples).
- Contrairement à beaucoup de crackmes « simples », celui-ci ne comporte **aucun XOR ni décalage** : le challenge est littéralement de le repérer dans `strings`, pas de le décoder.

## Vérification

```bash
./original/extracted/c++crackme <<< '@!#-3~&,$;7?/.:%42+`'
# Right password

./original/extracted/c++crackme <<< 'wrong'
# Wrong password
```

## Notes

- Pas de GDB utilisé, pas de décompilation nécessaire : `strings` + l'indice fourni par l'auteur suffisent entièrement.
- `readme.md` de l'auteur conservé dans `original/extracted/` (fait partie de l'archive d'origine).
