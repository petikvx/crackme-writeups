# crackmes.de's fr0g_kgm1

> [crackmes.one](https://crackmes.one/crackme/5ab77f5c33c5d40ad448c65b) · [`ORIGIN.yml`](ORIGIN.yml)

## Réponse

Login exemple **`petik`** (≥5). Serial 32 octets dans `/var/tmp/thegame.serial` :

`serial[i] = login[(31-i) % len] XOR "SeRiAlAbCdEfGhIjKlMnOpQrStUvWxYz"[i]`

```bash
python3 tools/fr0g-kgm1-solve.py --check --login petik
# Yeh, you did it
```

## Debug GDB (pas à pas)

ELF32 static strippé, entry **`0x8048097`**. Serial lu depuis **`/var/tmp/thegame.serial`**.

```bash
gdb -nx -q ./original/kgm1
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) x/40i $eip
```

| Adresse | Rôle |
|---|---|
| `0x8048097` | `write` banner `KGM#1 (fr0g 2k16)` |
| `0x80480ad` | `read(0, login@0x8049290, 0x20)` |
| `0x80480ce` | `call 0x8048080` — longueur login ; `cmp eax,5` `@0x80480d3` |
| `0x80480f4` | `open("/var/tmp/thegame.serial")` (`ebx=0x80491fa`) |
| `0x8048123` | `read` serial 32 octets → `@0x80492b0` |
| `0x8048158`…`0x804816d` | boucle : `login[j] XOR TABLE[i]` vs `serial[i]` |
| `0x8049249` | TABLE **`SeRiAlAbCdEfGhIjKlMnOpQrStUvWxYz`** |
| `0x804817d` | succès → `Yeh, you did it` |

```text
(gdb) break *0x8048167
(gdb) run
# saisir petik (login ≥5) ; serial déjà écrit par le solveur
(gdb) x/s 0x8049290          # login
(gdb) x/32bx 0x80492b0       # serial fichier
(gdb) x/s 0x8049249          # TABLE
(gdb) print/x $al            # octet calculé
(gdb) continue               # → Yeh, you did it
```

```bash
gdb -nx -batch -ex 'set debuginfod enabled off' -ex 'file ./original/kgm1' \
  -ex 'starti' -ex 'x/i 0x8048167' -ex 'x/s 0x8049249'
```
