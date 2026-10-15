# mystergaif — U Can't Pass

| | |
|---|---|
| **ID** | [`69cd36983e328e778db052c2`](https://crackmes.one/crackme/69cd36983e328e778db052c2) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | mystergaif |
| **Plateforme** | Linux ELF64 PIE, non strippé, compilé avec `clang version 21.1.8`, console |
| **Difficulté** | 1.0 |
| **SHA-256** | `ba7c61f81dbeb140cbcbfddbcf0eee2f0ab56118242c868ad8ee559333c116ff` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/main.out` | binaire |
| `tools/ucp-solve.py` | explique le piège + lance la preuve gdb (`--check`) |
| `tools/gdb-force-success.py` | script gdb : force le chemin « Success! » en mémoire |

## Réponse

Il n'y a **pas de mot de passe** : le programme ne lit **aucune entrée** (ni `stdin`, ni `argv`, ni variable d'environnement — `printf` est le seul import présent). Il affiche toujours `Error!`, quoi qu'on lui donne. Le titre est littéral : **« U Can't Pass »** — avec une exécution normale, on ne peut effectivement jamais passer.

```bash
python3 tools/ucp-solve.py
# Pas de mot de passe : le binaire imprime toujours 'Error!' sans intervention externe...
python3 tools/ucp-solve.py --check
# ... Success! force avec succes
```

La seule façon d'obtenir `Success!` est d'intervenir en direct sur l'exécution (debugger) — voir § Debug GDB.

## Premier regard

```bash
file original/main.out        # ELF64 PIE, NON strippé
nm original/main.out | grep " T "
#   main
strings -n 6 original/main.out
#   "Hello in my first programm for crackme.one"
#   "Success!"
#   "Error!"
#   "clang version 21.1.8"
```

Aucun `scanf`/`read`/`fgets` dans les imports (seulement `printf`) : dès le premier regard, impossible qu'il y ait un prédicat « entrée utilisateur → comparaison ».

## Flow

```bash
./main.out            # peu importe les arguments
# Hello in my first programm for crackme.one
# Error!
```

## Comment on trouve

**Ancrage.** Binaire non strippé, `main` @ `0x1150`, lu directement (MCP `ida` + `objdump -d -M intel` pour les adresses, PIE) :

```asm
1150: endbr64
115c: mov DWORD PTR [rbp-0x4], 0x0
1163: lea rdi, "Hello in my first programm..."
116c: call printf
1171: mov DWORD PTR [rbp-0x8], 0xa      ; var_8 = 10, CONSTANTE, jamais lue depuis dehors
1178: cmp DWORD PTR [rbp-0x8], 0xa      ; 1er test : var_8 == 10 ?
117c: je  118e                         ; si egal -> saute par-dessus "Success!"
117e: lea rdi, "Success!\n"
1187: call printf                      ; <-- code mort tant que var_8 == 10
118c: jmp 11a4
118e: cmp DWORD PTR [rbp-0x8], 0xa      ; 2e test, redondant : var_8 == 10 ?
1192: jne 11a2
1194: lea rdi, "Error!"
119d: call printf                      ; <-- toujours execute
```

**Lecture.** `var_8` est écrite en dur à `0xa` (10) juste avant d'être comparée à `0xa` : c'est une **tautologie**. Le premier `je` est donc **toujours pris**, saute systématiquement le `printf("Success!")`, et le second test (redondant, toujours vrai aussi) mène systématiquement à `printf("Error!")`. Il n'existe **aucune valeur d'entrée** capable de changer `var_8` : pas de `scanf`, pas d'`argv[1]` lu, rien. Le bloc « Success! » est du code mort **par construction**, pas par un bug de logique à inverser — le seul levier est de modifier l'état du programme depuis l'extérieur pendant son exécution.

**Assemblage de la réponse.** Il n'y a rien à « assembler » : le challenge consiste à **démontrer** (reproductiblement, sans patcher le fichier) qu'on peut faire bifurquer l'exécution malgré l'absence de toute entrée — via un debugger. Voir ci-dessous.

**Pièges.**
- Chercher un prédicat classique (serial/mot de passe) est une impasse : il n'y en a pas, le binaire n'a aucune voie d'entrée.
- Le second `cmp`/`jne` est redondant avec le premier — pas une seconde chance, juste du code généré tel quel par clang à `-O0`.

## Debug GDB (pas à pas)

Script complet : [`tools/gdb-force-success.py`](tools/gdb-force-success.py).

```bash
gdb -q -batch -ex "source tools/gdb-force-success.py" ./original/main.out
```

1. `break *main+0x28` : casse au premier `cmp DWORD PTR [rbp-0x8], 0xa` (offset calculé en PIE-safe via `main+0x28`, sans dépendre de la base ASLR).
2. À l'arrêt, lecture de `var_8` : `*(int*)($rbp-8)` → **10** (confirme la tautologie).
3. `set variable *(int*)($rbp-8) = 0` : on réécrit cette valeur en mémoire (processus déjà lancé, **fichier `original/main.out` intact**).
4. `continue` → le `je` n'est plus pris (`0 != 10`) → le programme tombe dans le bloc `printf("Success!")`.

Sortie observée :

```
PROOF var_8_before = 10
PROOF var_8_after = 0
Hello in my first programm for crackme.one
Success!
```

Pièges : binaire PIE → casser sur une adresse absolue (`*0x1178`) échoue (« Cannot access memory ») tant que le process n'est pas chargé ; utiliser `*main+0x28` (résolu après le chargement par `run`) plutôt qu'une adresse fixe.

## Vérification

```bash
./original/main.out
# Hello in my first programm for crackme.one
# Error!                      <- toujours, sans gdb

python3 tools/ucp-solve.py --check
# ... Success! force avec succes
```

## Notes

- Pas de patch binaire : `original/main.out` n'est jamais modifié, toute la démonstration se fait en mémoire, dans un process en cours d'exécution (autorisé, contrairement à patcher le fichier).
- Challenge « méta » : le prédicat n'est pas à résoudre mathématiquement, il est à **contourner structurellement** (aucune entrée possible → seule une modification runtime permet d'atteindre le code mort).
