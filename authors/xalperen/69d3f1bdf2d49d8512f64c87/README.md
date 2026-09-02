# xalperen's Python OBF Custom VM (KryptonVM)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/69d3f1bdf2d49d8512f64c87) · id `69d3f1bdf2d49d8512f64c87`

Crackme **Python 3.13+** multiplateforme (~1.4 MiB source packé).  
Auteur : **[xalperen](https://crackmes.one/user/xalperen)**. Diff ~4.0.

Packing 3 couches + mini-VM « Krypton » (bytecode self-mod, stack encrypt, constantes AES).  
Objectif annoncé : **password 10 caractères** → flag.

| Fichier | Rôle |
|---|---|
| [`original/crackmefinal.py`](original/crackmefinal.py) | loader + payload fragmenté |
| [`tools/kryptonvm-solve.py`](tools/kryptonvm-solve.py) | unpack + password/flag + `--run-patched` |
| [`analysis/notes.txt`](analysis/notes.txt) | notes reverse |

## Réponse

| Champ | Valeur |
|---|---|
| Password | **`u$u$u$u$u$`** |
| Flag | **`KCTF{5up3r_s3cr3t_krypt0n}`** |

```bash
python3 tools/kryptonvm-solve.py -q --check
# u$u$u$u$u$
# check: OK

# preuve live (Python ≥3.13 + pycryptodomex) — patch du bug de compare :
python3.13 -m venv analysis/.venv && analysis/.venv/bin/pip install pycryptodomex
analysis/.venv/bin/python tools/kryptonvm-solve.py --run-patched --check
# [+] DOĞRU! Flag: KCTF{5up3r_s3cr3t_krypt0n}
```

---

## Premier regard

```text
$ file original/crackmefinal.py
ASCII text, with very long lines …, with CRLF line terminators

# discord: xalperen / Goodluck!
# loader: base64 + hashlib + marshal + zlib
# 10012 chunks b85 + 3 layers flip/shift/blake2-XOR → zlib → marshal
```

Description site : *self-modifying bytecode, stack encryption, AES-256 constants, CFF — Python 3.13+ only*.

Sous 3.12/3.14, `exec` du code object plante souvent (segfault) ; **3.13** + `pycryptodomex` OK.

## Flow

```text
crackmefinal.py
  → assemble chunks / peel 3 layers / zlib / marshal.loads
  → exec <kryptonobf>   # bootstrap VM + helpers
  → main():
       password = input("Password: ")
       if check_password(password):
           print("… Flag: KCTF{5up3r_s3cr3t_krypt0n}")
       else:
           print("YANLIŞ!")
```

## Prédicat (`check_password`)

Après bootstrap, la fonction Python claire (plus la VM) fait :

```python
# docstring: "doğru şifre 'krypton2024'"  (leurre / commentaire)
if len(password) != 10:
    return False
encoded = "".join(chr(ord(c) ^ 66) for c in password)
target = "7f7f7f7f7f"          # stocké dans local `target`
return encoded == "krypton2024"  # BUG: compare la mauvaise constante
```

**Intention** (cohérente avec diff « 10 chars », la locale `target`, et les spoiler comments) :

```text
xor66(password) == "7f7f7f7f7f"  ⇒  password == "u$u$u$u$u$"
```

(`'^' 66` est involutif : `u`→`7`, `$`→`f`.)

**Bug runtime** : `LOAD_CONST '7f7f7f7f7f'` puis `STORE_FAST target` **sans jamais relire** `target` ; la compare utilise `'krypton2024'` (11 caractères) → **aucun** password de longueur 10 ne peut réussir sur le binaire stock. Le flag reste en clair dans les consts de `main`.

Le solveur `--run-patched` remplace la const de compare par `target` et rejoue `main()` → branche DOĞRU.

## Vérification

```bash
# dérivation offline
python3 -c "print(''.join(chr(ord(c)^66) for c in '7f7f7f7f7f'))"
# u$u$u$u$u$

analysis/.venv/bin/python tools/kryptonvm-solve.py --run-patched
# [+] DOĞRU! Flag: KCTF{5up3r_s3cr3t_krypt0n}
```

Sans patch, `printf 'u$u$u$u$u$\n' | python3.13 original/crackmefinal.py` → **YANLIŞ** (bug confirmé).

## Notes

- Ce n’est **pas** un keygen name→serial ; password fixe + flag fixe.
- La VM / AES whitebox sert surtout au bootstrap et au bruit ; le prédicat utile est dans `check_password` post-exec.
- Docstring `krypton2024` et const morte `7f7f…` = honeypot / erreur d’obfuscation.
