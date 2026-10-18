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


## Reprise 2026-10-18 (natif Windows, toujours non résolu)

Sous **Windows natif** (pas Wine) le jeu réagit aux clics : l'échec précédent venait de Wine. Outils : `tools/win-oracle.py` (lance le jeu dans une console neuve, localise le plateau en mémoire, injecte des clics via `WriteConsoleInputW`, relit) et `tools/win-collect-pairs.py` ; données dans `analysis/pairs-hash-board.json` (351 triplets `historique, hash, plateau`).

Faits établis (reproductibles) :

- Plateau initial affiché = `0x946683638e186420` (bit `r*8+c`, ● = 1). Cellule *(r,c)* cliquable en console aux coordonnées buffer **colonne `9+2c`, ligne `32+r`** (fenêtre console 120 col, rows 29+).
- **Ce n'est pas un Lights Out classique** : un coup retourne ~30 cellules (pseudo-aléatoire, avalanche complète), n'est ni involutif (A1,A1 ≠ init) ni commutatif (A1,B1 ≠ B1,A1) ni affine sur GF(2) (résidu ~31 bits sur une relation de dépendance).
- Un coup = un événement *button-down* (move/release seuls ne font rien) ; indépendant du timing et de la forme de l'événement. Un vrai clic matériel (`SetCursorPos` + `mouse_event`) donne **le même plateau** que l'injection → c'est la vraie mécanique, pas un artefact.
- **Le plateau en mémoire est un simple affichage** : écrire dedans n'a aucun effet sur le coup suivant (A1 depuis `0` donne la même chose que le 3ᵉ A1 de la chaîne). L'état dépend uniquement de la **séquence des cellules cliquées** ; `R` remet l'état initial.
- Sur la pile, à `plateau-0x28`, un qword = **hash FNV-1a 64 bits** : `0xcbf29ce484222325` (offset basis) à l'init, puis `0x8b35222e9137b0e9` après A1, `0x244013c55f62d09a` après B1… Le plateau est une **fonction pure** de ce hash (0 conflit sur 240 hashes) mais non affine. Écraser ce qword n'a aucun effet (la VM garde l'état réel dans ses registres virtuels).
- Le mot XORé dans le tour FNV (`h·P⁻¹ ⊕ h_prev`) n'est **pas** un octet/une cellule simple : pas de FNV-1a ≤4 octets (MITM), pas de FNV sur les 8 octets du plateau (ancien/nouveau, LE/BE, toggle voisins), pas de mixeur classique (splitmix/fmix/xorshift) du hash vers le plateau. Il dépend aussi de l'état précédent (pas une table `w[c]`).
- Les constantes FNV ne sont pas dans le fichier ni dans l'image dumpée : la logique est virtualisée par binsafe.

Pistes : tracer la VM (handlers dans la section rwx `💀`) autour du handler d'appui pour retrouver (1) la mise à jour de `h`, (2) la fonction `plateau = f(h)`, puis inverser (probable : cible `h*` telle que `f(h*)=0`, atteinte par MITM sur la chaîne FNV inversible) ; ou chercher une condition de victoire autre que « plateau = 0 ».
