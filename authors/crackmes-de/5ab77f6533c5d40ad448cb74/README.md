# crackmes.de's f1nd_my_k3y5 (rezk2ll)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6533c5d40ad448cb74) · id `5ab77f6533c5d40ad448cb74`

Keygenme **ELF32** NASM (mirror crackmes.de → crackmes.one).  
Auteur site : **crackmes.de** / auteur réel : **rezk2ll**.

| Fichier | Rôle |
|---|---|
| [`original/f1nd_My_k3y5.zip`](original/f1nd_My_k3y5.zip) | archive site |
| [`original/f1nd_My_k3y5`](original/f1nd_My_k3y5) | ELF extrait |
| [`original/README.txt`](original/README.txt) | brief auteur |
| [`tools/f1nd-my-k3y5-solve.py`](tools/f1nd-my-k3y5-solve.py) | keygen |
| [`analysis/ok.txt`](analysis/ok.txt) | `Yep , you Are correct !` |

## Réponse

| Input | Exemple |
|---|---|
| Key (13 chars) | **`AAAAAAAAAoy~!`** |

```bash
python3 tools/f1nd-my-k3y5-solve.py -q
# AAAAAAAAAoy~!

printf 'AAAAAAAAAoy~!\n\n' | ./original/f1nd_My_k3y5
# … Yep , you Are correct !
```

> Le binaire lit jusqu’à 14 octets puis, après le message, **attend un `\n`** (boucle `read(1)`). D’où le second `\n` en pipe.

---

## Prédicat

13 caractères. Pour chaque index `i`, un gadget fait :

```text
if pwd[i] == BAN[i]: infinite loop
out[i] = (pwd[i] + ADD[i]) ^ XOR[i]
ecx += out[i]
```

Puis `ecx -= 0x40` ; succès ssi `ecx == 0x3da` **et** le dernier transform `== 0x2b` (⇒ `pwd[12] == '!'`).

| i | ban | + | ⊕ |
|---|---|---|---|
| 0 | `l` | 9 | 7 |
| 1 | `S` | 0x11 | 7 |
| 2 | `a` | 7 | 3 |
| 3 | `N` | 4 | 2 |
| 4 | `f` | 6 | 5 |
| 5 | `i` | 0x10 | 0x45 |
| 6 | `g` | 5 | 8 |
| 7 | `P` | 7 | 3 |
| 8 | `0` | 7 | 3 |
| 9 | `O` | 1 | 8 |
| 10 | `P` | 7 | 3 |
| 11 | `E` | 7 | 3 |
| 12 | `S` | 7 | 3 |

Somme des transforms = **`0x41a`** (1050). Beaucoup de clés valides — le solveur en génère une.

## Notes

- Obfuscation : calling convention « pop return / leave password on stack », patches `'O'`/`'0'` et soustractions/shl sur un buffer **non utilisés** pour le prédicat final.
- README auteur : *make a keygen that generates valid keys*.
