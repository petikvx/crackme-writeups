# crackmes.de's basic_logic (eholzbach)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5f33c5d40ad448c7bd) · id `5ab77f5f33c5d40ad448c7bd`

ELF32 NASM strippé. Auteur : **eholzbach**.

| Fichier | Rôle |
|---|---|
| [`original/logic.tgz`](original/logic.tgz) | archive |
| [`original/logic/logic`](original/logic/logic) | ELF |
| [`original/readme.txt`](original/readme.txt) | brief |
| [`tools/basic-logic-solve.py`](tools/basic-logic-solve.py) | solveur PTY |
| [`analysis/ok.txt`](analysis/ok.txt) | `password is correct!` |

## Réponse

| Input | Formule |
|---|---|
| Password | **`str(getpid()) + str(time(NULL))`** (décimal, ordre naturel) |

Exemple (dépend du process) : `23020521787421186`.

```bash
python3 tools/basic-logic-solve.py --check
```

## Prédicat

1. `getpid` → chiffres décimaux.
2. `time` → chiffres décimaux.
3. Concaténation = password attendu.
4. Lecture caractère par caractère sur **fd 1** (stdout) → **PTY obligatoire** (pipe classique échoue).
5. `ptrace(TRACEME)` anti-debug (GDB ⇒ échec anticipé + `unlink` argv0).

## Debug GDB (pas à pas)

ELF32 NASM strippé, entry **`0x8048080`**. Password = `str(pid)+str(time)` ; lecture **caractère par caractère sur fd1** (PTY).

```bash
gdb -nx -q ./original/logic/logic
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) x/40i $eip
```

| Adresse | Rôle |
|---|---|
| `0x8048080` | sauve argv0 ; prompt `enter password:` |
| `0x804809d` | `sys_getpid` (`eax=0x14`) → digits `@0x80494fa` |
| `0x80480cd` | `ptrace(TRACEME)` (`eax=0x1a`) — sous GDB ⇒ branche fail `@0x8048277` |
| `0x80480e6` | `sys_time` (`eax=0xd`) → digits `@0x8049504` |
| `0x8048154`…`0x8048168` | `read(fd=1, 1 octet)` boucle → buf `@0x80492f0` |
| `0x80481ae`…`0x80481d1` | concat pid\|time → `@0x80493d4` |
| `0x80481f8` | `cmp al, bl` — prédicat octet à octet |
| `0x8048201` | succès → `password is correct!` |

```text
(gdb) break *0x80480dd
(gdb) break *0x80481f8
(gdb) run
(gdb) print/x $eax           # après ptrace : <0 sous GDB
# Pour inspecter le cmp sans anti-debug : patcher le test @0x80480df
#   (gdb) set *(unsigned char*)0x80480df = 0xeb  # jmp short, saute le fail
# puis PTY : saisir str(pid)+str(time) — ou laisser tools/basic-logic-solve.py --check
```

Sous debugger « naïf », le `ptrace` fait échouer le run (et peut `unlink` argv0). Preuve scriptée = solveur PTY hors GDB.

```bash
gdb -nx -batch -ex 'set debuginfod enabled off' -ex 'file ./original/logic/logic' \
  -ex 'starti' -ex 'x/i 0x80480cd' -ex 'x/i 0x8048154' -ex 'x/i 0x80481f8'
```

## Notes

- ioctl `TCGETS`/`TCSETS` pour masquer l’écho.
- Ne pas patcher le message « correct » : le readme demande d’apprendre la logique.
