# crackmes.de's rascal999 encrypt

> [crackmes.one](https://crackmes.one/crackme/5ab77f6033c5d40ad448c8b3) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | rascal999 (miroir crackmes.de) |
| **Plateforme** | Linux ELF32, FreeBASIC, GCC 4.1 |
| **Statut** | **parked** — chiffre connu, mots de passe inconnus |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/encrypt.tar.gz` | archive du site |
| `original/encrypt` | outil chiffre / déchiffre |
| `original/crackme` | message chiffré (318 octets) |
| `original/readme.txt` | deux entiers, pas de virgule dans le clair |
| `analysis/NOTES.md` | reprise |
| `tools/encrypt-solve.py` | déchiffre si on passe `--p1` et `--p2` ; `-q` sort 2 |

## Où on en est

Le binaire demande **password 1** et **password 2**, des entiers. Ils ne sont pas dans le binaire. `RANDOMIZE` utilise le MT19937 FreeBASIC (algo 3). Chaque caractère bouge de `round(10*RND)` ∈ 0..10 : d’abord ajout (graine 1), puis soustraction (graine 2). Le déchiffrement inverse l’ordre.

Les 15 premiers octets du clair sont un mot de 15 lettres (pas d’espace possible avant). `Congratulations` est le meilleur candidat du dictionnaire (`|P−C|` ≤ 6). Aucune paire de graines dans ±8 millions ne produit ce préfixe, ni les cinq autres mots du dico qui tiennent dans la fenêtre. La recherche au-delà a été arrêtée.

Détail et commande de reprise : [`analysis/NOTES.md`](analysis/NOTES.md).
