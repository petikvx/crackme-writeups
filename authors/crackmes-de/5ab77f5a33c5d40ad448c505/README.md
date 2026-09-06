# crackmes.de 's grainne2 (stefanie)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5a33c5d40ad448c505)

## Réponse

| Password | **`LOVE`** |

Embarqué dans le padding `e_ident` de l'ELF (offset 8).

```bash
python3 tools/grainne2-solve.py --check
xxd -l 16 original/grainne2.bin
# 00000000: 7f45 4c46 0101 0100 4c4f 5645 eb21 eb7c  .ELF....LOVE.!.|
```

## Debug GDB (pas à pas)

ELF32 avec **`e_shnum` absurde** (~65500) → GDB / `file` : *too many section* / format not recognized. Entry **`0x804800c`**. Password **`LOVE`** = `e_ident[8..11]` @ VA **`0x8048008`** (aussi visible en clair dans le fichier).

Copie chargeable (ne touche pas à `LOVE`) :

```bash
python3 - <<'PY'
from pathlib import Path
import struct, os
raw = bytearray(Path('original/grainne2.bin').read_bytes())
struct.pack_into('<I', raw, 0x20, 0)   # e_shoff
struct.pack_into('<HHH', raw, 0x2e, 0, 0, 0)
Path('/tmp/grainne2.fix').write_bytes(raw)
os.chmod('/tmp/grainne2.fix', 0o755)
PY
gdb -nx -q /tmp/grainne2.fix
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) x/8i $eip
# 0x804800c: jmp 0x804802f   (octets eb 21 juste après LOVE)
(gdb) x/16cb 0x8048008
# 'L' 'O' 'V' 'E' ...
(gdb) x/s 0x8048008
# "LOVE"… (jusqu’au prochain NUL / bruit header)
```

| Adresse | Rôle |
|---|---|
| `0x8048008` | padding `e_ident` = password **`LOVE`** |
| `0x804800c` | `e_entry` : `jmp` court (opcodes `eb 21` dans le header) |
| `0x804808c` | suite du stub (2ᵉ `jmp` / init) |

```bash
gdb -nx -batch \
  -ex 'set debuginfod enabled off' \
  -ex 'starti' \
  -ex 'x/16cb 0x8048008' \
  -ex 'x/4i 0x804800c' \
  --args /tmp/grainne2.fix
```

**Note** : l’exec live SEGFAULT souvent sur kernels modernes (ELF « funny ») ; le prédicat utile est la lecture de `e_ident` (solveur / `xxd`), GDB sert à confirmer le mapping VA ↔ padding.
