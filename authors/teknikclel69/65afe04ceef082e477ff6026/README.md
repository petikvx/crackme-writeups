# Teknikclel69's silly

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/65afe04ceef082e477ff6026) · id `65afe04ceef082e477ff6026`

Crackme **ELF32** Linux, NASM, **statique**, non strippé.  
Auteur site : **Teknikclel69**.

| Fichier | Rôle |
|---|---|
| [`original/main`](original/main) | binaire |
| [`tools/silly-solve.py`](tools/silly-solve.py) | password |
| [`analysis/ok.txt`](analysis/ok.txt) | preuve strace |

## Réponse

| Input | Valeur |
|---|---|
| Password | **`chicken baguette`** (+ `\n`) |

```bash
python3 tools/silly-solve.py -q
# chicken baguette

printf 'chicken baguette\n' | strace -e write ./original/main
# write(0, "you did the thing\n", 18)
```

---

## Analyse

1. `trole` patch le buffer `lmao` initialement **`chinese baguette\n`** : indices 3–6 → **`cken`** ⇒ **`chicken baguette\n`**.
2. `sys_read` (eax=3) lit **0x11** octets dans `string`.
3. `repe cmpsb` vs `lmao` ; égal → `congratulation`.

Piège « silly » : les `sys_write` utilisent **`ebx=0`** (stdin) au lieu de 1 → pas de sortie visible sur un pipe ; `strace` confirme le message.

---

## Debug GDB (pas à pas)

ELF32 **statique**, **non strippé**. Entry `0x8049000`.

```bash
gdb -q ./original/main
(gdb) info functions
# _start, trole, congratulation, error, exit
(gdb) disassemble _start
```

| Symbole | VA | Rôle |
|---|---|---|
| `trole` | `0x8049032` | patch `lmao` : `chinese` → `chicken` |
| `lmao` | `0x804a018` | référence après patch |
| `string` | `0x804a02a` | buffer `read` (0x11 octets) |
| `congratulation` | `0x8049066` | `write` « you did the thing » sur **fd 0** |

### Voir le patch `trole`

```text
(gdb) x/s &lmao
# chinese baguette\n
(gdb) break *0x8049005          # juste après call trole
(gdb) run < <(printf 'chicken baguette\n')
(gdb) x/s &lmao
# chicken baguette\n
```

### Compare + piège stdout

```text
(gdb) break *0x804902c          # repe cmpsb
(gdb) continue
(gdb) x/17cb $esi               # input
(gdb) x/17cb $edi               # lmao
(gdb) break congratulation
(gdb) continue
(gdb) # write ebx=0 → rien sur le terminal ; strace -e write le montre
```

```bash
printf 'chicken baguette\n' | strace -e write ./original/main
# write(0, "you did the thing\n", 18)
```

---

Hashes : voir `ORIGIN.yml`. Site : difficulty **1.5** · quality **4.8**.
