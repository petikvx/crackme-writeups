# Keep's sygil (gui version for linux)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aaa8922585e8875bcbebfde) · id `6aaa8922585e8875bcbebfde`

ELF64 **GTK3 + WebKitGTK** (UI HTML/JS). Diff. site **2.5**.

| Fichier | Rôle |
|---|---|
| [`original/sygil.fun`](original/sygil.fun) | binaire |
| [`analysis/sygil.fun.i64.c`](analysis/sygil.fun.i64.c) | Hex-Rays |
| [`tools/sygil-gui-solve.py`](tools/sygil-gui-solve.py) | keygen alias→token |

## Réponse

| | |
|---|---|
| **Alias (exemple)** | `petik` (longueur > 3) |
| **Token** | `syg-8fbf90b6-0f02-8fecc6f3` |
| OK UI | `triggerResponse(true, …)` |

```bash
python3 tools/sygil-gui-solve.py -q --name petik
# syg-8fbf90b6-0f02-8fecc6f3
```

Dans l’UI : *true name* = alias, coller le token. Sans debugger (`TracerPid=0`).

## Prédicat

FNV-1a 32 (`offset 0x811C9DC5`, prime `0x01000193`) sur l’alias ; si `TracerPid≠0` → XOR `0xDEADBEEF`.

```text
a    = h ^ 0x5947494C          # "LIGY"
fold = (h & 0xffff) ^ (h >> 16)
c    = fold ^ a ^ 0x535947     # "GYS"
token = sprintf("syg-%08x-%04x-%08x", a, fold, c)
```

## Notes

- Hints JS : PID / `0x01000193` / high↔low fold.
- Preuve live GUI non automatisée ici ; formule tirée de `decc` + cohérente avec les hints.
