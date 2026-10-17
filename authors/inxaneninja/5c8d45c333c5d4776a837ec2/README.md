# inxaneninja — Keygen Practice

| | |
|---|---|
| **ID** | [`5c8d45c333c5d4776a837ec2`](https://crackmes.one/crackme/5c8d45c333c5d4776a837ec2) |
| **Auteur** | inxaneninja |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `27595634a8dc7528dac6268f36b71df087f55d7f362121033c03160949d0867c` (binaire `license` extrait) |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/license` | binaire d'origine |
| `tools/keygenpractice-solve.py` | mot de passe gabarit (`-q`, `--check`) |

## Réponse

**Gabarit** : `sum(ord(c) pour c dans argv[1]) * len(argv[1])² == 0xcdaa` (52650). Exemple : `HHHHHHHHJ` (9 caractères, somme ASCII = 650).

```bash
./original/license 'HHHHHHHHJ'
python3 tools/keygenpractice-solve.py --check
```

## Premier regard

```bash
file original/license    # ELF64 PIE, not stripped
strings -n 5 original/license
```

Chaînes : `Usage: %s <password>`, `Good job!`, `Wrong password!`.

## Flow

`main(argc, argv)` additionne chaque octet de `argv[1]` multiplié par `strlen(argv[1])²`, et exige un total égal à `0xcdaa`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/license | awk '/<main>:/,/^$/'`.

```asm
; boucle sur i = 0..strlen(pw)-1
73b: movsx rax,[pw+i]          ; ebx = (char) pw[i]
754: imul ebx,eax               ; ebx *= strlen(pw)   (1ere strlen)
76c: imul edx,eax               ; edx = ebx * strlen(pw)  (2e strlen, meme valeur)
774: add eax,edx                ; accumulateur += edx
799: cmp eax,0xcdaa ; jne echec
```

Donc : `somme(pw[i]) * len(pw)^2 == 52650`. Comme un même facteur `len(pw)` est utilisé deux fois, c'est bien un carré, pas un simple produit — facile à mal lire en diagonale.

### Recherche d'une solution

```python
target = 0xcdaa   # 52650
for n in range(1, 30):
    if target % (n*n): continue
    s = target // (n*n)
    if 32*n <= s <= 126*n:      # atteignable avec des caracteres imprimables
        print(n, s)             # -> n=9, somme=650
```

9 caractères, somme ASCII = 650 : 8×`'H'` (72) + 1×`'J'` (74) = 576+74 = 650 → `"HHHHHHHHJ"`.

## Vérification

```bash
$ ./original/license 'HHHHHHHHJ'
Good job!

$ ./original/license 'wrongpass'
Wrong password!
```

## Notes

- Pas de GDB nécessaire : calcul entièrement statique et déterministe.
- Gabarit à solutions multiples : n'importe quelle chaîne de longueur `n` dont la somme ASCII vaut `52650/n²` (quand ce quotient est entier et atteignable) convient.
