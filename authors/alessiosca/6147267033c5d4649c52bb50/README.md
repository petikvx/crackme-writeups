# alessiosca's python - decryptme

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6147267033c5d4649c52bb50) · id `6147267033c5d4649c52bb50`

Crackme **Python source** multiplateforme (pas un binaire).  
Auteur site : **[alessiosca](https://crackmes.one/user/alessiosca)**. Diff ~1.7 / qualité ~4.8.

Le flag est un **commentaire** dans le source déchiffré de `helloworld_encrypted.py`.  
Méthode annoncée : [python-code-encryptor](https://github.com/alessio-ds/python-code-encryptor) (`pyencrypt.py`).

| Fichier | Rôle |
|---|---|
| [`original/helloworld_encrypted.py`](original/helloworld_encrypted.py) | source chiffré (1 ligne, ~356 KiB) |
| [`analysis/helloworld_decrypted.py`](analysis/helloworld_decrypted.py) | source après 4 peels |
| [`tools/python-decryptme-solve.py`](tools/python-decryptme-solve.py) | peel récursif + flag |

## Réponse

| Champ | Valeur |
|---|---|
| Flag (commentaire) | **`# I'm the flag. Hello!`** |

```bash
python3 tools/python-decryptme-solve.py -q --check
# # I'm the flag. Hello!
# check: OK

python3 analysis/helloworld_decrypted.py
# This isn't the flag you're looking for.
```

---

## Premier regard

```text
$ file original/helloworld_encrypted.py
ASCII text, with very long lines …, with no line terminators

$ sha256sum original/helloworld_encrypted.py
779c984618dd4c81143820ca62f76aa4903285dbbbeebf90313fef63725915ac
```

Forme unique :

```python
import base64;exec(base64.b64decode((base64.b32decode((base64.b16decode('4D46…'))))))
```

Pas de PyInstaller, pas de password interactif : c’est un **decrypt-me**.

## Flow / prédicat

`pyencrypt.py` fait, pour chaque récursion `r` :

1. (une seule fois au début) append `'#' * 1000` au source
2. `b64encode` → `b32encode` → `b16encode` du texte UTF-8
3. wrap dans le stub `import base64;exec(…b16decode…)`

Donc le peel inverse est déterministe :

```text
layer N  →  b16decode → b32decode → b64decode → UTF-8
répéter tant que le stub matche
rstrip('#')  → source clair
```

Ici : **4 couches**, puis **1000** `#` de padding, source final :

```python
print("This isn't the flag you're looking for.")
# I'm the flag. Hello!
```

Le `print` est un leurre ; le flag est la ligne commentaire (confirmé aussi par les write-ups publics, sans s’y fier pour la preuve locale).

## Vérification

```bash
python3 tools/python-decryptme-solve.py -v --check
# flag   = # I'm the flag. Hello!
# layers = 4  pad_hashes = 1000
# check: OK
```

## Notes

- Ce n’est **pas** du crypto à clé : empilement base64/32/16 + `exec`.
- Patch / modification du stub inutile ; keygen non applicable.
- Exécuter le fichier chiffré brut lance le leurre `print` après unwrap runtime — le flag reste dans le source déplié, pas dans la sortie.
