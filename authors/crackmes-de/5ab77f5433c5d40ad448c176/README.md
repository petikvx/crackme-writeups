# Console Infinity (promix17)

| | |
|---|---|
| **ID** | [`5ab77f5433c5d40ad448c176`](https://crackmes.one/crackme/5ab77f5433c5d40ad448c176) |
| **Auteur (site)** | crackmes.de (réimport) — auteur original **promix17** |
| **Plateforme** | Windows, Win32 console, C/C++ (MSVC) |
| **Difficulté** | 2.0 |
| **SHA-256 (zip)** | `83c79eb680fe1e9caa957b1c8e306d4e582bad7db62bd16ece1edc138596985b` |

## Solution

Un mot de passe valide (il y en a des milliers) :

```
Password!WErUPHacker!I35mP5pygInfinity!LoL!
```

Le programme ne gère pas d'utilisateur : le nom d'exemple `petik` n'intervient pas.

## Premier regard

- `ConsoleInfinity.exe` a **81 sections** nommées `Packer` de 0x20 octets chacune, et le point d'entrée est à `0x467000` : une chaîne de petits stubs qui déchiffrent `.text` / `.data`. Aucune chaîne utile (`Enter password:` incluse) n'est visible en statique.
- Le Read_me prévient : *Patches aren't allowed*.

## Comment on trouve

1. **Dump après décompression.** Pas besoin de comprendre le packer : on lance le binaire sous Wine, on le laisse bloqué sur la saisie, puis on lit l'image `0x400000..0x480000` via `/proc/<pid>/mem` du processus Wine. Le dump contient en clair `Well done!`, `Infinity!`, `Hacker!`, `Password!`, `Enter password:`.
2. **Xref.** L'adresse `0x414100` (`Password!`) n'est référencée qu'à `0x401182`, au milieu de la fonction de vérification `0x4010e0` (désassemblage dans [`analysis/check_dumped.asm`](analysis/check_dumped.asm)).
3. **Contraintes** lues dans `0x4010e0` (buffer `[ebp-0x54]`, lu par `cin >>`) :
   - `strlen == 0x2B` (43) ;
   - `strncmp(buf+0x00, "Password!", 9)`, `strncmp(buf+0x0E, "Hacker!", 7)`, `strncmp(buf+0x1E, "Infinity!", 9)` ;
   - `buf[0x2A] == '!'` ;
   - `hash(buf, 0xFFFFFF) == 0x209DD8`.
   Entre chaque test, un `GetTickCount` : si plus de 164 ms (`0xA4`) se sont écoulées, appel de `0x401000`, une boucle infinie (anti pas-à-pas).
4. **Le hash** (`0x401020`) : pour chaque caractère d'indice `i`, `a += ch; c ^= ch; a += c; c = ~c; c >>= 2; c ^= (u8)a; c ^= (u8)(i<<3); a ^= c*i*~a`, puis retour `a % 0xFFFFFF`.
5. Il reste 17 caractères libres (positions 9–13, 21–29, 39–41). Une cible sur 24 bits se trouve par force brute aléatoire en quelques millions d'essais : [`tools/consoleinfinity-brute.c`](tools/consoleinfinity-brute.c) trouve la solution ci-dessus en 0,1 s.

## Vérification

- **Emulation du vrai code** : la fonction `0x401020` du dump, exécutée avec Unicorn sur la solution, renvoie bien `0x209DD8`.
- **Live sous Wine** : avec la bonne saisie, le programme part dans la boucle de succès (`Well done!` puis attente d'une touche via `_kbhit`) ; avec un caractère changé il se termine immédiatement (`TerminateProcess`). L'affichage de `Well done!` reste dans le tampon de `cout` quand on pilote le programme par un pipe, donc on ne le voit pas dans la sortie capturée.

## Fichiers

- [`tools/consoleinfinity-solve.py`](tools/consoleinfinity-solve.py) : hash réimplémenté + générateur (`--new`).
- [`tools/consoleinfinity-brute.c`](tools/consoleinfinity-brute.c) : brute rapide en C.
- [`analysis/check_dumped.asm`](analysis/check_dumped.asm) : vérification désassemblée depuis le dump mémoire.
