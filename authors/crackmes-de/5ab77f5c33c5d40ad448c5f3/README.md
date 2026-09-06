# crackmes.de's oxfoo1me (0xf001)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5c33c5d40ad448c5f3) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | 0xf001 (miroir crackmes.de) |
| **Plateforme** | Linux ELF32 static (NASM), stripped + anti-disasm |
| **Type** | password 11 octets |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/oxfoo1m3.tgz` | archive d’origine |
| `original/oxfoo1m3` | ELF |
| `original/r34dm3.txt` | brief auteur |
| `tools/oxfoo1me-solve.py` | password + `--check` |

## Réponse

| Password | **`fucktheduck`** (11 chars) |

```bash
python3 tools/oxfoo1me-solve.py -q
# fucktheduck
python3 tools/oxfoo1me-solve.py --check
# u made it!
printf 'fucktheduck' | ./original/oxfoo1m3
# exit status 0xf001
```

(Pas de username — password fixe.)

## Premier regard

```text
ELF 32-bit LSB executable, Intel 80386, statically linked, stripped
Entry 0x8048080 ; LOAD RWE ; section headers pourris (anti-libbfd)
```

Banner : `oxfoo1m3 started ;]` / `3nt4 p455w0rD:` — goal = find the correct password (`r34dm3.txt`).

## Flow / protections

1. Trampolines `call $+1` / `pop edx ; add edx,0xb ; push ; ret` (anti-disasm linéaire).
2. Body XOR-décrypté en place avec **`0x58`** (`'X'`) → strings / code lisibles.
3. `ptrace(TRACEME)` anti-debug (sous `strace`/`gdb` → SEGV / chemin mort).
4. `read(0, buf, 11)` à `0x8048223`.
5. Pour `i = 0..10` : `al = password[i] ^ (11+i)` puis `cmp al, expected[i]` (`expected = myne{xtvfw~` juste après le buffer).
6. Succès → `u made it!` puis `exit(0xf001)`.

## Prédicat

```text
expected = "myne{xtvfw~"          # après décrypt 0x58
password[i] = expected[i] XOR (11 + i)
→ "fucktheduck"
```

## Debug GDB (pas à pas)

ELF32 static strippé, **section headers pourris** → BFD/`gdb file` refusent l’original. Copie de travail avec `e_shoff/e_shnum/e_shentsize = 0` (comme j444 / staple) :

```bash
python3 - <<'PY'
import struct
p='original/oxfoo1m3'; d=bytearray(open(p,'rb').read())
struct.pack_into('<I', d, 0x20, 0); struct.pack_into('<HHH', d, 0x2e, 0, 0, 0)
open('/tmp/oxfoo1m3.gdb','wb').write(d)
PY
chmod +x /tmp/oxfoo1m3.gdb
gdb -nx -q /tmp/oxfoo1m3.gdb
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) printf "EIP=%p\n", $eip   # 0x8048080
(gdb) x/20i $eip
```

| Adresse | Rôle |
|---|---|
| `0x8048080` | entry — trampolines `call $+5` / `pop edx ; add edx,0xb ; push ; ret` |
| `0x80480c2` | setup décrypt : `mov esi, 0x8048196` puis XOR body **`0x58`** |
| `0x80481d5` | banner clair `oxfoo1m3 started ;]` (après décrypt) |
| `0x804820f` | prompt `3nt4 p455w0rD:` |
| `0x8048223` | buffer 11 × `X` ; expected **`myne{xtvfw~`** juste après |
| `0x804863b` | succès `u made it!` |

```text
(gdb) break *0x80480c2
(gdb) run
(gdb) x/8i $eip
(gdb) continue
# ptrace(TRACEME) anti-debug → sous GDB : chemin mort / SIGSEGV (souvent @0xf001)
```

Le prédicat (XOR `(11+i)` vs expected) se voit surtout **après** décrypt en mémoire ; la preuve live reste **hors debugger** :

```bash
gdb -nx -batch -ex 'set debuginfod enabled off' -ex 'file /tmp/oxfoo1m3.gdb' -ex 'starti' -ex 'x/i $eip'
printf 'fucktheduck' | ./original/oxfoo1m3 ; echo exit=$?   # 0xf001
```

## Vérification

```bash
python3 tools/oxfoo1me-solve.py --check
# OK
```

## Notes

- Sous debugger/`strace`, le `ptrace` fait échouer le run — tester en natif.
- Exit code **`0xf001`** = signature de l’auteur.
- Les `XXXX` visibles après décrypt sont le marqueur du buffer (octets nuls ^ `0x58`).
