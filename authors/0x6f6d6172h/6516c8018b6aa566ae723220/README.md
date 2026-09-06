# 0x6f6D6172h — crackme1

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6516c8018b6aa566ae723220) · id `6516c8018b6aa566ae723220`

ELF64 dynamique (GCC), **non strippé**. Le flag est affiché tel quel.  
Auteur : [0x6f6D6172h](https://crackmes.one/user/0x6f6D6172h).

| Fichier | Rôle |
|---|---|
| [`crackme1`](original/crackme1) | binaire |
| [`crackme1-solve.py`](tools/crackme1-solve.py) | flag + `--check` |

## Réponse

| Flag |
|---|
| **`flag{not_that_kind_of_elf}`** |

```bash
./original/crackme1
# flag{not_that_kind_of_elf}
```

## Notes

- Jeu de mots ELF / elfe ; `puts` de la chaîne en clair dans `.rodata`.
- Fichier source nommé `babys_first_elf.c` dans les strings.
