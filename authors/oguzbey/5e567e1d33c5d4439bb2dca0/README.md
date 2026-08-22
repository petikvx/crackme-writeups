# oguzbey's Lucky Numbers

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5e567e1d33c5d4439bb2dca0) · id `5e567e1d33c5d4439bb2dca0`

Crackme **ELF32** Linux asm, strippé.  
Auteur : **oguzbey**.

| Fichier | Rôle |
|---|---|
| [`original/lucky_numbers`](original/lucky_numbers) | binaire |
| [`tools/lucky-numbers-solve.py`](tools/lucky-numbers-solve.py) | solveur |
| [`analysis/ok.txt`](analysis/ok.txt) | `Good Job !` |

## Réponse

| Input | Valeur |
|---|---|
| Lucky number | **`88`** |

```bash
printf '88' | ./original/lucky_numbers 2<&0
# Lucky Numbers: Good Job !
```

> `sys_read` sur **fd 2** (comme FindThePassword1) → `2<&0`.

---

## Analyse

Lit 2 octets, `sub` ASCII → digits, `adc al, bl` puis **`daa`**, exige `AL == 0x16` et second digit **`'8'`**.  
`8+8=16` → après DAA `0x16`. Difficulty **1.5**.
