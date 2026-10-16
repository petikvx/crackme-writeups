# vulnix — easyjerk

| | |
|---|---|
| **ID** | [`67fa22568f555589f3530a94`](https://crackmes.one/crackme/67fa22568f555589f3530a94) |
| **Auteur** | vulnix |
| **Plateforme** | Linux ELF64 PIE, C (`crackme.c`), non strippé |
| **SHA-256** | `74a56000344498f377156b16b2b47f574c93f8e63eb66f4296e6a8a065102de2` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/easyjerk` | binaire d'origine |
| `tools/easyjerk-solve.py` | inverse la transformation (`-q`, `--check`) |

## Réponse

**Serial : `LiZTeETf`** (8 caractères)

```bash
python3 tools/easyjerk-solve.py --check
echo LiZTeETf | ./original/easyjerk     # Access Granted! Welcome!
```

## Premier regard

`strings` : `Enter your serial: `, `Access Granted! Welcome!`, `Access Denied! Invalid Serial.`, symboles `transform` et `check_serial`.
Pas de chaîne secrète en clair : le serial est reconstruit par inversion.

## Flow

`main` : `printf`, `scanf("%s")`, `check_serial(buf)` ; non nul → « Access Granted! Welcome! ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/easyjerk | awk '/<(transform|check_serial)>:/,/ret/'`.

`transform(c, i)` @ `0x1169` :

```asm
1175: movsx eax,BYTE PTR [rbp-0x4]   ; c (signé)
1179: mov  edx,[rbp-0x8]             ; i
117c: add  edx,0x7                   ; i + 7
117f: xor  eax,edx                   ; c ^ (i+7)
1181: add  eax,0xd                   ; + 13
1184: and  eax,0x7f                  ; & 0x7f
```

`check_serial` @ `0x1189` : `strlen == 8`, puis pour chaque `i`, `transform(serial[i], i) == T[i]` avec la table posée sur la pile :

```asm
1195: mov DWORD PTR [rbp-0x30],0x58  ; T[0]
119c: ... 0x6e, 0x60, 0x6b, 0x7b, 0x56, 0x66, 0x75   ; T[1..7]
```

Inversion : `c = ((T[i] - 13) & 0x7f) ^ (i + 7)`.

| i | T[i] | T-13 | i+7 | c |
|---|---|---|---|---|
| 0 | 0x58 | 0x4b | 0x07 | 0x4c `L` |
| 1 | 0x6e | 0x61 | 0x08 | 0x69 `i` |
| 2 | 0x60 | 0x53 | 0x09 | 0x5a `Z` |
| 3 | 0x6b | 0x5e | 0x0a | 0x54 `T` |
| 4 | 0x7b | 0x6e | 0x0b | 0x65 `e` |
| 5 | 0x56 | 0x49 | 0x0c | 0x45 `E` |
| 6 | 0x66 | 0x59 | 0x0d | 0x54 `T` |
| 7 | 0x75 | 0x68 | 0x0e | 0x66 `f` |

→ **`LiZTeETf`**.

Piège : le `& 0x7f` ne garde que les 7 bits bas, donc le bit 7 de chaque octet est ignoré. Vérifié en live : remplacer `i` (0x69) par l'octet brut `0xe9` en 2ᵉ position (`printf 'L\xe9ZTeETf\n' | ./original/easyjerk`) donne aussi `Access Granted!`. La solution ASCII imprimable `LiZTeETf` reste celle à retenir.

## Vérification

```text
$ echo LiZTeETf | ./original/easyjerk   -> Access Granted! Welcome!
$ echo AAAAAAAA | ./original/easyjerk   -> Access Denied! Invalid Serial.
```

## Notes

- Reverse statique + essais live, pas de GDB.
