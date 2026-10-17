# jackioye — Simple but not simple

| | |
|---|---|
| **ID** | [`6603c10ccddae72ae250bcd6`](https://crackmes.one/crackme/6603c10ccddae72ae250bcd6) |
| **Auteur** | jackioye |
| **Plateforme** | Linux ELF64 **statique** (non PIE, glibc embarquée, 837 Ko), avec symboles |
| **SHA-256** | `4c7fa06dd78875610b8bfdad4905de28663f6f8eb15c120a4126e940d3938127` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/mid` | binaire d'origine |
| `tools/mid-solve.py` | relit la constante et la clé XOR dans le code (`-q`, `--check`) |

## Réponse

**Mot de passe : `secretPassword123`** (casse exacte)

```bash
python3 tools/mid-solve.py --check
echo secretPassword123 | ./original/mid      # Access Granted!
```

## Premier regard

Binaire **statique** : `strings` renvoie des milliers de messages de glibc (« Bad file descriptor », « wrong ELF class »…) qui noient les chaînes utiles. À retenir : `Enter password: `, `%255s`, `Access Granted!`, `Access Denied!`.
Mais `nm` donne les noms : `main` @ `0x40182b` et surtout `encryptInput` @ `0x4017d5` — le seul code applicatif avec `main`.

## Flow

`main` : `printf("Enter password: ")`, `scanf("%255s", buf)`, `encryptInput(buf)`, puis comparaison de `buf` avec une constante de 17 octets posée sur la pile, via un appel PLT (`strcmp` résolue par IRELATIVE en statique).

## Comment on trouve

**Ancrage** : `nm original/mid | grep -E 'main|encryptInput'` puis `objdump -d -M intel --no-show-raw-insn original/mid --start-address=0x4017d5 --stop-address=0x4018e6`.

```asm
; encryptInput @0x4017d5
4017e8: call strlen
401816: xor edx,0x5            ; buf[i] ^= 5
40181f: cmp i,len ; jl boucle

; main @0x40182b
401872: call encryptInput      ; transforme la SAISIE
401877: movabs rax,0x6455716077666076     ; octets 76 60 66 77 60 71 55 64
401881: movabs rdx,0x373461776a727676     ; octets 76 76 72 6a 77 61 34 37
401899: mov WORD PTR [rbp-0x110],0x36     ; octets 36 00
4018b6: call strcmp (PLT)      ; strcmp(saisie_xor5, constante) == 0 -> "Access Granted!"
```

La constante vaut ``v`fw`qUdvvrjwa476`` (17 caractères). La saisie est XORée avec `5` **avant** la comparaison : la saisie attendue est donc la constante XOR `5` :

| const | `v` | `` ` `` | `f` | `w` | `` ` `` | `q` | `U` | `d` | `v` | `v` | `r` | `j` | `w` | `a` | `4` | `7` | `6` |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| ^5 | `s` | `e` | `c` | `r` | `e` | `t` | `P` | `a` | `s` | `s` | `w` | `o` | `r` | `d` | `1` | `2` | `3` |

→ **`secretPassword123`**.

Pièges :
- binaire statique : ne pas se perdre dans la glibc ; les symboles `main` et `encryptInput` suffisent ;
- les constantes sont des `movabs` little-endian (octets à lire à l'envers) ;
- le XOR s'applique à la saisie (pas à la constante) : le sens de l'inversion est le même, XOR étant son propre inverse.

## Vérification

```text
$ echo secretPassword123 | ./original/mid   -> Access Granted!
$ echo secretpassword123 | ./original/mid   -> Access Denied!   (casse)
$ echo secretPassword12  | ./original/mid   -> Access Denied!   (tronqué)
$ echo wrong             | ./original/mid   -> Access Denied!
```

## Notes

- Reverse statique + essais live ; pas de GDB.
