# crackmes.de's KeygenmeNasm (rezk2ll)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6533c5d40ad448cb73) · id `5ab77f6533c5d40ad448cb73`

Keygenme **ELF32** NASM, non strippé. Auteur : **rezk2ll**.

| Fichier | Rôle |
|---|---|
| [`original/KeygenmeNasm.zip`](original/KeygenmeNasm.zip) | archive site |
| [`original/keygenme`](original/keygenme) | ELF |
| [`original/note.txt`](original/note.txt) | brief |
| [`tools/keygenmenasm-solve.py`](tools/keygenmenasm-solve.py) | keygen |
| [`analysis/ok.txt`](analysis/ok.txt) | `good work :)` |

## Réponse

| Champ | Exemple (`petik`) |
|---|---|
| Username | **`petik`** (longueur corps 3..13) |
| Password | **`uuu}k`** |

```bash
python3 tools/keygenmenasm-solve.py -q --user petik
# petik:uuu}k

python3 tools/keygenmenasm-solve.py --check --user petik
```

> Les deux `read()` enchaînés : envoyer username puis password en **deux écritures** (sinon le 1er `read` avale tout le pipe).

---

## Prédicat

1. `|username|` ∈ (3, 14] octets lus (typiquement corps + `\n`).
2. `|password|` == `|username|`.
3. Sur le corps (sans le `\n` final du compteur interne `len-1`) :

```text
al = 5
for c in username:
    out = c | al
    al = c
```

4. `password == out` (byte à byte, y compris `\n`).

## Debug GDB (pas à pas)

ELF32 **statique**, **non strippé** (`cipher`, `again`, `yep` / `nope`). Entry `_start` `@0x8048080`.

```bash
gdb -nx -q ./original/keygenme
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) disassemble cipher
(gdb) disassemble again
```

| Adresse / symbole | Rôle |
|---|---|
| `0x80480ac` | `read` username → `@0x8049284` (max 15) |
| `0x80480c2` / `0x80480cc` | rejet si `eax ≤ 3` ou `> 14` |
| `0x80480eb` | `read` password → `@0x8049293` |
| `0x8048102` | `|pwd| == |user|` |
| `cipher` `0x804811a` | boucle `out = c \| al` ; `al = c` (seed `al=5`) |
| `again` `0x8048134` | `cmp` byte à byte (index décroissant) |
| `yep` `0x804818b` | `good work :)` |

```text
(gdb) break *0x804811a
(gdb) break *0x804813a
(gdb) run
# username : petik
# password : uuu}k     (2ᵉ write — sinon le 1er read avale tout)
(gdb) x/s 0x8049284
(gdb) # après cipher (break on again) : username transformé in-place
(gdb) x/5c 0x8049284         # 'u','u','u','}','k'
(gdb) x/s 0x8049293
(gdb) continue               # cmps OK → good work :)
```

Pour `petik` : seed `5` puis `p\|5='u'`, `e\|'p'='u'`, `t\|'e'='u'`, `i\|'t'='}'`, `k\|'i'='k'`.

## Notes

- Symbole `cipher` / `again` visibles (non strippé).
- Échec username trop court/long → `mmmmm , this doesn't seem like a username`.
