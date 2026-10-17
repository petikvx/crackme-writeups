# pranav — unlockme

| | |
|---|---|
| **ID** | [`5ff53c5c33c5d42c3d0165b7`](https://crackmes.one/crackme/5ff53c5c33c5d42c3d0165b7) |
| **Auteur** | pranav |
| **Plateforme** | Linux ELF64 PIE, C, non strippé (`c_fun001`..`004`) |
| **SHA-256** | `f51a8fd5374933df7a4ef4dbeace0c00bc6f304612c75ed5b510318276065d3a` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/a.out` | binaire d'origine |
| `tools/unlockme-solve.py` | calcule le mot de passe (`-q`, `--check`) |

## Réponse

**Mot de passe (argv[1]) : `YesYouCrackedMe`** (15 caractères)

```bash
./original/a.out YesYouCrackedMe    # You have done it
python3 tools/unlockme-solve.py --check
```

## Premier regard

`strings` : `Input method: <appname> <password>`, `You have done it`, `You have failed...`. Symboles anonymisés `c_fun001` à `c_fun004`.

## Flow

`main` @ `0x821` : construit une table de 15 octets sur la pile ; `c_fun003(argv[1])` vérifie `2·strlen−1 == 0x1d` (donc longueur 15) ; `c_fun004(0x50, argv[1])` copie et XOR chaque octet avec `0x50` ; `c_fun001(xoré, table)` compare octet par octet.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/a.out | awk '/<c_fun00[1-4]>:/,/ret/'`.

```asm
; c_fun003 : strlen "à la main" puis 2n-1
780: lea eax,[rax+rax-0x1]

; c_fun004(key=0x50, src)
7da: xor eax,ebp ; mov [rdx],al     ; buf[i] ^= 0x50, en place sur une copie

; c_fun001(a,b)
7fd: cmp [rsi+rax],cl ; jne fail    ; a[i] == b[i] pour chaque octet, jusqu'au NUL commun
```

La table sur la pile (`mov BYTE PTR [rsp+i], imm8`) : `09 35 23 09 3f 25 13 22 31 33 3b 35 34 1d 35`. XORée avec `0x50` :
`Y e s Y o u C r a c k e d M e` → **`YesYouCrackedMe`**.

## Vérification

```text
$ ./a.out YesYouCrackedMe    -> You have done it
$ ./a.out wrong_wrong_15c    -> You have failed...
```

## Notes

- Reverse statique + essais live ; pas de GDB.
