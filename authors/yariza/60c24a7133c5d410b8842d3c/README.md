# Yariza — Keygen Me

| | |
|---|---|
| **ID** | [`60c24a7133c5d410b8842d3c`](https://crackmes.one/crackme/60c24a7133c5d410b8842d3c) |
| **Auteur** | yariza |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (`check_pw`, `donut`) |
| **SHA-256** | `5c1175f0a6734a92ec75e7e9c8e32b9c8fd9997db4017ff344327472ed21e6b0` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/keygen.me` | binaire d'origine |
| `tools/yariza-keygen-solve.py` | génère une clé valide (`-q`, `--check`) |

## Réponse

Gabarit : seuls 4 octets de la clé (passée en `argv[1]`) sont vérifiés, le reste est libre. Il faut au moins 16 caractères.

| Index | Caractère |
|---|---|
| 4 | `@` |
| 6 | `-` |
| 9 | `l` |
| 15 | `?` |

**Exemple : `xxxx@x-xxlxxxxx?`**

```bash
./keygen.me 'xxxx@x-xxlxxxxx?'    # Good job! (puis une animation ASCII "donut" qui ne rend jamais la main)
python3 tools/yariza-keygen-solve.py --check
```

## Premier regard

`strings` : `NICE.,-~:;=!*#$@`, `Checking password`, `Wrong`, `Good job!`, `Usage:`. Symbole `donut` : une animation ASCII (le fameux « donut.c »), affichée en cas de succès — pur effet visuel, sans rapport avec la validation, et qui boucle indéfiniment.

## Flow

`main` @ `0x16f4` : exige `argv[1]`, appelle `check_pw` @ `0x1658`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/keygen.me | awk '/<check_pw>:/,/ret/'`.

```asm
1678: movzx eax,[key+4] ; cmp al,0x40 ; setne dl    ; key[4] == '@'
1688: movzx eax,[key+6] ; cmp al,0x2d ; setne al    ; key[6] == '-'
169d: movzx eax,[key+9] ; cmp al,0x6c ; setne al    ; key[9] == 'l'
16b2: movzx eax,[key+15]; cmp al,0x3f ; setne al    ; key[15] == '?'
16bf: test eax,eax ; je success                       ; les 4 `setne` sont OR-combinés : tout à 0 -> succès
```

Aucune vérification de longueur exacte ni des autres octets.

## Vérification

```text
$ ./keygen.me 'xxxx@x-xxlxxxxx?'   -> Good job! (puis donut)
$ ./keygen.me 'yxxx@x-xxlxxxxx?'   -> Wrong   (index4 altéré)
```

Piège pour le solveur automatisé : en cas de succès, le programme lance `donut()` qui ne se termine jamais ;
`stdout` est de plus pleinement bufferisé vers un pipe, donc « Good job! » n'apparaît qu'avec `stdbuf -o0`
(sinon il reste dans le tampon du processus et se perd quand on le tue).

## Notes

- Reverse statique + essais live ; pas de GDB.
