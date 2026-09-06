# BinaryNewbie's Small Keygenme

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5e83f7f433c5d4439bb2e059) · id `5e83f7f433c5d4439bb2e059`

Keygenme **ELF64** NASM (statique, stripé), débutant. Serial hex 16 caractères.
Auteur : [BinaryNewbie](https://crackmes.one/user/BinaryNewbie).

Dossier : `authors/binarynewbie/5e83f7f433c5d4439bb2e059/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`easy-one.tgz`](original/easy-one.tgz) | archive site (sha256 dans ORIGIN) |
| [`little-crackme`](original/small-crackme/little-crackme) | ELF64 à reverse |
| [`readme.txt`](original/small-crackme/readme.txt) | specs auteur |
| [`small-keygenme-solve.py`](tools/small-keygenme-solve.py) | keygen |
| [`README.md`](README.md) | ce write-up |

## Réponse

Pas de username : n’importe quel **serial de 16 hex** dont chaque chiffre ∈ `{2, 5, 7, D, F}` (casse libre).

| Exemple | |
|---|---|
| **`2222222222222222`** | 16 × nibble pair valide |
| `2557dff52557dff5` | mixte |

```bash
python3 tools/small-keygenme-solve.py -q
# 2222222222222222
printf '2222222222222222' | ./original/small-crackme/little-crackme
# … Valid !!!
```

---

## 1. Premier regard

```text
file original/small-crackme/little-crackme
# ELF 64-bit LSB executable, x86-64, statically linked, stripped

sha256 little-crackme:
1737ca31b11102772d17f5efa0c32a99e5233c472649ccb1ead3c2ba920de819

# archive site (ORIGIN)
sha256 easy-one.tgz:
0c3cd28a4aa9baf1af602872ad94da2050d98e5bba6eb5cd57ad056dbf97d69e
```

Banner / messages : `Welcome…`, `Enter a serial:`, `Valid !!!` / `Not valid !!!`.  
Syscalls manuels (`write`/`read`/`exit`), convention d’appel custom (args empilés, `add rsp` pour sauter l’adresse de retour).

---

## 2. Flow

```text
main:
  write welcome (2 lignes)
  write "Enter a serial: "
  read ≤ 0x10 octets → buf ASCII @ .bss
  exiger len_effective == 0x0F  (bytes_read - 1 == 15  ⇒ 16 octets lus,
                                 sans '\n' dans le buffer — maxlen=16)
  hex_decode(ASCII → 16 nibbles)
  validate_nibbles(16)
  si OK → "Valid !!!" ; exit 0
  sinon → "Not valid !!!" ; exit 1
```

Astuce I/O : `read` demande 16 octets max. Un `echo SERIAL` (16 hex + `\n`) laisse le `\n` hors buffer → OK. Un `printf` sans newline marche aussi.

---

## 3. Prédicat

### Hex decode

Chaque caractère `0-9` / `A-F` / `a-f` → nibble `0..15` stocké sur un octet.  
Tout autre caractère → échec.

### Check par nibble (`test al, 1`)

```c
// n = nibble 0..15
if ((n & 1) == 0) {
    // branche paire
    ok = ((((n ^ 0xDEAD) + 0xBABE) >> 4) + n) == 0x1998;
    // seule solution dans 0..15 : n == 2
} else {
    // branche impaire
    ok = (((n ^ 0x1A) | 0xA) ^ 0x1987) == 0x1998;
    // solutions : n ∈ {5, 7, 0xD, 0xF}
}
```

Les 16 positions sont indépendantes → keygen = tirer 16 fois dans `{2,5,7,D,F}`.

---


## Debug GDB (pas à pas)

ELF64 **statique** strippé, pas de PIE. Entry `0x4001c4`. Mapping : `0x400000` r-xp / `0x600000` rw.

Points durs (objdump + live) :

| Adresse | Rôle |
|---|---|
| `0x4001c4` | entry / dispatch |
| `0x400169` | `test al,1` (nibble pair/impair) |
| `0x400180` / `0x400197` | `cmp eax,0x1998` |
| `0x400226` | call vérif nibble (live BP OK) |

```bash
export DEBUGINFOD_URLS=
gdb -nx -q ./original/small-crackme/little-crackme
(gdb) set debuginfod enabled off
(gdb) break *0x400226
(gdb) run <<< 2222222222222222
# PC=0x400226
(gdb) stepi
(gdb) break *0x400180
(gdb) continue
```

Charset live : nibbles ∈ `{2,5,7,D,F}` ; ex. tout `2` passe.

`solution_summary` : serial 16 hex ∈ `{2,5,7,D,F}` (ex. `2222222222222222`).

## 4. Vérification

```bash
python3 tools/small-keygenme-solve.py --check
# 2222222222222222 -> '…Valid !!!' (rc=0)
# OK
# 2557dff52557dff5 -> '…Valid !!!' (rc=0)
# OK

printf '0123456789ABCDEF' | ./original/small-crackme/little-crackme
# Not valid !!!
```

---

## 5. Notes

- Obfuscation / anti-debug : **0** (comme annoncé dans `readme.txt`).
- Patch interdit par les specs ; inutile ici — le prédicat est ouvert.
- Ce n’est **pas** un name→serial : pas de login `petik`.
- Binaire ~1 KiB, idéal pour lire l’asm NASM à la main (`objdump -d -M intel`).
