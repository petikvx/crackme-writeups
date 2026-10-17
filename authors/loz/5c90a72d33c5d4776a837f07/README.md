# Loz — Password Login

| | |
|---|---|
| **ID** | [`5c90a72d33c5d4776a837f07`](https://crackmes.one/crackme/5c90a72d33c5d4776a837f07) |
| **Auteur** | Loz |
| **Plateforme** | Linux ELF64 PIE, C++, non strippé |
| **SHA-256** | `cd00215df69e55cb05aaab1df4bb22533aecbe97fbbe1aa9d73aa853987c324a` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme` | binaire d'origine |
| `tools/passwordlogin-solve.py` | mot de passe (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **Mot de passe** | `cracked` |

```bash
echo cracked | ./original/crackme
python3 tools/passwordlogin-solve.py --check
```

## Premier regard

```bash
file original/crackme    # ELF64 PIE, C++, not stripped
strings -n 5 original/crackme
```

Chaînes : `Enter the password:`, `Login successful`, `Login failed`. Symbole `checkPassword`. Imports `std::reverse`.

## Flow

`main` lit une ligne (`getline`), appelle `checkPassword(input)`.

## Comment on trouve

**Ancrage** : MCP `ida`, Hex-Rays sur `checkPassword` (`0x1275`).

```c
std::string v10 = "dec";          // unk_2005, C-string de 3 caracteres
if (input.length() != 7) return false;

std::string v9;
for (i = 0; i < v10.length(); ++i) {
    if (i == v10.length() - 1) {      // dernier tour de boucle
        v9 += "k";                     // unk_2009
        v9 += "car";                   // unk_200B
    }
    v9 += v10[i];
}
// v9 = "d" + "e" + "k" + "car" + "c" = "dekcarc"

std::reverse(input.begin(), input.end());
return input == v9;
```

Inverser : le mot de passe est simplement `reverse("dekcarc")` = `"cracked"`.

## Vérification

```bash
$ echo cracked | ./original/crackme
Enter the password:
Login successful

$ echo wrong | ./original/crackme
Enter the password:
Login failed
```

## Notes

- Pas de GDB nécessaire : construction de chaîne entièrement statique et déterministe.
- Petit jeu de mots : le mot de passe (« cracked ») est littéralement ce que le challenge demande de faire au binaire.
