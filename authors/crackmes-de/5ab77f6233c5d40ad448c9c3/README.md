# crackmes.de's yyyyyyy1

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6233c5d40ad448c9c3) · id `5ab77f6233c5d40ad448c9c3`

Keygenme **ELF32** NASM, fortement obfusqué (junk, chemins inversés). Auteur : **yyyyyyy**.

| Fichier | Rôle |
|---|---|
| [`original/yyyyyyy1.tar.gz`](original/yyyyyyy1.tar.gz) | archive |
| [`original/yyyyyyy1`](original/yyyyyyy1) | ELF |
| [`original/readme.txt`](original/readme.txt) | brief |
| [`tools/yyyyyyy1-solve.py`](tools/yyyyyyy1-solve.py) | keygen |
| [`analysis/ok.txt`](analysis/ok.txt) | `win!` |

## Réponse

| Input | Exemple |
|---|---|
| Key (16 chars) | **`8bwh8ZVdOlNOZ5T\`** |

```bash
python3 tools/yyyyyyy1-solve.py -q
printf '%s\n' '8bwh8ZVdOlNOZ5T\' | ./original/yyyyyyy1
# yyyyyyy1 ~> win!
```

## Prédicat

1. `read` puis longueur effective `n-1 == 16` (donc 16 chars + `\n`).
2. Chaque octet ∈ `[0x21, 0x7a]` (`!`..`z`).
3. Checksum :

```text
ebx = 0
for c in key[1:16]:
    ebx = (~((ebx ^ c) + 0x2a) - 1) & 0xffffffff
key[0] == ebx & 0xff
```

Beaucoup de clés valides — le solveur en tire une au hasard (seed fixe).

## Debug GDB (pas à pas)

ELF32 NASM obfusqué, entry **`0x8048080`** (`xor eax,eax` / `je 0x8048140` — saute le junk).

```bash
gdb -nx -q ./original/yyyyyyy1
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) break *0x8048140
(gdb) run
(gdb) x/30i $eip
```

| Adresse | Rôle |
|---|---|
| `0x8048080` | entry → jump réel `@0x8048140` |
| `0x804815f` | premier `int 0x80` (write prompt décodé) |
| `0x804846b` / `0x8048484` | charset : `cmp al, 0x21` / `cmp al, 0x7a` |
| `0x80484bd`…`0x80484de` | checksum : `xor ebx,c` ; `add ebx, 0x2a` ; `not` / `dec` |
| `0x80484e2` | `cmp bl, [esi]` — **key[0] == ebx & 0xff** |
| `0x80485fa` | branche succès (retour 0) vs fumée `0x1337` `@0x804861c` |
| `0x804867c` / `0x804868e` | helper `write` (`int 0x80`) → `win!` |

```text
(gdb) break *0x80484e2
(gdb) run
# saisir 8bwh8ZVdOlNOZ5T\ + Entrée (16 chars)
(gdb) print/x $ebx
(gdb) x/bx $esi              # premier octet de la clé
(gdb) continue               # → yyyyyyy1 ~> win!
```

```bash
gdb -nx -batch -ex 'set debuginfod enabled off' -ex 'file ./original/yyyyyyy1' \
  -ex 'starti' -ex 'x/5i 0x8048140' -ex 'x/8i 0x80484bd'
KEY=$(python3 tools/yyyyyyy1-solve.py -q)
printf '%s\n' "$KEY" | ./original/yyyyyyy1
```

## Notes

- Prompt / messages décodés via `~(c) + remaining + 1`.
- Branche « 0x1337 » / ret 0 : fumée anti-RE ; le vrai succès affiche `win!` quand le check renvoie **0**.
