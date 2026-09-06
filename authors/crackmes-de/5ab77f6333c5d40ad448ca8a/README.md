# crackmes.de's easy_linux_crackme (lord)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6333c5d40ad448ca8a) · id `5ab77f6333c5d40ad448ca8a`

ELF32 NASM (dans `blah.tar.gz`). Auteur : **lord**.

| Fichier | Rôle |
|---|---|
| [`original/blah.tar.gz`](original/blah.tar.gz) | archive |
| [`original/blah`](original/blah) | ELF |
| [`tools/easy-linux-crackme-solve.py`](tools/easy-linux-crackme-solve.py) | doc + check gdb |
| [`analysis/ok.txt`](analysis/ok.txt) | `Okej!` |

## Réponse

| Condition | Valeur |
|---|---|
| `getgid()` | **`0xdead`** (57005) |

Pas de password clavier. Le binaire appelle `sys_getgid` (`eax=0x2f` / `int 0x80`) et exige `eax == 0xdead` pour afficher **`Okej!`**.

```bash
# sans root (preuve) :
python3 tools/easy-linux-crackme-solve.py --check

# avec privileges :
# sudo setpriv --reuid=$(id -u) --regid=57005 --clear-groups ./original/blah
```

## Prédicat

```asm
mov eax, 0x2f      ; sys_getgid
int 0x80
cmp eax, 0xdead
jne exit
; write "Okej!\n"
```

Binaire **statique** → pas de `LD_PRELOAD` sur getgid.

## Debug GDB (pas à pas)

ELF32 static strippé, entry **`0x8048094`**. Pas d’input : seul `sys_getgid` compte. Le solveur `--check` force `eax` sous GDB (pas besoin de root).

```bash
gdb -nx -q ./original/blah
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) x/20i $eip
```

| Adresse | Rôle |
|---|---|
| `0x8048094` | entry |
| `0x8048096` | `mov eax, 0x2f` — **sys_getgid** |
| `0x804809b` | `int 0x80` |
| `0x804809d` | `cmp eax, 0xdead` — prédicat |
| `0x80480a4` | succès → `write` `"Okej!\n"` `@0x80490c4` |
| `0x80480ba` | exit |

```text
(gdb) break *0x804809d
(gdb) run
(gdb) print/x $eax           # gid réel (souvent ≠ 0xdead)
(gdb) set $eax=0xdead
(gdb) continue               # → Okej!
```

Batch (comme `tools/easy-linux-crackme-solve.py --check`) :

```bash
gdb -nx -batch -ex 'set debuginfod enabled off' -ex 'set pagination off' \
  -ex 'break *0x0804809d' -ex 'run' -ex 'set $eax=0xdead' -ex 'continue' \
  ./original/blah
```
