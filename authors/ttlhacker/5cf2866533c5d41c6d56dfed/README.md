# ttlhacker — hard_software

> [crackmes.one](https://crackmes.one/crackme/5cf2866533c5d41c6d56dfed) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | ttlhacker |
| **Plateforme** | Linux ELF64 PIE, C++ généré, stripé |
| **Statut** | **solved** |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/hard_software_release.zip` | archive du site (SHA-256 d'`ORIGIN.yml`) |
| `original/hard_software` | ELF extrait du zip |
| `original/hard_software_source_encrypted.zip` | sources, mot de passe = la solution |
| `tools/hard-software-solve.py` | inverse le LFSR, `--check` |

## Réponse

32 caractères :

**`r1ppl3_c4rRy_aDD3rs_4rE_s0_sl0W!`**

```text
Password: Thinking about it...
Correct!
```

SHA-1 : `aa4cc69f4eaf8a6d0e5a82be47c20f9612850882`

```bash
python3 tools/hard-software-solve.py
python3 tools/hard-software-solve.py --check
printf 'r1ppl3_c4rRy_aDD3rs_4rE_s0_sl0W!\n' | ./original/hard_software
```

Le zip `hard_software_source_encrypted.zip` s'ouvre avec ce mot de passe.

## Premier regard

L'archive contient l'ELF et un zip de sources chiffré. L'ELF :

```text
ELF64 PIE, dynamiquement lié, stripé, GCC 7.4 (Ubuntu 18.04)
NEEDED : libstdc++.so.6, libc
imports utiles : getchar, putchar, memcmp, operator new
.rodata : 4 octets
.data   : 0x20020 octets à l'adresse 0x205000
```

Aucune chaîne du dialogue n'est dans le fichier. Au lancement :

```text
[hard_software crackme] System initialized. Good luck.
STRANGE PROCESSORS, INC. CENTRAL VAULT SYSTEM V2
...
Password:
Thinking about it...
Wrong, try again!
```

`main` (`0x6c0`) fait un `operator new(0xc48b)`, met le buffer à zéro, puis appelle `sub_7FA` en boucle jusqu'à ce qu'elle renvoie vrai.

## Flow

`sub_7FA` est presque tout le `.text` (environ 15 Ko). Ce n'est pas un flot de contrôle : c'est un circuit. À chaque appel :

1. elle recopie l'état (`0xc48b` octets) ;
2. elle recalcule des centaines de bits par AND, OR et XOR, en lisant l'instruction courante ;
3. elle recommence tant que l'état bouge (`memcmp`) ;
4. puis elle fait l'I/O : `putchar` d'un dword assemblé dans l'état, ou `getchar` dont les bits sont réinjectés un par un.

L'instruction vient de `byte_205020` (fichier `.data`, offset `0x5020`), 32 octets par mot, et chaque octet vaut 0 ou 1. Le compteur, un entier de 12 bits reconstruit par douze signaux à l'offset `49506`, indexe donc 4096 instructions. Le binaire est le netlist d'un petit CPU ; le programme de ce CPU est la ROM.

Ce CPU a des registres, un drapeau zéro, un drapeau de retenue, et un registre à décalage (LFSR) de 12 bits que **chaque** instruction avance, y compris les `nop`. Le pas, bits poids fort en tête :

```text
nouveau_bit = b11 xor b5 xor b3 xor b0
registre    = nouveau_bit : anciens_bits[:-1]
```

## Comment on trouve le mot de passe

Le programme de la ROM affiche le texte, lit une ligne, exige la longueur 32, puis teste chaque caractère `c` avec trois constantes `x`, `y`, `z` qui ne dépendent que de l'indice. Elles sont posées en RAM par `init`, aux indices `0x2b2`, `0x2d2` et `0x2f2`.

```text
LFSR = x xor c
répéter y+1 fois le pas
accepter si LFSR == x xor z
```

Le pas est linéaire, donc

```text
Step^{y+1}(c) = x xor z xor Step^{y+1}(x)
c = Step^{-(y+1)}(x xor z) xor x
```

L'inverse d'un pas remet le bit qui avait été produit par `b11 xor b5 xor b3 xor b0` en tête et décale vers la droite. Les 32 triplets donnent

```text
r1ppl3_c4rRy_aDD3rs_4rE_s0_sl0W!
```

## Vérification

```bash
python3 tools/hard-software-solve.py --check
# ok
```

`petik` :

```text
Wrong, try again!
```

## Notes

- Pas d'anti-debug, pas de code mort : l'auteur le dit, et le `.text` est bien le circuit entier.
- Le même auteur a fait `hell86` (VM sur `SIGILL`) puis `jittery` (JIT). Ici le processeur est simulé porte par porte, et l'adresse des données retombe encore sur `0x205020`.
- La chaîne « ripple carry adders are so slow » est le mot de passe : le circuit paie le temps de propagation des retenues à chaque cycle, d'où le « Thinking about it... ».
