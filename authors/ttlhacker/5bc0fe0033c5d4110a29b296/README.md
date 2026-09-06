# ttlhacker's hell86

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5bc0fe0033c5d4110a29b296) · id `5bc0fe0033c5d4110a29b296`

ELF64 Linux (PIE, stripped, GCC 6.3 Debian).  
Auteur : **[ttlhacker](https://crackmes.one/user/ttlhacker)**. Diff ~3.0 / qualité ~4.0.

Vérification écrite en assembleur « maison » : chaque insn est un **`UD2`** + 12 octets d’opérandes ; le handler **SIGILL** (`sa_sigaction`) interprète le bytecode sur les registres du `ucontext` (vraie mini-VM x86_64).

| Fichier | Rôle |
|---|---|
| [`original/hell86`](original/hell86) | binaire (SHA-256 `134b53b7…`) |
| [`original/hell86_source.7z`](original/hell86_source.7z) | sources Eclipse ; **mdp = le flag** |
| [`tools/hell86-solve.py`](tools/hell86-solve.py) | inversion cube + `--check` |
| [`analysis/hell86.i64.c`](analysis/hell86.i64.c) | Hex-Rays (setup signaux + switch VM) |
| [`analysis/source/ctf-test/src/`](analysis/source/ctf-test/src/) | `algo.cpp` / `vm.hpp` extraits |

## Réponse

| Champ | Valeur |
|---|---|
| Flag | **`FLAG{x86-1s-s0-fund4m3nt4lly-br0k3n}`** |
| SHA-256 | `8fbc397464bcf802e4091e42aff95ded2999e7041b187058cbe2b8818edad777` |

```bash
python3 tools/hell86-solve.py -q --check
# FLAG{x86-1s-s0-fund4m3nt4lly-br0k3n}
# offline: OK
# 'FLAG{x86-1s-s0-fund4m3nt4lly-br0k3n}' -> 'OK!' (rc=0)
# OK

./original/hell86 'FLAG{x86-1s-s0-fund4m3nt4lly-br0k3n}'
# OK!
```

Pas de username : un seul argument CLI = le flag.

---

## Premier regard

```text
$ file original/hell86
ELF 64-bit LSB pie executable, x86-64, … stripped

$ strings -n 6 original/hell86 | head
abdfgehikmanoqrstucvwlxyz-01h23p456u78j9-_.+
FLAG{
OK!
Wrong
[hell86 crackme] Please pass the flag as a command-line argument.
You have encountered a bug
```

Imports : `sigaction`, `sigaltstack`, `malloc`, `free`, `puts`.  
`main` pose une stack signal, installe un handler **SIGILL** (`sub_1946`), puis appelle `0x1190` — qui commence par `ud2`. Hex-Rays ne décompile pas la zone VM ; le C utile est surtout le grand `switch` d’opcodes.

Archive source chiffrée 7z (ajoutée après coup sur le site) : le mot de passe est **le flag validant** (commentaire crackmes.one).

## Flow

```text
main
  → sigaltstack(8 KiB) + sigaction(SIGILL, SA_SIGINFO|SA_ONSTACK, vm_handler)
  → call 0x1190   # entrée bytecode UD2
       argc==2 ?
       flag = argv[1]
       strlen==36 && prefix "FLAG{" && flag[35]=='}'
       indices = map(body[30], charset)   # malloc n*8 ; call native via reloc
       indices[0] == 22
       differences_xored(indices, 30)
       memcmp(indices, good_differences, 29*8) == 0  → rax=0 → "OK!"
  ← ret VM ; puts(OK! / Wrong / usage / bug)
```

Les `call malloc` / `call free` dans le bytecode sont des **`R_X86_64_64`** vers glibc : le VM fait `RIP = &malloc`, push du retour UD2 suivant — au `ret` natif, nouveau SIGILL et la VM reprend. Les adresses internes sont `R_X86_64_RELATIVE` (PIE).

## Prédicat

Charset (44 symboles) @ `.rodata+0x20a0` :

```text
abdfgehikmanoqrstucvwlxyz-01h23p456u78j9-_.+
```

Corps du flag (30 chars) → indices `a[0..29]` ; contrainte `a[0] = 22` → `'x'`.

Transform (`differences_xored`), pour `k = 29 … 1` :

```text
a[i] ← ((a[i+1] − a[i]) ⊕ k)³
```

Puis comparaison des 29 qwords avec la table `good_differences` @ `0x1fa0` (cubes connus : ±1, ±8, ±125, ±512, …).

**Inversion** : racine cubique entière de chaque entrée → `diff = cbrt ⊕ k` → `a[i+1] = a[i] + diff`, en partant de `a[0]=22`. Unique chemin dans le charset → flag.

Format insn VM (14 octets) :

```text
UD2 | imm64 | opcode | dst | src1 | src2
```

Opcode `9` avec `dst=RIP` = jump ; `0x28` = call (push RIP+14) ; registres = `gregs[]` Linux (RDI=8, RSI=9, …).

## Vérification

```bash
python3 tools/hell86-solve.py --check
./original/hell86 'FLAG{x86-1s-s0-fund4m3nt4lly-br0k3n}'   # OK!
# sources :
7z x -p'FLAG{x86-1s-s0-fund4m3nt4lly-br0k3n}' -oanalysis/source original/hell86_source.7z
```

Le commentaire `//FLAG{x86-1s-s0-fund4m3nt4lly-br0k3n}` est aussi en clair dans `algo.cpp` une fois l’archive ouverte — utile pour confirmer, pas nécessaire pour résoudre.

## Notes

- Ne **pas** patcher les `UD2` : c’est le jeu. Un désassembleur / émulateur du handler suffit.
- `You have encountered a bug` = chemin `rax` hors {0,1,2} après la VM.
- x64dbg MCP : N/A (ELF Linux natif).
