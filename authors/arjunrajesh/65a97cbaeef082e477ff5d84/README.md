# ArjunRajesh — FLAG

| | |
|---|---|
| **ID** | [`65a97cbaeef082e477ff5d84`](https://crackmes.one/crackme/65a97cbaeef082e477ff5d84) |
| **Auteur** | ArjunRajesh |
| **Plateforme** | Linux ELF64 PIE, C (`crackme.c`), non strippé |
| **SHA-256** | `4b3feaf4ae584b7ecbcb4c953c44516f3a68b8325cf71611845f3dbb4dfb1c8f` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/tryme` | binaire d'origine |
| `tools/tryme-solve.py` | recalcule le flag (`-q`, `--check`) |

## Réponse

**Flag (argv[1]) : `flag{_y0u_f0und_key_}`**

```bash
./original/tryme 'flag{_y0u_f0und_key_}'     # You found a flag! flag{_y0u_f0und_key_}
python3 tools/tryme-solve.py --check
```

## Premier regard

`strings` : `Usage: ./crackme FLAG`, `Wrong flag`, `You found a flag! %s` et **`sup3r_s3cr3t_k3y_1337`** (21 caractères). La chaîne ressemble à la solution mais ne l'est pas : c'est la *clé* d'un chiffrement ; la saisie `sup3r_s3cr3t_k3y_1337` est refusée.

## Flow

`main` @ `0x1165` : exige un argument (sinon « Usage… »), `strlen == 0x15` (21), puis deux boucles de 21 itérations avant un test octet par octet.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/tryme | awk '/<main>:/,/ret/'` (symbole `main` présent).

```asm
; boucle 1 (@0x11f7)
120a: movzx eax,BYTE PTR [rax]      ; key[i]  (pointeur .rodata+0x25 = "sup3r_s3cr3t_k3y_1337")
120d: sub   eax,0x22                ; key[i] - 0x22
121a: mov   [rbp+rax-0x20],dl       ; buf[i]

; table (@0x122e) : 21 dwords sur la pile
122e: mov DWORD PTR [rbp-0x80],0x37 ; 0x3f, 0x2f, 0x76, 0x2b, 0x62, 0x28, 0x21, 0x34, 0x0f, 0x77, 0x62,
      ...                           ; 0x48, 0x27, 0x75, 0x08, 0x56, 0x6a, 0x68, 0x4e, 0x68

; boucle 2 (@0x12cd)
12e6: movzx edx,BYTE PTR [argv1+i]  ; argv[1][i]
12f1: movzx eax,BYTE PTR [buf+i]
12f6: xor   eax,edx                 ; buf[i] ^ argv[1][i]
1303: mov   eax,[rbp+i*4-0x80]      ; table[i]
1307: cmp   edx,eax ; je suite      ; sinon "Wrong flag"
```

Donc `(key[i] − 0x22) XOR flag[i] == table[i]`, soit `flag[i] = (key[i] − 0x22) XOR table[i]` :

| i | key[i] | key−0x22 | table | flag[i] |
|---|---|---|---|---|
| 0 | `s` 0x73 | 0x51 | 0x37 | 0x66 `f` |
| 1 | `u` 0x75 | 0x53 | 0x3f | 0x6c `l` |
| 2 | `p` 0x70 | 0x4e | 0x2f | 0x61 `a` |
| 3 | `3` 0x33 | 0x11 | 0x76 | 0x67 `g` |
| 4 | `r` 0x72 | 0x50 | 0x2b | 0x7b `{` |
| 5 | `_` 0x5f | 0x3d | 0x62 | 0x5f `_` |
| 6 | `s` 0x73 | 0x51 | 0x28 | 0x79 `y` |
| 7 | `3` 0x33 | 0x11 | 0x21 | 0x30 `0` |
| 8 | `c` 0x63 | 0x41 | 0x34 | 0x75 `u` |
| 9 | `r` 0x72 | 0x50 | 0x0f | 0x5f `_` |
| 10 | `3` 0x33 | 0x11 | 0x77 | 0x66 `f` |
| 11 | `t` 0x74 | 0x52 | 0x62 | 0x30 `0` |
| 12 | `_` 0x5f | 0x3d | 0x48 | 0x75 `u` |
| 13 | `k` 0x6b | 0x49 | 0x27 | 0x6e `n` |
| 14 | `3` 0x33 | 0x11 | 0x75 | 0x64 `d` |
| 15 | `y` 0x79 | 0x57 | 0x08 | 0x5f `_` |
| 16 | `_` 0x5f | 0x3d | 0x56 | 0x6b `k` |
| 17 | `1` 0x31 | 0x0f | 0x6a | 0x65 `e` |
| 18 | `3` 0x33 | 0x11 | 0x68 | 0x79 `y` |
| 19 | `3` 0x33 | 0x11 | 0x4e | 0x5f `_` |
| 20 | `7` 0x37 | 0x15 | 0x68 | 0x7d `}` |

→ **`flag{_y0u_f0und_key_}`**.

Piège : la comparaison de la boucle 2 se fait sur un `char` signé (`movsx`), sans effet ici (tous les octets < 0x80).

## Vérification

```text
$ ./original/tryme 'flag{_y0u_f0und_key_}'   -> You found a flag! flag{_y0u_f0und_key_}
$ ./original/tryme 'flag{_y0u_f0und_key_x'   -> Wrong flag
$ ./original/tryme 'flag{_y0u_f0und_key_'    -> Wrong flag   (20 car.)
$ ./original/tryme                           -> Usage: ./crackme FLAG
```

## Notes

- Reverse statique + essais live ; pas de GDB.
