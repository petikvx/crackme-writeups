# soulreaper's XorGate

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a768ab608712c1a17cbacdd) · id `6a768ab608712c1a17cbacdd`

Crackme **Linux** ELF64 PIE, C, **non stripé**.  
Auteur site : **soulreaper**. Difficulty **1.5** · quality **4.6**.

Dossier : `authors/soulreaper/6a768ab608712c1a17cbacdd/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/XorGate`](original/XorGate) | ELF64 PIE |
| [`tools/xorgate-solve.py`](tools/xorgate-solve.py) | keygen user → password |

## Réponse

| | |
|---|---|
| Username | **`petik`** |
| Password | **`5346574a48@password`** |
| Flag | **`FLAG{SoulReaper_XOR_Crackme}`** |

```bash
python3 tools/xorgate-solve.py -q
# 5346574a48@password

printf 'petik\n5346574a48@password\n' | ./original/XorGate
# [+] Access granted!
# [+] FLAG{SoulReaper_XOR_Crackme}
```

---

## 1. Premier regard

```text
ELF 64-bit LSB pie, not stripped
sha256 fba3829b3f141e5ecaca2197871380bb571cb72c805a7eaea0c8d22580ed7120
```

Strings : `Username:`, `Password:`, flag en clair dans `.rodata`.

---

## 2. Flow

1. `scanf("%255s")` username puis password  
2. Pour chaque octet du username : `c ^ 0x23` → `snprintf("%02x")`  
3. Concatène le littéral **`@password`**  
4. Compare au password (longueur + octets)  
5. OK → flag + lien t.me

---

## 3. Prédicat

```python
password = "".join(f"{ord(c) ^ 0x23:02x}" for c in username) + "@password"
```

`0x23` est stocké en local (`mov BYTE [rbp-…], 0x23`).

---

## Debug GDB (pas à pas)

ELF64 **PIE**, **non strippé** → `break main` OK. Clé XOR en local : `movb $0x23, …`.

```bash
gdb -q ./original/XorGate
(gdb) break main
(gdb) run < <(printf 'petik\n5346574a48@password\n')
(gdb) # après 1er scanf :
(gdb) x/s $rbp-0x410          # username
```

### Boucle XOR → hex

| Offset `main` | Rôle |
|---|---|
| `+30` | `movb $0x23, [rbp-0x456]` — clé |
| `+198` | charge `user[i]`, `xor` avec `0x23` |
| `+287` | `snprintf("%02x")` dans le buffer attendu |
| `+324` | empile littéral `@password` (`movabs …617040`) |
| compare | password saisi vs buffer dérivé |

```text
(gdb) break *main+218          # xor al
(gdb) commands
> silent
> printf "c='%c' ^0x23 → %02x\n", $rax & 0xff, ($rax & 0xff) ^ 0x23
> continue
> end
(gdb) continue
# p→53, e→46, t→57, i→4a, k→48
```

### Succès

```text
(gdb) break puts
(gdb) continue
# [+] Access granted! / FLAG{SoulReaper_XOR_Crackme}
(gdb) find 0x555555556000, +0x2000, 'F','L','A','G'   # flag aussi en .rodata
```

---

## 4. Vérification

```bash
python3 tools/xorgate-solve.py --check 5346574a48@password --user petik
# check=OK …
```

---

## 5. Notes

- Le FLAG est aussi en clair dans le binaire ; le challenge reste le keygen XOR.  
- Même auteur : [Dead Terminal](../6a77c5d1df981859694944b8/), [Death Trap](../6a7d0ce1184836c0dbe7d77e/).
