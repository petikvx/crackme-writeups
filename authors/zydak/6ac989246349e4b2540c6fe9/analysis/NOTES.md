# Tetris DRM — parked (2026-10-10)

Ghidra GUI, projet `MalwareLab`, programme `/crackmes/zydak-tetris/Crackme` (sauvé, `main` nommé).

Image base Ghidra `0x100000`. ELF VA = adresse Ghidra − `0x100000`.

| Symbole | Ghidra | ELF |
|---|---|---|
| entry | `0x151000` | `0x51000` |
| main | `0x224a00` | `0x124a00` |
| clé rodata | `0x123902` | `0x23902` |
| clé BSS (`_INIT_8`) | `0x3b1280` | `0x2b1280` |
| `memfd_create@plt` | `0x3a1540` | `0x2a1540` |

`main` : `sub rsp, 0x1258`, puis des stores `mov [rsp+rcx*4+0x6c8], eax` avec `rcx = (r15 + k) & 0xff` et `r15 = rsp>>4`. Décompile Ghidra en timeout.

Live sans traceur : bannière FuckassCorp, prompt credentials, puis « servers are currently down », exit 1. `strace` → `SIGILL`.

But auteur : patcher le `exit(1)` du handshake, reconstruire ce que le serveur devait envoyer, rendre `CXXD4` jouable, finir 5 niveaux.

## IDA (idalib)

Base image `0`. `start` fait `lea rdi, main` puis `__libc_start_main`. `main` est nommé à `0x124a00` mais l’auto-analyse ne crée pas la fonction : le corps est coupé par un saut chevauchant.

`add_func(0x124a00, 0x126daf)` passe. Taille 9135 octets, 1865 instructions, **aucun `call`**. Hex-Rays sort 531 lignes : remplissage d’une table de 256 dwords sur la pile, index `(rsp>>4)`, puis :

- `STACK[0x21C8] = 0x9E3779B9` (constante TEA / splitmix)
- `STACK[0x21C0] = (addr 0xF6968 - image_base) xor 0x3B9223E3DAEF264F` soit l’RVA `0xF6968` chiffré
- `JUMPOUT(0x126DAD)`

Octets à `0x126dad` : `EB FF E0`. `EB FF` retombe sur son propre dernier octet ; l’instruction réelle est `FF E0` = `jmp rax`. Juste après, à `0x126db0`, du vrai code (`movzx esi, byte ptr [rsp+0C7h]`, puis un `cmovz` entre `0x2139909B` et `0xFA0387F1`).

`0xF6968` commence par le même prologue (`sub rsp, 0xE78`) et IDA l’a laissé en `dq`. Entre `main` et la fonction normale suivante (`0x158140`) : 362 `EB FF`, 302 `cmov`, sauts indirects `jmp rax/rcx/rdx`. Pas d’import `exit`. Aucun xref vers les PLT `memfd_create` / `ptrace` / `execvp`.

Hex-Rays ne va pas plus loin que ce prologue. La suite demande un lifter ou un passage dynamique une fois l’anti-debug (`SIGILL` sous `strace`) contourné. Base : `analysis/Crackme.i64` (gitignorée).
