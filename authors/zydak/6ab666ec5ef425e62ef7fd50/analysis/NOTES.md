# LeetObfuscator Crackme — parked (2026-10-18)

Stoppé à la demande : l’obfuscation (LeetObfuscator + watchdog ptrace) dépasse un reverse court. Pas de flag. `status: pending`, `parked: true`.

Page : https://crackmes.one/crackme/6ab666ec5ef425e62ef7fd50  
450 points, langage C/C++, arch x86-64, auto-validation (donc `CMO{…}` côté site). 7 solves au 2026-10-18 (SVz, xpert, bestaireverser, arshi, S3c_Cult, xlamwis, kobac).

Description auteur : l’algo fait moins de 100 lignes ; la difficulté vient de l’obfuscation. **Edit auteur** : un `xor` a été écrit à la place d’un `or`, donc **plusieurs flags passent le binaire** ; un seul est celui attendu sur le site. Contact : Telegram `@breslau10`, Discord `zydak2137`.

Obfuscateur public : [Zydak/LeetObfuscator](https://github.com/Zydak/LeetObfuscator) (fork LLVM). Passes documentées : StringEncryption (clé par site, inlinée), MBA, AAMBA (ADC/SBB qui dépendent de CF), control-flow flattening / dispatcher (sauts indirects), BlockSplitter, AntiAnalysis (octets invalides + `EB` devant les opcodes `FF`), AntiAliasing (un seul buffer de pile, index runtime), VariableSplitting, **Nanomites** (`int3`, le handler réécrit RIP vers le vrai `call`). Le watchdog de ce crackme n’est pas dans le repo public (`Watchdog.cpp` → 404) : le binaire cite `/home/user1/Dev/LeetObfuscatorProLocal/Src/Watchdog.cpp:374` (`assert(WIFSTOPPED(status))` dans `main`).

## Fichiers

Le ZIP crackmes.one (password `crackmes.one`) ne contient que `original/LeetCrackme.7z` (sans mot de passe). Dedans :

| Fichier | Rôle | Taille | SHA-256 |
|---|---|---|---|
| `original/LeetCrackme` | watchdog (parent) | 2318616 | `1aa28374ff51106275fe852bd396f34e47a148fc35a888066126d17a8c303daf` |
| `original/CXXD4` | payload obfusqué (enfant) | 2786528 | `af2e89bb71ba60dc9fff2ff4ceed23012e7a64e7a29857a883e915ce3ef3b76b` |
| `original/README.md` | `To run it execute ./LeetCrackme` | 32 | — |
| `original/LeetCrackme.7z` | archive interne | 1634637 | `bd7e56302197bc1c0443940ed2f02acf33ec66d8bf880b6e3461c4b5505d6a11` |

`CXXD4` ici n’est **pas** le jeu du Tetris DRM (`6ac98924…`, autre hash).

Les deux ELF sont statiques, GCC `(Debian 14.2.0-19) 14.2.0`, Linux 3.2.0, non-PIE (`EXEC`).

- `LeetCrackme` : **stripé**, entry `0x26ed80` (= début `.text`, `0x1ba8c4` octets). `.rodata` VA `0x2005c0`.
- `CXXD4` : **pas stripé au sens ELF**, mais `nm` ne montre que `main` @ `0x4859f0`. Le corps de `main` est déjà de l’obfu (prédicats opaques, `cs sbb` qui recouvre un `lea`, `movabs rsp, …` sur le chemin mort). Lancé seul : `SIGILL` immédiat (nanomites / opcode invalide, pas de handler).

Base IDA headless de `LeetCrackme` : `analysis/LeetCrackme.i64` (gitignorée). Auto-analyse OK. Pas de pseudo utile du check : les strings du challenge ne sont pas en clair dans le parent.

## Lancement

Les deux binaires doivent être dans le **cwd**. `LeetCrackme` fait un `exec` relatif de `./CXXD4`.

```bash
cd authors/zydak/6ab666ec5ef425e62ef7fd50/original
printf 'test\n' | ./LeetCrackme
```

Depuis un autre cwd : `Unable to start child process: No such file or directory` puis abort

`LeetCrackme: …/Watchdog.cpp:374: int main(int, char **): Assertion 'WIFSTOPPED(status)' failed.`

Chemin nominal (cwd bon, pas de traceur) :

1. Bannière L33T CRACKME + encadré `Difficulty : Easy`, `Flags : 1`, `Goal : Find the flag, zero rules`, `Date : 25.09.2026`.
2. Prompt `Password:`.
3. Mauvais mot de passe → `Hell no`, exit 0.

Arbre au prompt :

- parent `LeetCrackme`, `TracerPid: 0`, 1 thread, `Seccomp: 0` ;
- enfant `CXXD4`, `PPid` = le watchdog, **`TracerPid` = pid du watchdog** (le parent est déjà le traceur des nanomites).

`wchan` du parent au prompt est `0` (masqué). État `S`.

## Anti-debug (constaté)

Liste d’outils en clair dans `LeetCrackme` `.rodata` (IDA), autour de `0x210933`–`0x21372c` :

`/proc/self/status`, `TracerPid:` (`0x210bc3`), `/proc/self/maps` (`0x210a52`), `/proc/self/exe` (`0x210b9f`), `/proc/%d/comm` (`0x21370e`), et les noms `gdb-multiarch`, `binaryninja`, `python`, `python3`, `lldb-server`, `lldb`, `idag64`, `ida64`, `idaw64`, `ghidra`, `analyzeHeadless`, `ghidraRun`, `hopper`, `Hopper`, `frida`, `frida-helper`, `frida-server`, `radare`, `radare2`, `strace`, `qemu-x86_64`, `qemu-i386`, `ollydbg`, `x64dbg`, `x32dbg`, `windbg`, `valgrind`, `ltrace`, `xtrace`, `cutter`, `iaito`, `binja`, `rahash2`, `rasm2`, `rarun2`, `pinbin`, `wineserver`, `dotnet`, `inject`, `debug`, `trace`.

Effets vus :

| Condition | Résultat |
|---|---|
| Parent `comm` = `strace` ou binaire strace renommé `tracer` (ptrace quand même) | lit `/proc/<ppid>/comm` puis `SIGSEGV` (`si_addr` du genre `0x2fcf5887` / `0xfd121e17`) |
| Parent = `python3` (subprocess) | `SIGSEGV` au moment du mot de passe ; stdout fully-buffered donc bannière perdue |
| `comm` du parent contient `dump` (`rawdump`) | pas d’enfant `CXXD4` |
| `PTRACE_ATTACH` au prompt (yama `ptrace_scope=1`, parent légitime) | le process meurt `SIGSEGV` (wait status `0x8b`), `/proc/pid/maps` disparaît |
| `PR_SET_DUMPABLE` | le binaire le fait : un autre uid-égal ne lit pas `/proc/pid/maps` |
| seccomp qui refuse seulement `prctl(PR_SET_DUMPABLE)` | le prompt est atteint, `process_vm_readv` marche |
| seccomp `USER_NOTIF` sur `read`/`write`/`readv`/`writev` | tombe dans le chemin watchdog (`ENOENT` + assert `WIFSTOPPED`) |

Un process `python3` ailleurs dans le système **ne** suffit pas à tuer le crackme. Le check vise le parent / `TracerPid` / maps, pas tout `/proc`.

`CXXD4` reste lisible sans être le traceur (dumpable pas coupé sur l’enfant, ou le coupe échoue). C’est le canal qui a marché.

## Ce qui est en mémoire au prompt (enfant `CXXD4`)

Mappings utiles (non-PIE) :

```text
00200000-00276000 r--p  CXXD4
00276000-00491000 r-xp  CXXD4
00491000-0049d000 rw-p  CXXD4
0049d000-004ab000 rw-p  CXXD4
004ab000-004b4000 rw-p  anon
[heap]                ~140 KiB
[stack]               128 KiB
```

Strings déchiffrées (plus dans le binaire sur disque) :

- `Password: ` @ `0x4b3060` (pages anon `0x4ab000`)
- bannière / `Difficulty : Easy` / `Flags : 1` / `Goal` / `Date : 25.09.2026` juste après, ~`0x4b3724`
- copie des mêmes chaînes sur le heap

Pas de `Hell no`, pas de `CMO{`, pas de flag en clair dans le rw + heap **avant** la saisie. Un blob non-ASCII de ~127 octets @ `0x49d8a4` (dans `.data`) se termine par trois pointeurs vers lui-même (`0x49d8a4`) puis les dwords `3, 0x1f, 3`. Pas identifié.

Poll de la stack de `CXXD4` (400 lectures) juste après `write` du mot de passe : **aucune** nouvelle C-string, pas même `test` ni `Hell`. Soit le buffer n’est pas sur la stack, soit le check est plus court que la fenêtre et les octets sont essuyés, soit `Hell no` est émis par le parent. Le heap/BSS n’a **pas** été re-diff pendant le check.

`LeetCrackme` au prompt (scan rw + ro, parent) : les chaînes UI n’y sont pas. Toute la bannière vit dans l’enfant.

## Pistes pour reprendre

1. **Rester dehors du ptrace.** Le watchdog est déjà le traceur ; un second `PTRACE_ATTACH` tue. Continuer en `process_vm_readv` sur `CXXD4` (binaire helper dont le `comm` n’est pas dans la liste — `reader` / `launch` OK, pas `dump*`, pas `python3`, pas `strace`).
2. **Diff heap + `0x4ab000`–`0x4b4000` + stack dans la même boucle C**, du `write` du mot de passe jusqu’à la mort de `CXXD4`, pas seulement la stack. Chercher le buffer d’entrée et toute string neuve (`Hell`, `CMO{`, flag).
3. **Logger depuis le watchdog.** Patcher une copie de `LeetCrackme` (jamais `original/`) au `waitpid` / `ptrace` pour dumper `GETREGS` de l’enfant à chaque stop (`int3` nanomite) et un snapshot après le `read` du password. Le parent a le droit de lire l’enfant.
4. Ne pas interposer seccomp sur `write`/`read` : ça casse le `WIFSTOPPED`. Bloquer `PR_SET_DUMPABLE` seulement si on a encore besoin de `/proc/pid/mem`.
5. L’algo est censé être court, avec un bug `xor` vs `or` (plusieurs mots de passe acceptés par l’ELF). Une fois le prédicat extrait par trace, brute ou inversion, vérifier les deux : message autre que `Hell no`, **et** le flag site (un accepté localement peut être le mauvais).
6. `main` de `CXXD4` @ `0x4859f0` est le point statique si on lève les `EB FF` / nanomites. IDA sur `LeetCrackme` ne voit que le watchdog et la libc statique.

Pas de solveur. Pas de section GDB : aucune session GDB (le nom et `TracerPid` tuent le process).

## Reprise 2026-10-18 (2e passage, toujours parked)

- `main` du watchdog = `0x3fb080` (passé en arg à `__libc_start_main` = `sub_31E7D0` depuis l'entry `0x26ed80`). Non reconnu comme fonction par IDA : prologue obfusqué (`cmp eax,1 / jz $+6` qui recouvre un `adc`, des dizaines d'`and rsp,-16` pour l'allocation de variables locales). Hex-Rays échoue.
- Les chaînes `Watchdog.cpp`, `WIFSTOPPED`, `Unable to start`, `CXXD4` n'existent **pas** en clair dans le fichier `LeetCrackme` (grep -ab vide) : elles sont chiffrées/reconstruites au runtime, donc pas d'ancrage par xrefs de strings.
- Le wrapper `ptrace` libc (`0x3b22b0`) n'a aucune xref directe : appel indirect ou syscall inline. `0x2752e0` (18 Ko) est une grosse fonction de comparaison de chaînes (liste d'outils), pas la boucle ptrace.
- Environnement : pas de root (`sudo -n` refuse), donc pas de bpftrace/perf kernel pour observer les `ptrace()` du watchdog ; `ptrace_scope=1`.
- Reste la piste 3 : patcher une copie du watchdog (hors `original/`) pour logger `GETREGS`/mémoire de l'enfant, ce qui demande d'abord de dé-obfusquer `0x3fb080`.

## Reprise 3 (2026-10-18) : émulation Unicorn parent+enfant — arrêt demandé par l'utilisateur

`tools/dual.py` + `tools/run_dual.py` (constante `D=` à adapter) émulent `LeetCrackme` (watchdog) et `CXXD4` avec un faux ptrace/wait4 : bannière + `Password:` + `Hell no` reproduits (~6 s). Nanomites = `ud2` (SIGILL) ; le watchdog lit `./CXXD4` et `/proc/<pid>/maps`, fait `PEEKUSER rip` puis `POKEUSER rip` (ex. `0x4859a0`→`0x3b2a60`).

Constats sur l'enfant (après le `read` du mot de passe, ~2,3 M instrs, flot de contrôle identique pour tout mauvais mot de passe) :
- mot de passe copié en std::string sur la pile (`0x7fffefffec18`) ;
- étape A : une passe par caractère (~18 k instrs) ; étape B : 64 itérations fixes (~33 k instrs, `0x450192`/`0x4501c0`), index `i % len`, table de 512 dwords (`r15`, masque `0x1ff`), tampon `[rbp-0xa80]` ;
- `0x4b3000`/`0x4b3008` = globals d'état de l'obfuscateur, pas le prédicat ;
- timing check `rdtsc` (seuil `0x5f5e0ff`) à chaque dispatch ;
- diff d'écritures `petik` vs `petil` : plus aucune différence après l'itération 64, la décision finale tient donc dans des registres ; prédicat non extrait.
Taint par instruction en Python : trop lent (>50 min). Pas de flag. Reste `status: pending`, `parked: true`.
