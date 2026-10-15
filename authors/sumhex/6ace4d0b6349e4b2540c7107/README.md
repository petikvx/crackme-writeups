# sumhex — RiJiN crackme

> **Statut : EN COURS, PAS RÉSOLU.** Reverse avancé (flux applicatif confirmé,
> fonction de vérification localisée), mais mot de passe **non trouvé**.
> Difficulté officielle : **4.5** — la plus élevée rencontrée ce soir.
> Labels crackmes.one : Anti-debugging, IsDebuggerPresent, Packer, Code
> virtualization / VM, Control-flow obfuscation. **Zéro solveur public** listé.

| | |
|---|---|
| **ID** | [`6ace4d0b6349e4b2540c7107`](https://crackmes.one/crackme/6ace4d0b6349e4b2540c7107) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | sumhex |
| **Plateforme** | Windows PE32+ x86-64, **GUI**, stripped to external PDB, 364 KB |
| **SHA-256** | `4a6d0572400555e8c2fb2ec7be31bf5beca437c46b822b41ed948f93afdde8de` |

## Description officielle (crackmes.one)

> *"crackme with RiJiN's loader design, obfuscated by obfus.h (by DosX)"*

`obfus.h` est un obfuscateur C/C++ public connu (flattening de flot de
contrôle, prédicats opaques, junk bytes anti-désassemblage).

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/sumhex.exe` | binaire |
| `analysis/NOTES.md` | notes complètes de l'investigation |
| `tools/angr-harness-verify.py` | harnais d'exécution symbolique angr sur le vérificateur |
| `tools/angr-sweep-lengths.py` | balayage de longueurs de mot de passe |

## Ce qui est confirmé (décompile IDA, fiable)

Le mot de passe se saisit via la **boîte de dialogue Windows native**
`CredUIPromptForWindowsCredentialsW` (comme une invite d'identifiants système),
pas une fenêtre custom. Flux (fonction `sub_401a14`, entièrement lisible) :

1. Garde initiale (`sub_439301`, probablement anti-debug — proche de l'import
   `IsDebuggerPresent`).
2. `CredUIPromptForWindowsCredentialsW` → `CredUnPackAuthenticationBufferW`
   (titre « sumhex crackme », nom d'utilisateur pré-rempli **`@mov_eax_4`**,
   un clin d'œil cosmétique sans rapport avec la logique).
3. Le mot de passe est réduit en ANSI ; **un seul caractère non-ASCII invalide
   silencieusement la tentative**.
4. **`sub_44A76C(password, len, out_buf, 0x100)`** est le vrai vérificateur —
   retour non nul → succès (`dword_45D038 = 1`).
5. Message final « find the key » (succès) vs « wrong key, keep reversing » /
   « wrong key, try again » (échec) — pas de texte « Congratulations » explicite.

## Le piège : `sub_44A76C` est protégé par `obfus.h`

Illisible directement : prédicats opaques toujours vrais/faux par construction
(`x+x²` toujours pair, `(x)⁴ & 0xE` toujours nul…) et une chaîne de **dispatchs
par pointeur de fonction calculé** (`call *(adresse XOR constante)`) qui saute
entre des dizaines de fonctions trampolines.

**Fausse piste écartée** : `sub_44F188`, appelée en tête avec un « magic » dans
`eax` (`mov eax, 0x13A0; call sub_44F188`), ressemble à un dispatcher de VM —
mais son désassemblage brut révèle que c'est en réalité un **`__chkstk`**
standard MSVC (stack-probe), juste confus par Hex-Rays à cause de son prologue
non conventionnel. `eax` = taille de pile à allouer, pas un opcode de VM.

Plus loin, le code calcule un sélecteur de branche à partir de **l'adresse de
la pile elle-même** (`(rsp-68)>>4 XOR 0xD4655C11`) — potentiellement une vraie
dépendance d'exécution (ASLR), pas seulement de l'obfuscation cosmétique.

## Tentative d'exécution symbolique (angr)

```bash
pip install angr && pip install claripy==9.3.7 --no-deps
python3 tools/angr-sweep-lengths.py
```

Exécute `sub_44A76C` avec un mot de passe entièrement symbolique (ASCII
imprimable), longueurs 1 à 24. **Résultat actuel : toutes les longueurs testées
donnent le même chemin (61 blocs, zéro branchement, `RAX = 0` concret)** — le
chemin exploré ne dépend d'aucun octet du mot de passe, donc échoue toujours
sans jamais atteindre la vraie comparaison. Testé aussi le candidat posté en
commentaire public par `arshi` (`LwDYrgFzXpnB87K4tySLZJjyg6tRNFXNfgkFx96yNdBHZqgY`,
**non confirmé comme solution validée** — cette page ne liste aucun solveur,
contrairement à BoxVM) : échec également dans ce harnais, mais sans garantie
que le harnais soit fidèle (voir limite ci-dessous).

## Pourquoi ce n'est pas concluant

L'état symbolique démarre directement à `sub_44A76C`, pas depuis une vraie
exécution du programme. Si le sélecteur de branche basé sur l'adresse de pile
est une vraie dépendance (pas juste tautologique), mon harnais peut suivre un
chemin « mort » qui échoue toujours sans jamais atteindre la logique réelle.
Impossible de comparer avec une vraie exécution ici : le binaire est une
application **GUI**, et l'automatisation d'interface graphique
(`xvfb`/`xdotool`) n'est pas disponible dans cette session — la connexion à
l'affichage X réel de la machine est bloquée par le bac à sable de l'agent
(limite d'environnement délibérée, non contournée).

## À faire pour une résolution complète

Voir [`analysis/NOTES.md`](analysis/NOTES.md) § À faire : démarrer l'état
symbolique plus tôt (depuis `sub_401a14`, avec de vrais hooks CredUI), explorer
plus largement avec `angr`, ou obtenir une exécution concrète (Unicorn ou vraie
machine Windows) si l'adresse de pile s'avère être une vraie dépendance.
