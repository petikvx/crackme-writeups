# LubimPiskoty — Personal Safe

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5fa94bb233c5d424269a17b7) · id `5fa94bb233c5d424269a17b7`

ELF64 NASM statique : password **16 octets**, quatre sommes de 4 bytes.  
Auteur : [LubimPiskoty](https://crackmes.one/user/LubimPiskoty).

Dossier : `authors/lubimpiskoty/5fa94bb233c5d424269a17b7/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`safe`](original/safe) | binaire |
| [`personal-safe-solve.py`](tools/personal-safe-solve.py) | password + `--check` |

## Réponse

| | |
|---|---|
| Password (exemple) | **`ABABDDDEABABDDDE`** |

```bash
python3 tools/personal-safe-solve.py -q
python3 tools/personal-safe-solve.py --check
# Enter your password: Access granted!
```

(`petik` ne tient pas dans les sommes A=262 / B=273 sur 4 octets — d’où cet exemple ASCII.)

---

## 1. Premier regard

```text
ELF 64-bit LSB executable, x86-64, statically linked, not stripped
sha256: fe53cab82350ec8b8e2007efb3b280da4bc8f4d78189a927de4bea18f7e37a37
symbols: _verify, _verifyLoop, password, right, wrong
```

---

## 2. Flow

```text
write "Enter your password: "
read 16 bytes → password @ 0x402038
A = sum(pw[0:4]) ; also r13 += A
A'= sum(pw[8:12]) ; require A == A'
B = sum(pw[4:8]) ; r13 += B
B'= sum(pw[12:16]) ; require B == B'
require r13 == 0x42e          # sum of all 16 bytes
require A + 11 == B
→ Access granted!
```

---

## 3. Prédicat

```text
2(A+B) = 0x42e  ⇒  A+B = 535
A+11 = B        ⇒  A = 262, B = 273
pw[0:4] et pw[8:12]  : même somme A
pw[4:8] et pw[12:16] : même somme B
```

Exemple : `ABAB` (262) + `DDDE` (273), répété → `ABABDDDEABABDDDE`.

---

## 4. Vérification

```bash
printf 'ABABDDDEABABDDDE' | ./original/safe
# Enter your password: Access granted!
```

---

## 5. Notes

- Buffer 16 octets sans obligation de `\\0` / newline.
- `_verify` additionne 4 octets et accumule aussi dans `r13`.
