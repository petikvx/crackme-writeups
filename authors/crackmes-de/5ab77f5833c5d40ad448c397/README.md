# crackmes.de's 888 (crp)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5833c5d40ad448c397) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | crp (miroir crackmes.de) |
| **Plateforme** | Linux ELF32 tiny (888 octets, no section headers) |
| **Type** | argv + anti-debug SIGTRAP → print `OK` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/888.tgz` | archive |
| `original/888/888` | binaire 888 octets |
| `original/888/readme.txt` | *make it print 'OK', no patching please* |
| `tools/888-solve.py` | argv + check gdb |

## Réponse

```bash
./original/888/888 x y key
```

| Contrainte | Valeur |
|---|---|
| `argc` | ∈ **[4, 0x40]** |
| un `argv[i]` | 3 premiers octets = **`key`** |

```bash
python3 tools/888-solve.py -q
# ./888 x y key
python3 tools/888-solve.py --check
```

## Premier regard

```text
ELF 32-bit LSB executable, Intel 80386, statically linked, no section header
size 888 ; readme : make it print 'OK', no patching please
```

## Flow / prédicat

Obfuscation lourde (retaddr patchés avec constantes `GOOD` / `0x10101010`, handlers `SIGTRAP` / `SIGFPE`).

Chemin succès (extrait) :

1. Handler SIGTRAP incrémente le compteur `[0x804837c]`, pose la clé `[0x8048384] = 0xd4a08f90`.
2. Parse argv : refuse si pas d’argument « key… » / argc hors plage (`ARGS`).
3. Avant le `write` final :
   - `xor dword [esp], [0x8048384]`
   - si compteur ≠ 2 → force `NO\r\n`
   - sinon laisse le dword (ex. `0xdeadc4df ^ 0xd4a08f90` = **`OK\r\n`**)

## Debug GDB (pas à pas)

ELF32 tiny, **pas de section headers**. Entry observée sous `starti` : **`0x804823f`**. Le contrôle de flux s’appuie sur **`SIGTRAP`** (handler qui pose la clé et incrémente un compteur) — GDB doit **laisser passer** le signal au programme, sinon le prédicat OK ne se construit pas.

```bash
gdb -nx -q ./original/888/888
(gdb) set debuginfod enabled off
(gdb) handle SIGTRAP nostop noprint pass
(gdb) handle SIGFPE  nostop noprint pass
(gdb) starti
(gdb) x/20i $eip
```

| Adresse / symbole | Rôle |
|---|---|
| `0x804823f` | entry / premier trampoline |
| `0x804829f` | handler-ish : `mov dword [0x8048384], 0xd4a08f90` |
| `0x804837c` | compteur SIGTRAP (doit valoir **2** pour OK) |
| `0x8048384` | clé XOR du dword affiché |
| `0x804832d` | fin de chemin : XOR `[esp]` avec la clé puis `write` |

Sur kernels récents le 2ᵉ `sigreturn` casse souvent le flux natif (`NO`). Pour **prouver** le prédicat sans patcher `original/` (comme le solveur `--check`) :

```text
(gdb) break *0x804823f
(gdb) run x y key
(gdb) set {int}0x804837c = 2
(gdb) set {int}0x8048384 = 0xd4a08f90
(gdb) set $esp = $esp - 4
(gdb) set {int}$esp = 0xdeadc4df
(gdb) set $pc = 0x804832d
(gdb) continue
# → OK
```

```bash
# équivalent batch (déjà encapsulé dans tools/888-solve.py --check)
gdb -nx -batch \
  -ex 'set debuginfod enabled off' \
  -ex 'handle SIGTRAP nostop noprint pass' \
  -ex 'break *0x804823f' \
  -ex 'run x y key' \
  -ex 'set {int}0x804837c = 2' \
  -ex 'set {int}0x8048384 = 0xd4a08f90' \
  -ex 'set $esp = $esp - 4' \
  -ex 'set {int}$esp = 0xdeadc4df' \
  -ex 'set $pc = 0x804832d' \
  -ex 'continue' \
  --args ./original/888/888 x y key
```

**Piège** : laisser GDB stopper sur `SIGTRAP` (défaut) empêche le handler du crackme de tourner ; `info signals SIGTRAP` doit montrer `pass` vers le programme.

## Vérification

Sur **kernel moderne**, le 2ᵉ `sigreturn` échoue souvent (`ESRCH`) et le binaire affiche `NO` même avec les bons argv — comportement d’époque (2005) cassé.

Le solveur `--check` relance sous gdb la **fin de chemin OK** (compteur=2, clé, `0xdeadc4df` sur la pile) après `run x y key`, sans modifier `original/888/888` :

```bash
python3 tools/888-solve.py --check
# OK
```

## Notes

- Ce n’est **pas** un password stdin ; c’est argv + timing signaux.
- Interdiction de patcher le fichier (readme) : le check gdb ne touche pas l’original on-disk.
