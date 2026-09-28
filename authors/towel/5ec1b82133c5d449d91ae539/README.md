# Towel's QR Scanner

> [crackmes.one](https://crackmes.one/crackme/5ec1b82133c5d449d91ae539) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | Towel (0xTowel), NorthSec 2020 |
| **Plateforme** | Linux ELF64, OCaml natif statique |
| **Statut** | **solved** |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/QR_Scanner.7z` | archive du site |
| `original/QR` | ELF extrait (pas de section headers) |
| `tools/qr-scanner-solve.py` | chaîne `q`/`r`, flag = MD5, `--check` |

## Réponse

64 caractères, seulement `q` et `r` :

**`rqrqrrqrqrqqqrrrrqrqqqrqrrqqrqqrqrrrrqqrrrrrqqrqqrqrqqqrrrqrrqrq`**

```text
[+] QR Read Success.

FLAG-72ebf68f0d1f7be90bc52e36cb4a47f9
```

Le flag est `FLAG-` suivi du MD5 de cette chaîne.

```bash
python3 tools/qr-scanner-solve.py
python3 tools/qr-scanner-solve.py -q
python3 tools/qr-scanner-solve.py --check
printf 'rqrqrrqrqrqqqrrrrqrqqqrqrrqqrqqrqrrrrqqrrrrrqqrqqrqrqqqrrrqrrqrq\n' | ./original/QR
```

## Premier regard

```bash
7z x -ooriginal original/QR_Scanner.7z
# original/QR : ELF64 statique, pas de section headers, entrée 0x401b00
```

`strings` tombe surtout sur le runtime OCaml (`caml_startup`, `End_of_file`, `OCAMLRUNPARAM`). Le dialogue, lui, est bien en clair :

```text
Enter QR Code:
[!] Unable to read QR code.
[+] QR Read Success.
FLAG-
```

Le bandeau ASCII « QR » et `NSEC-2020` sont imprimés avant la saisie. `petik` ou `qqqq` donnent « Unable to read ». Une fin de fichier sans ligne lève `Fatal error: exception End_of_file`.

## Flow

Binaire OCaml natif, statique, symboles absents (pas de table de sections). Le programme lit une ligne et la traite comme un code, pas comme une image : l'alphabet utile est `{q, r}`, et une entrée valide fait toujours 64 caractères.

Le test n'est pas un `strcmp`. C'est une batterie de **278 automates** déterministes, environ 700 états chacun au départ. Une chaîne est acceptée seulement si **tous** les automates l'acceptent. Un mauvais préfixe est rejeté par au moins l'un d'eux. `2^64` chaînes, donc pas de force brute directe.

Chaque automate se minimise (états morts enlevés). Sur le premier, il ne reste qu'une centaine d'états et quelques chemins, que l'on écrit en contraintes booléennes : `qN` vrai signifie que le Nième caractère est `q`, faux signifie `r`. L'intersection des 278 formules est un problème SAT. `z3` le résout en une fraction de seconde. Une solution :

```text
rqrqrrqrqrqqqrrrrqrqqqrqrrqqrqqrqrrrrqqrrrrrqqrqqrqrqqqrrrqrrqrq
```

Le binaire l'accepte et imprime `FLAG-` plus `md5(chaîne)`.

## Vérification

```bash
python3 tools/qr-scanner-solve.py --check
# ok
```

```text
[+] QR Read Success.

FLAG-72ebf68f0d1f7be90bc52e36cb4a47f9
```

`qqqq` :

```text
[!] Unable to read QR code.
```

## Notes

- Ce n'est pas un décodeur de QR graphique. Le « code » est la chaîne `q`/`r`.
- Le MD5 n'est pas un secret séparé : il est calculé sur l'entrée acceptée.
- Même auteur que Mars Analytica. Ici le langage est OCaml, pas une VM x86 maison.
