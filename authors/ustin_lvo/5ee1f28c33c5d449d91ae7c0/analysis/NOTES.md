# Keygenme 9411 — notes (pas résolu)

ELF32 dynamique, stripé, ~6,5 Mo. L'archive `original/keygenme.7z` contient `keygenme` (extrait à côté). Pas de write-up public. La description dit que 9411 est la taille des sources, en octets.

## Comportement

```text
Enter username
Enter license key
Wrong license key
```

`petik` / `HELLO-KEY` est refusé. Les chaînes ne sont pas contiguës dans le fichier : `putchar` uniquement. Imports : `getchar`, `putchar`, `strlen` (jamais appelé sur cet essai), `malloc`, `realloc`, `exit`, `sigaction`.

## Obfuscation

C'est un binaire **M/o/Vfuscator** (Christopher Domas) :

- `.data` plein de tables de traduction ASCII (l'ALU n'est faite que de `mov`) ;
- `sigaction(SIGSEGV, …)` et `sigaction(SIGILL, …)` au démarrage ;
- le handler SIGSEGV est `0x8048340` (`jmp dword [0x867c354]`) ;
- le handler SIGILL est `0x80483c7` ;
- la fin du `.text` (`0x80d18ff`) est `mov cs, eax`, qui lève SIGILL à chaque « instruction » virtuelle.

Un passage complet fait environ 2219 SIGILL et 70 SIGSEGV. La trace de ces fautes est **identique** pour les clés `AAAA` et `BBBB` : le flot ne dépend pas de la clé (les deux côtés d'un test sont des `mov`). Compter les signaux ne distingue donc pas un bon caractère.

`gdb` meurt sur le SIGTRAP initial si on le « pass » au processus. Sans breakpoint, il faut avaler ce premier SIGTRAP (ptrace) et laisser passer SIGILL / SIGSEGV.

## Ce qui a été revu ensuite

`0x80d18ff` (`mov cs, eax`) est le seul point SIGILL : tout le `.text` entre `0x80483c7` et là est une longue suite de `mov` (le scheduler M/o/Vfuscator). Chaque faute y revient. Environ 2219 SIGILL par essai.

`putchar@plt` (`0x8048320`) émet exactement trois lignes, 51 caractères :

```text
Enter username\n
Enter license key\n
Wrong license key\n
```

`strlen` n'est pas appelé. `AAAA` et `BBBB` donnent la même trace de fautes : le test est sans branche.

Sous ptrace, le nom et la clé se retrouvent côte à côte dans un buffer stdin (`petik\nHELLO\n`) et dans un petit bloc alloué (`11 00 00 00` / chaîne / `51 00 00 00`). Rien à côté qui ressemble à une clé calculée en ASCII.

## Piste suivante

Demovfusquer le scheduler (le sélecteur d'instruction est dans les `mov` de `0x80483c7`, tables `0x80e70b0`) pour retrouver le C d'origine (~9411 octets) et écrire le keygen `petik → …`. Pas de write-up public.
