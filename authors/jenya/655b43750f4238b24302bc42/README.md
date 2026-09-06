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

---

## Debug GDB (pas à pas)

ELF64 **statique / stripped**, pas de PIE. Entry `0x401000`. Buffer input `@0x402000`.

```bash
gdb -q ./original/main
(gdb) starti
(gdb) x/30i $rip
```

| Adresse | Rôle |
|---|---|
| `0x40102d` | `read(0, 0x402000, 0x32)` |
| `0x40106a` | check palindrome (deux pointeurs) |
| `0x4010a1` | strlen jusqu’au `\n`, `cmp rbx, 3` |
| `0x401039` / `0x40104a` | `"Correct"` / `"Wrong"` |

### Voir le buffer et le palindrome

```text
(gdb) break *0x40102f          # après read
(gdb) run < <(printf 'aba\n')
(gdb) x/s 0x402000
(gdb) break *0x401094          # cmp al, ah (extrémités)
(gdb) continue
(gdb) print/c $al
(gdb) print/c $ah              # doivent matcher à chaque pas
```

Échec volontaire :

```text
(gdb) run < <(printf 'abc\n')
# au cmp : 'c' vs 'a' → jne → "Wrong"
```

### Longueur ≥ 3

```text
(gdb) break *0x4010bd
(gdb) run < <(printf 'aa\n')
(gdb) print $rbx               # 2 → jl Wrong
(gdb) run < <(printf 'aba\n')
(gdb) print $rbx               # 3 → OK, ret vers Correct
```

Ordre réel du binaire : **palindrome d’abord**, puis longueur (les deux doivent passer).

---

## Vérification

```bash
printf 'aba\n' | ./original/main
# Correct
python3 tools/linux-asm-jenya-solve.py --check
```

## Notes

- `solution.txt` dans le ZIP confirme palindrome + len > 2.
- Suite : [math_crackme](../659ffe1beef082e477ff59d0/).
