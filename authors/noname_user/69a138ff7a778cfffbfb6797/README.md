# noname_User's Test my obf. PLS

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/69a138ff7a778cfffbfb6797) · id `69a138ff7a778cfffbfb6797`

Crackme **Python** (script console).  
Auteur site : **[noname_User](https://crackmes.one/user/noname_User)**.

| Fichier | Rôle |
|---|---|
| [`original/test_protect.py`](original/test_protect.py) | stub b85+XOR+zlib+marshal |
| [`analysis/deobfuscated.py`](analysis/deobfuscated.py) | logique RGB claire |
| [`tools/test-my-obf-solve.py`](tools/test-my-obf-solve.py) | extrait le texte |

## Réponse

Pas d’input : le secret est le texte RGB.

| Champ | Valeur |
|---|---|
| Texte | **`hello`** |

```bash
python3 tools/test-my-obf-solve.py -q --check
# hello
timeout 1 python3 original/test_protect.py
# … \x1b[38;2;…mhello
```

---

## Premier regard

```text
$ file original/test_protect.py
Unicode text, UTF-8 text, with very long lines (1357)

# PROTECT BY NONAME
_k = bytes.fromhex('a8a2501e…0133')   # 32 octets
_r = base64.b85decode(...)
_x = XOR(_r, tile(_k))
exec(marshal.loads(zlib.decompress(_x)), ...)
```

Description site : AST destruction / bytecode fracturing / Chaos VM — ici la couche utile est surtout **b85 + XOR + zlib + marshal**.

---

## Flow

```text
test_protect.py
  → b85decode → XOR clé 32o → zlib → marshal
       → main() : colorsys HSV → ANSI RGB → print "hello" en boucle
```

---

## Vérification

```bash
python3 tools/test-my-obf-solve.py --check
# check: OK
```

---

## Notes

- Plus simple que [Unbreakable Python?](../699c06a46ca1599050950670/) du même auteur (pas de HWID / CFF).
- Goal = retrouver la logique / le texte, pas un serial.
