# crackmes.de 's grainne (stefanie)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5a33c5d40ad448c506)

## Réponse

| Password | **`stefu!u|`** |

Embarqué dans le padding `e_ident` de l'ELF (offset 8).

```bash
python3 tools/grainne-solve.py --check
xxd -l 16 original/grainne
# 00000000: 7f45 4c46 0101 0100 7374 6566 7521 757c  .ELF....stefu!u|
```

## Debug GDB (pas à pas)

Même famille que grainne2 : **`e_shnum`** pourri → GDB refuse l’original. Entry **`0x804800c`**. Password **`stefu!u|`** dans `e_ident[8..15]` @ **`0x8048008`**.

```bash
python3 - <<'PY'
from pathlib import Path
import struct, os
raw = bytearray(Path('original/grainne').read_bytes())
struct.pack_into('<I', raw, 0x20, 0)
struct.pack_into('<HHH', raw, 0x2e, 0, 0, 0)
Path('/tmp/grainne.fix').write_bytes(raw)
os.chmod('/tmp/grainne.fix', 0o755)
PY
gdb -nx -q /tmp/grainne.fix
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) x/16cb 0x8048008
# 's' 't' 'e' 'f' 'u' '!' 'u' '|'
(gdb) x/8cb 0x8048008
(gdb) x/4i $eip
# 0x804800c: … (octets du password réinterprétés comme code ; jne/jmp vers le stub)
```

| Adresse | Rôle |
|---|---|
| `0x8048008` | `e_ident` padding = **`stefu!u|`** |
| `0x804800c` | `e_entry` (au milieu du password / opcodes) |
| `0x804808c`… | corps du crackme (après sauts dans le header) |

```bash
gdb -nx -batch \
  -ex 'set debuginfod enabled off' \
  -ex 'starti' \
  -ex 'x/8cb 0x8048008' \
  -ex 'x/4i 0x804800c' \
  --args /tmp/grainne.fix
```

Comme grainne2 : preuve principale = dump fichier / solveur ; GDB valide que le padding est bien mappé à `0x8048008`. Exec natif souvent en SIGSEGV aujourd’hui.
