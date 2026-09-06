# crackmes.de's naive_crackme (yanisto)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3ee) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | yanisto (miroir crackmes.de) |
| **Plateforme** | Linux ELF32 static (NASM) |
| **Type** | password 8 octets + checksum intégrité |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/naive-crk.gz` | archive d’origine |
| `original/naive-crk` | ELF décompressé |
| `tools/naive-solve.py` | password + harness I/O |

## Réponse

| Password (8 bytes) | **`V7l$j^F;`** |

```bash
python3 tools/naive-solve.py -q
# V7l$j^F;
python3 tools/naive-solve.py --check
```

Le leurre `L4zyP4s5.` est déjà présent dans le binaire (zone `pass`) mais **échoue** le checksum.

## Premier regard

```text
ELF 32-bit LSB executable, Intel 80386, statically linked, not stripped
symbols: _check_pt, f_process, next, pass, stgraal, …
```

## Flow / pièges

1. **`e_entry` foireux** (`0x8048883`) → SIGSEGV immédiat. Le vrai `_start` est `0x80488bb` (hors de la zone LOAD hashée, donc patchable pour l’exec sans casser le prédicat).
2. **I/O croisés** : `write` sur **fd 0**, `read` password sur **fd 1** (il faut inverser les pipes).
3. `ptrace(TRACEME)` : si déjà tracé → message `ptraced !!` et sortie.
4. Décode XOR `0x1337` de l’invite, lecture de 8 octets dans `pass`, puis checksum.
5. Si OK → décode XOR `0x1977` du message « graal ».

## Prédicat

Sur l’image LOAD (`p_offset=0x1000`, `vaddr=0x8048000`) après le store final du décode invite en `0x8048251` :

```text
ecx=0; ebx=0
pour chaque dword w dans [0x8048000 .. 0x804846b] :
    ecx ^= w;  ecx = rol(ecx, 1);  ebx += ecx
ok ⇔ (ebx ^ 0x80483ba) == 0xc0ffee
```

Les 8 octets en `0x80483ba` sont le password (résolu via Z3 / force du checksum).

## Debug GDB (pas à pas)

ELF32 static **non stripé**. `e_entry` fichier = **`0x8048883`** (SIGSEGV). Vrai `_start` / `main` / `__main` = **`0x80488bb`**. Pour GDB : copie temporaire avec entry patchée (comme le solveur).

```bash
python3 - <<'PY'
from pathlib import Path
import struct, os
raw = bytearray(Path('original/naive-crk').read_bytes())
struct.pack_into('<I', raw, 0x18, 0x080488BB)
Path('/tmp/naive-crk.fix').write_bytes(raw)
os.chmod('/tmp/naive-crk.fix', 0o755)
PY
gdb -nx -q /tmp/naive-crk.fix
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) x/5i $eip
# 0x80488bb <__main>: jmp 0x8048291 <f_prog>
```

| Symbole / adresse | Rôle |
|---|---|
| `0x80488bb` `_start` | vrai entry |
| `0x8048291` `f_prog` | enchaîne checks |
| `0x804829c` `_check_pt` | `ptrace` — sous GDB → `ptraced !!` |
| `0x80482ca` `f_process` | décode invite / lit password |
| `0x80483ba` `pass` | 8 octets password (+ checksum LOAD) |
| `0x8048127` `stgraal` | message succès (XOR `0x1977`) |

```text
(gdb) break *_check_pt
(gdb) break *0x80482ca
(gdb) break *pass
(gdb) run
# si déjà tracé : message ptraced — patcher le retour comme pour CrackmeLinux
# ou lancer hors parent traceur
(gdb) x/8cb &pass
# 'V' '7' 'l' '$' 'j' '^' 'F' ';'
```

**I/O croisés** : `write` fd **0**, `read` fd **1** — `run < …` ne nourrit pas le password. Utiliser le harness `tools/naive-solve.py --check` (pipes inversés + entry fix) ; GDB sur la copie pour symbols / checksum.

```bash
gdb -nx -batch \
  -ex 'set debuginfod enabled off' \
  -ex 'starti' -ex 'info functions' \
  -ex 'x/10i 0x80488bb' \
  --args /tmp/naive-crk.fix
```

## Vérification

```bash
python3 tools/naive-solve.py --check
# … tip : choose ndisasm / hexdump / ur brain …
# OK
```

## Notes

- Ce n’est **pas** le string `L4zyP4s5.` (faux ami).
- Sans inversion fd0/fd1, le programme a l’air « mort » ou core.
