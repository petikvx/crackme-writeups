# Ximxn — perwira

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/64eb62e2d931496abf9092e7)

ELF64 PIE, `strcmp` en clair. Question : pejuang kemerdekaan Sarawak → **Rentap**.

## Réponse

| Password |
|---|
| **`3108{r3nt4p}`** |

```bash
printf '3108{r3nt4p}\n' | ./original/perwira
# That is correct!
```

## Debug GDB (pas à pas)

ELF64 **PIE**, non strippé. `main` file `0x119d` → live `@0x5555555551a5`, `getPass` `@0x555555555169` (base `0x555555554000`).

```bash
export DEBUGINFOD_URLS=
printf '3108{r3nt4p}\n' > /tmp/ximxn.in
gdb -nx -q ./original/perwira
(gdb) set debuginfod enabled off
(gdb) start < /tmp/ximxn.in
# main @ base+0x119d
(gdb) disassemble main
(gdb) break getPass
(gdb) continue
# strcmp attendu 3108{r3nt4p} → "That is correct!"
```

`solution_summary` : `3108{r3nt4p}` (Rentap).

