# crackmes.de's easy_crackme_2 (lord)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6333c5d40ad448ca8b) · id `5ab77f6333c5d40ad448ca8b`

ELF32 NASM (gzip dans le ZIP site). Auteur : **lord**.

| Fichier | Rôle |
|---|---|
| [`original/cm1eng.gz`](original/cm1eng.gz) | archive gzip site |
| [`original/cm1eng`](original/cm1eng) | ELF |
| [`tools/easy-crackme-2-solve.py`](tools/easy-crackme-2-solve.py) | solveur |
| [`analysis/ok.txt`](analysis/ok.txt) | `Great you did it !:)` |

## Réponse

| Input | Valeur |
|---|---|
| Password | **`pucybut`** |

```bash
printf 'pucybut\n' | ./original/cm1eng
# Great you did it !:)
```

## Prédicat

Ciphertext en `.data` : `QTBXCTU`. Au runtime, XOR `0x21` in-place, puis `rep cmps` sur 7 octets avec l’entrée.

## Debug GDB (pas à pas)

ELF32 static strippé, entry **`0x8048080`**.

```bash
gdb -nx -q ./original/cm1eng
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) x/40i $eip
```

| Adresse | Rôle |
|---|---|
| `0x8048080` | prompt `write` |
| `0x80480a5` / `0x80480aa` | `read(0, buf@0x804911b, 0x100)` |
| `0x80480ac` | `esi = 0x8049126` — ciphertext `QTBXCTU` |
| `0x80480b6`…`0x80480b9` | boucle : `lodsb` ; **`xor al, 0x21`** ; `stosb` |
| `0x80480d5` | `repz cmpsb` — 7 octets input vs plain |
| `0x80480d9` | succès → `Great you did it !:)` `@0x8049105` |

```text
(gdb) break *0x80480b7
(gdb) break *0x80480d5
(gdb) run
# saisir pucybut
(gdb) continue   # plusieurs fois dans la boucle XOR
(gdb) x/s 0x8049126          # après XOR : "pucybut"
(gdb) continue
(gdb) info registers eflags  # ZF si cmps OK
(gdb) continue
```

```bash
gdb -nx -batch -ex 'set debuginfod enabled off' -ex 'file ./original/cm1eng' \
  -ex 'starti' -ex 'x/15i 0x80480ac'
printf 'pucybut\n' | ./original/cm1eng
```
