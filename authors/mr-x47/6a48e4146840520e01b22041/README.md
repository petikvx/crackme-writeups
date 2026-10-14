# Mr.X47's BiLoop Cipher

| | |
|---|---|
| **ID** | [`6a48e4146840520e01b22041`](https://crackmes.one/crackme/6a48e4146840520e01b22041) — voir [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | Mr.X47 |
| **Auteur (local)** | mr-x47 |
| **Plateforme** | Linux, ELF64 x86-64 PIE, strippé, GCC 16.1.1 (C) |
| **Difficulté** | 1.8 |
| **SHA-256** | `5e68a7121b769801234ad99f60f390300ec913d8162d8928d009bd6a828fcd30` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/BiLoop_Cipher` | binaire d'origine (non patché) |
| `analysis/text.objdump.txt` | `objdump -d -M intel -j .text` complet (~300 lignes) |
| `analysis/check.txt` | sortie de `biloop-cipher-solve.py --check` + cas limites (natif) |
| `tools/biloop-cipher-solve.py` | keygen username → password (`--user`, `-q`, `--check`) |

## Réponse

C'est un **keygen** : le password dépend du username.
Le username doit faire **8 à 32 caractères** ASCII `0x21..0x7e` : `petik` (5 caractères) est **refusé**
(`[Error] The username must be between 8 and 32 characters`), donc l'exemple utilise **`petik123`**, le plus proche de `petik`.

| Username | Password |
|---|---|
| **`petik123`** | **`iemgo1#3`** |
| `petikpetik` | `iemgopttuq` |
| `!!!!!!!!!!!!!` | `8!8/%!0!=;)!*` (dernier caractère remplacé par `*`) |

```bash
python3 tools/biloop-cipher-solve.py                    # petik123 -> iemgo1#3
python3 tools/biloop-cipher-solve.py --user petikpetik
python3 tools/biloop-cipher-solve.py --check            # preuve native (OK + KO)
printf 'petik123\niemgo1#3\n' | ./original/BiLoop_Cipher
```

## Premier regard

```text
$ file original/BiLoop_Cipher
ELF 64-bit LSB pie executable, x86-64, dynamically linked, ..., stripped
```

Imports utiles (`strings`) : `__isoc23_scanf`, `strlen`, `malloc`, `memcpy`, `strcmp`, `free`, `printf`, `puts`.
Chaînes : `Username: `, `%32s`, les trois messages d'erreur sur le username, `Password: `,
`[ERROR] Internal Failure`, `Success`, `Failure`, `Access Status: %s`.

La présence de `strcmp` + `malloc`/`memcpy` laisse deviner le schéma classique : le binaire **calcule** le
password attendu à partir d'une copie du username, puis le compare à la saisie. Il n'y a pas de password en clair.

`objdump -s -j .rodata` montre, juste avant `Username: `, un bloc de **32 octets** à `0x2020` qui ne ressemble à rien
d'imprimable — c'est la clé XOR :

```text
2020 161d191d 04180007 1c18081b 031c0719
2030 1c140120 06111a0c 10110a11 0e14180f
```

## Flow (`main` @ `0x1394`)

1. `printf("Username: ")`, `scanf("%32s", user)` (buffer `rbp-0x60`) ;
2. `strlen(user) <= 7` → message « between 8 and 32 » et **on reboucle** sur `Username:` (`jmp 0x13b3`) ;
3. `check_charset(user)` (`0x11de`) faux → message « allowed ASCII range » et on reboucle ;
4. `printf("Password: ")`, `scanf("%32s", pass)` (buffer `rbp-0x30`) ;
5. `exp = derive(user)` (`0x1238`) ; `NULL` → `[ERROR] Internal Failure` ;
6. `printf("Access Status: %s\n", strcmp(exp, pass) == 0 ? "Success" : "Failure")`, `free(exp)`.

La limite haute « 32 » n'est pas testée explicitement : c'est `%32s` qui tronque.

## Comment on trouve le password

**Ancrage** : binaire strippé, donc on part du `main` passé à `__libc_start_main` puis on suit les `call`
internes dans `objdump -d -M intel -j .text` (fichier `analysis/text.objdump.txt`). Trois fonctions locales :

| Adresse | Rôle (nom donné) |
|---|---|
| `0x11b9` | `is_printable(c)` |
| `0x11de` | `check_charset(s)` : `is_printable` sur chaque octet |
| `0x1238` | `derive(user)` : les deux boucles XOR (« BiLoop ») + nettoyage |

### `is_printable` (`0x11b9`)

```asm
11c1: cmp  BYTE PTR [rbp-0x1],0x20   ; comparaison SIGNÉE (jle)
11c5: jle  -> return 0               ; c <= 0x20  (espace, contrôles, et >= 0x80 car négatif)
11c7: cmp  BYTE PTR [rbp-0x1],0x7f
11cb: je   -> return 0               ; DEL
11cd: mov  eax,0x1                   ; sinon 1
```

Donc caractère valide ⇔ `0x21 <= c <= 0x7e`.

### `derive` (`0x1238`) — les deux boucles

Après `malloc(len+1)` + `memcpy` + terminateur :

```asm
; boucle 1 : i = 0, 2, 4, ...
12b9: lea   rdx,[rip+0xd60]          ; K = .rodata 0x2020
12c7: movzx eax,BYTE PTR [rax]       ; K[i]
12d7: movzx ecx,BYTE PTR [buf+i]
12e5: xor   esi,ecx
12e9: mov   BYTE PTR [buf+i],dl      ; buf[i] ^= K[i]
12eb: add   QWORD PTR [rbp-0x28],0x2 ; i += 2
12f4: cmp   rax,[rbp-0x10] ; jb      ; tant que i < len

; boucle 2 : j = 0, 3, 6, ...
1304: mov   eax,0x1f
1309: sub   rax,QWORD PTR [rbp-0x20] ; 31 - j
1314: movzx eax,BYTE PTR [rax+rdx*1] ; K[31-j]   (clé lue à l'envers)
1333: xor   esi,ecx
1337: mov   BYTE PTR [buf+j],dl      ; buf[j] ^= K[31-j]
1339: add   QWORD PTR [rbp-0x20],0x3 ; j += 3

; boucle 3 : nettoyage
1365: call  is_printable
136f: je    ...
137c: mov   BYTE PTR [buf+k],0x2a    ; non imprimable -> '*'
```

Pseudo-C :

```c
char *derive(const char *u) {
    size_t n = strlen(u);
    char *b = malloc(n + 1); memcpy(b, u, n); b[n] = 0;
    for (size_t i = 0; i < n; i += 2) b[i] ^= K[i];
    for (size_t j = 0; j < n; j += 3) b[j] ^= K[31 - j];
    for (size_t k = 0; k < n; k++) if (!is_printable(b[k])) b[k] = '*';
    return b;                       // main : strcmp(b, password)
}
```

### Assemblage pour `petik123`

Les indices multiples de 6 (0, 6, …) prennent **les deux** XOR ; les impairs non multiples de 3 (1, 5, 7) ne sont pas touchés.

| i | u[i] | XOR boucle 1 (`K[i]`, i pair) | XOR boucle 2 (`K[31-i]`, i%3==0) | résultat |
|---|---|---|---|---|
| 0 | `p` 0x70 | `^0x16` | `^0x0f` | 0x69 `i` |
| 1 | `e` 0x65 | — | — | `e` |
| 2 | `t` 0x74 | `^0x19` | — | 0x6d `m` |
| 3 | `i` 0x69 | — | `^0x0e` (K[28]) | 0x67 `g` |
| 4 | `k` 0x6b | `^0x04` | — | 0x6f `o` |
| 5 | `1` | — | — | `1` |
| 6 | `2` 0x32 | `^0x00` | `^0x11` (K[25]) | 0x23 `#` |
| 7 | `3` | — | — | `3` |

→ **`iemgo1#3`**.

**Piège** : la boucle 3 remplace tout résultat non imprimable par `*`. Exemple : `K[12] ^ K[19] = 0x03 ^ 0x20 = 0x23`,
donc `'!'` (0x21) à l'indice 12 donne 0x02 → `*` (cas `!!!!!!!!!!!!!` → `8!8/%!0!=;)!*`, vérifié). Ce remplacement garantit
aussi qu'on peut toujours **taper** le password : il ne contient jamais d'espace ni de caractère de contrôle, que `%32s` ne lirait pas.
Le keygen n'est donc pas une bijection (plusieurs usernames peuvent donner le même password), mais ça ne gêne pas.

## Vérification (native)

```text
$ python3 tools/biloop-cipher-solve.py --check
username : petik123
password : iemgo1#3
[OK] 'petik123' / 'iemgo1#3' -> Success
[OK] 'petikpetik' / 'iemgopttuq' -> Success
[OK] 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA' / 'XAXOEAPA][IAbAF]]A\\AGI[AVAKEOADA' -> Success
[OK] '~~~~~~~~~~~~' / 'g~gpz~o~bdv~' -> Success
[OK] 'petik_crackmes.one' / 'iemgo_rr}ycmFs)sre' -> Success
[OK] 'petik123' / 'iemgo1#3x' -> Failure (attendu)

$ printf 'petik\npetik123\nwrongpw\n' | ./original/BiLoop_Cipher
Username: [Error] The username must be between 8 and 32 characters
Username: Password: Access Status: Failure
```

(Sortie complète dans `analysis/check.txt`.)

## Notes

- Reverse **100 % statique** (`objdump`) ; GDB n'a pas servi, la preuve est faite en natif par le solveur.
- Raccourci possible : `ltrace` / un breakpoint sur `strcmp` montrerait directement le password attendu pour un username donné,
  mais le keygen ci-dessus marche pour n'importe quel username valide.
- Comme `scanf("%32s")` tronque à 32 caractères, un username plus long est simplement coupé (seules ses 32 premières lettres comptent).
