# Harel21 — crackme

| | |
|---|---|
| **ID** | [`6047ffb433c5d42c3d016da6`](https://crackmes.one/crackme/6047ffb433c5d42c3d016da6) |
| **Auteur** | Harel21 |
| **Plateforme** | Linux ELF64 PIE, C, **strippé**, **bug de l'auteur : segfault systématique à l'exécution normale** |
| **SHA-256** | `9d562ab54d31a96a5c90b181eba2564cb561da5b622b654b5d48622c82b717e4` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme` | binaire d'origine (segfault à chaque lancement normal, voir plus bas) |
| `tools/harel21-solve.py` | rejoue la preuve sous gdb (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| Nom | `petik` |
| Serial | `535341` |

```bash
python3 tools/harel21-solve.py --check
```

**`./original/crackme` plante systématiquement** (voir ci-dessous) : la preuve ne peut être faite qu'en appelant les fonctions internes sous GDB.

## Premier regard

Binaire strippé (`nm` : no symbols). `strings` : `yay you have the correct creds :)`, `sorry, better luck next time :(`, `Enter your name`, `Enter the serial`. Lancer le binaire normalement :

```text
$ printf 'petik\n535341\n' | ./original/crackme
Enter your name
Segmentation fault (core dumped)
```

## Flow (voulu, d'après le désassemblage)

`main` (retrouvé via l'entry point de `_start`, @ `0x127e`) : lit un nom (`scanf("%s", name)`), appelle `nameValue(name)` @ `0x1169`, lit un entier (`serial`), appelle `checker(nameValue, serial)` @ `0x124b` qui fait juste `a == b` → « yay you have the correct creds :) ».

## Le bug qui empêche l'exécution normale

```asm
; main @0x127e
12a1: mov rax,[rbp-0x10]     ; <-- lecture d'une variable locale JAMAIS INITIALISÉE
12a8: lea rdi,[rip+...]      ; "%s"
12b4: call scanf             ; scanf("%s", rax)   : écrit à une adresse arbitraire (garbage de pile)
12bd: mov rdi,rax
12c0: call nameValue          ; nameValue(rax)    : relit depuis cette même adresse arbitraire
```

`name` est déclaré comme un pointeur (`char *name`) jamais affecté avant le premier `scanf`. `scanf("%s", name)` écrit donc à une adresse de pile non définie (très probablement valide par chance, le premier `puts` et le `scanf` ne plantent pas), mais l'appel suivant à `strlen` **dans `nameValue`** plante systématiquement (confirmé sous gdb : `SIGSEGV` dans `__strlen_evex`, appelé depuis l'intérieur de la fonction à `0x1169`). C'est un bug de l'auteur, pas une protection : vérifié reproductible à 100 % sur cette machine.

## Comment on trouve (la logique, lue statiquement)

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/crackme --start-address=0x1169 --stop-address=0x1320`.

- `nameValue(name)` : `L = strlen(name)`. Si `L` est **impair** : somme des caractères `name[2..L-2]`, puis `(somme·0x240e)/2 + 1` (arrondi). Si `L` est **pair** : une formule qui ne dépend que de `L` (`13·((L-1)·0x9d9fd / 4) / 3`, lue mais **non recalculée à la main** — voir ci-dessous).
- `checker(a, b)` @ `0x124b` : `a == b` → succès, sinon échec.

Plutôt que de reproduire la formule entière à la main (les idiomes de division par constante de gcc sont sujets à erreur), **la valeur a été obtenue directement sous GDB**, en appelant `nameValue("petik")`.

## Debug GDB (pas à pas)

GDB est **indispensable** ici : il contourne le `main` cassé en appelant les fonctions utiles directement, avec un buffer valide.

```bash
gdb -q ./original/crackme
(gdb) break *0x555555555070      # notre _start (PIE, base 0x555555554000), APRÈS le chargement dynamique
(gdb) run                        # s'arrête avant que le main buggé ne s'exécute
(gdb) call (char*)malloc(32)     # $1 : buffer valide, contrairement au pointeur non initialisé de main
(gdb) call (int)strcpy($1,"petik")
(gdb) call (int)0x555555555169($1)    # nameValue("petik")  -> $3 = 535341
(gdb) call (void)0x55555555524b($3,535341)     # checker(535341,535341)
(gdb) call (void)0x55555555524b($3,535340)     # checker(535341,535340) -> contrôle négatif
(gdb) call (int)fflush(0)        # vide le tampon stdout (sinon les deux messages n'apparaissent pas)
```

Sortie observée :

```text
$3 = 535341
yay you have the correct creds :)
sorry, better luck next time :(
```

Pièges :
- `starti` s'arrête **dans le chargeur dynamique** (`ld.so`), où `malloc`/`strcpy` ne sont pas encore résolus — il faut un breakpoint sur le `_start` **du binaire lui-même** (`0x1070` + base PIE), atteint après le chargement ;
- sans `fflush`, les deux messages de `puts` restent dans le tampon stdio (sortie non-tty) et ne s'affichent jamais ;
- appeler `main` directement aurait planté comme en exécution normale : il faut appeler `nameValue`/`checker` **individuellement**, jamais `main`.

## Vérification

```text
$ python3 tools/harel21-solve.py --check
name = petik
serial = 535341
GDB -> OK: True | KO (serial-1): True
```

## Notes

- `petik` a une longueur impaire (5) : `nameValue` dépend alors du contenu (pas seulement de la longueur), mais la valeur a été lue directement sous GDB plutôt que recalculée à la main.
- Le binaire d'origine n'a pas été patché ; seule son exécution sous GDB (appel de fonctions) a servi à la preuve.
