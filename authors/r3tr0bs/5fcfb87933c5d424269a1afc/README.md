# R3tr0BS's EZ crackme

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5fcfb87933c5d424269a1afc) · id `5fcfb87933c5d424269a1afc`

Crackme **ELF32** Linux NASM (mal labellisé Windows sur le site).  
Auteur : **R3tr0BS**.

| Fichier | Rôle |
|---|---|
| [`original/run.exe`](original/run.exe) | binaire (ELF malgré l’extension) |
| [`original/Readme.txt`](original/Readme.txt) | note auteur |
| [`original/Crackme.tar`](original/Crackme.tar) | archive site |
| [`tools/ez-crackme-solve.py`](tools/ez-crackme-solve.py) | password |
| [`analysis/ok.txt`](analysis/ok.txt) | `You Got This!` |

## Réponse

| Input | Valeur |
|---|---|
| argv[1] | **`P455w0rd`** |

```bash
./original/run.exe P455w0rd
# You Got This!
```

Password en clair dans `.data` (`P455w0rd`). Difficulty **1.0**.

---

## Debug GDB (pas à pas)

ELF32 **statique**, **non strippé** (malgré le nom `run.exe`). Password en **argv[1]** (pas stdin).

```bash
gdb -q ./original/run.exe
(gdb) disassemble _start
(gdb) x/s 0x804a000
# P455w0rd
```

| Symbole | Rôle |
|---|---|
| `_start` | `pop` argc/argv ; charge dword `password` |
| `_start.goodjob` | `"You Got This!"` |
| `_start.wrong` | `"Wrong!"` |

```text
(gdb) break *_start+8           # cmp [ebx], eax  (argv[1] vs password)
(gdb) run P455w0rd
(gdb) x/s $ebx                  # argv[1]
(gdb) x/s 0x804a000
(gdb) stepi                     # je goodjob
```

```bash
./original/run.exe P455w0rd
# You Got This!
```

