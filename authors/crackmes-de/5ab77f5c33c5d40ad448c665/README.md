# crackmes.de's j555 (josamont)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5c33c5d40ad448c665)

ELF32 josamont (pas de section headers). Password sur **fd1** (PTY) ; atoi puis compare à **`0xcafede`**.

| Fichier | Rôle |
|---|---|
| [`original/j555.tar.gz`](original/j555.tar.gz) | archive |
| [`original/j555`](original/j555) | ELF |
| [`tools/j555-solve.py`](tools/j555-solve.py) | solveur |
| [`analysis/ok.txt`](analysis/ok.txt) | `Well done!` |

## Réponse

| Password | **`13303518`** |

`13303518 == 0xcafede`. Messages succès/échec XOR-chiffrés (`0x13579ace` / `not`).

```bash
python3 tools/j555-solve.py --check
```

## Debug GDB (pas à pas)

Entry `0x8048074`. `starti` avant dump ; **`read` fd1**, buffer large (`0x45`).

```bash
gdb -nx -q ./original/j555
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) x/60i $eip
```

| Adresse | Rôle |
|---|---|
| `0x8048092` | `read(fd=1, buf@0x8049177, 0x45)` |
| `0x80480a8` | `call` parse `@0x8048114` (digits → int, `*10` en boucle puis `/10`) → `@0x80491f9` |
| `0x80480ad`…`0x80480bc` | `cmpsb` 4 octets vs `@0x804920d` (`0x00cafede`) |
| `0x8048149` | déchiffre message (XOR dword `0x13579ace`, puis `not` la clé) |
| `0x80480e0` | branche succès |

```text
(gdb) break *0x80480a6
(gdb) break *0x80480bc
(gdb) run
# TTY : 13303518 + Entrée
(gdb) print/d $ebx              # 1
(gdb) continue
(gdb) x/wx 0x80491f9            # 0x00cafede si OK
(gdb) x/wx 0x804920d            # expect
(gdb) continue                  # → Well done! (après XOR decode)
```

**PTY / fd1** : identique à j333/j444 — GDB sur un vrai TTY ; éviter `run < …`. Le solveur utilise `pty.fork`.

## Notes

- Expect en clair dans le binaire (`0xcafede`) ; seuls les strings de sortie sont XOR.
- Le parse multiplie par 10 **après** chaque digit puis divise une fois à la fin → valeur = entier décimal saisi.
