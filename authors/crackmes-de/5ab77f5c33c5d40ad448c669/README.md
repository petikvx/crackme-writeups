# crackmes.de's j333 (josamont)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5c33c5d40ad448c669)

ELF32 (pas de section headers / mapping minimal). Auteur : **josamont**.

| Fichier | Rôle |
|---|---|
| [`original/j333.tar.gz`](original/j333.tar.gz) | archive |
| [`original/j333`](original/j333) | ELF |
| [`tools/j333-solve.py`](tools/j333-solve.py) | solveur |
| [`analysis/ok.txt`](analysis/ok.txt) | `Well done!` |

## Réponse

| Password | **`246581`** |

`read` sur **fd 1** (6 octets) ; compare à `"246581"` `@0x804913f` (sous-chaîne de `2793246581` dans les data). **PTY** requis (mode canonique + newline) — un pipe sur stdin ne nourrit pas fd1.

```bash
python3 tools/j333-solve.py --check
```

## Debug GDB (pas à pas)

Sans headers de sections, `x/i` **avant** le chargement échoue → toujours `starti` d’abord. Entry `0x8048074`.

```bash
gdb -nx -q ./original/j333
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) x/40i $eip
```

| Adresse | Rôle |
|---|---|
| `0x8048074` | banner `Crackme 333 Josep\n` |
| `0x8048083` | prompt `Password: ` |
| `0x8048092` | `read` : **`ebx=1` (fd1)**, buf `@0x8049146`, len **6** |
| `0x80480aa`…`0x80480b9` | `repz cmpsb` vs `"246581"` `@0x804913f` |
| `0x80480d0` | succès → `Well done!\n` |
| `0x80480bf` | échec → `Bad password…` |

```text
(gdb) break *0x80480a6          # juste avant int 0x80 (read)
(gdb) break *0x80480b9          # cmpsb
(gdb) run
# IMPORTANT : laisser le TTY à l’inférieur (pas de run < file).
# Au prompt Password: taper 246581 puis Entrée
(gdb) print/d $ebx              # 1  ← fd stdout/PTY
(gdb) continue
(gdb) x/6c 0x8049146            # input
(gdb) x/s 0x804913f             # "246581"
(gdb) continue                  # → Well done!
```

**Piège PTY / fd1** : sous GDB interactif le processus partage le terminal → `read(1,…)` voit ce qu’on tape. Avec redirection (`run < pwd.txt`) fd1 reste un pipe/stdout non lisible → le `read` bloque ou échoue. Pour une preuve non interactive, préférer le solveur (`pty.fork`) plutôt que GDB batch.

## Notes

- Mapping « UPX-like » / pas de `Section Headers` : `readelf -S` vide ; le code est quand même à VA `0x8048xxx` une fois mappé.
- Longueur fixe 6 — pas d’`atoi`, comparaison raw `cmpsb`.
