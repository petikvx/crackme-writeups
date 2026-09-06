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
