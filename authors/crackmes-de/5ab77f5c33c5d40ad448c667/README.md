# crackmes.de's j444 (josamont)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5c33c5d40ad448c667)

ELF32 josamont (pas de section headers). Password lu sur **fd1** (PTY), puis **atoi** maison.

| Fichier | Rôle |
|---|---|
| [`original/j444.tar.gz`](original/j444.tar.gz) | archive |
| [`original/j444`](original/j444) | ELF |
| [`tools/j444-solve.py`](tools/j444-solve.py) | solveur |
| [`analysis/ok.txt`](analysis/ok.txt) | `Well done!` |

## Réponse

| Password | **`247356`** |

```bash
python3 tools/j444-solve.py --check
```

`247356 == 0x3c63c` — dword attendu `@0x80491b4`.

## Debug GDB (pas à pas)

Entry `0x8048074`. Comme j333 : **`starti` obligatoire** avant tout dump ; **`read` sur fd1**.

```bash
gdb -nx -q ./original/j444
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) x/50i $eip
```

| Adresse | Rôle |
|---|---|
| `0x8048074` | banner `Crackme 444 Josep\n` |
| `0x8048092` | `read(fd=1, buf@0x804914c, 6)` |
| `0x80480a8` | `call` atoi `@0x80480f6` → stocke `@0x8049196` |
| `0x80480ad`…`0x80480bc` | `repz cmpsb` 4 octets vs expect `@0x80491b4` (`0x0003c63c`) |
| `0x80480d1` | succès → `Well done!` |

```text
(gdb) break *0x80480a6
(gdb) break *0x80480bc
(gdb) run
# TTY : saisir 247356 + Entrée (PTY / fd1 — pas de redirection)
(gdb) print/d $ebx              # 1
(gdb) continue
(gdb) x/s 0x804914c             # "247356…"
(gdb) x/wx 0x8049196            # résultat atoi
(gdb) x/wx 0x80491b4            # 0x0003c63c
(gdb) continue
```

Même contrainte PTY que j333 : GDB interactif OK ; `run < file` non. Preuve scriptée = `tools/j444-solve.py --check`.

## Notes

- L’atoi s’arrête au premier non-digit (le `\n` du mode canonique).
- Comparaison sur **4 octets** little-endian du entier, pas sur la chaîne ASCII.
