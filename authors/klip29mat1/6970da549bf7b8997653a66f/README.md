# Klip29mat1's Rev1

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6970da549bf7b8997653a66f) · id `6970da549bf7b8997653a66f`

ELF64 console **avec sources fournies**, `-no-pie -fno-stack-protector` :
**débordement de pile classique**, pas un mot de passe à deviner.
Diff. site **2.0**. Famille : [`../README.md`](../README.md).

| Fichier | Rôle |
|---|---|
| [`original/rev1.tar.gz`](original/rev1.tar.gz) | archive d'origine (sources + binaire) |
| [`analysis/rev1/`](analysis/rev1/) | extraction (non modifiée) : `src/`, `include/`, `Makefile`, binaire `rev1` |
| [`tools/rev1-solve.py`](tools/rev1-solve.py) | exploit complet, `--check` / `--payload` |

## Réponse

Pas un mot de passe : un **payload de débordement de pile** (43 octets)
qui détourne le flux d'exécution directement vers la branche "ACCESS
GRANTED" de `main`, sans jamais satisfaire `verify()` normalement
(impossible, voir § 2).

```bash
python3 tools/rev1-solve.py           # exploite via un pty, affiche "ACCESS GRANTED"
python3 tools/rev1-solve.py --check   # code retour 0/1
python3 tools/rev1-solve.py --payload # affiche le payload en hex
```

## 1. Premier regard — sources fournies

```bash
tar -tzf original/rev1.tar.gz
# rev1/{src/{main.c,check.c},include/check.h,Makefile,rev1}
```

`Makefile` :

```make
CFLAGS = -O0 -fno-stack-protector -no-pie -Wall -Iinclude
```

**Pas de canari, adresses fixes (non-PIE)** : signal explicite que le
crackme attend un exploit mémoire, pas juste une lecture de code.

`src/check.c` :

```c
int verify(char *s)
{
    char buf[32];
    strcpy(buf, s);                    // <-- aucune borne : overflow possible

    if (strlen(buf) != 8) return 0;
    if (buf[0] != 'R')    return 0;
    if (buf[3] != '4')    return 0;
    if (buf[7] != 'Z')    return 0;
    if (strcmp(buf + 1, "3V4") == 0) return 1;
    return 0;
}
```

## 2. Le piège logique — `verify()` ne peut jamais retourner 1

`strcmp(buf + 1, "3V4")` compare caractère par caractère `buf[1..]` à
`"3V4\0"`. Pour être égal, il faut `buf[1]='3'`, `buf[2]='V'`, `buf[3]='4'`
**et** `buf[4] == '\0'` (le `\0` terminal de `"3V4"` doit matcher le
caractère suivant de `buf`). Mais `buf[4] == '\0'` donnerait
`strlen(buf) == 4`, **en contradiction directe** avec le test
`strlen(buf) != 8` qui a déjà dû passer plus haut (donc `buf[4]` est
forcément un caractère non-nul à ce stade). **Aucune chaîne de 8
caractères ne peut satisfaire les deux conditions à la fois** — la piste
« trouver le bon mot de 8 lettres » (`R??4???Z` avec `3V4` en positions
1-3) est un leurre qui ne compile/exécute jamais vers `return 1`.
Vérifié en testant plusieurs candidats (`R3V4XXXZ`, etc.) : tous donnent
`ACCESS DENIED`.

Avec `strcpy` non bornée sur `buf[32]` et pas de canari/PIE, la vraie
piste est le **débordement de pile**.

## 3. Construction de l'exploit (objdump, binaire non-PIE)

```bash
objdump -d -M intel analysis/rev1/rev1
```

`main` (extrait) :

```asm
4011ae: call   4011de <verify>
4011b3: test   eax,eax
4011b5: je     4011c8          ; échec -> "ACCESS DENIED"
4011b7: lea    rax,[rip+0xe57] ; "ACCESS GRANTED" <-- cible du détournement
4011be: mov    rdi,rax
4011c1: call   401040 <puts@plt>
4011c6: jmp    4011d7
...
4011d7: mov    eax,0x0
4011dc: leave                  ; <-- utilise RBP (qu'on va corrompre)
4011dd: ret
```

`verify` (extrait) :

```asm
4011de: push   rbp
4011df: mov    rbp,rsp
4011e2: sub    rsp,0x30
4011e6: mov    [rbp-0x28],rdi
4011ea: ...
4011f8: call   strcpy@plt      ; strcpy(buf=[rbp-0x20], argv[1]) -- buf[32], aucune borne
...
40126d: leave
40126e: ret
```

`buf` est à `rbp-0x20`. Disposition de la pile de `verify()`, dans l'ordre
où `strcpy` les écrase :

| Octets | Rôle | Contenu du payload |
|---|---|---|
| 0–31 (32o) | `buf[32]` | `'A' * 32` (peu importe, les checks logiques sont contournés) |
| 32–39 (8o) | RBP sauvegardé de `verify` → devient le RBP de `main` après `ret` | `'B' * 8` (peu importe la valeur, mais `main` plantera au `leave` final — voir § 4) |
| 40–42 (3o) | **adresse de retour**, octets bas | `b7 11 40` = bas de `0x004011b7` |

