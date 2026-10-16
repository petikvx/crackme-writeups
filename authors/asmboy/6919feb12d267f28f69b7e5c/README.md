# ASMboy — segfault

| | |
|---|---|
| **ID** | [`6919feb12d267f28f69b7e5c`](https://crackmes.one/crackme/6919feb12d267f28f69b7e5c) |
| **Auteur** | ASMboy |
| **Plateforme** | Linux ELF64 PIE, C (`main.c`), non strippé |
| **SHA-256** | `0521f61250bf5d16e81f697b9b387f17aed92a2a63c23c7878d8c1eb887e79c5` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/a.out` | binaire d'origine |
| `tools/segfault-solve.py` | keygen username → serial (`--user`, `-q`, `--check`) |

## Réponse

`serial = atoi( alt_case(username)[0:8] )`, avec `alt_case` = minuscule aux indices pairs, majuscule aux indices impairs.
Le nom doit faire **8 à 12 caractères** (« petik » seul est trop court).

| Username | Transformé | Serial |
|---|---|---|
| `petikpetik` | `pEtIkPeTiK` | **`0`** (`atoi` s'arrête sur `p`) |
| `12345678` | `12345678` | **`12345678`** |
| `  42abcdefgh` | `  42aBcDeFgH` | **`42`** (`atoi` saute les espaces) |

```bash
python3 tools/segfault-solve.py --check              # petikpetik -> 0
python3 tools/segfault-solve.py --user 12345678 -q   # 12345678
```

## Premier regard

`strings` : `username:`, `username must be between 8 and 12!`, `serial number:`, `s/n OK!`, `s/n WRONG!`.
Imports parlants : `fgets`, `strcspn`, `tolower`, `toupper`, `strncpy`, `atoi`. Le format `scanf` en `.rodata` est `%lf` (**un double**).

## Flow

1. Boucle `username:` : `fgets(buf, 0x80)`, retrait du `\n` via `strcspn`, `strlen` ; refait la demande tant que `len <= 7` ou `len > 12` (@ `0x1310`–`0x1320`).
2. `scanf("%lf", &serial)` @ `0x1365` (double à `[rbp-0x128]`).
3. Boucle de transformation @ `0x1398`, puis `strncpy(dst, t, 8)`, `atoi(dst)`, comparaison avec le double.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/a.out | awk '/<main>:/,/ret/'`.

```asm
1398: mov eax,[rbp-0x138]      ; i
139e: and eax,1 / jne 13dd     ; i impair -> branche toupper
13ba: call tolower             ; i pair   -> tolower(u[i])
13f2: call toupper             ; i impair -> toupper(u[i])
...                            ; t[j++] = résultat (tampon [rbp-0x90])
144a: mov edx,8 ; call strncpy ; copie 8 octets de t dans [rbp-0x120]
145a: mov BYTE PTR [rbp-0x118],0   ; NUL terminal (donc chaîne de 8 car.)
146b: call atoi
1482: movsd xmm1,[rbp-0x128]   ; serial saisi (double)
148a: ucomisd xmm0,xmm1        ; (double)atoi == serial ?  -> s/n OK!
```

Donc `serial == (double)atoi(t[0:8])`. Pièges :
- le serial est un **double** (`%lf`) : `0`, `0.0`, `12345678.0` passent ; la comparaison est exacte ;
- `atoi` s'arrête au premier caractère non numérique : tout nom commençant par une lettre donne **0**, ce qui rend le « keygen » trivial pour un nom alphabétique ;
- seuls les 8 premiers caractères comptent, mais la longueur 8–12 est quand même exigée.

## Vérification

```text
$ printf 'petikpetik\n0\n' | ./original/a.out   -> s/n OK!
$ printf 'petikpetik\n1\n' | ./original/a.out   -> s/n WRONG!
$ printf '12345678\n12345678\n' | ./original/a.out -> s/n OK!
```

## Notes

- Reverse statique + essais live, pas de GDB. Malgré le titre « segfault », aucun crash rencontré.
