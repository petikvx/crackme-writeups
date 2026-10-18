# RadonCoding's binsafe

| | |
|---|---|
| **ID** | [`6ad4ab462c7537120cbe832b`](https://crackmes.one/crackme/6ad4ab462c7537120cbe832b) |
| **Auteur (site)** | RadonCoding |
| **Auteur (local)** | radoncoding |
| **SHA-256** | `93bee7316ad4043a923e033be104911c43a9346387847f8ad393f500d04c0a14` |

## Origine

- Page : https://crackmes.one/crackme/6ad4ab462c7537120cbe832b
- Download : https://crackmes.one/download/crackme/6ad4ab462c7537120cbe832b
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Contenu

```
original/   # binaire d'origine
analysis/   # IDA, screenshots
tools/      # solveur, recon
```

## Status

- [ ] reverse
- [ ] write-up
- [ ] solveur

## Notes de reprise (non résolu)

- PE64 MinGW packé/virtualisé par **binsafe** (sections `💀` rwx et `☠️`, imports vides, API résolues à l'exécution, logique dans une VM à bytecode : le désassemblage linéaire est inexploitable).
- Le programme est un **Lights Out 8×8** en console VT (`[R] reset`, `[Esc] quit`). Plateau initial fixe, 8 octets `20 64 18 8e 63 83 66 94` à `0x11fd90` (pile du thread principal, bit c de l'octet r = colonne c de la ligne r, ● = 1).
- Disposition écran (0-based) : cellules A–H aux colonnes 9, 11, …, 23, lignes 3 à 10 ; ligne 15 = « Keys [R] reset [Esc] quit ».
- Entrée : `ReadConsoleInputA`, mode console `0x91` (mouse + processed + extended), un enregistrement à la fois dans un tampon pile à `0x11fe10` (`MOUSE_EVENT` = type 2, COORD en `0x11fe14`).
- Sous Wine/Xvfb (`wineconsole`), un clic sur `[Esc] quit` (colonne 28, ligne 15) quitte le jeu : les clics sont donc bien interprétés. En revanche **aucun clic sur les cellules ne modifie le plateau** (ni mémoire ni écran), ni en pty ni en console graphique ; répondre à `ESC[16t` n'y change rien.
- Rendu correct seulement dans un pty Wine ; `wineconsole` affiche les séquences VT brutes.
- `tools/inject.c` : injecteur d'événements console (`WriteConsoleInputA`, s'attache à la console du jeu via `AttachConsole`). Un `ReadProcessMemory` depuis Wine permet de lire le plateau (le `/proc/<pid>/mem` natif est bloqué par yama).
- `relay` (`WINEDEBUG=+relay`) fait quitter le jeu (timing anti-debug).
- Piste : jouer le jeu sous Windows pour voir comment un coup est accepté, puis solveur GF(2) 64×64 ; ou tracer la VM au niveau du handler d'événement souris.
