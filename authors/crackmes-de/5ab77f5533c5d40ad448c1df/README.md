# crackme1 by adamziaja (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1df>
- **Plateforme** : Linux **ELF64** C++ (libstdc++), non strippé — difficulté 1.0
- **Archive** : `original/crackme1.tar.gz` → `crackme1`
- **Statut** : résolu (keygen), vérifié (**natif**)

## Solution

```
python3 tools/crackme1-solve.py petikpet       →  11269116
python3 tools/crackme1-solve.py --check petikpet
# username doit faire 8..12 caractères (petik seul est trop court)
```

1. `getline` username ; refuse si `len ≤ 7` ou `len > 12`.
2. Lit un **double** (serial).
3. Pour chaque index `i` : `tolower` si `i` pair, `toupper` si impair ; `stringstream << (int)code` (décimal ASCII concaténé).
4. `offset = (len - 8) * 2` ; `serial_attendu = int( stream.substr(offset).substr(0, 8) )` ; compare au double.

`petikpet` → stream `11269116731078010184` → **`11269116`**.

## Comment on trouve

1. `diec` / `file` : ELF64 + debug. Strings `username:` / `s/n OK!` / `s/n WRONG!`.
2. `main` @ `0x40108d` : gate longueur, boucle `tolower`/`toupper` + `operator<<(int)`, `substr` + parse `int` vs double (`ucomisd`).

## Vérification

- `printf 'petikpet\n11269116\n' | ./original/crackme1` → `s/n OK!`
- `tools/crackme1-solve.py --check` (OK + WRONG sur `0`).
