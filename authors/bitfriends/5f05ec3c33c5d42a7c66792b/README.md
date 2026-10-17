# BitFriends — simple overflow

| | |
|---|---|
| **ID** | [`5f05ec3c33c5d42a7c66792b`](https://crackmes.one/crackme/5f05ec3c33c5d42a7c66792b) |
| **Auteur** | BitFriends |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `9bec25af59838923a448ed3ca257a5c277100d52945ad5b1330d67a88b145740` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/a.out` | binaire d'origine |
| `tools/overflow-solve.py` | payload d'overflow (`-q`, `--check`) |

## Réponse

**Payload : 31 caractères `A` (sans rien d'autre)**, envoyés en entrée.

```bash
python3 -c "print('A'*31)" | ./original/a.out
python3 tools/overflow-solve.py --check
```

## Premier regard

```bash
file original/a.out     # ELF64 PIE, not stripped
strings -n 5 original/a.out
```

Chaînes : `enter password: `, `uid: %d`, `you are logged in as admin`, `you are logged in as user`. Symbole `login` présent.

## Flow

`login` @ `0x1169` :

```asm
1182: mov edi,0x10 ; call malloc      ; buf  = malloc(0x10)
1190: mov edi,0x8  ; call malloc      ; uid  = malloc(0x8)
11a2: mov DWORD PTR [rax],0x1         ; *uid = 1   (valeur par defaut -> "user")
11bb: call fgets(buf, 0xa0, stdin)    ; lit JUSQU'A 0xa0 octets dans un buffer de 16 !
11dd: eax = *uid
11e1: jne  -> "you are logged in as user"   ; si uid != 0
11e3: (fallthrough) -> "you are logged in as admin"  ; si uid == 0
```

Pas de canari, pas de check de longueur : `fgets` accepte jusqu'à 0x9f octets alors que le buffer alloué ne fait que 16 octets utiles. Les deux variables sont sur le **heap** (deux `malloc` consécutifs), pas sur la pile : c'est un heap-overflow, pas un stack-overflow classique.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/a.out | awk '/<login>:/,/^$/'`.

La logique est **inversée** par rapport à l'intuition : `*uid` est initialisé à **1** (donc "user" par défaut), et c'est la branche `uid == 0` qui affiche "admin" (`test eax,eax` ; le `jne` saute vers "user", le fallthrough va vers "admin"). Il faut donc **écraser `uid` à zéro** via l'overflow du buffer `malloc(0x10)` qui précède.

Comme le buffer est rempli par `fgets`, il n'y a pas de contrôle direct sur les octets après la fin de l'entrée — mais `fgets` ajoute toujours un `'\0'` terminal juste après les octets lus. En faisant varier la longueur d'entrée par bruteforce empirique (boucle bash de 16 à 48 'A'), on repère le point où ce `'\0'` tombe exactement sur le premier octet de `*uid` :

```text
n=30 -> uid: 1   (user)   ; le 0x0a de fin de ligne est hors de la zone uid
n=31 -> uid: 0   (admin)  ; le '\0' terminal de fgets tombe sur le low-byte de uid
n=32 -> uid: 10  (user)   ; le '\n' (0x0a) lui-même tombe sur le low-byte -> uid=0x0a
```

Avec 31 `'A'`, `fgets` copie les 31 `'A'` + le `'\n'` (32 octets) puis écrit le `'\0'` terminal au 33ᵉ octet du buffer — cet octet correspond au premier byte de la zone `uid` sur le heap (chunks `malloc` contigus, taille minimale de chunk glibc = 0x20), ce qui le remet à **0** → branche "admin".

## Vérification

```bash
$ python3 -c "print('A'*31)" | ./original/a.out
enter password: uid: 0
you are logged in as admin

$ python3 -c "print('A'*30)" | ./original/a.out
enter password: uid: 1
you are logged in as user

$ python3 -c "print('A'*32)" | ./original/a.out
enter password: uid: 10
you are logged in as user
```

## Notes

- Pas de GDB nécessaire : la décision (quelle longueur zère `uid`) a été trouvée par balayage empirique des longueurs d'entrée contre le binaire natif, puis confirmée en lisant l'asm de `login`.
- L'offset exact (31) dépend de la disposition des chunks `malloc` de ce binaire précis (glibc, build donné) ; ce n'est pas une constante universelle mais une valeur vérifiée empiriquement et stable sur ce binaire.
