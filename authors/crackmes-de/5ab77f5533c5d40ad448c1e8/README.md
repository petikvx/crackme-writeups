# damos_crackme_1_for_win32 by damo2k (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1e8>
- **Plateforme** : Windows **PE32** i386 console, C (MSVC 6, CRT statique, seul import `KERNEL32.dll`) — difficulté 2.0
- **Archive** : `original/crkme1-win32.zip` → `crkme1-win32.exe` + `crkme1.txt`
- **Statut** : résolu (keygen), vérifié **live sous wine**
- **Jumeaux** : même code C que [damos_crackme_1_for_linux](../5ab77f5533c5d40ad448c1e6/) et [damos_crackme_1_for_solaris](../5ab77f5533c5d40ad448c1e7/) (le `crkme1.txt` : « Executables for Win32, Linux, Solaris are using the same code »)

## Solution

```
wine original/crkme1-win32.exe POFKPPEZAS     →  Good Serial!
python3 tools/damo-crackme1-win32-solve.py -n 4 --check
POFKPPEZAS -> Good Serial!
QY5SZIMIKT -> Good Serial!      (aléatoires, changent à chaque run)
...
POFKPPEZAX -> Bad Serial!
SHORT -> Bad Serial!
```

Serial en argument (`argv[1]`), **10 caractères**, minuscules upcasées en place (`sub al,0x20`), puis (`s` = serial upcasé) :

| Contrainte | Exemple `POFKPPEZAS` |
|---|---|
| `s[0] = s[9] - 3` | `P` = `S` − 3 |
| `s[1] = s[8] + 14` | `O` = `A` + 14 |
| `s[2] = s[7] - 20` | `F` = `Z` − 20 |
| `s[3] = s[6] + 6` | `K` = `E` + 6 |
| `s[0] = (s[4] + s[5]) / 2` (division entière) | `P` = (`P` + `P`) / 2 |

Pas de nom, donc pas de serial pour `petik` : c'est un serial à contraintes, il y en a des milliers (le keygen en tire au hasard). Un serial commençant par `PETIK` est impossible (il faudrait `s[7] = 'h'`, upcasé en `H`).

## Comment on trouve

1. `crkme1.txt` : « Run from command line and pass in a serial as an argument », « No Patching », non packé. Le binaire n'importe que `KERNEL32.dll` : la CRT MSVC est liée en statique, donc pas de `printf` visible dans les imports.
2. Point d'entrée `0x401121` (startup CRT) ; `main` est la toute première fonction de `.text`, à `0x401000`. `objdump -d -M intel --start-address=0x401000 --stop-address=0x401121` suffit :
   - `argc <= 1` → message d'usage (`0x406030`) ;
   - `repnz scasb` + `not ecx ; dec ecx` = `strlen(argv[1])`, comparé à `0xa`, sinon *Bad Serial!* (`0x406058`) ;
   - boucle `cmp al,0x61 / jl` + `cmp al,0x7a / jg` → `sub al,0x20` : upcase en place ;
   - quatre blocs `movsx` / `sub|add imm` / `cmp` / `jne bad` : `s9-3`, `s8+0xe`, `s7-0x14`, `s6+6` ;
   - dernier bloc : `s5+s4`, puis `cdq ; sub eax,edx ; sar eax,1` (division signée par 2, version MSVC de l'idiome GCC `shr 0x1f ; add ; sar`) comparé à `s0` → *Good Serial!* (`0x406044`).
3. C'est exactement le même enchaînement que la version Linux : on reprend le keygen (on choisit `s9`, `s8`, `s7`, `s6`, puis `s4` et `s5` tels que `s4+s5 ∈ {2·s0, 2·s0+1}`), en restant dans `[A-Z0-9]`.

## Vérification

- Live sous wine : `POFKPPEZAS` et `pofkppezas` → `Good Serial!` ; `POFKPPEZAX`, `ABC` → `Bad Serial!`.
- `tools/damo-crackme1-win32-solve.py --check` lance l'exe sous wine sur le serial fixe + des serials aléatoires générés.
