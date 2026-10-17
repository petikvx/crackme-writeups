# jeffli6789 — bubbly

| | |
|---|---|
| **ID** | [`5f00a02533c5d4285070947a`](https://crackmes.one/crackme/5f00a02533c5d4285070947a) |
| **Auteur** | jeffli6789 |
| **Plateforme** | Linux ELF64 PIE, C, strippé |
| **SHA-256** | `4f31749483e71f76c0efa867c505a37fb8198d923b3d557e431ace9bc7d26ec5` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/main` | binaire d'origine |
| `analysis/main.i64` | base IDA (auto-analyse + Hex-Rays) |
| `tools/bubbly-solve.py` | calcule la séquence d'index de swaps (`-q`, `--check`) |

## Réponse

**Entrée : la liste d'index suivante, un par ligne** (termine dès que le tableau interne est trié) :

```
2 3 4 5 7 9 10 13 15 17 18 1 4 12 14 16 17 0 11 15 16 15
```

```bash
python3 tools/bubbly-solve.py --check
python3 tools/bubbly-solve.py -q | tr ' ' '\n' | ./original/main
```

## Premier regard

```bash
file original/main      # ELF64 PIE, stripped
strings -n 5 original/main
```

Chaînes : `cat flag.txt`, `Well done!`, `Try again!`. Import `scanf`, `system`. Binaire strippé → pas de symboles utiles, on passe directement à IDA.

## Comment on trouve

**Ancrage** : MCP `ida` (`open_database` sur `original/main`, puis Hex-Rays sur `main` à `0x660`, strippé mais petit — 5 fonctions utilisateur seulement).

```c
// main (simplifie)
while (1) {
    scanf("%d", &v11);
    if (v11 > 0x12) break;              // index hors [0,18] -> abandon
    // swap XOR : dword_201020[v11] <-> dword_201020[v11+1]
    v5 = arr[v11+1] ^ arr[v11];
    arr[v11] = v5;
    v6 = arr[v11+1] ^ v5;
    arr[v11+1] = v6;
    arr[v11] ^= v6;
    // controle de tri croissant sur les 20 cases
    v7 = &arr[1]; v8 = arr[0];
    while (1) {
        if (*v7 < v8) break;             // pas trie -> retour au scanf
        ++v7; v8 = *v7_prev;
        if (v7 == &arr[20]) { puts("Well done!"); system("cat flag.txt"); return 0; }
    }
}
puts("Try again!");
```

Le programme attend en boucle un **index `i` (0..18)** et échange `arr[i]` / `arr[i+1]` (tableau `dword_201020`, 20 entiers, dans `.data`), puis vérifie si le tableau est devenu trié croissant. C'est littéralement un bubble-sort piloté depuis stdin : on « est » l'algorithme de tri.

### Valeurs initiales du tableau

Lues directement en mémoire via le MCP `ida` (`db.bytes.get_byte_at` sur `dword_201020`, 20×4 octets, `.data`) :

```
[1, 2, 6, 0, 3, 5, 4, 8, 7, 12, 9, 10, 13, 17, 11, 18, 14, 19, 16, 15]
```

### Assemblage de la réponse

Un bubble-sort classique (passes successives, swap sur toute inversion adjacente) sur ce tableau donne directement la séquence d'index à envoyer (`tools/bubbly-solve.py`) — 22 swaps au total, dans l'ordre produit par l'algorithme. N'importe quelle séquence de swaps valides qui trie le tableau fonctionnerait (le check ne regarde que l'état final), celle-ci est juste la plus simple à calculer.

## Vérification

```bash
$ python3 tools/bubbly-solve.py --check
22 swaps : [2, 3, 4, 5, 7, 9, 10, 13, 15, 17, 18, 1, 4, 12, 14, 16, 17, 0, 11, 15, 16, 15]
check: OK - ['Well done!']

$ printf '0\n0\n0\n99\n' | ./original/main
Try again!
```

(Le `99` final sort de la plage `[0,18]` et casse volontairement la boucle pour montrer le chemin KO ; `0 0 0` ramène d'ailleurs le tableau à son état initial sans jamais le trier.)

## Notes

- Pas de GDB nécessaire : tout le prédicat tient dans le pseudo-code Hex-Rays d'une seule fonction `main`.
- `flag.txt` n'est pas fourni dans ce dépôt (le binaire fait juste `system("cat flag.txt")` — en l'absence du fichier, `cat` échoue silencieusement mais `Well done!` s'affiche quand même, ce qui suffit à prouver la résolution).
