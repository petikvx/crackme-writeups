# ttlhacker — jittery

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5c44f1bb33c5d475210bc634) · id `5c44f1bb33c5d475210bc634`

ELF64 Linux (PIE, stripé), GCC 8.2 — suite de [hell86](../5bc0fe0033c5d4110a29b296/) : VM + **JIT self-modifying** (code compilé à la volée, modifié par le password). Pas d’anti-debug ; patcher le binaire n’est pas une solution valide.

| Fichier | Rôle |
|---|---|
| [`jittery`](original/jittery) | binaire d’origine |
| [`jittery-source.7z`](original/jittery-source.7z) | sources (mdp = le flag) |
| [`original/source/`](original/source/) | extrait (C + `.jasm` + assembleur Java) |
| [`jittery-solve.py`](tools/jittery-solve.py) | keygen depuis `data_buffer` + `--check` |
| [`analysis/data_buffer`](analysis/data_buffer) | dump 1024×u64 @ VA `0x205020` |
| [`analysis/jittery.i64.c`](analysis/jittery.i64.c) | Hex-Rays (`decc`) |
| [`analysis/writeup-4aca7f6c/`](analysis/writeup-4aca7f6c/) | write-up officiel crackmes.one (réf.) |

## Réponse

| | |
|---|---|
| Password | **`FLAG{wh4t_1s_a_pr0gr4m_c0unt3r?_jit_eng1n3s_ar3_4wes0m3}`** |

```bash
python3 tools/jittery-solve.py -q
# FLAG{wh4t_1s_a_pr0gr4m_c0unt3r?_jit_eng1n3s_ar3_4wes0m3}

python3 tools/jittery-solve.py --check
# … Correct! Well done! … OK
```

Hashes publics (commentaires crackmes.one) :

- SHA-256 = `638da17366d6d99d7a60568a8eba64a71217743f602d9ca2cb961f063bb093b6`
- SHA-1 = `e6cfd29b61e7006e8bf7573cd638bae85bb2d5e1`

---

## 1. Premier regard

```text
ELF 64-bit LSB pie executable, x86-64, dynamically linked, stripped
GCC (Ubuntu 8.2.0-1ubuntu2~18.04) 8.2.0 · GLIBC 2.4+
sha256: 57aa4a74af67ad9a6f33ae92f26deff3877ae648b4688c87df20c9ce53d2a723
imports: mmap, munmap, aligned_alloc, _IO_getc/_IO_putc, __printf_chk, …
```

Bannière (stdin, pas argv) :

```text
[jittery crackme] Good luck!
STRANGE PROCESSORS, INC. CENTRAL VAULT SYSTEM
"We exist to make the world a weirder place." (tm)
Password: … → WRONG! / Correct! Well done!
```

`main` ne fait qu’appeler le runtime JIT :

```c
// VA 0xd10
sub_3460(qword_205020 /* 1024 qwords */, 1024, &unk_207020 /* {10,7} */, 2);
```

---

## 2. Flow (couches)

1. **mmap** RWX de `64 × 0x400` octets : un bloc de 64 B par entrée de `data_buffer`.
2. Init de chaque bloc : `movabs rax, stub; call rax; int3…` + qword raw en queue.
3. Kickoff sur **block[1]** (pas 0) → le stub appelle le compilateur à la volée (`0x3210` / table de JIT).
4. Ordre de compilation piloté par le tableau `{10, 7}` (paramètre 3/4 de `main`).
5. Une fois « compilé », le code exécuté est celui d’une **VM stack** (bytecode dans `.data`), pas du C classique.
6. Le prédicat password **réécrit** un bloc JIT (syscall VM 8) selon le caractère — self-mod.

Sources utiles une fois le flag connu (mdp de l’archive = flag) :

- `original/source/jittery-code/jittery/src/arch/verify_input.jasm`
- `original/source/jittery-code/jittery/src/arch/selfmod_verify.jasm` (commentaire L1 = flag)

---

## 3. Prédicat

Contraintes globales (VM) :

- longueur **56**
- préfixe **`FLAG{`**, suffixe **`}`**
- 50 caractères du corps vérifiés un par un

Pour chaque caractère `c`, quatre signed 32-bit (high half des qwords) `d1…d4` sont lus en suivant le **program counter** LFSR :

```python
def step_register(index):
    mask = 0b1001000000  # bits 6 et 9
    res = (index << 1) & 0x3FF
    return res if (index & mask) in (0, mask) else res + 1
```

Départ : index `0x3F3`. Puis :

```text
op = c - d1          # doit être ∈ {3..9}
r13 = ALU_op(d2, d3) # table JIT : + - * neg & | ^
ok  ⇔ r13 == d4
```

Keygen (inverse) : pour chaque quadruplet, choisir l’op qui satisfait `ALU(d2,d3)==d4`, puis `c = op + d1`.

```bash
# data_buffer extrait du ELF (file off 0x5020)
python3 tools/jittery-solve.py -q
```

---

## 4. Vérification

```bash
printf '%s\n' 'FLAG{wh4t_1s_a_pr0gr4m_c0unt3r?_jit_eng1n3s_ar3_4wes0m3}' | ./original/jittery
# Correct! Well done!

python3 tools/jittery-solve.py --check
# OK
```

Archive sources :

```bash
7z x -p'FLAG{wh4t_1s_a_pr0gr4m_c0unt3r?_jit_eng1n3s_ar3_4wes0m3}' \
  -ooriginal/source original/jittery-source.7z
```

(Comme hell86 : le mdp du `.7z` source = le flag.)

---

## 5. Notes

- Difficulté site ~5 : JIT + VM + self-mod + PC non linéaire — pas un simple `strcmp`.
- Write-up de référence : [4aca7f6c](https://crackmes.one/solution/5c50d3ce33c5d475210bc6cc) (compilateur offline des blocs) ; s4r avait résolu via DynamoRIO.
- Pas de username/keygen user→serial : password fixe (pas d’exemple `petik`).
- `*.i64` gitignoré ; garder le `.c` Hex-Rays sous `analysis/`.
