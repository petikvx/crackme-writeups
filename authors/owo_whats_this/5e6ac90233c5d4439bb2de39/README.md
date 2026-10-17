# owo_whats_this — Very Special Number v1

| | |
|---|---|
| **ID** | [`5e6ac90233c5d4439bb2de39`](https://crackmes.one/crackme/5e6ac90233c5d4439bb2de39) |
| **Auteur** | owo_whats_this |
| **Plateforme** | Linux ELF64 PIE, C++, non strippé |
| **SHA-256** | `c8990006a610e4a28e6eb2d78b5d923ecbd0ed7a6da146a8a9444cd590976640` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/OwO_vsn_1` | binaire d'origine |
| `analysis/OwO_vsn_1.i64` | base IDA |
| `tools/vsn1-solve.py` | nombre (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **Nombre** | `109713430479` |

```bash
echo 109713430479 | ./original/OwO_vsn_1
python3 tools/vsn1-solve.py --check
```

## Premier regard

```bash
file original/OwO_vsn_1     # ELF64 PIE, C++, not stripped
strings -n 5 original/OwO_vsn_1
```

Chaînes : `Hi! Can you guess my Special Number?`, `You must be psychic :O`, `Wrong! Try again :)`. Symboles C++ démanglés : `generate()`, `genNum(long long, long long, int, int, long long)`, globales `magic_number1`, `magic_number2`, `magic_arr`.

## Flow

`main` lit un `long long` (`std::cin >> n`) et compare à `generate()`.

## Comment on trouve

**Ancrage** : MCP `ida` sur `original/OwO_vsn_1`, Hex-Rays + désassemblage de `generate()` (`0x12c4`) et `genNum` (`0x1189`).

```c
__int64 generate() { return genNum(magic_number1 + magic_number2, magic_number2, 5, 0, 0); }
```

`genNum` est en réalité **une boucle de 5 itérations suivie d'une récursion en queue**, pas une simple fonction à switch unique (l'IDA pseudocode affiche la récursion mais masque la boucle interne, visible seulement en désassemblage brut : `jg` revient dans le corps de la fonction tant que le compteur `a4` (le 3ᵉ paramètre) reste positif) :

```c
switch (a4 % 5) {        // a4 cycle 0,1,2,3,4 à chaque passage
  case 0: a5 = a2 + 42 + a1;              break;
  case 1: a5 = a1 / (a2 + 3);             break;
  case 2: a5 = a1 - (a2 + 33 + magic_arr[a4]); break;
  case 3: a5 = (a2 - 16) * a1;            break;
  case 4: a5 = a1 % (1000 * a2); a5 >>= 1; break;  // puis case 5 : a5 >>= 1 (fallthrough)
}
```

Constantes lues en mémoire (MCP `ida`, lecture directe des symboles `.data`) : `magic_number1 = 39843943743`, `magic_number2 = 34934743347`, `magic_arr = [15, 2, 487, 567, 298]`.

Retracer à la main la condition exacte de sortie de la récursion (le compteur passe en négatif entre deux appels, sans remonter de façon évidente dans le pseudocode Hex-Rays) coûte plus de temps que d'**exécuter directement la fonction** dans le process réel : voir § Debug GDB.

## Debug GDB (pas à pas)

Au lieu de retracer la récursion de `genNum` à la main, on appelle `generate()` directement dans le process (PIE, mais GDB résout le symbole démanglé sans calcul d'offset manuel) :

```bash
gdb -q -batch \
  -ex 'starti' \
  -ex 'print/d (long long) _Z8generatev()' \
  --args ./original/OwO_vsn_1
```

Observé :

```text
Program stopped.
0x00007ffff7fe3340 in _start () from /lib64/ld-linux-x86-64.so.2
$1 = 109713430479
```

`starti` arrête le process à son tout premier instruction (juste après le chargement de l'interpréteur dynamique, avant même `_start` du binaire) — suffisant pour que `generate()` soit déjà mappée en mémoire exécutable et appelable par GDB via son nom mangled C++ (`_Z8generatev`), sans avoir besoin de calculer la base PIE à la main.

## Vérification

```bash
$ echo 109713430479 | ./original/OwO_vsn_1
Hi! Can you guess my Special Number?
You must be psychic :O

$ echo 123 | ./original/OwO_vsn_1
Hi! Can you guess my Special Number?
Wrong! Try again :)
```

## Notes

- Le nom « genNum » masque une boucle for interne (5 cas de switch enchaînés en séquence, chacun une seule fois) suivie d'une récursion en queue qui réutilise le résultat de la boucle précédente — un style d'obfuscation de flot de contrôle plutôt qu'un vrai calcul complexe.
- Aucune anti-debug : l'appel direct de fonction sous GDB fonctionne sans contournement.
