# D4RKFL0W — Crack3-by-D4RK_FL0W

| | |
|---|---|
| **ID** | [`5ca0b3f833c5d4419da5567a`](https://crackmes.one/crackme/5ca0b3f833c5d4419da5567a) |
| **Auteur** | D4RKFL0W |
| **Plateforme** | Linux ELF64 PIE, C++, non strippé |
| **SHA-256** | `5f424cea423fcec30c22bd3c351879700935734a108ad14ac68bb51d733dae1e` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crack3-by-D4RK_FL0W` | binaire d'origine |
| `analysis/crack3-by-D4RK_FL0W.i64` | base IDA |
| `tools/crack3-solve.py` | code (`-q`, `--check`) |

## Réponse

**Code à 4 chiffres, saisis un par un : `3`, `6`, `7`, `4`.**

```bash
printf '3\n6\n7\n4\n' | ./original/crack3-by-D4RK_FL0W
python3 tools/crack3-solve.py --check
```

## Premier regard

```bash
file original/crack3-by-D4RK_FL0W   # ELF64 PIE, C++, not stripped
strings -n 5 original/crack3-by-D4RK_FL0W
```

Chaînes : `Please Enter The Passcode:`, `Enter Digit `, `WRONG`, `You Did It.`. Symboles `get_code`, `get_digit`, `check_code`.

## Flow

`check_code()` compare chaque chiffre saisi à `get_digit(pN, 10)` pour `N=1..4`, où `p1`..`p4` sont 4 tableaux fixes de 10 entiers en `.data`.

## Comment on trouve

**Ancrage** : MCP `ida`, Hex-Rays sur `get_digit` et lecture directe des tableaux `p1`..`p4` en mémoire (`db.bytes.get_byte_at`).

```c
int get_digit(int *a, int n) {    // circuit de propagation "carry" bit a bit
    unsigned carry = 0, acc = 0;
    for (i = 0; i < n; ++i) {
        unsigned v6 = (acc & a[i]) | carry;
        unsigned v8 = a[i] ^ acc;
        unsigned v3 = ~(v6 & v8);
        acc   = v3 & v8;
        carry = v3 & v6;
    }
    return acc;
}
```

Tableaux (lus en `.data`) :

```
p1 = [1, 3, 1, 1, 4, 4, 4, 6, 6, 6]
p2 = [10, 10, 10, 6, 70, 70, 70, 35, 35, 35]
p3 = [7, 68, 68, 68, 23, 23, 23, 40, 40, 40]
p4 = [4, 3, 3, 3, 5, 5, 5, 7, 7, 7]
```

Réimplémenter `get_digit` fidèlement en Python (avec masquage 32 bits sur le `~`) et l'appliquer aux 4 tableaux donne directement le code : `3 6 7 4`.

## Vérification

```bash
$ printf '3\n6\n7\n4\n' | ./original/crack3-by-D4RK_FL0W
Please Enter The Passcode:
Enter Digit 1: 
Enter Digit 2: 
Enter Digit 3: 
Enter Digit 4: 

You Did It.
3674
```

## Notes

- Pas de GDB nécessaire : fonction et données entièrement statiques, reproductibles en Python.
- `get_digit` ressemble à un additionneur binaire bit-sériel détourné pour opérer sur des entiers complets — un habillage obfusquant une simple table de constantes.
