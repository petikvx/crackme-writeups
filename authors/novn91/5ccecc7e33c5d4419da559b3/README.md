# novn91 — crackmepal

| | |
|---|---|
| **ID** | [`5ccecc7e33c5d4419da559b3`](https://crackmes.one/crackme/5ccecc7e33c5d4419da559b3) |
| **Auteur** | novn91 |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `1b7d7c5ae2b5cd333dd539185581ccf5f74ba2e8c48e3a047b7bc9a44a50a59a` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackmeMario` | binaire d'origine |
| `tools/crackmepal-solve.py` | mot de passe gabarit (`-q`, `--check`) |

## Réponse

**Gabarit** : mot de passe (`argv[1]`) de 9 caractères, caractère à l'indice 4 = `-`, et contenant au moins un `@` n'importe où.

```bash
./original/crackmeMario 'xxxx-@xxx'
python3 tools/crackmepal-solve.py --check
```

## Premier regard

```bash
file original/crackmeMario     # ELF64 PIE, not stripped
strings -n 5 original/crackmeMario
```

Chaînes : `usage <password>`, `good job! now keygen me!`, `try again pal.`. Symbole `fail`.

## Flow

`main(argc, argv)` : exige `argc==2`, `strlen(argv[1])==9`, `argv[1][4]=='-'`, puis balaie toute la chaîne à la recherche d'un octet `0x40` (`@`).

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/crackmeMario | awk '/<main>:/,/^$/'`.

```asm
118c: call strlen ; cmp rax,0x9        -> longueur == 9
11af: movzx eax,[pw+4] ; cmp al,0x2d   -> pw[4] == '-'
1181: mov [rbp-0x1d],0x40              -> cible de recherche = '@'
11d4..1208: boucle sur tous les indices, compare chaque octet a 0x40,
            si trouve: flag=1 et sort                -> "contient au moins un '@'"
120a: xor eax,1 ; test ; je succes      -> succes si flag==1 (trouve)
```

## Vérification

```bash
$ ./original/crackmeMario 'xxxx-@xxx'
good job! now keygen me!

$ ./original/crackmeMario wrongpass
try again pal.
```

## Notes

- Pas de GDB nécessaire : trois conditions lisibles directement en asm statique.
- `fail()` est la fonction qui affiche `try again pal.` (`puts` sur une chaîne dédiée) ; `main` l'appelle à chacun des trois points d'échec (mauvaise longueur, `[4] != '-'`, pas de `@`).
