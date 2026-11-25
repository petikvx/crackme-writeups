# howosec's Not to simple KeyGen V2

| | |
|---|---|
| **ID** | [`69a1f44218b5d7ee4709351d`](https://crackmes.one/crackme/69a1f44218b5d7ee4709351d) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Page** | https://crackmes.one/crackme/69a1f44218b5d7ee4709351d |
| **Auteur** | howosec |
| **Plateforme** | Linux ELF x86-64, statique, strippé |
| **SHA-256** | `8b685085320c61337679f34eedc5aa338b5cc38c782ab5034581f33ae6c08804` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/howo-not-to-simple-keygen` | binaire d'origine (non exécutable : `chmod +x` sur une **copie**) |
| `tools/howo-keygen-solve.py` | keygen (port Python du hash + `--check` live) |

## Réponse

| name | email | serial |
|---|---|---|
| `petik` | `petik1@mail.com` | `AAA@AAAAAAAAAAAA` |

```bash
python3 -I tools/howo-keygen-solve.py --check      # défaut : petik / petik1@mail.com
python3 -I tools/howo-keygen-solve.py -q --name X --email Y@z.com
```

Flag affiché : `CTF{Giant-binary!=Secure-binary---Look-to-validation-and-boom}`.

> Contrainte : avec `petik@mail.com` aucun serial ASCII imprimable n'existe (voir plus bas),
> d'où l'email `petik1@mail.com` (le serial dépend du hash name+email).

## Premier regard

- `file` : ELF 64-bit statique, stripped (~800 Ko, libc embarquée). Aucune chaîne du jeu dans `strings` : les messages sont décodés à l'exécution (fonction `0x402dd0`, clé en 2e argument = longueur).
- Le programme demande `full name`, `email`, `serial` (3 × `fgets`, `\n` retiré), puis affiche `POLICE, THIS GUY IS A ROBBER...` ou le flag.

## Flow

`entry 0x401b00` → `main 0x401640` :

1. lit `name` (≤255), `email` (≤255), `serial` (≤16 car. : `fgets(buf, 0x11)`) ;
2. `H1 = hash(name)`, `H2 = hash(email)` (256 octets chacun, `0x401d80`) ;
3. `H = hash(H1 || H2)` (512 octets → 256) — registre `rbx` ;
4. vérifie `strlen(serial) == 16` puis la boucle de contrôle `0x4019ab–0x401a01`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel` à partir de l'entry ; `main` = l'argument passé à `__libc_start_main` (`mov rdi,0x401640`). Pas d'IDA headless disponible ici (`decc` absent) → lecture asm + GDB.

**Boucle de contrôle** (`n = 17 = strlen+1`, `s` = serial, `H` = hash 256 octets) :

```asm
4019ab  xor edx,edx
4019b1  movsx edi, s[i]                ; s[i]
4019ba  div r9                         ; (i+1) % 17
4019c1  movsx ecx, s[(i+1)%17]
4019cb  add ecx,edi                    ; s[i]+s[i+1]
4019cd  movsx r10d, s[(i+2)%17] ; shl r10d,3
4019d7  cmp ecx,r10d ; je 4019fb       ; ÉGAL => itération suivante (leurre !)
4019e1  movsx esi, H[i] ; shl esi,2    ; 4*H[i]
4019ec  movsx r11d, s[(i+3)%17]
4019f2  cmp r11d,esi ; je 401aa4       ; SUCCÈS -> flag
4019fb  i += 3 ; jusqu'à i >= 17
```

Donc : succès ⇔ ∃ i ∈ {0,3,6,9,12,15} tel que `s[(i+3)%17] == 4*(int8)H[i]` **et** `s[i]+s[i+1] != 8*s[i+2]`.
Piège : la première comparaison est un `je` vers l'itération suivante (pas vers le succès) — on la lit d'abord comme une branche gagnante, mais elle sert de garde. Les indices sont signés (`movsx`), et `s[16] = 0` (fin de buffer).

**Printable** : `s[pos] = 4*H[i]` doit être dans 32..126 ⇒ `H[i] ∈ [8,31]`. Il suffit d'un seul i parmi 6 (≈ 9 % chacun), les 15 autres octets sont libres (`A`). Pour `petik` / `petik@mail.com` : `H[0,3,6,9,12,15] = 154,168,207,122,49,38` → aucun ne convient ; `petik1@mail.com` donne `H[0]=16` et `H[9]=17` (dans la plage) → `s[3] = 4*H[0] = '@'`, d'où `AAA@AAAAAAAAAAAA`.

**Le hash `0x401d80`** (portage dans `hash256()` du solveur) : état de 64 dwords initialisé depuis `.rodata 0x497890..0x497900` ; absorption octet par octet (`b*0x100019c`, xor `0xbcbda360`, `*0x9e3779b3`, `rol 13`, index `&0x3f`, deux blocs alternés « S/T » dont la parité de longueur change le premier octet) ; 8 tours de mélange (`*0x85ebca78`, `^>>13`), 16 tours de finalisation (`*0x85ebca78`, `>>16`, `*0x7feb352c`, `>>15`) ; sortie = `state[j] ^ (j*0x9e3779b8)` en LE (constantes `.rodata 0x497910`). Validation : le port reproduit exactement le dump mémoire GDB (premier dword du hash du nom `619c0429`, et `H[0..3] = 9a 6b 6a a8`).

## Debug GDB (pas à pas)

Binaire non exécutable : `cp original/howo-not-to-simple-keygen /tmp/b && chmod +x /tmp/b`. Entrées dans `in.txt` (`name\nemail\nserial\n`).

```gdb
gdb -q ./b
set pagination off
break *0x401879        ; juste après hash(name) : x/64xw $rax  -> 29 04 9c 61 ... (= hash256(b"petik"))
break *0x40199c        ; avant la boucle : x/32xb $rbx = H ; x/s $rsp+0x20 = serial ; $r13 = 16
break *0x4019d7        ; cmp s[i]+s[i+1] vs 8*s[i+2] : $ecx / $r10d
run < in.txt
```

Observations : à `0x40199c`, `H = 9a 6b 6a a8 de e5 cf 58 …` (identique au Python) ; à `0x4019d7`, avec serial `||\x1fAAAA…`, `ecx == r10d == 248` et le programme enchaîne sur l'itération suivante (confirme que `je` = leurre, pas succès). Pas de PIE (binaire statique non-PIE), pas d'anti-debug rencontré.

## Vérification

```text
$ python3 -I tools/howo-keygen-solve.py --check
name=petik email=petik1@mail.com serial=AAA@AAAAAAAAAAAA
Get your flag: CTF{Giant-binary!=Secure-binary---Look-to-validation-and-boom}

# KO : mauvais serial
$ printf 'petik\npetik1@mail.com\nAAAAAAAAAAAAAAAA\n' | ./b | tail -1
POLICE, THIS GUY IS A ROBBER BUT HE DON'T HAVE A VALID SERIAL KEY LOL!
# KO : petik@mail.com => le solveur refuse (aucun octet de hash dans [8,31])
```

## Notes

- Le serial est lié à `name` **et** `email` (hash chaîné) ; changer l'un invalide l'autre.
- Les chaînes d'interface ne sont pas dans `strings` (décodage runtime), la libc statique noie le code utile : partir de `main` via l'entry.
