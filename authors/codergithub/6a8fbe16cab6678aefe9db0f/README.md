# codergithub's VBO

| | |
|---|---|
| **ID** | [`6a8fbe16cab6678aefe9db0f`](https://crackmes.one/crackme/6a8fbe16cab6678aefe9db0f) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | codergithub |
| **Plateforme** | macOS, Mach-O 64-bit **arm64** (PIE), C, 33 936 octets |
| **SHA-256** | `84930efce42d52e876790fe050db5a8bfa96a3970049be1e3fe047e25781491a` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme` | binaire d'origine (non modifié) |
| `tools/codergithub-vbo-solve.py` | solveur + `--check` (émulation unicorn du code ARM64 d'origine) |

## Réponse

Pas de username : une seule clé.

| Clé | Message déchiffré |
|---|---|
| **`FLAG-7A3F-9B1C-4D8E-2E6A`** | `FLAG{VBO_VIRTUAL_MACHINE_CRACKME_SOLVED_2026}` |

```bash
python3 tools/codergithub-vbo-solve.py          # clé + message
python3 tools/codergithub-vbo-solve.py -q       # clé seule
python3 tools/codergithub-vbo-solve.py --check  # rejoue le code d'origine sous unicorn
```

## Premier regard

```bash
file original/crackme     # Mach-O 64-bit arm64 executable, PIE
strings -n 6 original/crackme
```

`strings` ne montre que les messages d'erreur (`Invalid Key Length`, `Invalid Key Prefix`, `Hex Parsing Error`, `Verification Failed! Incorrect Key.`) et `Expected format: FLAG-XXXX-XXXX-XXXX-XXXX`. Le banner, le préfixe, le format `sscanf` et le message de succès sont **absents** : ils sont chiffrés (XOR) et déchiffrés à l'exécution.

## Flow

`main` (`0x10000078c`) enchaîne des « étapes » : à chaque étape il écrit un identifiant d'état dans `.bss` (`0x100008000`) et un résultat (0 = OK, 1 = KO), puis appelle `raise(5)` (SIGTRAP, stub `0x1000010b0`). Un handler de signal installé au début (`0x100000548` → `sigaction`, handler `0x100001010`) cherche l'état dans une table de 32 octets par entrée et, si le résultat vaut 1, redirige le PC (via `ucontext`, `[ctx+0x30]+0x110`) vers une fonction d'échec qui fait `puts(message)` + `exit(1)`. C'est donc un « VM » d'état + contrôle de flux par signal, qui gêne la lecture linéaire mais ne fait que des tests simples :

| État | Test | Échec |
|---|---|---|
| `0xe7bc` | `argc >= 2` | usage |
| `0x2cb` | `strlen(argv[1]) == 0x18` (24 = `FLAG-` + 4×4 + 3 tirets) | Invalid Key Length |
| `0x2a19` | `strncmp(argv[1], "FLAG-", 5) == 0` | Invalid Key Prefix |
| `0x7fbf` | `sscanf(argv[1]+5, "%04x-%04x-%04x-%04x", &a,&b,&c,&d) == 4` | Hex Parsing Error |
| `0xafa3` | `check(a,b,c,d)` (`0x100000fac`) | Verification Failed |

Succès : `printf("[+] SUCCESS! KEY VALIDATED (Token: 0x%016llX)", token)` puis un message déchiffré avec un keystream dérivé de la clé.

## Comment on trouve

### 1. Ancrage

Pas d'IDA ni de gdb disponibles pour ce Mach-O arm64 sur le serveur Linux (`objdump` ne le reconnaît pas, rien ne peut l'exécuter nativement). Désassemblage avec un petit script Python : parsing des `LC_SEGMENT_64` à la main puis **capstone** (ARM64) sur `__text` (`0x100000548`, 0xb38 octets). Le binaire n'est donc pas exécutable ici ; la preuve passe par l'émulation (voir Vérification).

### 2. Déchiffrement des chaînes

Motif répété partout (ex. `0x1000007cc`) :

```asm
mov  w10, #0xdff9 ; movk w10, #0x38bd, lsl #16   ; clé k = 0x38bddff9
...
ldur w12, [x29,#-0x88]   ; k
eor  w12, w12, w8        ; ^ compteur (w8 += 0x5d à chaque octet)
ldrb w13, [x10, x9]      ; octet chiffré (.const)
eor  w12, w13, w12
strb w12, [x11, x9]      ; seul l'octet bas est stocké
```

Soit `clair[i] = chiffré[i] ^ (k & 0xff) ^ ((i*0x5d) & 0xff)`. Appliqué aux blocs de `__const` : banner `=====…`, `REVERSE ENGINEERING CRACKME CHALLENGE`, préfixe `FLAG-`, format **`%04x-%04x-%04x-%04x`**, `[+] SUCCESS! KEY VALIDATED (Token: 0x%016llX)`.

### 3. Le prédicat `0x100000fac(a,b,c,d)`

`sscanf` écrit `a,b,c,d` dans cet ordre (`w0..w3` au call). Désassemblage commenté :

```asm
eor  w8, w1, w0 ; cmp w8, #0xe123 ; b.ne fail     ; a ^ b == 0xe123
madd w8, w1, 0x9e37, w2 ; cmp 0xe892, w8 (uxth)   ; (b*0x9e37 + c) & 0xffff == 0xe892
ubfx w10, w3, #11, #5 ; orr w10, w10, w3, lsl #5
and  w10, w10, #0xffff ; eor w10, w10, w2          ; rol16(d,5) ^ c == 0x80cb
(a+b)+(c+d) ; uxth == 0x9153                       ; somme 16 bits
```

### 4. Résolution

Tout est inversible champ par champ : pour chaque `a` (65536) : `b = a ^ 0xe123`, `c = 0xe892 - b*0x9e37 (mod 2^16)`, `d = ror16(c ^ 0x80cb, 5)`, puis on teste la somme. Résultat : **5 solutions** qui passent `check` :

```
19CC-F8EF-EB39-935F   1DE0-FCC3-40AD-3603   649B-85B8-9E0A-08F6
7A3F-9B1C-4D8E-2E6A   9104-7027-BE31-D1F7
```

### 5. Quelle est la bonne ? Le keystream

Après `check`, `token = a<<48 | b<<32 | c<<16 | d` (`0x100000c64`). Le message de succès (44 octets en `0x1000011ee`, +1 octet final) est XORé avec un keystream splitmix64 : 4 lanes `mix(token + C_l)` avec `C = 9e3779b97f4a7c15, 3c6ef372fe94f82a, daa66d2c7ddf743f, 78dde6e5fd29f054` (`C_l += 0x78dde6e5fd29f054` à chaque tour de 4 octets), `mix(x): x^=x>>30; x*=0xbf58476d1ce4e5b9; x^=x>>27; x*=0x94d049bb133111eb`, octet = `ct ^ v ^ (v>>31)` (bas 8 bits). Le 45e octet vient de `mix(token + 0xcfc0659b6017cfb1) ^ 0xb9 ^ …`.

Les 5 candidats passent le test mais **un seul** donne un message lisible : `7A3F-9B1C-4D8E-2E6A → FLAG{VBO_VIRTUAL_MACHINE_CRACKME_SOLVED_2026}`. Les 4 autres donnent du bruit — le binaire les accepterait quand même (le prédicat seul est satisfait), la clé « voulue » est celle-ci.

### Pièges

- Les constantes 64 bits sont construites en `mov/movk` : l'ordre des 16 bits est facile à inverser (ma première version avait `0x9e377f4a79b97c15` au lieu de `0x9e3779b97f4a7c15` : seule la lane 0 était fausse, ce qui a révélé l'erreur).
- `%04x` n'impose pas 4 chiffres max pour `sscanf`, mais la longueur totale 24 fixe quasiment le format 4-4-4-4.
- Le contrôle de flux par `raise`/handler rend le désassemblage « plat » trompeur : les fonctions d'échec (`0x1000006ec…`) n'ont aucun `bl` explicite.

## Vérification

Le binaire est un Mach-O arm64 : **pas exécutable sur le serveur Linux** (pas de macOS/Darling, pas de qemu-user pour Mach-O). Preuve par **émulation unicorn du code ARM64 d'origine** (`--check`) : exécution de `0x100000fac` avec la clé, puis du bloc `0x100000c64–0x100000dc0` (token + keystream) sur le contenu réel de `original/crackme` :

```text
$ python3 tools/codergithub-vbo-solve.py --check
clé     : FLAG-7A3F-9B1C-4D8E-2E6A
message : FLAG{VBO_VIRTUAL_MACHINE_CRACKME_SOLVED_2026}
[check] 0x100000fac -> 1; message émulé = FLAG{VBO_VIRTUAL_MACHINE_CRACKME_SOLVED_2026}
```

Non testé sur un vrai macOS arm64 (`./crackme FLAG-7A3F-9B1C-4D8E-2E6A` devrait afficher le `SUCCESS` et le flag). Cas KO : la longueur, le préfixe et le `sscanf` sont lus statiquement ; une clé qui échoue à `check` (ex. `FLAG-0000-0000-0000-0000` : `a^b = 0 ≠ 0xe123`) renvoie 0 dans `0x100000fac`.

## Notes

- Le sujet « VBO » (VM-based obfuscation) est léger : états + signal, aucune VM de bytecode.
- La clé du solveur est choisie par lisibilité du message, pas uniquement par le prédicat.
