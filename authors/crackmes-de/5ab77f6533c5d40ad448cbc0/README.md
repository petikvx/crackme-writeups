# crackme.03.32 (geyslan)

> [crackmes.one](https://crackmes.one/crackme/5ab77f6533c5d40ad448cbc0) · [`ORIGIN.yml`](ORIGIN.yml) · auteur d’origine **geyslan** (import crackmes.de)

| | |
|---|---|
| **ID** | [`5ab77f6533c5d40ad448cbc0`](https://crackmes.one/crackme/5ab77f6533c5d40ad448cbc0) |
| **Auteur (site)** | crackmes.de / geyslan |
| **Plateforme** | Linux ELF32 (header crafté, syscalls `int 0x80`) |
| **SHA-256 (tar.gz)** | `d37e639ac1e82f3f35b027b59df1be6817f9d714a9cfe32b931088ecac863d15` |

| Fichier | Rôle |
|---|---|
| [`original/crackme.03.32.tar.gz`](original/crackme.03.32.tar.gz) | archive site |
| [`original/crackme.03.32`](original/crackme.03.32) | ELF 372 o (extrait) |
| [`tools/crackme03-solve.py`](tools/crackme03-solve.py) | déchiffre + patch + `--check` |
| [`analysis/crackme.03.32.patched`](analysis/crackme.03.32.patched) | copie patchée (générée) |

## Réponse

**String de succès :** `Omedetou` (japonais : « félicitations »)

```bash
python3 tools/crackme03-solve.py -q
# Omedetou

python3 tools/crackme03-solve.py --check
# … live : 'Omedetou' → OK

./analysis/crackme.03.32.patched
# Omedetou
```

Pas de username / serial : c’est un **patchme**. Le binaire d’origine affiche toujours le badboy.

## Premier regard

```text
$ file original/crackme.03.32
ELF 32-bit invalid byte order (SYSV)   # EI_DATA = 0 (volontaire)

$ ./original/crackme.03.32
Try to find the string of success and make me print it.
```

- 372 octets, **sans** sections / imports / libc — ELF handcrafté, `e_phoff = 4` (PHDR chevauche `e_ident`).
- Base `0x10000`, entry `0x10020`.
- Anti-désassemblage : `jmp` courts par-dessus des octets poubelle (`eb 01` / `eb 02`).

## Flow

1. **Checksum header** : somme des octets `[0x10000, 0x1002e)` ≪ 2 == word `@0x1002e` (`0x140c`).
2. Autres checks sur `e_version` / constante `0x8010` (passent sur l’original).
3. Puis **`xor eax,eax` ; `jnz 0x100e4`** — jump **jamais** pris → chute dans le badboy (`sys_write` du message + `sys_exit`).
4. Chemin mort `0x100e4+` : copie 9 octets chiffrés `@0x10030`, déchiffre, 2ᵉ checksum fichier, `sys_write` de la string.

## Prédicat / crypto

Blob `@file+0x30` (9 octets) :

```text
90 7c 97 ad b6 b6 c6 c0 bf
```

Pour `i = 1..8` :

```text
buf[i] = (buf[i] - 9) ^ 0xAC ^ buf[i-1]
```

→ `\x90Omedetou`. Le runtime fait `inc esp` avant le `write` : le `\x90` est sauté ; longueur 9 avec `\n` final → **`Omedetou\n`**.

## Patch

| Offset fichier | Avant | Après | Effet |
|---|---|---|---|
| `0x84` | `75` (`jnz`) | `74` (`jz`) | entre dans le déchiffrement après les checksums |
| `0x172..0x173` | `6d 7f` | `6c 7f` | recalcule `sum([0..0x172))` (delta −1) |

Le 2ᵉ checksum additionne `[0x10000, 0x10172)` et compare au dword `@0x10172` (high words nuls via mapping `filesz` gonflé). Sans retouche du word final, le patch du `jnz` renvoie au badboy.

## Debug GDB (pas à pas)

L’original a **`EI_DATA = 0`**, `e_phoff = 4` (PHDR chevauche `e_ident`) → **`gdb file original/crackme.03.32` échoue** (`file format not recognized`), alors que le noyau l’exécute. `objdump`/`readelf` sont également fragiles.

**Workaround** : image d’analyse séparée — en-tête ELF32 LSB + PHDR standards, payload (372 o) mappé à `0x1000` → VA `0x10000` (alignement page). Ne pas patcher l’en-tête *in-place* : les octets `@0x20…` sont aussi du code (`mov bl,0x2a` @`0x10020`).

```bash
python3 - <<'PY'
import struct, os
raw=open('original/crackme.03.32','rb').read()
# ou analysis/crackme.03.32.patched pour le chemin succès
e=bytearray(52)
e[0:4]=b'\x7fELF'; e[4]=1; e[5]=1; e[6]=1
struct.pack_into('<HHI', e, 16, 2, 3, 1)
struct.pack_into('<III', e, 24, 0x10020, 52, 0)
struct.pack_into('<IHHHHHH', e, 36, 0, 52, 32, 1, 0, 0, 0)
poff=0x1000
ph=struct.pack('<IIIIIIII', 1, poff, 0x10000, 0x10000, len(raw), 0x10200, 7, 0x1000)
open('/tmp/cm03.gdbelf','wb').write(bytes(e)+ph+bytes(poff-84)+raw)
os.chmod('/tmp/cm03.gdbelf', 0o755)
PY
gdb -nx -q /tmp/cm03.gdbelf
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) printf "EIP=%p\n", $eip   # 0x10020
(gdb) x/12i $eip
```

| Adresse | Rôle |
|---|---|
| `0x10020` | entry : `mov bl, 0x2a` ; checksum header |
| `0x1007f` | `jmp short` anti-disasm → `@0x10082` |
| `0x10082` | `xor eax, eax` |
| `0x10084` | **`jne 0x100e4`** (original `75`) / **`je`** si patché (`74`) |
| `0x10086`…`0x100e2` | badboy `sys_write` + `sys_exit` |
| `0x100e4` | chemin mort (succès) : copie blob `@0x10030`, déchiffre, `write` |

```text
(gdb) break *0x10084
(gdb) run
(gdb) x/4i $eip              # original : jne 0x100e4 (jamais pris après xor eax,eax)
(gdb) continue               # → Try to find the string…

# Même wrapping sur analysis/crackme.03.32.patched :
(gdb) break *0x10084
(gdb) break *0x100e4
(gdb) run
(gdb) x/i $eip               # je 0x100e4
(gdb) continue               # → 0x100e4 déchiffrement → Omedetou
```

Preuve native sans GDB : `./analysis/crackme.03.32.patched` ou `python3 tools/crackme03-solve.py --check`.

## Vérification

```bash
python3 tools/crackme03-solve.py --check
# success string : Omedetou
# patched        → …/analysis/crackme.03.32.patched
# live           : 'Omedetou'
# OK

./original/crackme.03.32
# Try to find the string of success and make me print it.

./analysis/crackme.03.32.patched
# Omedetou
```

## Notes

- Difficulty / quality site : 4.0 / 4.0.
- `file` / `objdump` / `readelf` crachent souvent sur le header ; désassembler en suivant les `jmp` (Capstone / ndisasm / r2).
- Ce n’est **pas** un keygen : aucune entrée utilisateur.
