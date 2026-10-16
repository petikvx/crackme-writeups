# YandereMia — Introduction to RE

| | |
|---|---|
| **ID** | [`6940b5870992a052ab22235b`](https://crackmes.one/crackme/6940b5870992a052ab22235b) |
| **Auteur** | YandereMia |
| **Plateforme** | Linux ELF64 PIE, C (`PassGuess.c`), non strippé |
| **SHA-256** | `fa3bdc769c6be91079ae0df2accc430b12e3163e6401d09f04bbd30656059dc2` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/passguess` | binaire d'origine |
| `tools/passguess-solve.py` | lit le mot de passe dans l'ELF (`-q`, `--check`) |

## Réponse

**Mot de passe : `7Wtyr`**

```bash
python3 tools/passguess-solve.py --check
echo 7Wtyr | ./original/passguess     # [OK] Passowrd Found
```

## Premier regard

```bash
file original/passguess
strings -n 4 original/passguess
```

`strings` montre `Guess The Pass: `, `%255s`, `[OK] Passowrd Found`, `[ERROR] Password is incorrect`, et un fragment
`7Wtyr` perdu entre les symboles : c'est le mot de passe, mais rien ne le désigne comme tel.

## Flow

`main` @ `0x1179` : `printf("Guess The Pass: ")`, `scanf("%255s", buf)`, `strcmp(buf, pw)`, puis `puts` OK ou ERROR.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/passguess | awk '/<main>:/,/ret/'`.

```asm
1193: lea  rax,[rip+0xe6a]       # 0x2004 -> pointeur vers le mot de passe
119a: mov  [rbp-0x118],rax       ; pw = 0x2004
11ce: call scanf                 ; "%255s" -> [rbp-0x110]
11d3: mov  rdx,[rbp-0x118]       ; rdx = pw
11da: lea  rax,[rbp-0x110]
11e7: call strcmp                ; strcmp(saisie, pw)
11ec: test eax,eax / jne 1201    ; 0 -> "[OK] ..." sinon "[ERROR] ..."
```

`objdump -s -j .rodata` : à `0x2004`, les octets `37 57 74 79 72 00` = **`7Wtyr`**. Les 4 octets avant (`01 00 02 00`) sont
`_IO_stdin_used`. Aucune transformation de la saisie ni du secret.

## Vérification

```text
$ echo 7Wtyr | ./original/passguess
Guess The Pass: [OK] Passowrd Found
$ echo nope | ./original/passguess
Guess The Pass: [ERROR] Password is incorrect
```

## Notes

- Reverse statique uniquement (pas de GDB). Pas d'anti-debug.
- Faute d'orthographe d'origine : « Passowrd ».
