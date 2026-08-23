# Nizzix's Ageis crackme :3

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/693027c02d267f28f69b82b5) · id `693027c02d267f28f69b82b5`

Crackme **`.pyc` CPython 3.13** (obfuscateur [nizzix.xyz](https://nizzix.xyz)).  
Auteur site : **[Nizzix](https://crackmes.one/user/Nizzix)**.

| Fichier | Rôle |
|---|---|
| [`original/x.pyc`](original/x.pyc) | bytecode 3.13 (~400 KiB) |
| [`analysis/test_py.marshal`](analysis/test_py.marshal) | couche finale `test.py` |
| [`analysis/test_reconstructed.py`](analysis/test_reconstructed.py) | logique claire |
| [`tools/ageis-solve.py`](tools/ageis-solve.py) | password + `--check` |

## Réponse

| Champ | Valeur |
|---|---|
| Password | **`OsBuiltinsPass`** |

```bash
python3 tools/ageis-solve.py -q --check
# OsBuiltinsPass
printf 'OsBuiltinsPass\n' | uv run --python 3.13 python original/x.pyc
# Access granted
```

Nécessite **Python 3.13** (`uv python install 3.13`) — magic `f30d0d0a`.

---

## Premier regard

```text
$ file original/x.pyc
Byte-compiled Python module for CPython 3.12 or newer … .py size: 153756 bytes

Description site : « Python 3.13 :) »
Banner : [ AGEIS ] obf with: https://nizzix.xyz
```

Anti-debug (`sys.gettrace`, `IsDebuggerPresent`) + couches lazy (zlib/lzma/marshal) avant le vrai script.

---

## Flow

```text
x.pyc (<l1eo>)
  → <lazy> (hex key + marshal)
  → <banner> (ASCII AGEIS)
  → <infos> (--infos)
  → C:\Users\Xylera\Desktop\pyc\test.py
       exitos():
         pwd = input("Enter a password: ")
         if pwd == "OsBuiltinsPass": print("Access granted")
         else: print("Access denied"); exitos()
```

Hook `marshal.loads` pendant l’exec sous 3.13 pour dumper la couche `test.py` (les strings du shell obfusqué sont chiffrées ; le prédicat final est en clair une fois dépaqueté).

---

## Vérification

```bash
printf 'OsBuiltinsPass\n' | uv run --python 3.13 python original/x.pyc | tee /dev/stderr | grep -q 'Access granted'
```

---

## Notes

- Difficulty 5.0 surtout grâce à l’obfuscateur + taille ; le check password est trivial une fois la dernière couche extraite.
- Ne pas charger le `.pyc` avec CPython 3.12 (`cb0d0d0a` ≠ `f30d0d0a`).
