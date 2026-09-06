# crackmes.de's frogger_crackme (macabre)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5a33c5d40ad448c4f7)

## Réponse

| User | Key |
|---|---|
| `petik` | **`62-qqqqqv`** |

`atoi(num)==62` patche un `jmp` relatif ; `(sum(user)^2 ⊕ -sum(tail)) & 0xff == 0x1c`.  
Sur Linux moderne : `mprotect` le `.text` (gdb dans le solveur).

```bash
python3 tools/frogger-solve.py --check --user petik
```

## Debug GDB (pas à pas)

ELF32 dynamique stripé. Entry **`0x80482f0`**. Le `.text` n’est **pas** writable : le patch SMC (`movb $0xe9, …`) segfault sans `mprotect` — le solveur `--check` le fait déjà sous GDB.

```bash
gdb -nx -q ./original/frogger
(gdb) set debuginfod enabled off
(gdb) set args petik 62-qqqqqv
(gdb) break *0x080483fc
(gdb) commands
> silent
> call (int)mprotect((void*)0x8048000, 0x2000, 7)
> continue
> end
(gdb) break *0x08048437          # printf succès
(gdb) run
```

| Adresse | Rôle |
|---|---|
| `0x80482f0` | `_start` / entry |
| `0x804844d` | somme / carré du user → `@0x80497d0` |
| `0x8048496` | parse key `atoi` avant `-` → `@0x80497d8` (= **62**), somme queue → `@0x80497d4` |
| `0x80483fc` | SMC : écrit `0xe9` + rel8 dans `@0x80483d8+offset` |
| `0x8048416` | `jmp` vers succès si patch OK |
| `0x8048437` | `"SUCCESS"` path (`printf` + `exit(0x29a)`) |

```text
(gdb) # après hit 0x80483fc (mprotect déjà fait par commands)
(gdb) printf "atoi_num=%d sum_tail=%d\n", *(int*)0x80497d8, *(int*)0x80497d4
(gdb) continue
# → 0x8048437
```

```bash
gdb -nx -batch -x /dev/stdin ./original/frogger <<'EOF'
set debuginfod enabled off
set args petik 62-qqqqqv
break *0x080483fc
commands
  silent
  call (int)mprotect((void*)0x8048000, 0x2000, 7)
  continue
end
break *0x08048437
run
printf "SUCCESS eip=%p\n", $eip
quit
EOF
```

Sans `mprotect`, le `movb` à `0x80483fc` → SIGSEGV (page `.text` RX only sur Linux moderne).
