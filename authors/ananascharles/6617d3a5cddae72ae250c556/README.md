# AnanasCharles — Authorize by PIN

| | |
|---|---|
| **ID** | [`6617d3a5cddae72ae250c556`](https://crackmes.one/crackme/6617d3a5cddae72ae250c556) |
| **Auteur** | AnanasCharles |
| **Plateforme** | Linux ELF64 PIE, C (`authorize.c`), non strippé |
| **SHA-256** | `d454043736ee996dc6f63de011ec78070a13c5808210163a70e6f5b38c952e0c` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/authorize` | binaire d'origine |
| `tools/authorize-solve.py` | calcule le PIN et décode le flag (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **PIN** (argument) | `3991` |
| **Flag** | `JCTF{3nC0D1nG_15_FuN}` |

```bash
./original/authorize 3991      # Correct PIN entered! / Decoded String: JCTF{3nC0D1nG_15_FuN}
python3 tools/authorize-solve.py --check
```

## Premier regard

`strings` : `Usage: %s <pin>`, **`8446`**, `This is not right`, `Correct PIN entered!`, `Decoded String: %s` et une chaîne illisible `}|.wOlHtc}j@z9jf3 O Q`. Symboles : `encode_pin`, `decode_pin`, `decode_string`.
Piège : `./authorize 8446` est **refusé** (`8446` est la valeur *après* décodage, pas le PIN à saisir).

## Flow

`main` @ `0x1380` : `argc == 2`, `decoded = decode_pin(argv[1])`, `strncmp(decoded, "8446", 4)`, puis `strlen(argv[1]) == strlen(decoded)`.
Si tout passe : affiche « Correct PIN entered! » puis `decode_string(chaîne_encodée, argv[1])`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/authorize | awk '/<(decode_pin|decode_string|main)>:/,/^$/'`.

`decode_pin` @ `0x1238` (4 itérations) :

```asm
125c: sub eax,0x35          ; d = c - '5'
1262: cmp d,0 ; jns ; add d,10   ; si négatif : += 10   -> d = (c - '5') mod 10
126f: add eax,0x30          ; + '0'  -> chiffre
```

Chaque chiffre est donc **décalé de −5 modulo 10**. Le résultat est comparé (`strncmp`, longueur de la chaîne `8446`) à `8446`. Inversion : chiffre saisi = (chiffre cible + 5) mod 10 :
`8→3`, `4→9`, `4→9`, `6→1` → **`3991`**. La solution est unique (la fonction est bijective sur les chiffres).
`encode_pin` (@ `0x1165`) n'est pas appelée par `main`.

Le test `strlen(argv[1]) == strlen(decoded)` (= 4) interdit `39910` ou `399`.

`decode_string` @ `0x129d` : déchiffrement façon Vigenère avec **le PIN saisi comme clé** (`argv[1]`) :

```asm
12ee: idiv [rbp-0xc]        ; i % len(key)
1305: sub eax,edx           ; r = enc[i] - key[i % len(key)]
130a: cmp r,0x1f ; jle repli ; cmp r,0x7e ; jle ok     ; garder si 0x20 <= r <= 0x7e
1319: add eax,0x3f ... imul 0x5f ... lea eax,[rdx+0x20] ; repli : ((r + 0x3f) % 95) + 0x20
```

Appliqué à `}|.wOlHtc}j@z9jf3 O Q` (21 octets) avec la clé `3991`, on obtient `JCTF{3nC0D1nG_15_FuN}`. Le solveur reproduit exactement la sortie du binaire.

## Vérification

```text
$ ./original/authorize 3991    -> Correct PIN entered! / Decoded String: JCTF{3nC0D1nG_15_FuN}
$ ./original/authorize 8446    -> This is not right
$ ./original/authorize 39910   -> This is not right
$ ./original/authorize 399     -> This is not right
```

## Notes

- Reverse statique + essais live ; pas de GDB.
- Le flag dépend du PIN utilisé comme clé : seul le bon PIN affiche le bon flag.
