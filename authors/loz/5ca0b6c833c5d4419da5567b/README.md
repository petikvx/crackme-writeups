# Loz — Password Login 2

| | |
|---|---|
| **ID** | [`5ca0b6c833c5d4419da5567b`](https://crackmes.one/crackme/5ca0b6c833c5d4419da5567b) |
| **Auteur** | Loz |
| **Plateforme** | Linux ELF64 PIE, C++, non strippé |
| **SHA-256** | `537abfb050bff429a13057666c238c15a4a44ac070fa171c6cc59ef0fa51817d` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/main` | binaire d'origine |
| `tools/passwordlogin2-solve.py` | mot de passe (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **Mot de passe** | `lozlvl2` |

```bash
echo lozlvl2 | ./original/main
python3 tools/passwordlogin2-solve.py --check
```

## Premier regard

```bash
file original/main      # ELF64 PIE, C++, not stripped
strings -n 5 original/main | grep -i login
```

Pas de prompt visible en clair (la saisie se fait silencieusement via `getline`). Chaînes utiles : `Login failed`, `Login successful`. Classe C++ `password` avec `checkLength`, `checkPassword`.

## Flow

`main` lit une ligne (`std::getline`), construit un objet `password`, vérifie la longueur puis le contenu.

## Comment on trouve

**Ancrage** : MCP `ida`, Hex-Rays sur le constructeur `password::password()` et les deux méthodes de vérification.

```c
// constructeur
this->key = 66;                                    // 'B' = 0x42
this->secret = "x_.1:.-8.4.p6-e.!-";                 // chaine membre

// checkLength(len)
// std::to_string(360).at(1) == '6' ; atoi("6")+1 == 7  -- obfuscation d'une constante
return len == 7;

// checkPassword(input)
xored = XOR(input, key)                              // octet par octet
target = secret.substr(5, 7)                          // ".-8.4.p"
return xored == target;
```

Inverser : `password = XOR(secret.substr(5,7), 0x42)`.

```python
secret = "x_.1:.-8.4.p6-e.!-"
sub = secret[5:12]           # ".-8.4.p"
password = "".join(chr(ord(c) ^ 0x42) for c in sub)
# -> "lozlvl2"
```

## Vérification

```bash
$ echo lozlvl2 | ./original/main
Login successful

$ echo wrong | ./original/main
Login failed
```

## Notes

- Pas de GDB nécessaire : clé XOR et chaîne membre lisibles directement en Hex-Rays.
- La « longueur 7 » est dérivée d'un calcul obfusqué (`std::to_string(360).at(1)` donne le caractère `'6'`, puis `atoi + 1`) — juste une façon tordue d'écrire la constante `7`.
