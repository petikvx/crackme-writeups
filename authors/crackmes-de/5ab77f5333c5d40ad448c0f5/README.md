# qcrk_2 — qnix (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c0f5
- Plateforme : Linux ELF32 dynamique (GCC 3.4.4 Gentoo, non-stripped) · difficulté 1.5 · publié le 2018-03-25 (réimport crackmes.de)
- Archive : `original/qcrk-2.tgz` → binaire `qcrk2`
- Usage : `./qcrk2 <argv[1]> <argv[2]>`

## Réponse

Il n'y a **aucune clé** à trouver : le flot normal de `main` ne vérifie rien et
se contente de recopier les deux arguments. Le message gagnant
`---[[[ CRACKED ]]]---` est affiché par la fonction `crap` (`0x08048686`) qui
**n'est jamais appelée**. On la déclenche par un **débordement de pile** via
`argv[2]` :

```bash
./qcrk2 petik "$(python3 tools/qcrk_2-solve.py -q)"
# argv[2] = 'A'*2060 + "\x86\x86\x04\x08"  (adresse de crap, little-endian)
```

## Comment on trouve

1. `file` : `ELF 32-bit LSB executable, Intel 80386, dynamically linked, not stripped`. Les strings montrent `--[ ERROR ]--[ BYE ]--`, `(+) Copying argv[1] into the buffer1`, `(!) overflow detected.`, et surtout `---[[[ CRACKED ]]]---`.
2. Désassemblage de `main` (`analysis/objdump-main.txt`) :
   - **anti-debug** : `ptrace(PTRACE_TRACEME, 0, 1, 0)` ; si le retour est négatif (un debugger est attaché) → `--[ ERROR ]--[ BYE ]--` et sortie.
   - exige `argc == 3` (deux arguments).
   - `strlen(argv[1]) <= 0x3ff` sinon « overflow detected » ; puis `snprintf(buffer1, 0x400, "%s", argv[1])` dans un tampon à `ebp-0x408`.
   - `strlen(argv[2]) <= 0xbff` sinon « overflow detected » ; puis **`snprintf(buffer2, 0xc00, "%s", argv[2])`** dans un tampon à `ebp-0x808` qui ne fait que **0x800 octets**. La taille passée à `snprintf` (`0xc00`) est plus grande que le tampon → **débordement contrôlé**.
   - `main` retourne 0, sans jamais tester de clé.
3. La seule façon d'afficher `CRACKED` est la fonction morte `crap` (`analysis/objdump-crap.txt`) :
   ```
   08048686 <crap>:  fprintf(stdout, "\t---[[[ CRACKED ]]]---\n"); return 0;
   ```
4. **Offset du débordement** : `buffer2` est à `ebp-0x808`, l'adresse de retour sauvegardée est à `ebp+4`. Distance = `0x808 + 4 = 0x80c = 2060` octets (confirmé sous GDB, voir plus bas). On écrit donc 2060 octets de bourrage puis l'adresse de `crap` `0x08048686` en little-endian (`\x86\x86\x04\x08`, sans octet nul → OK pour une chaîne d'argument).
5. Pas d'obstacle : **pas de canari** (GCC 3.4.4 sans SSP actif, aucun `__stack_chk_fail` importé) et **binaire non-PIE** (adresses fixes `0x0804xxxx`), donc l'adresse de `crap` ne bouge pas.

## Vérification

Le binaire d'origine affiche `CRACKED` puis reçoit un `SIGSEGV` (le `ret` de
`crap` retombe sur le bourrage). Comme `stdout` est entièrement bufferisé quand
la sortie est redirigée, le message serait perdu au crash : le solveur lance
donc le binaire via un **PTY** (stdout ligne-bufferisé) pour que le `\n` final
flushe `CRACKED` avant le segfault.

```bash
python3 tools/qcrk_2-solve.py --check
# → check: OK — ---[[[ CRACKED ]]]--- affiché par crap
```

## Debug GDB

L'anti-debug `ptrace` fait sortir le binaire sous GDB (`--[ ERROR ]--[ BYE ]--`).
Pour l'analyse de l'offset, on travaille sur une **copie** `analysis/` dont le
saut `jns` après `ptrace` (`0x80484a9 : 79 25`) est passé en `jmp` (`eb 25`) —
l'`original/` n'est jamais modifié. On confirme alors l'offset et la redirection :

```gdb
(gdb) break *0x8048684          # juste avant le `leave; ret` de main
(gdb) run petik "$(python3 -c 'import sys;sys.stdout.buffer.write(b"A"*2060+b"\x86\x86\x04\x08")')"
(gdb) x/2x $ebp
0xffffc998: 0x41414141  0x08048686   # ebp sauvé = AAAA, retour = &crap
(gdb) stepi                          # leave
(gdb) stepi                          # ret → EIP = 0x08048686 <crap>
(gdb) call (int)setvbuf(stdout,0,2,0)
(gdb) continue
        ---[[[ CRACKED ]]]---
```

L'adresse de retour est bien à `ebp+4`, à 2060 octets du début de `buffer2`
(`ebp-0x808`), et l'exécution saute dans `crap`.

## Fichiers

- `analysis/qcrk2` : ELF extrait de l'archive
- `analysis/objdump-main.txt` : désassemblage de `main`
- `analysis/objdump-crap.txt` : la fonction gagnante `crap`
- `tools/qcrk_2-solve.py` : solveur (payload `-q`, vérif live `--check` via PTY)
