# Jenya — linux_asm_jenya

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/655b43750f4238b24302bc42) · id `655b43750f4238b24302bc42`

Password **palindrome**, longueur **≥ 3**. ZIP avec source + `solution.txt`.  
Auteur : [Jenya](https://crackmes.one/user/Jenya).

| Fichier | Rôle |
|---|---|
| [`jenya_asm_linux.zip`](original/jenya_asm_linux.zip) | archive site |
| [`main`](original/main) | ELF64 static |
| [`main.asm`](analysis/extracted/source_code/main.asm) | source |
| [`linux-asm-jenya-solve.py`](tools/linux-asm-jenya-solve.py) | check |

## Réponse

| Password | |
|---|---|
| **`aba`** | (ou `noon`, `racecar`, `aaa`, …) |

```bash
python3 tools/linux-asm-jenya-solve.py -q
# aba
printf 'aba\n' | ./original/main
# Correct
```

## Prédicat

```text
len(password sans \\n) >= 3
password == reverse(password)
```

## Notes

- `solution.txt` dans le ZIP confirme palindrome + len > 2.
