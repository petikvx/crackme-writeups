# Yekong — Salt and Hash - Linux

| | |
|---|---|
| **ID** | [`644bd78b33c5d43938912c94`](https://crackmes.one/crackme/644bd78b33c5d43938912c94) |
| **Auteur** | Yekong |
| **Plateforme** | Linux ELF64 PIE, **Rust** (4,3 Mo, symboles conservés) |
| **SHA-256 (7z)** | `3ea873edbef0e3e3f0ac17f49982c8ca7e53075e3fca2e322b1dea4158879f32` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/hash.7z` | archive d'origine (chiffrée, mot de passe `crackmes.one`) |
| `analysis/x/hash` | binaire extrait |
| `analysis/hash.i64` | base IDA (gitignorée) |
| `tools/hash-solve.py` | calcule la réponse depuis la constante codée en dur (`-q`, `--check`) |

## Réponse

**Réponse (`--verify`) : `adm1n1strat0r`**

```bash
7z x -pcrackmes.one -oanalysis/x original/hash.7z
echo adm1n1strat0r | ./analysis/x/hash --verify     # Congratulation! You find the answer
python3 tools/hash-solve.py --check
```

## Premier regard

À chaque lancement, le programme affiche un hash **différent** (MD5 **ou** SHA1, en alternance aléatoire) avec deux indices : « Hint 1: Salt is your input », « Hint 2: Do you check what type of hash is used? ». Ces indices pointent vers un vrai cassage de hash salé — **c'est un leurre** : `--verify` ne recalcule jamais ce hash.

## Flow

`hash::main` lit l'option (`--hint`, `--verify`, ou rien) : sans option, affiche un hash aléatoire du couple (entrée, `KEY`) via `md5_salt`/`sha1_salt` ; avec `--hint`, affiche les deux indices ; avec `--verify`, lit une réponse et appelle `check_ans`.

## Comment on trouve

**Ancrage** : MCP `ida` (idalib + Hex-Rays) : fonctions `hash::main`, `hash::md5_salt`, `hash::sha1_salt`, `hash::check_ans` @ `0x106f0`.

```c
// check_ans
v4 = a2[2] == 13
   && (*v3 ^ 0x7473316E316D6461LL | *(QWORD*)((char*)v3 + 5) ^ 0x7230746172747331LL) == 0;
```

`check_ans` **ignore complètement** `md5_salt`/`sha1_salt` : il compare la longueur (13) et deux `qword` qui se recouvrent sur 3 octets (positions 5 à 7) :

```text
octets 0..7  (0x7473316E316D6461, LE) : 61 64 6D 31 6E 31 73 74  ->  a d m 1 n 1 s t
octets 5..12 (0x7230746172747331, LE) : 31 73 74 72 61 74 30 72  ->  1 s t r a t 0 r
                                         (positions 5,6,7 identiques des deux côtés : '1','s','t')
```

Assemblage : **`adm1n1strat0r`** (13 caractères, « administrator » en leetspeak : `i→1`, `o→0`).

Piège : perdre du temps à casser le hash MD5/SHA1 affiché (qui change à chaque exécution et n'est jamais vérifié) au lieu de lire `check_ans`, qui est le seul chemin de succès.

## Vérification

```text
$ echo adm1n1strat0r | ./hash --verify     -> Congratulation! You find the answer
$ echo adm1n1strat0rx | ./hash --verify    -> Wrong answer. Please try again or look the hint
$ echo administrator | ./hash --verify     -> Wrong answer. Please try again or look the hint
```

## Notes

- Reverse avec le MCP `ida` + essais live ; pas de GDB.
- `--verify` ignore l'argument qui le suit sur la ligne de commande : la réponse se saisit sur **stdin**, après l'invite « Enter the answer you find ».
