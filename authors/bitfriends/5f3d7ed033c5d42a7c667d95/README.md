# BitFriends's rop

| | |
|---|---|
| **ID** | [`5f3d7ed033c5d42a7c667d95`](https://crackmes.one/crackme/5f3d7ed033c5d42a7c667d95) |
| **Auteur (site)** | BitFriends |
| **Auteur (local)** | bitfriends |
| **SHA-256** | `e8c92c0169816faf71095740a1b6c65dd5eaef89ccfbb84bf7d734ed417eb729` |

## Origine

- Page : https://crackmes.one/crackme/5f3d7ed033c5d42a7c667d95
- Download : https://crackmes.one/download/crackme/5f3d7ed033c5d42a7c667d95
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Contenu

```
original/   # binaire d'origine
analysis/   # IDA, screenshots
tools/      # solveur, recon
```

## Status

- [x] reverse
- [x] write-up — [`analysis/writeup.md`](analysis/writeup.md)
- [x] solveur — [`tools/rop-solve.py`](tools/rop-solve.py)

**Solution :** stack overflow (offset 72), NX/pas de canary/non-PIE. Pas de
`system`/`/bin/sh`/`pop rdi` dans le binaire → **ret2csu** pour leak la libc via
`write(1, write@GOT, 8)`, retour dans `main`, puis **ret2libc** `system("/bin/sh")`
(gadget `pop rdi; ret` pris dans la libc leakée, `ret` d'alignement `0x400416`).
