# s4r — fuckalight2

> [crackmes.one](https://crackmes.one/crackme/5b58ebc433c5d46b771434a7) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | s4r |
| **Plateforme** | Linux ELF32 statique, packé UPX 3.94 |
| **Statut** | **solved** |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/fuckalight2.bin` | binaire packé (preuve live) |
| `analysis/fuckalight2.unpacked` | `./tools/upx-3.96 -d` |
| `tools/fuckalight2-solve.py` | les trois mots de passe |

## Réponse

Trois lignes, dans l'ordre des boss.

| Boss | Mot de passe |
|---|---|
| Callisto | **`U8JZnpU5nD`** |
| Titan | **`REbtr3L65GEK`** |
| Ganymede | **`m173aDjELq`** |

La dernière ligne du programme :

```text
You're free, hero.
```

```bash
python3 tools/fuckalight2-solve.py
python3 tools/fuckalight2-solve.py -q
python3 tools/fuckalight2-solve.py --check
printf 'U8JZnpU5nD\nREbtr3L65GEK\nm173aDjELq\n' | ./original/fuckalight2.bin
```

## Premier regard

```text
original/fuckalight2.bin : ELF32, statique, pas de section headers
DIE                      : UPX 3.94 (NRV)
```

```bash
./tools/upx-3.96 -d -o analysis/fuckalight2.unpacked original/fuckalight2.bin
# 3.0 Mo → 19.6 Mo, ELF32 statique, symboles locaux, entrée 0x8048074 (_start)
```

`strings` ne donne pas le texte du jeu. `nm` liste environ 470 000 symboles `labelN`. Le binaire n'est pas strippé, mais les noms ne disent rien.

Lancé, il affiche, caractère par caractère :

```text
Welcome fellow explorer. You've just entered the forge.
...
----------First: Callisto----------
Callisto: "Enter the password"
You:
```

Une mauvaise ligne tue le joueur (`Callisto hit you in the head and instantly killed you.`).

## Flow

`_start` (`0x8048074`) charge `esi` avec `0x867b000` (le `.bss`, 30 000 octets à zéro) puis l'avance de 3. Tout le `.text` est une seule routine : `inc/dec esi`, `add/sub byte [esi], 1`, `cmp byte [esi], 0` / `je` / `jne`, et `int 0x80`.

C'est du Brainfuck compilé tel quel :

| Opcode | Brainfuck |
|---|---|
| `46` `inc esi` | `>` |
| `4e` `dec esi` | `<` |
| `80 06 01` | `+` |
| `80 2e 01` | `-` |
| `8a 1e` / `80 fb 00` / `je` | `[` |
| `jne` vers le `[` | `]` |
| `mov eax, 4` / `ebx, 1` / `edx, 1` / `int 0x80` | `.` |
| `mov eax, 3` / `ebx, 0` / `edx, 1` / `int 0x80` | `,` |
| `mov eax, 1` / `int 0x80` | fin |

On compte 1483 écritures d'un octet, **3** lectures (`0x80b3c3e`, `0x819b24c`, `0x82c81b8`) et un `exit`. Chaque lecture est un octet sur la bande. Les trois sites sont les trois boss : la même instruction `,` est dans une boucle, donc une ligne entière passe par un seul site.

La boucle de saisie (autour de l'op Brainfuck qui correspond à `0x80b3c3e`) stocke les caractères **moins 11**, un toutes les 4 cases, et s'arrête sur le saut de ligne (le `\n` n'est pas gardé). Pour `Hello` :

```text
case 806 = 'H' - 11 = '='
case 810 = 'e' - 11 = 'Z'
case 814 = 'l' - 11 = 'a'
...
```

Le test vient ensuite. Trois longueurs : Callisto 10, Titan 12, Ganymede 10. Une longueur fausse ou un caractère faux part sur le message de mort du boss en cours. Il n'y a pas de `strcmp`.

## Comment on trouve les mots de passe

### Ancrage

Décompression UPX, puis `objdump -d -M intel` sur l'unpacké (les symboles `labelN` sont là). Le premier `int 0x80` de lecture est à `0x80b3c3e` :

```asm
mov    ecx, esi          ; buffer = case courante de la bande
mov    eax, 3            ; sys_read
mov    ebx, 0            ; stdin
mov    edx, 1            ; un octet
int    0x80
```

`strace -e write,read` montre que tout l'affichage est `write(1, "W", 1)`, `write(1, "e", 1)`, etc. Rien n'est une chaîne C.

### Callisto

Longueur 10. Le premier octet doit valoir `0x55` (`U`). Les neuf suivants vérifient `s[i] - 3 == C[i]` avec

```text
C = 55 35 47 57 6b 6d 52 32 6b 41
```

Donc `s[i] = C[i] + 3` pour `i > 0` :

```text
U  8  J  Z  n  p  U  5  n  D
```

### Titan et Ganymede

Même boucle de lecture, plus loin dans le Brainfuck (`0x819b24c`, puis `0x82c81b8`). Titan attend 12 caractères, Ganymede 10. Les tests ne sont plus un simple `s[i] - 3` : chaque boss a son bloc arithmétique sur la bande. Les lignes qui traversent les trois sont :

```text
U8JZnpU5nD
REbtr3L65GEK
m173aDjELq
```

## Vérification

```bash
python3 tools/fuckalight2-solve.py --check
# ok
printf 'U8JZnpU5nD\nREbtr3L65GEK\nm173aDjELq\n' | ./original/fuckalight2.bin
```

```text
Callisto: Hmm, well played, let's see what you can do against Titan.
...
Titan: "Wow, you're powerful. Ganymede is coming, ..."
...
Ganymede: "Good job, you beat me. You're the one, the last keeper of the forge."
...
You're free, hero.
```

Callisto juste, Titan faux (`wrong`) :

```text
You underestimated the strength of Titan. His frost killed you.
```

`petik` meurt dès Callisto.

## Notes

- UPX ne cache que la taille. Le programme est le Brainfuck, pas un binaire C obfusqué au-dessus.
- `fuckalight2` est décrit par l'auteur comme « the father of fuckalight, obviously harder ». Ce dossier ne couvre que celui-ci.
- Le drapeau n'est pas une chaîne `flag{…}`. La victoire est la dernière réplique, `You're free, hero.`
