# crackmes.de's BeatMe (rezk2ll)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6533c5d40ad448cb72) · id `5ab77f6533c5d40ad448cb72`

Keygenme **ELF32** NASM, strippé. Strings en **ROT−1**. Auteur : **rezk2ll**.

| Fichier | Rôle |
|---|---|
| [`original/BeatMe.zip`](original/BeatMe.zip) | archive |
| [`original/BeatMe`](original/BeatMe) | ELF |
| [`tools/beatme-solve.py`](tools/beatme-solve.py) | keygen |
| [`analysis/ok.txt`](analysis/ok.txt) | `CORRECT , YOU WIN` |

## Réponse

| Champ | Exemple |
|---|---|
| Username | **`petik`** (longueur 3..8) |
| Password | **`5tshwln`** |

```bash
python3 tools/beatme-solve.py -q --user petik
# petik:5tshwln
python3 tools/beatme-solve.py --check --user petik
```

## Prédicat

1. Username lu : longueur ∈ [4..9] → corps `L` ∈ [3..8].
2. `password[0] == '0' + L`
3. `password[1] == username[2]`
4. Sur `password[2:]` : decode ROT−1, puis `c -= L//2` ; le résultat (L octets) == username.
5. Anti-debug `rdtsc` (écart > `0x3500` → crash).

Keygen : `pwd[2+i] = user[i] + (L//2) + 1`.

## Debug GDB (pas à pas)

ELF32 **statique**, **strippé**, entry `0x8048080`. Deux `read` séparés + anti-debug `rdtsc`.

```bash
gdb -nx -q ./original/BeatMe
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) x/30i $eip
```

| Adresse | Rôle |
|---|---|
| `0x80480a5` | `read` username → `@0x80493ec` (max `0x14`) |
| `0x80480b8` / `0x80480c1` | longueur ∈ (3, 10) ; `L = eax-1` `@0x804941e` |
| `0x80480f9` | `read` password → `@0x804940a` |
| `0x804812d` | `call` check `@0x80481e4` |
| `0x80481f3` | `pwd[0]-'0' == L` |
| `0x80481fc`…`0x8048224` | `rdtsc` ×2 ; écart > `0x3500` → `div 0` / `int3` |
| `0x8048237` | `pwd[1] == username[2]` (`@0x80493ee`) |
| `0x804823d` | decode ROT−1 sur `pwd[2:]` |
| `0x804826c` | `repz cmpsb` vs username |
| `0x804827e` | succès → bannière `CORRECT , YOU WIN` |

```text
(gdb) break *0x80481e4
(gdb) break *0x804826c
(gdb) run
# 1ʳᵉ invite : petik
# 2ᵉ invite : 5tshwln   (deux saisies distinctes — pas un seul pipe)
(gdb) x/s 0x80493ec          # "petik"
(gdb) x/s 0x804940a          # "5tshwln"
(gdb) print/d *(unsigned char*)0x804941e   # L == 5
(gdb) continue               # passe rdtsc si pas trop lent
(gdb) # au cmpsb : ESI = pwd décodé, EDI = username
(gdb) continue               # → CORRECT , YOU WIN
```

Sous GDB lent, le seuil `0x3500` peut fausser : rejouer, ou avancer au-delà de `0x8048224` après le 1ᵉʳ `rdtsc`.

## Notes

- Bannières ASCII art décodées à la volée (`dec` sur chaque octet).
- Envoyer user/pass en **deux écritures** (même piège pipe que KeygenmeNasm).
