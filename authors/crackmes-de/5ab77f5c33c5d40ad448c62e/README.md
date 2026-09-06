# crackmes.de's Crackme3 (S!x0r)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5c33c5d40ad448c62e) · [`ORIGIN.yml`](ORIGIN.yml)

## Réponse

| User | Serial |
|---|---|
| `petik` | **`5C8E-D82D`** |

Username ≥5, serial `XXXX-XXXX` (hex). Hash produit + pow/mod (`0xf2a7`, `0x3ca9d`). Inputs sur **fd 1** (PTY).

```bash
python3 tools/crackme3-sx0r-solve.py --check --user petik
```

## Debug GDB (pas à pas)

ELF32 static strippé, entry **`0x8048080`**. Inputs via **`read` fd=1** (PTY), comme josamont.

```bash
gdb -nx -q ./original/Crackme3
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) x/30i $eip
```

| Adresse | Rôle |
|---|---|
| `0x8048080` | banner `Crackme3 by S!x0r` (`write` `@0x80480f5`) |
| `0x804809e` / `0x80480a8` | `read(fd=1, buf@0x804937c, 0x32)` — username |
| `0x80480bc` / `0x80480c6` | `read(fd=1, buf@0x80493ae, 0x32)` — serial |
| `0x8048102` | helper `read` : `mov ebx,1` ; `int 0x80` |
| `0x80480cb` | `call 0x804810f` — vérif longueurs / tiret / hash |
| `0x8048123` | username `len >= 5` |
| `0x8048140` | serial `len == 9` (`XXXX-XXXX`) |
| `0x804825f` | `cmp edx, [0x80493f0]` — prédicat final |
| `0x8048267` | succès → `Correct, now write a Keygen/Tutorial!` |

```text
(gdb) break *0x80480a8
(gdb) break *0x804825f
(gdb) run
# TTY : petik + Entrée, puis 5C8E-D82D + Entrée (PTY / fd1)
(gdb) x/s 0x804937c
(gdb) continue
(gdb) print/x $edx
(gdb) x/wx 0x80493f0
(gdb) continue
```

`run < file` ne nourrit pas fd1 — utiliser un PTY (solveur `--check`) ou GDB interactif.
