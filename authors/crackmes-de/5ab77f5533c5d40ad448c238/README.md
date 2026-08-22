# crackmes.de's crackme1 (darius949)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5533c5d40ad448c238) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | darius949 (miroir crackmes.de) |
| **Plateforme** | Linux ELF32 |
| **Type** | name → serial |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme1.tgz` | binaire d’origine (ELF malgré l’extension) |
| `original/crackme1` | copie exécutable |
| `tools/crackme1-solve.py` | keygen |

## Réponse

| Nom | Serial |
|---|---|
| `test` | **`780`** |

```text
serial = Σ (name[i] + name[i+1])  pour i ∈ [0, len(name))
avec name[len] = 0
```

```bash
python3 tools/crackme1-solve.py -q --name test
# test:780
printf 'test\n780\n' | ./original/crackme1
# Vous avez craque le no de serie
python3 tools/crackme1-solve.py --check --name test
```

## Premier regard

```text
ELF 32-bit LSB executable, Intel 80386, dynamically linked, not stripped
```

Le fichier livré s’appelle `crackme1.tgz` mais c’est l’ELF lui-même (pas une archive).

## Flow

1. Demande le nom (`Donnez votre nom:`).
2. Demande le serial (`Donnez le no de serie:`).
3. Calcule `c` sur le nom, compare au serial lu.
4. Succès → `Vous avez craque le no de serie`.

## Prédicat

Pour chaque caractère du nom (C-string, NUL final inclus dans le voisin de droite) :

```c
c = 0;
for (i = 0; name[i]; i++)
    c += (unsigned)name[i] + (unsigned)name[i+1];
```

Exemple `test` : `(t+e)+(e+s)+(s+t)+(t+0)` = `780`.

## Vérification

```bash
printf 'test\n780\n' | ./original/crackme1
# c=780
# Vous avez craque le no de serie
```

## Notes

- Serial décimal affiché aussi en debug (`c=…`).
- Pas de protection anti-debug.
