# zed-zahir — ZED-Crackme

| | |
|---|---|
| **ID** | [`5ecd7cc133c5d449d91ae641`](https://crackmes.one/crackme/5ecd7cc133c5d449d91ae641) |
| **Auteur** | zed-zahir |
| **Plateforme** | Linux ELF64 PIE, C, non strippé, packé UPX 3.94 |
| **SHA-256** | `224e3e153805d7abba7219d442e4d37da10e5e0dea6e08df3946ef83c886f023` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/ZED-Crackme-x64.bin` | binaire d'origine (packé UPX) |
| `analysis/ZED-Crackme-x64.unpacked.bin` | unpacké (`tools/upx-3.96 -d`), utilisé pour le reverse et la preuve GDB |
| `tools/zed-solve.py` | calcule le serial et rejoue le binaire sous GDB (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **Passphrase / serial** | `C(uiICD@CADDEBNEEDD` |

```bash
python3 tools/zed-solve.py --check
```

(voir § Debug GDB pour lancer `original/…` ou `analysis/…unpacked.bin` à la main — deux anti-X bloquent un simple `echo … | ./binaire`.)

## Premier regard

```bash
file original/ZED-Crackme-x64.bin
# ELF64 PIE, statically linked, no section header -> UPX
strings -n 6 original/ZED-Crackme-x64.bin | grep -i upx
# $Info: This file is packed with the UPX executable packer...
```

```bash
./tools/upx-3.96 -d -o analysis/ZED-Crackme-x64.unpacked.bin original/ZED-Crackme-x64.bin
file analysis/ZED-Crackme-x64.unpacked.bin   # ELF64 PIE dynamique, not stripped
```

Chaînes utiles côté unpacké : `do not bruteforce`, `do not patch, find instead the serial.`, `VMware detected`, `enter the passphrase: `, `This process is being debugged!!!`, `you succeed!!` / `try again`, `door #%d is %s.`. Imports : `ptrace`, `qsort`, `__ctype_b_loc`.

## Flow

Symboles présents (non strippé) : `main`, `rot`, `cryptSerial`, `checkSerial`, `gauss_eliminate`, `swap_row`, `obfuscation`, `compare`, `generic_fizz_buzz`. **Seul `main` est appelé** au runtime — les cinq autres (tamis de premiers via `checkSerial`/« doors », résolution d'un système linéaire par élimination de Gauss via `cryptSerial`) sont du code mort, jamais référencé depuis `main` : des leurres pour faire perdre du temps si on reverse à l'aveugle.

`main` (après unpack) :
1. anti-VM via `SIDT` (instruction qui lit l'IDTR) ;
2. `rot(13, buf)` deux fois sur une chaîne factice (`"This is a top secret text message!"`) — ROT13∘ROT13 = identité, résultat jamais utilisé : encore un leurre ;
3. copie une constante `"AHi23DEADBEEFCOFFEE"` (19 octets) sur la pile ;
4. `scanf("%s", saisie)` ;
5. anti-debug via `ptrace(PTRACE_TRACEME, 0)` ;
6. dérive un serial attendu à partir de la constante (transformations octet par octet) et `strcmp()` avec la saisie.

## Comment on trouve

**Ancrage** : MCP `ida` sur `analysis/ZED-Crackme-x64.unpacked.bin` (le binaire original packé n'a pas de section pour l'auto-analyse), Hex-Rays sur `main` @ `0x1343`.

```c
qmemcpy(v6, "AHi23DEADBEEFCOFFEE", 19);
...
s1[0] = LOBYTE(v6[0]) ^ 2;
s1[1] = BYTE3(v6[0]) - 10;
s1[2] = BYTE2(v6[0]) + 12;
s1[3] = BYTE2(v6[0]);
s1[4] = BYTE1(v6[0]) + 1;
for (i = 5; i <= 18; ++i)
    s1[i] = *((BYTE*)v6 + i) - 1;
if (strcmp(s1, s2) == 0) puts("you succeed!!");
```

`v6` est un tableau de qwords vu comme octets : `LOBYTE`/`BYTE1`/`BYTE2`/`BYTE3` du premier qword correspondent simplement aux octets d'indices 0,1,2,3 de la constante. En notant `c[i]` les octets de `"AHi23DEADBEEFCOFFEE"` :

```
s1[0] = c[0] ^ 2        s1[1] = c[3] - 10       s1[2] = c[2] + 12
s1[3] = c[2]            s1[4] = c[1] + 1        s1[5..18] = c[5..18] - 1
```

```python
c = b"AHi23DEADBEEFCOFFEE"
s1 = bytearray(19)
s1[0]=(c[0]^2)&0xFF; s1[1]=(c[3]-10)&0xFF; s1[2]=(c[2]+12)&0xFF; s1[3]=c[2]; s1[4]=(c[1]+1)&0xFF
for i in range(5,19): s1[i]=(c[i]-1)&0xFF
# -> b'C(uiICD@CADDEBNEEDD'
```

## Debug GDB (pas à pas)

Le binaire comporte **deux anti-X avant le `strcmp`**, et le sandbox de reverse ici déclenche un **faux positif** sur le premier : `SIDT` lit l'IDTR dans un buffer sur la pile puis compare l'octet d'offset 5 à `0xFF` — un indicateur documenté de VMware, mais qui remonte aussi `0xFF` dans ce conteneur/sandbox alors que ce n'est pas VMware. Un simple `echo serial | ./binaire` n'arrive donc jamais jusqu'au `strcmp` (le binaire fait juste `exit(1)` après `"VMware detected"`), et le binaire **packé d'origine** segfault même sous `strace` pendant le dépaquetage UPX dans cet environnement — on travaille donc sur l'unpacké pour le GDB.

Base PIE **non standard** sur cette machine : `starti` + `info proc mappings` donne `0x555555400000` (pas `0x555555554000`).

```bash
chmod +x analysis/ZED-Crackme-x64.unpacked.bin
objdump -d -M intel --no-show-raw-insn analysis/ZED-Crackme-x64.unpacked.bin | awk '/<main>:/,/<rot>:/' \
  | grep -n "sidt\|cmp.*0xff\|ptrace\|test   rax,rax"
#  1140a: cmp al,0xff ; jne ...     (bypass SIDT : forcer al=0 juste avant)
#  114af: test rax,rax ; jns ...    (bypass ptrace : forcer rax=0 juste apres le call)
```

```bash
gdb -q -batch \
  -ex 'break *0x55555540140a' \
  -ex 'break *0x5555554014af' \
  -ex 'run' \
  -ex 'set $al = 0' \
  -ex 'continue' \
  -ex 'set $rax = 0' \
  -ex 'continue' \
  --args ./analysis/ZED-Crackme-x64.unpacked.bin <<< 'C(uiICD@CADDEBNEEDD'
```

Observé :

```text
Breakpoint 1, 0x000055555540140a in main ()     <- juste avant cmp al,0xff (sortie SIDT)
Breakpoint 2, 0x00005555554014af in main ()     <- juste apres call ptrace (test rax,rax)
enter the passphrase: you succeed!!
```

Avec un serial faux (`wrong`), même bypass → `try again`. Les adresses `0x...140a` / `0x...14af` sont `base (0x555555400000) + offset fichier (0x140a / 0x14af)` — pas de PIE-base standard ici, à revérifier sur une autre machine via `starti`.

## Vérification

```bash
$ python3 tools/zed-solve.py --check
serial = C(uiICD@CADDEBNEEDD
OK: True | KO: True
```

```text
# bypass + bon serial
enter the passphrase: you succeed!!
# bypass + mauvais serial
enter the passphrase: try again
```

## Notes

- `checkSerial()` (tamis « doors open/closed », en fait un style Josephus/tamis de Sieve-like sur 100 cases) et `cryptSerial()` (élimination de Gauss sur un système 6×6) sont des **leurres** : jamais appelés par `main`, ils n'interviennent pas dans la validation du serial.
- Le `rot(13, …)` double sur la chaîne « secret » est aussi un leurre : ROT13 appliqué deux fois redonne le texte d'origine, et le résultat n'est jamais réutilisé.
- Le faux-positif `SIDT`/VMware est spécifique à cet environnement de reverse (sandbox) ; sur une vraie machine Linux non virtualisée, le binaire passerait probablement ce test sans bypass.
