# lincrkme_01 by digitalbyte (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5333c5d40ad448c12f>
- **Plateforme** : Linux, ELF 32 bits i386, C (gcc 4.1.2), non strippé, avec infos de debug
- **Difficulté** : 2.0
- **Objectif** (readme) : trouver un serial valide et écrire un keygen
- **Statut** : ✅ résolu — `petikvx` / **`xvkitep`**

## TL;DR

Le serial est simplement le **username à l'envers**. Le username doit faire au moins 6 caractères
(`petik` est trop court, d'où l'exemple `petikvx`). Le « piège » annoncé dans le readme est un
anti-debug `ptrace` : sous gdb, le programme répond toujours `username too short!!`.

```
$ printf 'petikvx\nxvkitep\n' | ./lincrkme_01
username : serial   : good boy!
```

## Comment on trouve

### 1. Reconnaissance

`file` : ELF32 dynamique, non strippé. `strings` donne `username : `, `username too short!!`,
`serial   : `, `good boy!`, `bad boy!` et, dans les imports, **`ptrace`** et `strcmp`.
Un `ptrace` importé dans un crackme Linux, c'est presque toujours de l'anti-debug.

### 2. Le piège : `ptrace` avant `main`

`objdump -d` montre une fonction au nom trompeur, `__do_global_dtors_inx` (0x8048484), qui s'exécute
avant `main` :

```asm
call   ptrace@plt            ; ptrace(PTRACE_TRACEME, 0, 0, 0)
cmp    eax,0xffffffff
jne    ok
mov    DWORD PTR ds:0x8049904,0x1   ; flag "débogueur détecté"
ok: call main
```

Si le processus est déjà tracé (gdb), `ptrace` renvoie -1 et le flag global `0x8049904` passe à 1.

### 3. `main`

```asm
fgets(user, 0x33, stdin)
cmp  strlen(user),6 ; jbe -> "username too short!!"
cmp  [0x8049904],0  ; flag anti-debug -> même message "too short"
fgets(serial, 0x33, stdin)
for (i = 0; i < strlen(user)-1; i++)
    buf[i] = user[strlen(user) - 2 - i];   ; copie à l'envers, sans le '\n'
serial[strlen(serial)-1] = 0               ; retire le '\n'
strcmp(buf, serial) == 0 -> "good boy!" sinon "bad boy!"
```

- `strlen` inclut le `\n` laissé par `fgets` : il faut `strlen > 6`, donc **≥ 6 caractères visibles**.
- `buf` (`ebp-0xa6`) est mis à zéro (`rep stos`) avant la boucle, il est donc bien terminé par un 0.
- La boucle lit `user[len-2-i]` : le dernier caractère utile d'abord, donc le username inversé.

Le message d'erreur de l'anti-debug est le même que celui de la longueur : c'est le « don't get
fooled » du readme. En suivant son conseil (`gdb`, `break main`), on obtient toujours
« username too short!! » quel que soit le nom.

## Keygen

`tools/crackmes-de-lincrkme_01-solve.py` :

```
$ python3 tools/crackmes-de-lincrkme_01-solve.py
petikvx / xvkitep
```

## Vérification

Binaire lancé en natif (pas sous gdb, pour ne pas déclencher le `ptrace`) :

```
$ printf 'petikvx\nxvkitep\n' | ./lincrkme_01
username : serial   : good boy!
$ printf 'petik\n' | ./lincrkme_01
username : username too short!!
```

Pour déboguer quand même, il suffit de sauter le flag (`set *(int*)0x8049904=0` après le `ptrace`)
ou de forcer le retour de `ptrace` à 0 ; l'analyse statique suffisait ici.
