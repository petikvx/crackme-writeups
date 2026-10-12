# damos_crackme_1_for_solaris by damo2k (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1e7>
- **Plateforme** : Solaris **ELF32 SPARC** (big-endian), C, non strippé — difficulté 2.0
- **Archive** : `original/crkme1-solaris.tar.gz` → `crkme1-solaris` + `crkme1.txt`
- **Statut** : résolu (keygen), vérifié par **émulation Unicorn SPARC du vrai `main()`** (pas de machine Solaris/SPARC sous la main)
- **Jumeau** : même code C que [damos_crackme_1_for_linux](../5ab77f5533c5d40ad448c1e6/) (le `crkme1.txt` le dit : « Executables for Win32, Linux, Solaris are using the same code »)

## Solution

```
python3 tools/damo-crackme1-sparc-solve.py -n 4 --check
POFKPPEZAS -> Good Serial!
PD4SXHMH6S -> Good Serial!      (aléatoires, changent à chaque run)
...
POFKPPEZAX -> Bad Serial!
SHORT -> Bad Serial!
```

Serial en argument, **10 caractères**, minuscules upcasées (`-0x20`), puis (`s` = serial upcasé) :

| Contrainte | Exemple `POFKPPEZAS` |
|---|---|
| `s[0] = s[9] - 3` | `P` = `S` − 3 |
| `s[1] = s[8] + 14` | `O` = `A` + 14 |
| `s[2] = s[7] - 20` | `F` = `Z` − 20 |
| `s[3] = s[6] + 6` | `K` = `E` + 6 |
| `s[0] = (s[4] + s[5]) / 2` (division entière) | `P` = (`P` + `P`) / 2 |

## Comment on trouve

1. `file` : ELF 32 bits MSB SPARC, interpréteur `/usr/lib/ld.so.1`, symboles présents (`main` @ `0x105f8`, 1024 octets). `objdump` du système ne connaît pas SPARC → désassemblage avec **capstone** (`CS_ARCH_SPARC`, big-endian) sur `.text`.
2. Lecture du listing SPARC (délais de branchement : l'instruction après `call`/`b*` est le *delay slot*, ici toujours `nop`) :
   - `call 0x20b60` (PLT `strlen`) sur `argv[1]`, `cmp %o0, 0xa` ;
   - boucle `ldub` / `sll 0x18 ; sra 0x18` (extension de signe d'un `char`) / `cmp 0x60` / `cmp 0x7a` / `add -0x20` / `stb` = upcase en place ;
   - cinq blocs `add %o1, imm` + `cmp` + `be` : `-3`, `+0xe`, `-0x14`, `+6`, puis `(s4+s5)` avec l'idiome `sra 0x1f ; srl 0x1f ; add ; sra 1` (division signée par 2) comparé à `s0`.
   - `.rodata` @ `0x10a98` : `Bad Serial!` / `Good Serial!` / `%s\n` / `Usage: %s <serial>\n`, imprimés via `call 0x20b6c` (PLT `printf`).
3. Exactement le même prédicat que la version Linux x86 → même keygen.

## Vérification

- Pas de Solaris/SPARC natif ni de `qemu-sparc` utilisable (binaire lié à `libc.so.1` Solaris) : `tools/damo-crackme1-sparc-solve.py --check` charge les `PT_LOAD` du binaire dans **Unicorn** (`UC_ARCH_SPARC`, 32 bits big-endian), prépare `argc`/`argv`, simule seulement `strlen` et `printf` de la PLT (retour à `%o7+8`) et exécute **le vrai `main()`** jusqu'à son `ret`.
- Résultat : `Good Serial!` pour les serials générés, `Bad Serial!` pour `POFKPPEZAX` et pour une longueur ≠ 10.
- Recoupé avec la version Linux : `POFKPPEZAS` y est validé **en natif**.
