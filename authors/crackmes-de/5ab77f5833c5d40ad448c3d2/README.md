# crackmes.de's CrackmeLinux (nobz)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3d2)

## Réponse

| argv | **`0bfu5c4t3D=-_-"`** (15 chars) |

XOR dword-wise with clé `0x1337babe` (ptrace TRACEME doit réussir).

```bash
./original/CrackmeLinux '0bfu5c4t3D=-_-"'
# Yeah ! You did it !
```

## Debug GDB (pas à pas)

ELF32 static stripé. Entry **`0x8048060`**. `argc` doit être **2** (binaire + 1 argv). Clé XOR construite = **`0x1337babe`**, puis `ptrace(TRACEME)` : sous GDB le syscall échoue et **xor** la clé — il faut forcer `eax=0` **après** `int 0x80`.

```bash
gdb -nx -q --args ./original/CrackmeLinux '0bfu5c4t3D=-_-"'
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) x/30i $eip
```

| Adresse | Rôle |
|---|---|
| `0x8048085` | `cmp argc, 2` |
| `0x804809f` | `call` ptrace `@0x80481b9` (`eax=0x1a`, `ebx=0`) |
| `0x80481c2` / `0x80481c4` | `int 0x80` / retour ptrace |
| `0x80480c9` | vérif longueur argv == 15 |
| `0x8048109` | `xor` clé avec retour ptrace |
| `0x8048115` | déchiffre buffer (XOR dword-wise) `@0x8048238` |
| `0x804812f` | `test eax` après `cmps` vs blob `@0x8048181` |
| `0x8048146` | succès → `"Yeah ! You did it !"` |

```text
(gdb) break *0x80481c4
(gdb) commands
> set $eax = 0
> continue
> end
(gdb) break *0x8048109
(gdb) break *0x804812f
(gdb) run
(gdb) printf "key=%#x ptrace_slot=%#x\n", *(unsigned*)($esp+4), *(unsigned*)($esp+0x18)
# key=0x1337babe ptrace_slot=0
(gdb) continue
(gdb) printf "cmps eax=%d\n", $eax
# 0
(gdb) continue
# Yeah ! You did it !
```

Sans le patch `eax=0` après ptrace, la clé devient `0x1337babe ^ (-1)` et le `cmps` échoue même avec le bon password.

```bash
gdb -nx -batch \
  -ex 'set debuginfod enabled off' \
  -ex 'break *0x80481c4' \
  -ex 'run' -ex 'set $eax = 0' -ex 'continue' \
  --args ./original/CrackmeLinux '0bfu5c4t3D=-_-"'
```
