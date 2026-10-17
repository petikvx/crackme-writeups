# nutcake — PieIsMyFav

| | |
|---|---|
| **ID** | [`5c11e1f333c5d41e58e00579`](https://crackmes.one/crackme/5c11e1f333c5d41e58e00579) |
| **Auteur** | nutcake |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `2c7774d411988d5d2eb5c88f5919d01ebd3efb502109dcea4b160fbb57b56818` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/simple` | binaire d'origine |
| `tools/pieismyfav-solve.py` | nombre magique (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **Numéro magique** | `3` |

```bash
echo 3 | ./original/simple
python3 tools/pieismyfav-solve.py --check
```

## Premier regard

```bash
file original/simple    # ELF64 PIE, not stripped
strings -n 5 original/simple
```

Chaînes : `Welcome to the wonderful world of assembly!`, `Qual o numero magico? ` (« quel est le nombre magique ? »), `Essa eh a sua flag!`, `Try harder...`.

## Flow

`main` lit un entier (`scanf("%d")`) et le compare au résultat d'un petit calcul sur deux constantes.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/simple | awk '/<main>:/,/^$/'`.

```asm
115d: v1 = 0x64   (100)
1164: v2 = 0xe    (14)
11b1..11ba: eax = v1*3 + v2        ; (v1 + 2*v1) + v2 = 300 + 14 = 314
11bd: idiv [v1]                     ; 314 / 100 = 3   (division entiere)
11c6: cmp resultat,saisie ; jne echec
```

`(v1*3 + v2) / v1 = (100*3 + 14) / 100 = 314 / 100 = 3`.

## Vérification

```bash
$ echo 3 | ./original/simple
Welcome to the wonderful world of assembly!
Qual o numero magico? Essa eh a sua flag!

$ echo 5 | ./original/simple
Welcome to the wonderful world of assembly!
Qual o numero magico? Try harder...
```

## Notes

- Pas de GDB nécessaire : calcul entièrement statique et déterministe.
- Clin d'œil probable du titre (« Pie is my fav ») : la réponse `3` est aussi le premier chiffre de π.
