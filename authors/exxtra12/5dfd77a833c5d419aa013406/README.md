# Exxtra12 — Ext.challenges (xordemo)

| | |
|---|---|
| **ID** | [`5dfd77a833c5d419aa013406`](https://crackmes.one/crackme/5dfd77a833c5d419aa013406) |
| **Auteur** | Exxtra12 |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (symboles présents) |
| **SHA-256** | `9fdc40e37f9a39ab87f5477f8c76867ac21c0dff860506068d406e9dafb5f982` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/xordemo` | binaire d'origine |
| `tools/xordemo-solve.py` | argument attendu (`-q`, `--check`) |

## Réponse

**Argument (`argv[1]`) : `rungirl34`**

```bash
./original/xordemo rungirl34      # -> Jackpot
python3 tools/xordemo-solve.py --check
```

## Premier regard

```bash
file original/xordemo            # ELF64 PIE, not stripped
strings -n 5 original/xordemo
```

Chaînes : `Need exactly one argument.`, `Jackpot`, fragment `badbeef1` visible dans les constantes immediates. Symbole `checkPassword` présent.

## Flow

`main` exige `argc==2`, passe `argv[1]` à `checkPassword(argv[1])`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/xordemo | awk '/<checkPassword>:/,/^$/'`.

```asm
756: movabs rax,0x3166656562646162  ; "badbeef1" (8 octets LE)
764: mov    WORD PTR [...],0x32     ; + "2\0"       -> cle = "badbeef12"
76a: movabs rax,0x020a170c050a1410  ; cible XOR (8 octets LE)
778: mov    WORD PTR [...],0x6      ; + octet 0x06  -> cible = 9 octets

787..7ae: boucle : out[i] = key[i] ^ argv1[i]   (meme indice, pas cyclique)
7bf: strlen(key)
7d0: strlen(cible)
7e6: strncmp(out, cible, strlen(cible))
```

Donc `out[i] == cible[i]` pour `i` dans `[0, strlen(cible)[`, avec `out[i] = key[i] ^ argv1[i]`. En inversant le XOR : `argv1[i] = key[i] ^ cible[i]`.

### Décodage

```python
key    = b"badbeef12"
target = [0x10, 0x14, 0x0a, 0x05, 0x0c, 0x17, 0x0a, 0x02, 0x06]
answer = "".join(chr(key[i] ^ target[i]) for i in range(9))
# -> "rungirl34"
```

## Vérification

```bash
$ ./original/xordemo rungirl34
Jackpot

$ ./original/xordemo wrong
fail

$ ./original/xordemo
Need exactly one argument.
```

## Notes

- Pas de GDB nécessaire : les deux constantes (clé et cible XOR) sont directement lisibles en immediates dans le désassemblage, pas de calcul dynamique.
- Le nom du binaire (`xordemo`) et le fragment `badbeef1` visible via `strings` sont des indices directs vers la nature de la protection.
