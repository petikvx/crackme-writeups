# 476f64 — easyAF

| | |
|---|---|
| **ID** | [`5eae2d6633c5d47611746500`](https://crackmes.one/crackme/5eae2d6633c5d47611746500) |
| **Auteur** | 476f64 |
| **Plateforme** | Linux ELF64 PIE, C++, non strippé |
| **SHA-256** | `f698b8c11bc1cfd39dbbab6883356e007cd18c0c209b88e598e8c082039aaccb` (binaire extrait ; voir note dans `ORIGIN.yml`) |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/easyAF` | binaire d'origine (extrait de `easyAF.zip`, sans mot de passe sur ce zip interne) |
| `tools/easyaf-solve.py` | mot de passe (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **Mot de passe** | `pass` |

```bash
echo pass | ./original/easyAF
python3 tools/easyaf-solve.py --check
```

## Premier regard

```bash
file original/easyAF            # ELF64 PIE, C++, not stripped
strings -n 5 original/easyAF
```

Chaînes : `Enter the password: `, `Welldone!`, `Nope`. `std::cin`/`std::string` (C++), pas d'anti-debug.

## Flow

`main` lit un `std::string` sur `std::cin`, le compare (`operator==`) à une constante, affiche `Welldone!` si égal sinon `Nope`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/easyAF | awk '/<main>:/,/^$/'` puis `objdump -s -j .rodata`.

```
.rodata @0x2000 :
  2000: 01 00 02 00 00 "pass" 00 "Enter the password: " 00 "Welldone!" 00 "Nope" 00
```

La chaîne `pass` est référencée directement par `lea rsi,[rip+0xddb] # 2005` juste avant l'assignation du `std::string` constant comparé à l'entrée (`operator==` @ `0x13f2`). Aucun calcul, aucune transformation : le mot de passe est en clair dans le binaire.

## Vérification

```bash
$ echo pass | ./original/easyAF
Enter the password: Welldone!

$ echo wrong | ./original/easyAF
Enter the password: Nope
```

## Notes

- Nom du challenge fidèle au contenu : littéralement « easy AF », pas d'obfuscation, pas de reverse dynamique nécessaire.
