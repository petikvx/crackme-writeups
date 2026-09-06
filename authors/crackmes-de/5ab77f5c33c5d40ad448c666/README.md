# crackmes.de's j666 (josamont)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5c33c5d40ad448c666)

ELF32 josamont (pas de section headers). Password **hex 8 chars** sur **fd1** (PTY) ; la valeur doit égaler les **4 premiers octets** de l’instruction `@0x8048096`.

| Fichier | Rôle |
|---|---|
| [`original/j666.tar.gz`](original/j666.tar.gz) | archive |
| [`original/j666`](original/j666) | ELF |
| [`tools/j666-solve.py`](tools/j666-solve.py) | solveur |
| [`analysis/ok.txt`](analysis/ok.txt) | OK / Well done |

## Réponse

| Password | **`04919AB9`** |

`04919AB9` little-endian = octets `B9 9A 91 04` = préfixe de `mov $imm32, %ecx` `@0x8048096`.

```bash
python3 tools/j666-solve.py --check
```

## Debug GDB (pas à pas)

Entry **`0x8048091`** (pas `0x8048074` : ce bloc est un **checksum** du code appelé en premier).

```bash
gdb -nx -q ./original/j666
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) info registers eip        # 0x8048091
(gdb) x/40i $eip
(gdb) x/20i 0x8048074           # somme octets → @0x8049292
```

| Adresse | Rôle |
|---|---|
| `0x8048091` | `call 0x8048074` — checksum `[0x8048074 … 0x804819a]` |
| `0x80480b4` | `read(fd=1, buf@0x80491d8, 8)` |
| `0x80480ca` | parse hex → dword `@0x8049289` |
| `0x80480d4` | XOR-decode strings (`0x13579ace`) |
| `0x80480de`…`0x80480e8` | `cmpsb` 4 : ESI=`0x8048096`, EDI=`0x8049289` |
| `0x80480fd` | succès (message court déchiffré) |

```text
(gdb) break *0x80480c8
(gdb) break *0x80480e8
(gdb) run
# TTY : 04919AB9 + Entrée  (8 hex, fd1 / PTY)
(gdb) print/d $ebx              # 1
(gdb) continue
(gdb) x/8c 0x80491d8
(gdb) x/4bx 0x8048096           # b9 9a 91 04
(gdb) x/wx 0x8049289            # 0x04919ab9 après parse
(gdb) continue
```

**PTY / fd1** : même famille que j333–j555. Ne pas rediriger stdin sous GDB ; pour le batch, `tools/j666-solve.py --check`.

Self-check : le password n’est « secret » que parce qu’il **est** le début du code après le `call` checksum — `x/wx 0x8048096` suffit une fois le mapping OK.

## Notes

- Digits hex `0-9A-F` (soustraction `0x7` si `al ≥ 10` après `-0x30`).
- Checksum initial : utile anti-patch grossier ; sous GDB soft breakpoints logiciels modifient un octet → éventuellement à surveiller si le check est relu plus tard (ici le parse teste aussi un dword code via XOR).
