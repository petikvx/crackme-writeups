# vodeff — FindLicenseKey

| | |
|---|---|
| **ID** | [`6a2c61c06840520e01b21e2d`](https://crackmes.one/crackme/6a2c61c06840520e01b21e2d) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | vodeff |
| **Plateforme** | Linux ELF64 PIE, stripped, GCC 16.1, C |
| **Difficulté** | 1.8 |
| **SHA-256 (zip)** | `b3a949cb…0a6551` |
| **SHA-256 (ELF)** | `7b768c41c9f7599b2dc955abfa116257fa7d9db0ae9c48ea62b40fd19572c1d8` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/FindLicenseKey.zip` | archive d'origine (non modifiée) |
| `original/FindLicenseKey/findlicensekey` | binaire extrait + `README.txt` de l'auteur (keygen demandé, patch interdit) |
| `analysis/flk.i64.c` | pseudo-C Hex-Rays (`bash -ic 'decc flk'`) |
| `tools/findlicensekey-solve.py` | keygen + `--check` contre le binaire live |

## Réponse

La clé dépend du **username** passé en argv (`./findlicensekey <username>`), 24 caractères :

```
key[i] = T[(name[i] + i) % 62]   pour i = 0..23
T = "QAZPLWSXOKMEYDCIJNRFVUHBTGqpalzmwoeirutyskdjfhgxncbv1750284369"
```

```bash
python3 tools/findlicensekey-solve.py petik_the_crackme_reverser_2026 -q
# bs2gct6cxdxAxb3Q0bO4C6YC
```

| Username | Clé | Remarque |
|---|---|---|
| `petik_the_crackme_reverser_2026` | `bs2gct6cxdxAxb3Q0bO4C6YC` | ≥ 24 car. : déterministe |
| `petik` | `bs2gcW7c82c4Q1S49ZTS8CXQ` | **dépend de la mémoire pile** (voir Pièges) ; valeur obtenue avec `env -i` |

> `petik` (5 car.) est valide mais la clé dépend du contexte d'exécution. Pour une clé reproductible,
> prendre un username d'au moins 24 caractères.

## Premier regard

```bash
file original/FindLicenseKey/findlicensekey
# ELF 64-bit LSB pie executable, x86-64, dynamically linked, stripped
strings -n 5 original/FindLicenseKey/findlicensekey
```

Un `strings` suffit presque : une chaîne de 62 octets sort d'un seul bloc (collée à `2c` de l'ELF header) :
`QAZPLWSXOKMEYDCIJNRFVUHBTGqpalzmwoeirutyskdjfhgxncbv1750284369` — 26 majuscules mélangées, 26 minuscules mélangées, 10 chiffres mélangés = alphabet alphanumérique permuté. Puis `Enter license key to continue:`, `Key validated`, `Invalid key`, `strcmp`, `%255s`.

## Flow

1. `argc == 2` sinon `Error: usage: %s <username>` (exit 2).
2. `sub_1189(argv[1], v5)` calcule la clé attendue dans `v5`.
3. `scanf("%255s", s1)` lit la clé saisie.
4. `strcmp(s1, v5) == 0` → `Key validated`, sinon `Invalid key`.

## Comment on trouve

**Ancrage.** Binaire strippé mais minuscule : `decc` (IDA headless) donne `main` @ `0x121A` et une unique fonction utilitaire `sub_1189` @ `0x1189`, appelée avant le `scanf`. La table est à côté de `strcmp` dans `.rodata`.

**Lecture.** Pseudo-C de `sub_1189` :

```c
for ( i = 0; i <= 23; ++i )
    out[i] = T[(*(char *)(in + i) + i) % 62];   // char signé, T = aQazplwsxokmeyd
out[i] = 0;                                      // 24 chars + NUL
```

Chaque octet de la clé est donc un lookup dans `T` à l'indice `(c + i) % 62`. Pas de XOR ni d'état : c'est une substitution décalée par la position. Le `i` dans l'indice fait que deux lettres identiques donnent des sorties différentes (`AAAA…` → `PLWSXOK…`, la table lue à la suite).

**Assemblage.** Exemple `petik_the_crackme_reverser_2026` (premiers 24 octets `petik_the_crackme_revers`) :

| i | c | c+i | %62 | T[·] |
|---|---|---|---|---|
| 0 | `p`=112 | 112 | 50 | `b` |
| 1 | `e`=101 | 102 | 40 | `s` |
| 2 | `t`=116 | 118 | 56 | `2` |
| 3 | `i`=105 | 108 | 46 | `g` |
| 4 | `k`=107 | 111 | 49 | `c` |

→ `bs2gc…` ✔ (identique à la sortie du solveur).

**Pièges.**
- **Lecture hors chaîne** : la boucle va toujours jusqu'à 23 sans tester le NUL. Un username court laisse la boucle lire les octets *suivant* `argv[1]` en mémoire pile : le `\0` terminateur (→ `T[i]`, ex. `T[5]='W'` pour `petik`), puis le chemin d'exécution (`AT_EXECFN`) / l'environnement. La clé d'un nom court dépend donc du chemin d'appel et de l'env — d'où la recommandation ≥ 24 caractères, et le `--check` du solveur qui lance le binaire sous `env -i` avec le chemin fourni pour reproduire le layout.
- `char` **signé** : un octet ≥ 0x80 donne un indice négatif (`% 62` négatif en C) — le solveur reproduit ce comportement via `s8()`, mais l'ASCII est le cas normal.
- Pas de GDB utilisé : reverse 100 % statique + preuve par exécution directe.

## Vérification

```bash
cd authors/vodeff/6a2c61c06840520e01b21e2d
python3 tools/findlicensekey-solve.py petik_the_crackme_reverser_2026 --check "$PWD/original/FindLicenseKey/findlicensekey"
# bs2gct6cxdxAxb3Q0bO4C6YC
# Enter license key to continue:
# Key validated

python3 tools/findlicensekey-solve.py AAAAAAAAAAAAAAAAAAAAAAAA --check "$PWD/original/FindLicenseKey/findlicensekey"
# PLWSXOKMEYDCIJNRFVUHBTGq  -> Key validated

echo wrongkey | ./original/FindLicenseKey/findlicensekey petik
# Invalid key   (KO)
```

## Notes

- Ce n'est **pas** un hash : transformation réversible, mais le lecteur n'a besoin que du sens direct (keygen).
- Le ZIP contient un dossier `FindLicenseKey/` ; le SHA-256 indexé (`catalog.yml`) est celui du ZIP.
