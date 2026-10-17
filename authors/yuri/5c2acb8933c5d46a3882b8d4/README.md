# Yuri — Simple Keygen

| | |
|---|---|
| **ID** | [`5c2acb8933c5d46a3882b8d4`](https://crackmes.one/crackme/5c2acb8933c5d46a3882b8d4) |
| **Auteur** | Yuri |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `95d4e0ba3b1c804e6ad051ef09e242e916bf768661dee835bfec96576839d09c` (binaire `SimpleKeyGen` extrait) |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/SimpleKeyGen` | binaire d'origine |
| `tools/simplekeygen-solve.py` | serial gabarit (`-q`, `--check`) |

## Réponse

**Gabarit, 16 caractères** : 8 paires de caractères consécutifs croissants (`serial[2k+1] == serial[2k]+1`).

```bash
./original/SimpleKeyGen 0123456789ABCDEF
python3 tools/simplekeygen-solve.py --check
```

## Premier regard

```bash
file original/SimpleKeyGen    # ELF64 PIE, not stripped
strings -n 5 original/SimpleKeyGen
```

Chaînes : `%s [SERIAL]`, `Good Serial`, `Bad Serial`. Symbole `checkSerial`.

## Flow

`checkSerial(serial)` exige `strlen(serial)==16`, puis vérifie 8 paires consécutives.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/SimpleKeyGen | awk '/<checkSerial>:/,/^$/'`.

```asm
11b0: cmp rax,0x10 ; je ...      -> strlen(serial) == 16
; boucle i = 0,2,4,...,14 (pas de 2)
11d6: movsx edx,[serial+i]       ; edx = serial[i]
11ec: movsx eax,[serial+i+1]     ; eax = serial[i+1]
11ef: sub edx,eax                ; edx = serial[i] - serial[i+1]
11f3: cmp eax,0xffffffff ; je ok ; doit valoir -1 -> serial[i+1] = serial[i]+1
```

8 paires de caractères consécutifs croissants, sans autre contrainte (n'importe quel caractère de départ convient pour chaque paire).

## Vérification

```bash
$ ./original/SimpleKeyGen 0123456789ABCDEF
Good Serial

$ ./original/SimpleKeyGen wrongwrongwrong1
Bad Serial
```

## Notes

- Pas de GDB nécessaire : boucle entièrement statique et déterministe.
- Gabarit à solutions multiples : toute chaîne de 16 caractères composée de 8 paires `(c, c+1)` convient (ex. `"aAbBcCdDeEfFgGhH"`).
