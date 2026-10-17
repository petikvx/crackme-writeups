# Shad3 — Baby Ransom

| | |
|---|---|
| **ID** | [`5ec1a37533c5d449d91ae535`](https://crackmes.one/crackme/5ec1a37533c5d449d91ae535) |
| **Auteur** | Shad3 |
| **Plateforme** | Linux ELF64 PIE, C, strippé |
| **SHA-256** | `a483e1a3d6e270bc34dec5c5d6d3f2d69cb08193e60e0dca0e0e561dbef0e932` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## ⚠️ Ce binaire n'est PAS exécuté dans ce write-up

`covid-19.bin` est un **toy-ransomware** : il ouvre le répertoire courant (`opendir(".")`), chiffre **tous les fichiers réguliers** qu'il y trouve avec un XOR mono-octet, **supprime les originaux** (`remove()`), puis affiche un message de rançon en boucle infinie. Il n'embarque **aucune fonction de déchiffrement** — la seule chose récupérable est la **clé** utilisée pour le chiffrement.

Par prudence (ce dépôt n'exécute jamais un binaire qui supprime des fichiers, même dans un dossier jetable), la clé a été retrouvée **sans lancer le binaire d'origine une seule fois** : uniquement par décompilation statique (Hex-Rays) puis reproduction du générateur pseudo-aléatoire de la libc (`srand`/`rand`) via `ctypes`, qui ne touche à aucun fichier.

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/covid-19.bin` | binaire d'origine (**ne pas exécuter tel quel**, voir ci-dessus) |
| `tools/babyransom-solve.py` | recalcule la clé XOR et vérifie par round-trip en mémoire (`-q`, `--check`) |

## Réponse

**Clé XOR mono-octet : `92` (`0x5c`)**, fixe à chaque exécution.

```bash
python3 tools/babyransom-solve.py --check
```

## Premier regard

```bash
file original/covid-19.bin      # ELF64 PIE, stripped
strings -n 5 original/covid-19.bin
```

Chaînes : message de rançon ASCII-art (« SO YOU THOUGHT COVID-19 IS ONLY A HUMAN'S VIRUS? », adresse BTC), extension `.corona`. Imports : `opendir`, `readdir`, `fopen`, `strcat`, `remove`, `srand`, `rand`, `system("clear")`, `sleep`.

## Flow

`main` (vu via IDA, non strippé au niveau symboles internes bien que le binaire soit marqué « stripped » par `file` — en fait seuls les symboles de debug manquent, les noms de fonctions statiques restent partiellement nommés par Hex-Rays sous forme `sub_XXXX`) :

1. `srand(0xDEADBEEF)` puis `v6 = rand() % 255` — **la clé de chiffrement, fixe**.
2. Calcule `dest` = une sous-chaîne de son propre `argv[0]` pour s'auto-exclure de la boucle.
3. `opendir(".")` puis pour chaque entrée régulière (`stat().st_mode & S_IFMT == S_IFREG`, hors lui-même) : lit octet par octet, XOR avec la clé, écrit dans `./<nom>.corona`, puis **supprime l'original**.
4. Affiche le message de rançon en boucle (`sleep(1)` + `system("clear")`), ne revient jamais.

## Comment on trouve

**Ancrage** : MCP `ida` sur `original/covid-19.bin`, Hex-Rays sur `main` (`0xc99`).

```c
srand(0xDEADBEEF);
v6 = rand() % 255;              // <- toute la "crypto" tient ici
...
fputc((char)(v6 ^ v5), stream); // chiffrement = dechiffrement (XOR)
```

Le générateur est **initialisé avec une graine fixe codée en dur** (`0xDEADBEEF`) : la clé est donc identique à chaque exécution, indépendamment de la machine ou de l'heure. Il suffit de reproduire le PRNG de la libc avec cette graine — **sans jamais lancer le binaire**, qui lui ne ferait qu'exécuter la destruction réelle de fichiers :

```python
import ctypes
libc = ctypes.CDLL("libc.so.6")
libc.srand(0xDEADBEEF)
key = libc.rand() % 255   # -> 92 (0x5c)
```

Comme le XOR est sa propre inverse, un fichier `*.corona` quelconque produit par ce binaire se déchiffre avec `octet ^ 92`.

## Vérification

Round-trip XOR purement en mémoire, sur un fichier factice dans un répertoire temporaire jetable (jamais le binaire original, jamais de fichier réel du dépôt) :

```bash
$ python3 tools/babyransom-solve.py --check
srand(0xDEADBEEF) ; rand()%255 = 92 (0x5c)
round-trip XOR: OK
```

## Notes

- **Pas de preuve "live" sur le binaire d'origine** par choix délibéré : ce `crackme` est un simulateur de ransomware qui détruit réellement les fichiers du répertoire où il est lancé (`remove()` après chiffrement, aucune fonction de restauration dans le binaire). L'exécuter, même dans un dossier vide créé pour l'occasion, reviendrait à lancer un programme destructeur — ce que ce dépôt évite systématiquement quand une alternative statique existe (ici : lire la graine et rejouer `rand()` via `ctypes`).
- Si quelqu'un doit restaurer de vrais fichiers chiffrés par ce binaire : `octet_clair = octet_chiffré ^ 92` sur chaque fichier `*.corona`, puis renommer en retirant le suffixe.
