# toasterbirb — argc

| | |
|---|---|
| **ID** | [`68698837aadb6eeafb399017`](https://crackmes.one/crackme/68698837aadb6eeafb399017) |
| **Auteur** | toasterbirb |
| **Plateforme** | Linux ELF64 PIE, C (gcc 14.3, `-O2 -ggdb`), avec `_start` modifié |
| **SHA-256** | `e4afac571dfc8ac5ee37b612c5a1ee217f4f1bbc168c0fb0ace1940fa277b23a` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/argc` | binaire d'origine |
| `tools/argc-solve.py` | affiche la ligne de commande gagnante (`WORD`, `-q`, `--check`) |

## Réponse

Deux premiers arguments **identiques**, et **5 ou 6 arguments** au total (pas 2 !). Exemple avec `petik` :

```bash
./original/argc petik petik a b c        # correct! (˶ᵔ ᵕ ᵔ˶)
./original/argc petik petik a b c d      # correct! aussi (6 arguments)
python3 tools/argc-solve.py --check
```

## Premier regard

`strings` : `please try again and make sure to give the correct amount of arguments („ᵕᴗᵕ„)`, `correct! (˶ᵔ ᵕ ᵔ˶)`, `wrong passwords...`, import `strcmp`.
Le message « *correct amount of arguments* » est le vrai indice : le nombre d'arguments compte, et pas de la façon attendue.

## Flow

`main` @ `0x1080` : `argc == 3` ? `strcmp(argv[1], argv[2]) == 0` ? → `correct!` ; `strcmp` ≠ 0 → `wrong passwords...` ; `argc != 3` → message d'erreur.
Lu seul, `main` suggère « 2 arguments identiques »… mais `petik petik` est refusé.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/argc`, d'abord `main`, puis `_start` quand `petik petik` échoue.

```asm
; main
1085: cmp  edi,0x3              ; argc == 3 ?
108a: mov  rax,[rsi+0x10]       ; argv[2]
108e: mov  rdi,[rsi+0x8]        ; argv[1]
1095: call strcmp               ; 0 -> "correct! (˶ᵔ ᵕ ᵔ˶)" (0x2061)

; _start (modifié, pas le _start de crt1)
10e0: pop  rax                  ; rax = argc
10e1: shr  al,1                 ; argc >>= 1   <--- le piège
10e3: push rax
10e9: pop  rsi                  ; rsi = argc modifié (1er argument de __libc_start_main -> argc de main)
10f8: lea  rdi,[rip-0x7f]       ; main
10ff: call __libc_start_main
```

`_start` divise `argc` par 2 (octet bas) avant de le transmettre à `main`. Pour que `main` voie `3`, l'`argc` réel doit valoir `6` ou `7`,
soit **5 ou 6 arguments**. `argv` n'est pas modifié : `argv[1]` et `argv[2]` restent les deux premiers arguments, qui doivent être égaux.

## Debug GDB (pas à pas)

C'est GDB qui a révélé le piège : à `main`, `argc` ne vaut pas ce qu'on a tapé.

```bash
gdb -q ./original/argc
(gdb) break *0x555555555085        # cmp edi,3 dans main  (PIE : base 0x555555554000 + 0x1085)
(gdb) run z z
(gdb) info registers edi           # edi = 1 alors que argc réel = 3  (3 >> 1)
(gdb) x/2gx $rsi                   # argv inchangé
```

Observé : `edi 0x1` pour `run z z` (argc réel 3 → 1). Avec `run petik petik a b c` (argc réel 6), `edi = 3` et le `strcmp` passe.
Piège : `break main` sans PIE connu ne suffit pas, il faut l'adresse chargée (`starti` puis `info proc mappings`, ou `break *0x555555555085` après `run`).

## Vérification

```text
$ ./original/argc petik petik a b c      -> correct! (˶ᵔ ᵕ ᵔ˶)
$ ./original/argc petik petik a b c d    -> correct! (˶ᵔ ᵕ ᵔ˶)
$ ./original/argc petik other a b c      -> wrong passwords...
$ ./original/argc petik petik            -> please try again and make sure to give the correct amount of arguments
$ ./original/argc petik petik a b        -> please try again … (argc réel 5 -> 2)
$ ./original/argc petik petik a b c d e  -> please try again … (argc réel 8 -> 4)
```

## Notes

- Le nom du challenge (`argc`) est l'indice : c'est `argc` qui est trafiqué, pas la comparaison.
