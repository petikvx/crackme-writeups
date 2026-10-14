# 1337_arm — gtksor (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5733c5d40ad448c380 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux **ARM** EABI (32 bits), statique, non strippé (glibc statique)
- Archive : `original/1337_ARM.zip` → `1337ARM.bin` (extrait sous `analysis/`)
- Usage : `./1337ARM.bin <clé>`

## Réponse

```
ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_
```

(les 31 octets `0x41 … 0x5f`). Le programme n'affiche rien : il **retourne `0x539` (1337)** si la clé est bonne, `-1` sinon.

```bash
python3 -I tools/1337arm-solve.py --check
# check: OK (clé=0x539, préfixe=0x539, 'petik'=-1)
./1337ARM.bin 'ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_' ; echo $?     # 57 (= 0x539 & 0xff) sur un hôte ARM / qemu-arm
```

## Premier regard

```text
$ file analysis/1337ARM.bin
ELF 32-bit LSB executable, ARM, EABI4 version 1 (SYSV), statically linked, with debug_info, not stripped
```

Binaire statique de 460 Ko : toute la glibc est dedans ; seul `main` @`0x8290` (168 instructions) est utile. Pas de `qemu-user` sur cette machine : désassemblage avec `capstone` (ARM) et émulation de `main` avec `unicorn`.

## Comment on trouve

**Ancrage** : `nm analysis/1337ARM.bin | grep -w main` → `00008290 T main`, puis désassemblage ARM 32 bits (`analysis/main-arm.txt`).

```asm
82ac: cmp r3,#1 ; bgt 82c0        ; argc > 1, sinon retourne -1
82c8: mov r0,#0x20 ; bl malloc    ; tableau t[] de 9 pointeurs ...
82dc..8334: pour i = 0..7 : t[i] = malloc(0x20) ; memset(t[i], 0xa, 0x20)   ; (8 buffers remplis de '\n')
8350: t[8] = NULL
8358: mov r3,#0x41 ; str r3,[fp,#-0x18]      ; c = 'A'
8364: t[3][i] = (char)c ; c++ ; i++           ; jusqu'à i == 0x1f  (31 itérations)
83bc: t[3][31] = 0                           ; t[3] = "ABC...Z[\]^_"
83d0..8438: pour chaque octet de argv[1] jusqu'à son NUL :
      if (argv[1][i] != t[3][i]) return -1
8440: ldr r3,[pc,#0x10] ; retour = [0x8458] = 0x539
```

Le seul buffer qui compte est `t[3]` (offset `0xc` du tableau : `add r3, r3, #0xc`), rempli avec les octets consécutifs `0x41, 0x42, …, 0x5f`. La comparaison s'arrête au NUL de `argv[1]` : **tout préfixe** de la chaîne est donc accepté (y compris `A`) ; la clé « attendue » est la chaîne complète de 31 caractères.

**Pièges :**
- Les 8 `malloc(0x20)` + `memset(…,'\n',0x20)` sont du bruit : seul `t[3]` est utilisé.
- Le résultat n'est pas imprimé : le « succès » est le code de retour (`0x539`, soit 1337 → `57` côté shell).
- La boucle écrit 31 octets (pas 32) : le dernier caractère est `_` (0x5f), pas `` ` `` (0x60).

## Vérification

```text
$ python3 -I tools/1337arm-solve.py --check
argv[1] : ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_
check: OK (clé=0x539, préfixe=0x539, 'petik'=-1)
```

Émulation unicorn de `main` (malloc/memset court-circuités) : clé complète et préfixe → `0x539`, mauvaise clé → `-1`.

## Fichiers

- `analysis/1337ARM.bin`, `analysis/main-arm.txt` (désassemblage capstone de `main`)
- `tools/1337arm-solve.py` : clé + `--check` (unicorn ARM)
