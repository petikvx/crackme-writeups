# crack_me_01 by dynsym (crackmes.de)

- Origine : [ORIGIN.yml](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2b7)
- Auteur : dynsym (archive crackmes.de, publié sur crackmes.one par `crackmes.de`)
- Plateforme : Linux x86, ELF 32 bits, C (GCC 3.3.5 Debian), non strippé, avec debug info
- Difficulté site : 1.0

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme1.zip` | archive d’origine (password `crackmes.one`) |
| `original/crackme1` | binaire ELF extrait (non modifié) |
| `original/README` | consigne de l’auteur (« It will only print 'Solved' when certain conditions are met ») |
| `analysis/crackme1.objdump.txt` | `objdump -d -M intel` complet |
| `analysis/check.txt` | sortie de `--check` |
| `tools/crack_me_01-solve.py` | extrait le mot de passe du binaire, `-q`, `--check` |

## Réponse

Le mot de passe se passe en **premier argument** :

```console
$ ./original/crackme1 __gmon_start__
[!] Solved!
```

Seuls les **10 premiers octets** sont comparés : `__gmon_sta`. Tout argument qui commence par `__gmon_sta`
(`__gmon_sta`, `__gmon_start__`, `__gmon_staXYZ`…) est accepté.

```bash
./tools/crack_me_01-solve.py -q        # → __gmon_sta
./tools/crack_me_01-solve.py --check   # lance le binaire (2 OK + 2 KO)
```

## Premier regard

```console
$ file original/crackme1
ELF 32-bit LSB executable, Intel i386, dynamically linked, for GNU/Linux 2.2.0, with debug_info, not stripped
$ strings -n 4 original/crackme1 | head
/lib/ld-linux.so.2
_Jv_RegisterClasses
__gmon_start__
libc.so.6
getpid  puts  ptrace  exit
...
[!] Solved!
```

Imports très réduits : `getpid`, `ptrace`, `puts`, `exit`. Pas de `printf`/`scanf`/`fgets` : l’entrée ne peut venir
que de `argv`. Sans argument le programme segfaulte (`argv[1]` = NULL) ; avec un mauvais argument il meurt sur
SIGILL/SIGSEGV, sans rien afficher.

Le piège : `strings` montre `__gmon_start__` **deux fois** (une dans `.dynstr` comme symbole, une dans `.rodata`).
On le prend pour du bruit de crt (gprof) alors que c’est justement le mot de passe.

## Flow (`main`, 0x8048430)

```asm
8048442: mov  edi,0x80485d4            ; edi -> chaîne de référence en .rodata
8048447: call getpid
804845c: mov  [esp],0                  ; ptrace(PTRACE_TRACEME=0, getpid(), 0, 0)
8048463: call ptrace                   ; anti-debug « décoratif » : le retour n'est pas testé
8048468: cld
8048469: mov  edx,[ebp+0xc]            ; argv
804846c: mov  ecx,0xa                  ; 10 octets
8048471: mov  esi,[edx+0x4]            ; esi = argv[1]
8048474: repz cmpsb                    ; compare argv[1] et [0x80485d4], 10 octets
8048476: je   80484b0                  ; égal -> puts("[!] Solved!")
8048478: jmp  8048464                  ; sinon saut AU MILIEU du call ptrace (e8 c4 fe ff ff)
...
80484b0: mov  [esp],0x80485e3          ; "[!] Solved!"
80484b7: call puts
80484bc: jmp  804847d                  ; ptrace(0x11 = PTRACE_DETACH, getpid(), 0, 0) ; exit(0)
```

## Comment on trouve le mot de passe

1. **Ancrage** : `objdump -d -M intel original/crackme1` → `main` (symbole présent). Le seul test du programme est le
   `repz cmpsb` à `0x8048474`, avec `esi = argv[1]` (`[ebp+0xc]` = `argv`, `+4` = `argv[1]`), `edi = 0x80485d4`
   (chargé dès le prologue, `0x8048442`) et `ecx = 10`.
2. **Lecture de la référence** : `.rodata` commence à `0x80485cc` (`readelf -S`, offset fichier `0x5cc`).

   ```console
   $ objdump -s -j .rodata original/crackme1
    80485cc 03000000 01000200 5f5f676d 6f6e5f73  ........__gmon_s
    80485dc 74617274 5f5f005b 215d2053 6f6c7665  tart__.[!] Solve
    80485ec 642100                               d!.
   ```

   `0x80485d4 - 0x80485cc = 8` : on saute `_IO_stdin_used` (`03000000`) + `01000200`, et on tombe sur
   `5f 5f 67 6d 6f 6e 5f 73 74 61` = **`__gmon_sta`** (10 octets). La chaîne continue en `rt__\0`, d’où
   `__gmon_start__` qui marche aussi, mais seuls 10 octets comptent (pas de test du `\0` final).
3. **Branche d’échec** : `jmp 0x8048464` tombe dans les octets `c4 fe ff ff ...` du `call ptrace` (`0x8048463`),
   décodés comme `les edi,...` etc. → SIGILL / SIGSEGV. Pas de message « wrong » : c’est voulu.
4. **Anti-debug** : `ptrace(PTRACE_TRACEME)` au début. Son retour n’est pas vérifié, donc il ne bloque pas un debugger ;
   en revanche, comme le process s’est déclaré « tracé par son parent », un signal fatal le met en **état stoppé**
   (le parent n’étant pas un vrai tracer) au lieu de le tuer. Sous bash on voit `rc=132` (SIGILL) ; depuis Python
   le process reste suspendu, d’où le `timeout` dans `--check`.

## Vérification (native)

```console
$ ./tools/crack_me_01-solve.py --check
'__gmon_sta'       rc=0     Solved  OK
'__gmon_start__'   rc=0     Solved  OK
'__gmon_st'        rc=stop  -       OK      # 9 octets seulement -> KO
'petik'            rc=stop  -       OK      # KO
```

Et à la main sous bash : `./original/crackme1 __gmon_start__` → `[!] Solved!` (rc 0) ; `./original/crackme1 petik` → rc 132 ;
sans argument → rc 139.

## Notes

- Ce n’est **pas** un keygen : pas de nom / pas de calcul, juste une comparaison mémoire de 10 octets.
- Le mot de passe n’apparaît pas comme une « vraie » chaîne isolée : il est caché dans le nom d’un symbole de crt
  recopié en `.rodata`.
- Reverse 100 % statique (`objdump`, `readelf`), aucune session GDB.
