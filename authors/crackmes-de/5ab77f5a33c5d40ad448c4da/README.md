# easy_celen — s4t4y (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5a33c5d40ad448c4da · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, **statique**, strippé ; anti-debug `ptrace(PTRACE_TRACEME)`
- Archive : `original/celen.tar.gz` → `celen` (extrait sous `analysis/`)

## Réponse

```
the_flag_is_arip_power
```

Le binaire n'a pas de saisie : le flag est **construit sur la pile** par `main` et affiché seulement si un mot de pile vaut `0x400` (voir ci-dessous).

```bash
python3 -I tools/celen-solve.py --check
# flag : the_flag_is_arip_power
# check: OK (gdb : ptrace neutralisé, [esp+0x14]=0x400 -> flag affiché)
```

## Premier regard

```text
$ ./analysis/celen
Welcome!
$ strings -n 6 analysis/celen | grep -n "Welcome"
Welcome!        (le seul message applicatif ; le reste est la glibc statique)
```

Sous `strace`/`gdb` : `ptrace(PTRACE_TRACEME) = -1 EPERM` puis `exit_group(1)` (anti-debug).

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn analysis/celen` ; point d'entrée `0x8048d0a` : `push 0x8048e60` = `main` (argument de `__libc_start_main`), et le constructeur `0x8048e24` (`.init_array`) = le test `ptrace`.

```asm
8048e24: ptrace(PTRACE_TRACEME, 0, 0, 0)  -> call 0x806d880 ; si < 0 : exit(1)    ; anti-debug (constructeur)
8048e60: main :
8048e8c: mov BYTE [esp+0x18],0x74   ; 't'
8048e91: mov BYTE [esp+0x19],0x68   ; 'h'
         … 22 octets : 74 68 65 5f 66 6c 61 67 5f 69 73 5f 61 72 69 70 5f 70 6f 77 65 72
8048efa: puts("Welcome!")                         ; [esp]=0x80be1a8
8048f06: mov eax,[esp+0x14] ; cmp eax,0x400 ; jne fin
8048f16: fprintf(stdout, "%s\n", esp+0x18)         ; <- affiche le flag
```

Les 22 `mov byte [esp+0x18+i], imm8` forment le flag **en clair** dans le code : `74 68 65 5f 66 6c 61 67 5f 69 73 5f 61 72 69 70 5f 70 6f 77 65 72` = `the_flag_is_arip_power`.

**Condition d'affichage** : `[esp+0x14]` n'est écrit par aucune instruction de `main` (le `rep stos` n'efface que `esp+0x18…`) : c'est un reste de pile laissé par `__libc_start_main`/le constructeur. Sur cette machine il vaut `0` ⇒ seul `Welcome!` apparaît ; variations d'environnement ou d'arguments sans effet (testé : 0 à 40 caractères d'environnement, 0 à 5 arguments).

**Pièges :**
- `ptrace(TRACEME)` dans le constructeur : sous `gdb` le programme sort avec le code 1 avant `main` ; on neutralise l'appel (`break *0x8048e49` → `set $eax=0; set $eip=0x8048e4e`).
- Le flag n'est pas en clair dans `strings` (octets immédiats séparés par des `mov`) : seul le désassemblage le révèle.
- Le résidu `[esp+0x14]` n'est pas portable : la preuve force `0x400` avec `set *(int*)($esp+0x14)=0x400`.

## Debug GDB (pas à pas)

```gdb
gdb -nx -batch ./analysis/celen -x script.gdb
# script.gdb :
set debuginfod enabled off
break *0x8048e49                 # call ptrace@0x806d880 (constructeur anti-debug)
commands
  silent
  set $eax = 0                   # simule un succès
  set $eip = 0x8048e4e           # saute le call
  continue
end
break *0x8048f06                 # mov eax,[esp+0x14] avant cmp 0x400
commands
  silent
  set *(int*)($esp+0x14) = 0x400 # force la condition
  continue
end
run
```

Sortie : `Welcome!` puis `the_flag_is_arip_power`. Sans forcer la valeur, `[esp+0x14]` vaut `0` et rien n'est affiché (observé avec `x/wx $esp+0x14`).

## Vérification

```text
$ ./analysis/celen
Welcome!
--- gdb (ptrace neutralisé, [esp+0x14]=0x400) ---     (analysis/verify.txt)
Welcome!
the_flag_is_arip_power
```

## Fichiers

- `analysis/celen`, `analysis/dis.txt` (objdump), `analysis/verify.txt`
- `tools/celen-solve.py` : relit les 22 octets du flag dans le binaire + preuve gdb
