# Bkamp — glow wine [keygen practice]

| | |
|---|---|
| **ID** | [`5df26b4033c5d419aa013362`](https://crackmes.one/crackme/5df26b4033c5d419aa013362) |
| **Auteur** | Bkamp |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `6054843d0b4228b8a2a60b25be18bb6e205c0a9da5f6393569cda520ea8c2f43` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/glowwine` | binaire d'origine |
| `tools/glowwine-solve.py` | clé (`-q`, `--check`) |

## Réponse

**Gabarit** : clé de 5 caractères, `key[1]=='@'`, `key[2]+key[3]+key[4]==300` (somme ASCII), `key[0]` libre.

| Clé exemple |
|---|
| `A@ddd` |

```bash
./original/glowwine 'A@ddd'
python3 tools/glowwine-solve.py --check
```

## Premier regard

```bash
file original/glowwine      # ELF64 PIE, not stripped
strings -n 5 original/glowwine
```

Chaînes : `usage: ./glowwine <key>`, `nice one! Now, can you keygen me?`, `wrong key, try again :/`. Fonction décoy `sorrybro` (appelée à chaque échec, sans effet visible autre qu'un `ret`).

## Flow

`main(argc, argv)` : vérifie `argc>1`, `strlen(argv[1])==5`, `argv[1][1]=='@'`, puis `argv[1][2]+argv[1][3]+argv[1][4]==300`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/glowwine | awk '/<main>:/,/^$/'`.

```asm
703: call strlen          ; cmp rax,0x5        -> len(key) == 5
727: movzx eax,[key+1]    ; cmp al,0x40 ('@')  -> key[1] == '@'
747/75c/773: movsx edx/eax,[key+2]/[key+3]/[key+4]
762: add edx,eax ; 779: add eax,edx
77b: cmp eax,0x12c (300)                       -> key[2]+key[3]+key[4] == 300
```

`key[0]` n'est jamais lu : totalement libre. Il suffit de choisir trois caractères ASCII dont la somme fait 300 — `'d'×3 = 100×3 = 300` est le plus simple.

## Vérification

```bash
$ ./original/glowwine 'A@ddd'
nice one! Now, can you keygen me?

$ ./original/glowwine wrong
wrong key, try again :/
```

## Notes

- `sorrybro()` est une fonction décoy appelée à chaque échec de check (juste un `ret`, aucun effet visible) — sans doute pour perturber un reverse trop rapide qui s'attendrait à une fonction de sortie.
