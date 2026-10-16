# howosec — Password And Flag in C

| | |
|---|---|
| **ID** | [`6973ebc6d735cd51e7a1aa97`](https://crackmes.one/crackme/6973ebc6d735cd51e7a1aa97) |
| **Auteur** | howosec |
| **Plateforme** | Linux ELF64 PIE, C (GCC 11.4), non strippé |
| **SHA-256** | `2849760cc674e39bc691cada99f6e1256e93cb4b7d61e5092fd8df559e2d7e5b` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/senha-e-flag-C-2` | binaire d'origine |
| `tools/senha-solve.py` | décodage statique du mot de passe **et** du flag (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **Mot de passe** | `senhafoda1234567890` |
| **Flag** | `HOWO{REVERSING-A-COMPLEX-XOR}` |

```bash
python3 tools/senha-solve.py --check
echo senhafoda1234567890 | ./original/senha-e-flag-C-2
```

## Premier regard

```bash
file original/senha-e-flag-C-2      # ELF64 PIE, not stripped
strings -n 4 original/senha-e-flag-C-2
```

Les chaînes utiles : `Insira sua senha:`, `Aqui está sua flag: %s`, ` errou hahahahah`. Les **symboles sont présents** :
`getPass`, `getFlag`, `xorEncode`, `xorDecode`, `rrxor` (`rrrrrxor` côté données), `djb2_hash`, `prandom`.
Aucune chaîne `senha…` ni `HOWO{…}` en clair : mot de passe et flag sont chiffrés dans le binaire.

## Flow

`main` @ `0x1769` :

1. `printf("Insira sua senha: ")` puis `scanf("%s", buf)` ;
2. `getPass()` → blob chiffré (pointeur + longueur `0x93`) ;
3. appel de `xorDecode` **via un pointeur de fonction global** (`call rcx`, `rcx = [rip+0x3571]` @ `0x4d58`, qui vaut `0x1fa7`) — petite obfuscation, pas de `call xorDecode` direct ;
4. `strcmp(saisie, décodé)` @ `0x180d` ;
5. si égal : `getFlag()` → même décodage → `printf("Aqui está sua flag: %s")`, sinon `puts("Você errou hahahahah")`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/senha-e-flag-C-2`. Le binaire n'est pas strippé donc
on lit directement `getPass` (`0x152b`), `getFlag` (`0x12c9`), `xorDecode` (`0x1fa7`), `rrxor` (`0x1aeb`), `djb2_hash` (`0x1cfb`).

### 1. Les blobs

`getPass` construit sur la pile une suite de `movabs reg, imm64` (little-endian) puis copie le tout dans un `malloc(0x93)` :

```asm
154a: movabs rax,0xe4d3b8b11a289ca8     ; octets a8 9c 28 1a b1 b8 d3 e4
1554: movabs rdx,0x5107d353b49f9e61     ; octets 61 9e 9f b4 53 d3 07 51
...
1658: mov    WORD PTR [rbp-0x20],0xdee3 ; + 2 octets
165e: mov    BYTE PTR [rbp-0x1e],0xeb   ; + 1 octet  => 18*8 + 3 = 147 = 0x93
1662: mov    edi,0x93
1667: call   malloc
```

`getFlag` fait pareil avec `0x9d` (157) octets (19 qwords + 4 + 1 octets). Piège : `strings` ne voit rien d'exploitable, il faut
relire les immediates en LE (comme pour l'exercice acheylate).

### 2. Format du blob (`xorDecode` @ `0x1fa7`)

```
blob = [ 128 octets "sel" ][ données XORées (len-128) ]
```

```asm
1fc4: mov edi,0x80 ; malloc(0x80) puis memcpy(blob, 0x80)
1ffb: call djb2_hash          ; h = djb2(blob[0:0x80])  -> 8 octets
200b: rax = blob + 0x80       ; données
201b: rsi = len - 0x80
2039: call rrxor(data, len, key8)
```

`djb2_hash` : `h = 5381 ; h = h*33 + byte` (`shl 5` + `add`), résultat 64 bits stocké dans un `malloc(8)` → **clé de 8 octets (LE)**.

### 3. `rrxor` @ `0x1aeb`

Boucle `for i in 0..len` (compilée avec des `div` par la taille de clé = 8) :

```
out[i]          = data[i] ^ key[(i+1) % 8]     ; 1c1d..1c4e
key[(i+2) % 8]  = key[i % 8]                   ; 1c51..1c8f  (la clé est mutée au fil de l'eau)
```

Ce n'est donc pas un XOR à clé répétée simple : la clé « glisse » (`key[i+2] ← key[i]`), d'où le nom `rrrrrxor` / « COMPLEX-XOR ».

### 4. Assemblage

Solveur : djb2 des 128 premiers octets → clé 8 octets → `rrxor` sur le reste. Même fonction pour `getPass` et `getFlag`.

```text
getPass blob (147 o) -> djb2(sel)=clé8 -> rrxor -> "senhafoda1234567890"
getFlag blob (157 o) -> même procédé        -> "HOWO{REVERSING-A-COMPLEX-XOR}"
```

(`xorEncode` @ `0x1da9` n'est **pas** appelée dans le flow : il génère un sel aléatoire via `rand()`/`prandom`, c'est le code qui a servi à fabriquer les blobs.)

## Debug GDB (pas à pas)

Pour confirmer le prédicat sans rien décoder à la main : intercepter le `strcmp` **applicatif** de `main`.
Piège : un `break strcmp` brut tombe d'abord dans le `strcmp` du loader (`ld-linux`) — il compare `/lib64/ld-linux-x86-64.so.2` — donc il faut viser l'adresse exacte du `call` dans `main`.

PIE : sous GDB la base est `0x555555554000`, l'appel `strcmp` @ offset `0x180d` donne `0x55555555580d`.

```bash
chmod +x original/senha-e-flag-C-2
echo aaaa > /tmp/in.txt
gdb -q -batch \
  -ex 'break *0x55555555580d' \
  -ex 'run < /tmp/in.txt' \
  -ex 'x/s $rdi' -ex 'x/s $rsi' \
  ./original/senha-e-flag-C-2
```

Observé :

```text
Breakpoint 1, 0x000055555555580d in main ()
0x7fffffffd8a0:  "aaaa"                  <- rdi = saisie (stack)
0x55555555c180:  "senhafoda1234567890"   <- rsi = mot de passe décodé (heap, malloc dans rrxor)
```

→ `rsi` est le buffer `malloc` retourné par `rrxor`. Le solveur statique donne exactement la même chaîne.

## Vérification

```bash
$ python3 tools/senha-solve.py --check
password = senhafoda1234567890
flag     = HOWO{REVERSING-A-COMPLEX-XOR}
check: OK - Insira sua senha: Aqui está sua flag: HOWO{REVERSING-A-COMPLEX-XOR}

$ echo wrong | ./original/senha-e-flag-C-2
Insira sua senha: Você errou hahahahah
```

## Notes

- Pas d'anti-debug : GDB marche tel quel.
- La « complexité » est surtout de la présentation (pointeur de fonction global, clé glissante) ; un breakpoint sur le `strcmp` suffit à tout révéler.
- Le sel de 128 octets est fixe dans le binaire (pas de `rand()` au runtime côté décodage).
