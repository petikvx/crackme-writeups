# chaltu's a Treasure

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a4014135f26f108ba18ba0b) · id `6a4014135f26f108ba18ba0b`

Crackme **ELF64** packé **PyInstaller** (CPython **3.13**).  
Auteur site : **[chaltu](https://crackmes.one/user/chaltu)**.

Dossier : `authors/chaltu/6a4014135f26f108ba18ba0b/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/treasure`](original/treasure) | binaire d’origine (PyInstaller) |
| [`original/source/treasure.py`](original/source/treasure.py) | source reconstruit depuis le `.pyc` |
| [`analysis/treasure.pyc`](analysis/treasure.pyc) | entry point extrait |
| [`analysis/notes.txt`](analysis/notes.txt) | notes d’extract |
| [`tools/a-treasure-solve.py`](tools/a-treasure-solve.py) | extrait / vérifie le flag |
| [`README.md`](README.md) | ce write-up |

## Réponse

Le « trésor » est le plaintext **base64** embarqué (le XOR n’est **jamais** affiché) :

```text
bb{easy_r3v_challenge_s0lv3d}
```

```bash
python3 tools/a-treasure-solve.py -q
# bb{easy_r3v_challenge_s0lv3d}

python3 tools/a-treasure-solve.py --check
# flag = bb{easy_r3v_challenge_s0lv3d}
# check: OK (banner)
```

Live :

```text
$ ./original/treasure
The secret treasure is hidden in: **********
```

---

## 1. Premier regard

```text
file original/treasure
# ELF 64-bit LSB executable, x86-64, … stripped
diec original/treasure
# Packer: PyInstaller
```

- ~7.7 MiB, chaînes `_MEIPASS`, `PYZ`, `libpython3.13.so`, etc.
- Pas d’entrée utilisateur : un seul `print` puis calcul silencieux.
- SHA-256 `e0e1d7fd6392d0210f0273c1bfbddb4fdb8bb92f8c2ae9d38616c044d2547223`.

---

## 2. Flow

```text
PyInstaller boot → treasure.pyc
  main():
    print("The secret treasure is hidden in: **********")  # leurre
    hidden = decode_message()  # calculé, jamais print
```

---

## 3. Prédicat / extraction

```bash
python3 tools/pyinstxtractor.py original/treasure
# → analysis/…/treasure.pyc (entry)
```

Bytecode (CPython 3.13) — `decode_message` :

1. `encoded = "YmJ7ZWFzeV9yM3ZfY2hhbGxlbmdlX3MwbHYzZH0="`
2. `key = md5(b"s3cr3t_k3y").hexdigest()[:8]` → `1fbffbe9`
3. `data = b64decode(encoded).decode()` → **`bb{easy_r3v_challenge_s0lv3d}`**
4. XOR caractère par caractère avec `key` → blob non affichable (et non utilisé pour l’UI)

Le flag attendu est donc **`data`** (étape 3), pas le résultat du XOR.

---


## Debug GDB (pas à pas)

ELF64 **PyInstaller** (bootloader), EXEC strippé. Entry `0x401cc0` (live confirmé). Le prédicat utile est dans le **`.pyc`**, pas dans le code natif du bootloader — GDB sur l’ELF ne montre guère que le runtime Python.

```bash
export DEBUGINFOD_URLS=
gdb -nx -batch -ex 'set debuginfod enabled off' -ex 'starti' \
  -ex 'break *0x401cc0' -ex 'continue' -ex 'x/10i $pc' -ex 'quit' \
  ./original/treasure
# entry=0x401cc0  (xor ebp / setup argc+argv → PyInstaller)
```

Chemin utile (hors GDB) :

```bash
python3 tools/pyinstxtractor.py original/treasure
# → analysis/…/treasure.pyc  (aussi original/source/treasure.py)
pycdc analysis/treasure.pyc   # ou lire original/source/treasure.py
# b64decode → bb{easy_r3v_challenge_s0lv3d}
```

`solution_summary` : PyInstaller → `treasure.pyc` ; `bb{easy_r3v_challenge_s0lv3d}`.

## 4. Vérification

```bash
chmod +x original/treasure
./original/treasure
# The secret treasure is hidden in: **********

python3 tools/a-treasure-solve.py --check
```

---

## 5. Notes

- PyInstaller + Python **3.13** : `pyinstxtractor` sous 3.12 peut skip le PYZ ; l’entry `treasure.pyc` suffit ici.
- Le message à étoiles est un **constante** dans `main`, pas un masquage dynamique du flag.
- `hashlib` / XOR = piste / code mort côté affichage.
