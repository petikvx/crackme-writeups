# ray33ee's obscurio - 1

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a88726c3b246e477b6c094d) · id `6a88726c3b246e477b6c094d`

Crackme **Windows** PE64 console + bytecode `program.bin`.  
Auteur : [ray33ee](https://crackmes.one/user/ray33ee). Série **obscurio** (#1 — le plus facile de la série VM). Diff site **4.2**.

Dossier : `authors/ray33ee/6a88726c3b246e477b6c094d/` — [série](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/crackus.exe`](original/crackus.exe) | host VM (MinGW) |
| [`original/program.bin`](original/program.bin) | bytecode (~26k mots u32) |
| [`tools/obscurio1-solve.py`](tools/obscurio1-solve.py) | password + `--check` Wine |
| [`analysis/wine-verify.log`](analysis/wine-verify.log) | preuve live |

## Réponse

Password **fixe** (pas de username) :

| | |
|---|---|
| **Password** | **`r4y_0b5Curi0_I729`** |

```bash
python3 tools/obscurio1-solve.py -q
# r4y_0b5Curi0_I729

cd original
printf 'r4y_0b5Curi0_I729\n' | WINEDEBUG=-all wine crackus.exe
# Please enter password: well done!
```

`cwd` doit contenir `program.bin` (sinon `fopen: No such file`).

---

## 1. Premier regard

```text
crackus.exe  : PE32+ console x86-64 (GCC 13.1 MinGW)
program.bin  : data LE uint32, 104888 bytes
sha256 crackus   78e57601954380985d539ef126b973b4e32f7c64a05be86a9f4f57f4448175d6
sha256 program   e5699551367488e9ccf9cc66bfeadc4fb3bb79a6218a2ae4cc8815f0a0fe82fc
```

Prompts : `Please enter password:` → `well done!` / `incorrect`.  
Même host VM que [obscurio - 3](../6a9ae805cab6678aefe9dcb2/) (opcodes / stack VM), bytecode **beaucoup plus petit** et encoding d’immediates différent (série « même cœur, programmes différents »).

---

## 2. Flow

```text
crackus.exe
  charge program.bin (cwd)
  VM stack exécute le bytecode
  lit password (stdin)
  prédicat VM → well done! / incorrect
```

Le password n’apparaît **pas** en clair dans l’exe ni dans `program.bin` — check via la VM.

---

## 3. Vérification

```text
r4y_0b5Curi0_I729 → well done! (exit 0)
wrong             → incorrect   (exit 1)
```

Log : [`analysis/wine-verify.log`](analysis/wine-verify.log).  
`python3 tools/obscurio1-solve.py --check`.

---

## 4. Notes

- Spoilers publics crackmes.one donnaient déjà la chaîne ; confirmée live Wine.
- Pour le reverse VM profond / keygen générique : voir tools de **obscurio - 3** (`vm_run`, decode immediates) — à adapter au dialecte #1 si besoin d’un keygen « from scratch ».
