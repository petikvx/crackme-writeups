# 5iriu5 — SSE Login

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/65a81968eef082e477ff5d10) · id `65a81968eef082e477ff5d10`

Login **ELF64** NASM + **SSE2** (`paddb` / `pcmpeqb`). ZIP imbriqué `ssepwd.zip`.  
Auteur : [5iriu5](https://crackmes.one/user/5iriu5).

Dossier : `authors/5iriu5/65a81968eef082e477ff5d10/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`ssepwd.zip`](original/ssepwd.zip) | archive site |
| [`easy`](original/easy) | binaire (symbols) |
| [`harder`](original/harder) | même binaire stripé |
| [`src/ssepwd.s`](analysis/src/ssepwd.s) | source fournie |
| [`sse-login-solve.py`](tools/sse-login-solve.py) | keygen + `--check` |

## Réponse

| | |
|---|---|
| Username | **`plague`** |
| Password | **`god`** |

Buffers exacts (read 8+8, bss zéro) : `plague\n\0` / `god\n\0\0\0\0`.

```bash
python3 tools/sse-login-solve.py -q
# plague god

python3 tools/sse-login-solve.py --check
# hack the planet! → OK
```

---

## 1. Premier regard

```text
original/ssepwd.zip → ssepwd/{easy,harder,src/ssepwd.s,README.md}
easy/harder : ELF64 static
sha256 zip: 1051ebc131c963f5774f028d36bd50b8c68c5bbfc64490ca0ef05273b0d3b17f
```

Hints auteur : ≤8 chars, mots anglais, obfuscation *wrap-around sum*.

---

## 2. Flow

```text
write "username: "; read 8 → username
write "password: "; read 8 → password   # .bss adjacent
xmm0 = movdqu(username)                 # 16 octets = user‖pass
xmm0 = paddb(xmm0, key)                 # add saturante? non : wrap 8-bit
pcmpeqb(xmm0, secret) ; all-FF? → "hack the planet!" else "access denied!"
```

---

## 3. Prédicat

```text
key    = d2 09 23 42 a5 10 79 d5 fb cf 2a 16 c5 fc f6 92
secret = 42 75 84 a9 1a 75 83 d5 62 3e 8e 20 c5 fc f6 92

userpass[i] = (secret[i] - key[i]) mod 256
            = 70 6c 61 67 75 65 0a 00 67 6f 64 0a 00 00 00 00
            = "plague\n\0" ‖ "god\n\0\0\0\0"
```

---

---

## Debug GDB (pas à pas)

ELF64 **statique**, labels `_start` / `won`. Variante `easy` (user+pass SSE).

```bash
gdb -q ./original/easy
(gdb) break *_start+120         # movdqu username/password
(gdb) run < <(printf 'plague\ngod\nXXXXXXX')
# padder si besoin (read 8)
```

| Adresse | Rôle |
|---|---|
| `0x40102c` / `0x401068` | `read` user `@0x402058` / pass `@0x402060` |
| `0x401078` | `movdqu` + `paddb` unwrap |
| `0x401097` | `pcmpeqb` vs cible |
| `0x4010af` | `je won` si tous octets match |

```text
(gdb) break *0x4010ab
(gdb) continue
(gdb) print/x $rdi              # 0xffffffffffffffff si OK
(gdb) break won
(gdb) continue
# "hack the planet!"
```

`harder` : même idée SSE, stripped — breakpoints sur offsets similaires après `starti` / `x/i`.

## 4. Vérification

```bash
python3 -c "import pathlib; u=b'plague\n\x00'; p=b'god\n\x00\x00\x00\x00'; pathlib.Path('/dev/stdout').write_bytes(u+p)" \
  | ./original/easy
# hack the planet!

./original/harder   # même soluce
```

---

## 5. Notes

- Source dans le ZIP : reverse presque « open book », l’intérêt est SSE `paddb` wrap.
- `movdqu username` lit **16** octets : user et pass doivent être contigus (ordre `.lcomm`).
