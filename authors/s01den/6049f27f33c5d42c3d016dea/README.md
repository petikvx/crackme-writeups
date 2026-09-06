# S01den — 0verney

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6049f27f33c5d42c3d016dea) · id `6049f27f33c5d42c3d016dea`

ELF64 dynamique : `main` ne fait qu’un `puts("Hello there!")`. Le vrai challenge est dans un **PT_LOAD caché** @ `0xc003ef8` (magic ELF `de c0 ad de`).  
Auteur : [S01den](https://crackmes.one/user/S01den).

Dossier : `authors/s01den/6049f27f33c5d42c3d016dea/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`0verney`](original/0verney) | binaire (~17 Ko) |
| [`0verney-solve.py`](tools/0verney-solve.py) | password sum + `--check` |

## Réponse

| | |
|---|---|
| Exemple (`petik…`) | **`petikpppq`** |
| Contrainte | `Σ ord(c) == 0x3de` (**990**), puis `\\n` |
| Succès | **`G00d`** |

```bash
python3 tools/0verney-solve.py -q
# petikpppq
python3 tools/0verney-solve.py --check
# G00d / OK
```

Toute chaîne (≤12 chars utiles) de somme 990 marche — ex. `nnnnnnnnn`.

---

## 1. Premier regard

```text
ELF 64-bit LSB executable, x86-64, dynamically linked, not stripped
sha256: 7d28b351023d1cca44d6c901c45a5041391d8234e396beb1e9d2d39650ab0c01
ELF padding / ABI note : de c0 ad de
.init_array → 0xc003f7e (ptrace)
.fini_array → 0xc003ef8 (loader shellcode)
```

Sous `strace` / gdb : `PTRACE_TRACEME` échoue → `exit(0)` silencieux. Sans traceur : le shellcode tourne.

---

## 2. Flow (segment caché)

```text
ctor ptrace: TRACEME OK → continue ; sinon exit
fini / stub 0xc003ef8:
  mmap RWX
  copie + XOR 0x60 pour index > 0xc2
  jmp mapped+0xc3
shellcode:
  read(0, buf, 13)
  sum = Σ bytes jusqu’à '\\n'
  if (0xaf75 XOR sum) == 0xacab → write "G00d" else "Bad!"
  exit
  (+ suite : infection ELF / parasite — hors scope password)
```

---

## 3. Prédicat

```text
0xaf75 ⊕ sum == 0xacab
sum == 0xaf75 ⊕ 0xacab == 0x3de == 990
```

---


## Debug GDB (pas à pas)

ELF64 EXEC non strippé. Entry `0x401040`, `main` `@0x401126`. **PT_LOAD RWE** caché `@0xc003ef8` (shellcode). Anti-`ptrace` : sous GDB, `main` peut se contenter d’un `puts` + `ret` (chemin « tracer détecté ») — le shellcode utile ne s’exécute pas comme en natif.

```bash
export DEBUGINFOD_URLS=
gdb -nx -q ./original/0verney
(gdb) set debuginfod enabled off
(gdb) break main
(gdb) run
(gdb) disassemble main
# sous trace : puts @0x402004 puis return 0 — pas le check Σord
(gdb) info proc mappings
# chercher mapping …0xc003000 rwx (segment caché)
```

Hors GDB (ou avec contournement anti-debug) : Σ`ord == 990` (ex. `petikpppq`) → `G00d`.

`solution_summary` : hidden PT_LOAD shellcode ; Σord==990 (`petikpppq`) → G00d ; anti-ptrace.

## 4. Vérification

```bash
printf 'petikpppq\n' | ./original/0verney | xxd
# 4730 3064  = G00d
printf 'AAAA\n' | ./original/0verney | xxd
# 4261 6421  = Bad!
```

---

## 5. Notes

- Ne pas analyser sous strace sans patcher le check ptrace.
- `main` / « Hello there! » est un leurre ; la sortie utile est `G00d` / `Bad!`.
