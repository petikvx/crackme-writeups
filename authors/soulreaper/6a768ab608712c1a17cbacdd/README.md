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

## 4. Vérification

```bash
python3 tools/xorgate-solve.py --check 5346574a48@password --user petik
# check=OK …
```

---

## 5. Notes

- Le FLAG est aussi en clair dans le binaire ; le challenge reste le keygen XOR.  
- Même auteur : Dead Terminal (solved), Death Trap (pending).
