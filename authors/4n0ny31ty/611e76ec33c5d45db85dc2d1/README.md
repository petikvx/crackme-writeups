# 4N0NY31TY — 4N0NY31TY's First Crackme

| | |
|---|---|
| **ID** | [`611e76ec33c5d45db85dc2d1`](https://crackmes.one/crackme/611e76ec33c5d45db85dc2d1) |
| **Auteur** | 4N0NY31TY |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (`input`, `len`) |
| **SHA-256** | `3400f61cd80ce6794178a9d557f8ca50f03d7a485abf62f199799db40ece790b` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme` | binaire d'origine |
| `tools/4n0ny31ty-solve.py` | génère une licence valide (`--length`, `-q`, `--check`) |

## Réponse

Gabarit, pas de licence unique : il faut une chaîne dont **la somme des codes ASCII** vaut `13543 − 10·longueur`. Exemple (150 caractères, `Q`×43 + `P`×107) :

```text
QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
```

```bash
printf '%s\n' 'QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP' | ./original/crackme   # License is valid!
python3 tools/4n0ny31ty-solve.py --check
```

**Piège** : la saisie doit se terminer par un retour à la ligne. `input()` lit caractère par caractère via `getchar` et agrandit le buffer par `realloc` ; sans `\n` final, le programme échoue avec « Error While Reallocating Memory! ».

## Premier regard

`strings` : `Enter License: `, `License is valid!`, `Invalid license!`, `Error While Reallocating Memory!`. Symboles `input`, `len`, `main`.

## Flow

`main` @ `0x12da` : `input()` lit la licence dynamiquement ; somme les codes ASCII de tous ses caractères ; compare à `len(licence) · (−10) + 0x34e7`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/crackme | awk '/<main>:/,/ret/'`.

```asm
1306..1319: boucle : somme += (signed char) licence[i]
1327: call len                      ; longueur de la licence
133d: imul eax,eax,0xfffffff6       ; longueur * (-10)
1340: add  eax,0x34e7               ; + 13543
1345: cmp  [somme],eax ; jne échec
```

Donc `somme(codes ASCII) == 13543 − 10·longueur`. Pour une longueur `L` donnée, une solution simple : répartir une valeur moyenne `cible/L` (arrondie) sur tous les caractères, en ajustant quelques-uns pour le reste exact.

## Vérification

```text
$ printf '%s\n' 'QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP' | ./crackme   -> License is valid!
$ printf 'wrong\n' | ./crackme        -> Invalid license!
$ printf 'hello' | ./crackme          -> Error While Reallocating Memory!   (pas de \n)
```

## Notes

- Reverse statique + essais live ; pas de GDB.
