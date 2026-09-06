# crackmes.de's tiny_crackme (yanisto)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3ed) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | yanisto (miroir crackmes.de) |
| **Plateforme** | Linux ELF32 tiny (static, headers corrompus) |
| **Type** | password 4 octets + checksum SMC |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/tiny-crackme.gz` | archive d’origine |
| `original/tiny-crackme` | ELF 795 octets |
| `tools/tiny-solve.py` | password + harness I/O |

## Réponse

| Password (4 bytes) | **`72 90 40 cd`** (`r\x90@\xcd`, dword LE `0xcd409072`) |

```bash
python3 tools/tiny-solve.py -q
# 729040cd
python3 tools/tiny-solve.py --check
# -> Success !! Congratulations...
```

## Premier regard

```text
ELF 32-bit LSB executable, Intel 80386, statically linked, corrupted section header size
Entry 0x200008  (code dans e_ident[8+] : mov bl,0x2a ; jmp body)
LOAD @ 0x200000, filesz 0x31b, RWE
```

## Flow

1. Entry dans le padding ELF : `mov bl,0x2a` puis saut vers le stub.
2. Anti-disasm `jmp $+1`, puis `call` routine qui **XOR-décrypte** `[0x20004b ..)` avec la clé dword **`0x3f5479f1`**.
3. XOR-décode la bannière avec la clé en clair **`0xbeefc0da`** (`[0x200292]`).
4. `ptrace` check.
5. Lit **4 octets** (fd 1) en `0x200296`.
6. Checksum : somme des dwords depuis `0x200008` (longueur `0x2df`), XOR `0x5508046b`, compare au dword password.

## Prédicat

Après décryptages :

```text
ebx = 0
pour i in 0 .. (0x2df>>2)-1 :
    ebx += dword[0x200008 + 4*i]
ebx ^= 0x5508046b
ok ⇔ ebx == dword_password   # en 0x200296
```

Le password participe lui-même à la somme (bytes à `0x296..0x299`) → équation linéaire résolue (Z3).

## I/O

Comme `naive_crackme` : **write → fd 0**, **read ← fd 1**. Utiliser le solveur.

## Debug GDB (pas à pas)

ELF32 tiny : **PHDR chevauche** les champs `e_sh*` du header → GDB BFD refuse `file original/tiny-crackme` (*file format not recognized*). Les VA utiles restent **`0x200000`…** (LOAD RWE). Contournement : wrapper page-aligné (même image à `0x200000`) ou `objdump -b binary`.

```bash
# Wrapper GDB-friendly (p_offset=0x1000, p_vaddr=0x200000, entry=0x200008)
python3 - <<'PY'
from pathlib import Path
import struct, os
raw = Path('original/tiny-crackme').read_bytes()
page = bytearray(0x1000)
struct.pack_into('<I', page, 0, 0x464c457f)
page[4:8] = b'\x01\x01\x01\x00'
struct.pack_into('<HH', page, 0x10, 2, 3)          # ET_EXEC, EM_386
struct.pack_into('<I', page, 0x14, 1)
struct.pack_into('<I', page, 0x18, 0x200008)       # entry
struct.pack_into('<I', page, 0x1c, 52)             # e_phoff
struct.pack_into('<H', page, 0x28, 52)
struct.pack_into('<HH', page, 0x2a, 32, 1)         # phentsize, phnum
struct.pack_into('<IIIIIIII', page, 52,
                 1, 0x1000, 0x200000, 0x200000, len(raw), len(raw), 7, 0x1000)
Path('/tmp/tiny-crackme.gdbwrap').write_bytes(bytes(page) + raw)
os.chmod('/tmp/tiny-crackme.gdbwrap', 0o755)
PY

gdb -nx -q /tmp/tiny-crackme.gdbwrap
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) x/10i $eip
# 0x200008: mov bl, 0x2a ; jmp 0x200040
```

| Adresse | Rôle |
|---|---|
| `0x200008` | entry (padding `e_ident`) : `mov bl,0x2a` |
| `0x200040` | stub SMC / anti-disasm |
| `0x20004b`… | zone XOR-décryptée (clé `0x3f5479f1`) |
| `0x200292` | clé bannière `0xbeefc0da` |
| `0x200296` | buffer password 4 octets (fd **1**) |

```text
(gdb) break *0x200296
# après le read : comparer le dword au prédicat
(gdb) x/wx 0x200296
# 0xcd409072  (== bytes 72 90 40 cd)
(gdb) x/4xb 0x200296
```

Sans wrapper, dump statique :

```bash
objdump -b binary -m i386 -D --adjust-vma=0x200000 original/tiny-crackme | head -40
```

**I/O** : comme le solveur, inverser fd0/fd1 (write→0, read←1) ; GDB `run < fichier` ne suffit pas. Préférer `tools/tiny-solve.py --check` pour la preuve live, GDB pour SMC / checksum.

## Vérification

```bash
python3 tools/tiny-solve.py --check
# OK
```

## Notes

- `file` annonce des section headers corrompus : normal pour un tiny ELF.
- Password non ASCII complet (octet `0x90`).
