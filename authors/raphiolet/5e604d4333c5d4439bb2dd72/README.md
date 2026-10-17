# raphiolet — mgdilolmsoamasiug

| | |
|---|---|
| **ID** | [`5e604d4333c5d4439bb2dd72`](https://crackmes.one/crackme/5e604d4333c5d4439bb2dd72) |
| **Auteur** | raphiolet |
| **Plateforme** | Linux ELF64 PIE, C++, non strippé |
| **SHA-256** | `2c6e01e41cd5350f8fbd25065ccdc817f94629e4ae93cb6bb3f61089b4217200` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/mgdilolmsoamasiug` | binaire d'origine |
| `analysis/mgdilolmsoamasiug.i64` | base IDA |
| `tools/mgdilol-solve.py` | calcule le « guess result » pour un mot donné (`--word`, `-q`, `--check`) |

## Réponse

Il faut saisir **deux lignes** : un mot quelconque, puis le résultat exact de sa transformation interne (gabarit — toute paire *(mot, transformé)* valide fonctionne). Exemple avec l'utilisateur de référence **`petik`** :

| Mot | Guess result |
|---|---|
| `petik` | `iekik` |

```bash
printf 'petik\niekik\n' | ./original/mgdilolmsoamasiug
python3 tools/mgdilol-solve.py --check
```

## Premier regard

```bash
file original/mgdilolmsoamasiug     # ELF64 PIE, C++, not stripped
strings -n 5 original/mgdilolmsoamasiug
```

Chaînes : `Input word: `, `Guess result: `, `Good job!`, `Not exactly...`. `std::string::operator[]`, `::length`, `memcmp` (via `operator==`).

## Flow

`main` lit deux `std::string` (`word`, `guess`), transforme `word` en place, puis compare au `guess` saisi.

## Comment on trouve

**Ancrage** : MCP `ida` sur `original/mgdilolmsoamasiug`, Hex-Rays sur `main`.

```c
std::cin >> word;
std::cin >> guess;
n = word.length();
for (i = 0; i < n; ++i) {
    c = word[i];                 // valeur COURANTE (mutations precedentes visibles)
    word[(unsigned char)c % n] = c;
}
if (guess == word) puts("Good job!"); else puts("Not exactly...");
```

C'est une permutation en place **non triviale à inverser** à la main à cause de l'aliasing : chaque itération peut écrire dans une case déjà visitée (ou future), et les lectures suivantes voient l'état déjà muté — il faut donc **simuler pas à pas**, pas chercher une formule fermée.

### Assemblage de la réponse

Pour `word = "petik"` (`n=5`) :

```
i=0: c=word[0]='p'(0x70) ; idx=0x70%5=2 ; word[2]='p'        -> p e p i k
i=1: c=word[1]='e'(0x65) ; idx=0x65%5=1 ; word[1]='e'         -> p e p i k (inchangé, idx==i)
i=2: c=word[2]='p'(mutée!) ; idx=0x70%5=2 ; word[2]='p'       -> p e p i k (inchangé)
i=3: c=word[3]='i'(0x69) ; idx=0x69%5=0 ; word[0]='i'         -> i e p i k
i=4: c=word[4]='k'(0x6b) ; idx=0x6b%5=2 ; word[2]='k'         -> i e k i k
```

Résultat : `"iekik"`. `tools/mgdilol-solve.py` effectue exactement cette simulation pour n'importe quel mot (`--word`).

## Vérification

```bash
$ printf 'petik\niekik\n' | ./original/mgdilolmsoamasiug
Input word: Guess result: Good job!

$ printf 'petik\nwrong\n' | ./original/mgdilolmsoamasiug
Input word: Guess result: Not exactly...
```

## Notes

- Pas de GDB nécessaire : la boucle est courte et sans effet de bord caché, la simulation Python suffit à reproduire exactement le comportement.
- Le titre du challenge (`mgdilolmsoamasiug`) est lui-même un exemple « mot d'entrée » déjà permuté dans une version antérieure — un indice visuel sur la nature de la transformation.
