# breadleaf — Password and Username guess

> [crackmes.one](https://crackmes.one/crackme/647eeb9b33c5d439389136a8) · C++ ELF64

Deux strings séparées par un espace. Lambda = somme des codes du **username** ; OK si `len(password) == sum`.

## Réponse

| User | Password |
|---|---|
| **`petik`** | n’importe quelle string de **541** caractères |

```bash
python3 tools/password-username-solve.py --check
# … y
```

## Debug GDB (pas à pas)

ELF64 **PIE** C++, non strippé. Entry file `0x1140`, `main` file `0x1240`. Live : base `0x555555554000`, `main` `@0x55555555524b` (après prologue).

Prédicat : `len(password) == Σ ord(username)` — pour `petik` → **541**.

```bash
export DEBUGINFOD_URLS=
PASS=$(python3 -c 'print("A"*541)')
gdb -nx -q ./original/crackMe
(gdb) set debuginfod enabled off
(gdb) break main
(gdb) run < <(printf 'petik %s\n' "$PASS")
# main @ base+0x1240
(gdb) info proc mappings
(gdb) disassemble main
```

`solution_summary` : `petik` + any password len=541 (=Σord).

