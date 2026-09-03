# nonzenzes_keygenme1 (nonzenze)

> [crackmes.one](https://crackmes.one/crackme/5ab77f6133c5d40ad448c933) · Keygenme MASM32 — hash `bswap`+add, SEH leurre.

| Fichier | Rôle |
|---|---|
| [`original/_u/keygenme#1.exe`](original/_u/keygenme%231.exe) | challenge |
| [`tools/nonzenze-kg1-solve.py`](tools/nonzenze-kg1-solve.py) | keygen |

## Réponse

| Username | RegCode |
|---|---|
| **`petik`** | **`E4000156`** |

```bash
python3 tools/nonzenze-kg1-solve.py -q
python3 tools/nonzenze-kg1-solve.py --check
```

Contraintes UI : name ≥ 5, code exactement 8 chars.

## Prédicat

1. Lowercase du buffer code ; trim espaces.
2. SEH + `div ebx` (ebx=0) = obfuscation (handlers enchaînent le vrai code).
3. Hash :

```text
ebx = 0
c = name[0]
for i in 0..len(name)-1:
    bswap(ebx)
    ebx += c
    c += 1
RegCode = hex8_upper(ebx)
```

4. Comparaison code saisi ↔ hex via table `xlat` (A–Z → a–z).

## Vérification

Wine : `petik` / `E4000156` → MessageBox **Well Done** / `RegCode is correct`.

## Notes

- Le hash **ne parcourt pas** toute la string : il part de `name[0]` et incrémente le code ASCII `len` fois.
- `decc` → `original/_u/keygenme#1.exe.i64.c` (SEH brouille Hex-Rays).
