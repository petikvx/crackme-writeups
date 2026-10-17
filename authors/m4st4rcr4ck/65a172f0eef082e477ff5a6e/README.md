# M4st4rCr4ck — H1dd4n Fl4g

| | |
|---|---|
| **ID** | [`65a172f0eef082e477ff5a6e`](https://crackmes.one/crackme/65a172f0eef082e477ff5a6e) |
| **Auteur** | M4st4rCr4ck |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (45 Ko, remplissage de `.rodata`) |
| **SHA-256** | `7124d1e9c6e03a0494ac606824c132ab367da3d272bd4da52afe481ac544a873` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/h1dd3n_fl4g` | binaire d'origine |
| `tools/h1dd3n-solve.py` | retrouve la fonction cachée et le flag, preuve sous gdb (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| Login / mot de passe acceptés par `main` | `r3v3rs3r` / `lixachev` (mais ils ne donnent **pas** le flag) |
| **Flag caché** | **`FLAG{B3ST_R3V3RS3R}`** |

```bash
printf 'r3v3rs3r\nlixachev\n' | ./original/h1dd3n_fl4g | cut -c1-80    # [!] D0 y0u th1nk 3v3ryth1ng 1s s0 s1mpl3?
python3 tools/h1dd3n-solve.py --check
```

**Attention** : plusieurs fonctions du binaire impriment des chaînes de plus de 10 Ko (`br000…`). Toujours tronquer la sortie (`| cut -c1-80`).

## Premier regard

`strings` : `r3v3rs3r`, `lixachev` (login et mot de passe), `[+] Ent3r L0g1n:`, `[+] Ent3r p4$$w0rd:`, `[!] D0 y0u th1nk 3v3ryth1ng 1s s0 s1mpl3?`, `[*] B4d L0g1n…`, et — au milieu de milliers de `br0000…` — **`[+] FLAG{B3ST_R3V3RS3R}`**.
Le binaire pèse 45 Ko pour peu de code : `.rodata` est gonflé par des chaînes `br000…` de plus en plus courtes (leurre de `strings`).

## Flow

`main` @ `0x1169` : monte deux chaînes sur la pile (`movabs` → `r3v3rs3r`, `lixachev`), lit un login et un mot de passe (`scanf("%s")`), `strcmp` des deux ; les deux égaux → « [!] D0 y0u th1nk 3v3ryth1ng 1s s0 s1mpl3? », sinon « [*] B4d L0g1n 0r P4$$w0rd… ».
**Aucun chemin de `main` n'affiche le flag.**

## Comment on trouve

**Ancrage** : `nm original/h1dd3n_fl4g` liste des fonctions jamais appelées : `Flag_G3t` @ `0x1251`, `strcmpr` @ `0x126c`, `Easy_Dump` @ `0x1287`, `__init_`, `__init__`, `__init___`, `___init____`, `__init____`, `__init_____`, `__inits`.

Toutes font `printf(<chaîne>)` ; presque toutes pointent vers `.rodata+0x98` (`0x2098`, le début du remplissage `br000…`). Une seule est différente :

```asm
12f3 <___init____>:
12f7: lea rax,[rip+0x7f23]      # 0x9221
12fe: mov rdi,rax
1306: call printf               ; affiche "[+] FLAG{B3ST_R3V3RS3R}"
```

`0x9221` est en plein milieu du remplissage : `xxd -s 0x9221` ou `strings -t x | grep FLAG` donne `[+] FLAG{B3ST_R3V3RS3R}`. Piège : un `grep FLAG` sur `strings` trouve bien la chaîne, mais rien n'indique qu'elle est la bonne ; ici le diagnostic vient de la fonction qui la référence (`___init____` ≠ les autres).

## Debug GDB (pas à pas)

Les fonctions n'étant jamais appelées, GDB sert à les exécuter à la main (PIE : base `0x555555554000`, symboles résolus par gdb).

```bash
gdb -q ./original/h1dd3n_fl4g
(gdb) break main
(gdb) run < /dev/null
(gdb) call (int)___init____()      # $1 = 23   <- printf a écrit 23 octets : "[+] FLAG{B3ST_R3V3RS3R}"
(gdb) call (int)fflush(0)          # force l'écriture (stdout sur pipe = tamponné)
(gdb) call (int)Flag_G3t()         # imprime le remplissage br000… (>10 Ko) : leurre
```

Piège : sans `fflush`, la sortie reste dans le tampon quand stdout est un pipe et gdb tue le processus ; `$1 = 23` (longueur de `[+] FLAG{B3ST_R3V3RS3R}`) suffit à identifier la bonne fonction.

## Vérification

```text
$ python3 tools/h1dd3n-solve.py --check
___init____ @ 0x12f3 -> lea 0x9221 -> '[+] FLAG{B3ST_R3V3RS3R}'
flag = FLAG{B3ST_R3V3RS3R}
gdb call ___init____ -> OK | chemin normal (r3v3rs3r/lixachev) sans flag: True
```

## Notes

- Le flag est « caché » : il n'existe que dans une fonction non appelée ; le couple login/mot de passe visible est un leurre.
- Le flag n'est pas obtenu en jouant le programme mais en exécutant (via gdb) la fonction repérée statiquement.
