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

---

## Debug GDB (pas à pas)

ELF32 **statique / stripped**. Entry `0x804903a`. **`sys_read` sur fd 2** → sous GDB/TTY : `run 2<&0` ou `2<&0` dans le shell.

```bash
gdb -q ./original/lucky_numbers
(gdb) starti
(gdb) x/25i $eip
```

| Adresse | Rôle |
|---|---|
| `0x8049050` | `read` : `ebx=2`, buf `@0x804a024`, len 2 |
| `0x8049066` | digits ASCII → binaires |
| `0x8049076` | `adc` + `daa` |
| `0x804907c` | `cmp al, 0x16` |
| `0x8049080` | `cmp bl, '8'` (`0x38`) |

```text
(gdb) break *0x804907c
(gdb) run 2<&0
# saisir 88
(gdb) print/x $al               # 0x16 si OK
(gdb) print/c $bl               # '8'
```

Lucky number **`88`** : somme BCD via ADC/DAA == `0x16` et 2ᵉ chiffre `'8'`.