Binaire **non-PIE** : `0x004011b7` tient sur 3 octets non nuls, les
**5 octets hauts de la case "adresse de retour" sont déjà à 0x00** dans la
pile avant l'écrasement (vérifié sous GDB, voir § 4) — pas besoin de les
écrire, donc pas d'octet `0x00` à faire transiter par `argv[1]` (qui est
une chaîne C classique, un `\0` la tronquerait).

```python
payload = b"A"*32 + b"B"*8 + bytes([0xb7, 0x11, 0x40])   # 43 octets
```

`ret` dépile ces 3 octets + les 5 zéros déjà en place = `0x004011b7`, et
saute directement **après** le `test eax,eax; je ...` de `main` : la
branche "ACCESS GRANTED" s'exécute sans jamais réellement valider
`verify()`.

## 4. Debug GDB (pas à pas)

```bash
gdb -q --args ./analysis/rev1/rev1 "$(python3 -c "...")"
# (ou, binaire-safe sans l'intermédiaire shell : passer le payload comme
#  argument à `gdb -batch --args ./rev1 <bytes>` via subprocess Python,
#  gdb transmettant l'argv tel quel via execve)
set disable-randomization on
break *0x4011fd        ; juste après le "call strcpy" dans verify
run <43 octets ci-dessus>
x/48xb $rbp-0x20        ; dump buf..case adresse de retour
```

```text
0x...da00: 41 41 ... (32x 'A')              <- buf
0x...da20: 42 42 42 42 42 42 42 42          <- RBP sauvegardé
0x...da28: c2 b7 11 40 00 00 00 00          <- adresse de retour (payload trop court d'1 octet dans ce test manuel -> b7 décalé)
```

Ce dump a servi à **localiser précisément** l'offset (32 + 8 = 40 octets
avant l'adresse de retour) et à confirmer que **les 5 octets hauts sont
déjà à `0x00`** avant toute écriture — essentiel pour ne pas avoir besoin
d'octets nuls dans `argv[1]`. (Le `c2` au lieu de `b7` dans cet essai
venait d'un payload de recherche décalé d'un octet ; corrigé ensuite dans
`continue`/`info registers` jusqu'à atteindre `rip = 0x4011dc`.)

```bash
continue
# Program received signal SIGBUS/SIGSEGV
# rip = 0x4011dc  (main+118, juste APRÈS le "call puts" de la branche ACCESS GRANTED)
# rbp = 0x4242424242424242   <- notre filler, utilisé par le "leave" final de main
```

Confirme le scénario : le détournement **fonctionne** (`rip` atteint bien
`main+118`, juste après le `puts("ACCESS GRANTED")`), mais `main` plante
ensuite au `leave;ret` final car son `rbp` est notre filler `'B'*8`
corrompu — **après** avoir déjà imprimé le message.

## 5. Piège restant : la sortie plantée est perdue sur un pipe

En lançant l'exploit avec `stdout` redirigé vers un **pipe** (le cas par
défaut de `subprocess.run(..., stdout=PIPE)`), `puts()` écrit dans le
tampon **pleinement bufferisé** de la libc (comportement standard quand
`stdout` n'est pas un terminal) — tampon qui n'est flush qu'à la sortie
*normale* du programme. Le crash (`SIGSEGV`/`SIGBUS`) qui suit
immédiatement empêche ce flush : **le message est calculé mais jamais
réellement écrit sur le descripteur de fichier**, donc invisible côté
pipe (confirmé : `subprocess.run` avec `stdout=PIPE` renvoie une sortie
vide malgré le même payload).

Solution : lancer le binaire via un **pty** (`os.pty.fork` + `execv`) —
sur un terminal, `stdout` est **bufferisé ligne par ligne**, donc
`puts("ACCESS GRANTED\n")` est flush immédiatement après le `\n`, bien
avant le crash qui suit. C'est ce que fait `tools/rev1-solve.py`.

## 6. Vérification

```text
$ python3 tools/rev1-solve.py
ACCESS GRANTED

$ python3 tools/rev1-solve.py --check; echo $?
0

$ ./analysis/rev1/rev1 R3V4XXXZ   # tentative "logique" (8 car., piège)
ACCESS DENIED
```

## 7. Notes

- Les sources sont fournies (cas rare dans ce dépôt) : le reverse est
  surtout une **lecture de C** + compréhension du piège logique
  `strcmp`/`strlen`, puis un exploit mémoire classique (stack overflow,
  pas de ROP nécessaire : une seule adresse à injecter).
- `original/rev1.tar.gz` reste l'archive d'origine intacte ;
  `analysis/rev1/` est juste son extraction (non modifiée), gardée pour
  pouvoir lancer/`objdump` le binaire sans dézipper à chaque fois.
- Le crash final de `main` (après le message) est **attendu et sans
  importance** : le "gagné" du crackme est le texte affiché, pas un code
  de sortie propre.
