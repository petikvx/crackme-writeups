# s0k1t — GO GO GO - Harmful Logic

| | |
|---|---|
| **ID** | [`6044083333c5d42c3d016d3d`](https://crackmes.one/crackme/6044083333c5d42c3d016d3d) |
| **Auteur** | s0k1t |
| **Plateforme** | Linux ELF64 **statique, Go** (go1.16, 1,39 Mo), strippé |
| **SHA-256** | `593879a07a2690c2d58434d2f1fe2cd1a07a76080e70b1c8d31e1ad79ec9adfd` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/main` | binaire d'origine |
| `analysis/main.i64` | base IDA (gitignorée) |
| `tools/harmfullogic-solve.py` | décode le mot de passe (`-q`, `--check`) |

## Réponse

**Mot de passe : `solarwinds123`**

```bash
echo solarwinds123 | ./original/main      # Password Plox: / Welcome
python3 tools/harmfullogic-solve.py --check
```

## Premier regard

`go version -m original/main` confirme un binaire Go 1.16 statique. `file` : strippé, pas de table de symboles (`nm` : no symbols). `strings` : `Password Plox: `, `try again loser`, et beaucoup de bruit runtime Go (`reflect`, `fmt`…).

## Flow

`main.main` : `fmt.Fprintf("Password Plox: ")`, `fmt.Fscan` lit la saisie, décode une constante hexadécimale interne, compare (`runtime.memequal`) à la saisie → « Welcome » ou « try again loser ».

## Comment on trouve

**Ancrage** : MCP `ida` (idalib + Hex-Rays, le Go-analyzer d'IDA retrouve `main.main` malgré le stripping grâce à `pclntab`). Pseudo-code de `main.main` :

```c
v9 = runtime_stringtoslicebyte(v8, "736f6c617277696e6473313233", 26);   // constante hex, 26 caractères
v4 = encoding_hex_Decode(...);                                          // decodage hex -> 13 octets
if (len(input) == len(decoded) && runtime_memequal(input, decoded, len) != 0)
    puts("Welcome");
else
    puts("try again loser");
```

`736f6c617277696e6473313233` (hex) → **`solarwinds123`**. Clin d'œil probable à l'attaque SolarWinds (2020).

## Vérification

```text
$ echo solarwinds123 | ./main   -> Password Plox: / Welcome
$ echo wrong          | ./main   -> Password Plox: / try again loser
```

## Notes

- Reverse avec le MCP `ida` (nécessaire : binaire Go statique strippé, pas de `GoReSym` installé sur cette machine) + essais live.
