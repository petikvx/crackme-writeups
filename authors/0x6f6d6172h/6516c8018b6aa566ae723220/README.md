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


## Debug GDB (pas à pas)

ELF64 **EXEC** (pas de PIE), non strippé. Entry `0x400450`, `main` `@0x400546`. Mapping live : `0x400000` r-xp.

Le flag n’est pas un vrai prédicat utilisateur : `main` reconstruit une chaîne (boucle + `puts`). Sous GDB on le voit directement.

```bash
export DEBUGINFOD_URLS=
gdb -nx -q ./original/crackme1
(gdb) set debuginfod enabled off
(gdb) break main
(gdb) run
# main=0x400551
(gdb) disassemble main
(gdb) continue
# flag{not_that_kind_of_elf}
```

Batch équivalent :

```bash
gdb -nx -batch -ex 'set debuginfod enabled off' -ex 'break main' -ex 'run' \
  -ex 'disassemble main' -ex 'continue' -ex 'quit' ./original/crackme1
```

`solution_summary` : `flag{not_that_kind_of_elf}` (puts en clair).

## Notes

- Jeu de mots ELF / elfe ; `puts` de la chaîne en clair dans `.rodata`.
- Fichier source nommé `babys_first_elf.c` dans les strings.
