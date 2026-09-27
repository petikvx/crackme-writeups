# 5's Quintessence

| | |
|---|---|
| **ID** | [`6ab04161cab6678aefe9de58`](https://crackmes.one/crackme/6ab04161cab6678aefe9de58) |
| **Auteur** | [5](https://crackmes.one/user/5) |
| **Plateforme** | Linux x86-64, ELF64 statique, stripé, GCC 14.2.0 (Debian) |
| **Type** | keygen (name → serial `XXXX-XXXX-XXXX-XXXX`) |
| **SHA-256 (ZIP distribué)** | `3c225964d481f6ebfed6c3bdcb25523204365bdce83cd937031f2034729ab63f` |
| **SHA-256 (`quintessence`)** | `064b4422fd28ced044c0e3cf9d2a53a777777c8c5be81ae575d89b9757b6a4a8` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/quintessence.zip` | archive telle que livrée par crackmes.one (mot de passe du ZIP site : `crackmes.one` ; le ZIP interne n’en a pas) |
| `original/quintessence` | ELF extrait |
| `original/README.txt` | énoncé de l’auteur |
| `analysis/main.pseudoc` | pseudo Hex-Rays de `main` (`sub_401640`), via le MCP `ida` |
| `tools/quintessence-solve.py` | keygen |

## Réponse

Un nom de 3 à 31 caractères ASCII affichables a **un** serial. Exemple :

| Nom | Serial | Proof token |
|---|---|---|
| `petik` | `585A-57BB-F245-6B39` | `9C289046554D6A74` |

```bash
python3 tools/quintessence-solve.py            # --name petik par défaut
python3 tools/quintessence-solve.py --check
python3 tools/quintessence-solve.py -q
```

Les tirets sont facultatifs, la casse du serial aussi : `585a57bbf2456b39` est accepté.

## Premier regard

```text
ELF 64-bit LSB executable, x86-64, statically linked, stripped
entry 0x4029e0, .text 0x401100 (≈ 590 Kio)
```

`strings` ne sort presque que du bruit de libc (le binaire est statique). Les messages du programme sont chiffrés dans `.rodata`. L’énoncé (`original/README.txt`) dit l’essentiel : serial hex 16 chiffres, un seul par nom, le message de succès ne se déchiffre qu’avec le bon serial, un debugger attaché force « Invalid serial », patcher le binaire est détecté.

Lancement :

```text
Quintessence -- the fifth element of reversing
Find a valid serial for your name (keygen preferred).
Serial format: XXXX-XXXX-XXXX-XXXX
Name   :
Serial :
```

## Flow

`start` (`0x4029e0`) appelle `__libc_start_main` avec `main` = `sub_401640`.

1. Deux S-box sont construites en mémoire (Fisher-Yates, voir plus bas).
2. Le binaire déchiffre et affiche le bandeau, lit le nom (≤ 79 octets) et le serial (≤ 95), retire le `\n` final.
3. Nom : longueur 3…31, octets `0x20`…`0x7E`. Sinon échec.
4. Serial : les caractères hex (`0-9`, `a-f`, `A-F`) remplissent 16 nibbles ; tout le reste (tirets, espaces) est ignoré. Il en faut **exactement** 16. Ils sont compactés en 8 octets : nibble pair = poids fort.
5. Anti-debug : `TracerPid:` lu dans `/proc/self/status` (chaînes déchiffrées). Un pid non nul fait échouer. Le test est fait deux fois (avant et après la VM).
6. Intégrité : ouvre `/proc/self/exe`, cherche la section ELF nommée `.text`, CRC-32 (poly `0xEDB88320`) comparé au dword de la section custom `.crc` à `0x4C5AC0` (`0x589E2551`). Un `.text` patché fait échouer.
7. Une VM à pile, sans branchement, mélange le nom dans le registre 1 et le serial dans le registre 3. Succès ssi `reg1 == reg3`, pas de debugger, et l’écart `__rdtsc` autour de la VM reste ≤ `0x5F5E100` (10⁸ cycles).
8. Succès : « Correct! Serial accepted for this name. » puis `Proof token: %016llX`. Échec : « Invalid serial. »

## Comment on trouve le prédicat

### Ancrage

MCP `ida` : `open_database` sur `original/quintessence`, puis `execute_python`. `start` ne fait que passer `sub_401640` à la libc. C’est le `main` (≈ 5 Kio, `0x401640`). Le pseudo est dans `analysis/main.pseudoc`.

Les chaînes utiles ne sont pas en clair. Le déchiffreur `sub_402BC0` (`0x402BC0`) fait, pour `i` de 0 à `n-1` :

```text
clair[i] = i ^ cle ^ chiffré[i]
```

| Adresse | Clé | n | Clair |
|---|---|---|---|
| `0x497370` | `0x36` | 14 | `/proc/self/exe` |
| `0x497380` | `0xF8` | 17 | `/proc/self/status` |
| `0x497360` | `0xB2` | 10 | `TracerPid:` |
| `0x497355` (`aZ3`) | `0x54` | 5 | `.text` |
| `0x4973A0` | `0x25` | 16 | `Invalid serial.\n` |
| `0x497320` XOR `0x4972E0` | — | 53 | `Correct! Serial accepted…\nProof token: ` |

`sub_402B60` est le parseur de nibble (retourne `-1` si le caractère n’est pas hex). `sub_402C10` ouvre le status et `sscanf` le pid après `TracerPid:`.

### La VM

Le bytecode est à `0x4974C0`, 0x746 octets, démasqué par `byte_497C10[i & 0xF]`. Boucle dans `main` : un octet d’opcode, puis un immédiat selon l’opcode. Pile de 16 qwords. Huit registres (slots 0…7). Tout est sur 64 bits, les décalages sont masqués à 6 bits (`shr`/`rol` avec `cl`).

| Opcode | Effet |
|---|---|
| 0 | stop |
| 1 | push immédiat u64 LE |
| 2 | push `serial[imm & 7]` |
| 3 | push `name[imm % len]` |
| 4 | push longueur du nom |
| 5 | add |
| 6 | sub (second − sommet) |
| 7 | mul |
| 8 | xor |
| 9 | and |
| 10 | or |
| 11 / 12 / 13 | rol / ror / shr du sommet, compte sur l’octet suivant |
| 14 | sommet = `S256[sommet & 0xFF]` |
| 15 | S-box d’un octet du qword (lane `imm & 7`, voir plus bas) |
| 16 | permutation des 64 bits |
| 17 | `acc ^= pop` (l’accumulateur n’est pas testé) |
| 18 / 19 / 20 | dup / swap / pop |
| 21 / 22 | pop → `reg[imm & 7]` / push `reg[imm & 7]` |

Les deux tables sont un `0..n-1` mélangé par Fisher-Yates. L’état est un xorshift32 :

```text
x ^= x << 13
x ^= x >> 17
x ^= x << 5
```

Pour `i` de `n-1` à `1` : `j = xorshift() % (i+1)`, échange `a[i]` et `a[j]`.

| Table | n | graine | Rôle |
|---|---|---|---|
| `S256` @ `0x4C5BA0` | 256 | `1052827226` (`0x3EC2A25A`) | S-box octets |
| `P64` @ `0x4C5B60` | 64 | `0xA5A5BEEF` (`-1515864337`) | position de sortie du bit `i` |

Le bloc SIMD avant le mélange ne fait que poser l’identité `0, 1, 2, …` : le keygen qui part de `range(n)` est accepté par le binaire.

Opcode 15, lane `L` :

```text
b  = octet L
b' = S256[(b + 17*L) & 0xFF] ^ ((44*L) & 0xFF)
```

Opcode 16 : le bit `i` de l’entrée va au bit `P64[i]` de la sortie.

### Ce que le programme calcule vraiment

Le préfixe (jusqu’au seul `STORE 1`, vers l’offset `0x689` du bytecode démasqué) ne lit **que le nom**. Il absorbe `name[0] … name[31]` avec `index % len`, donc le nom est rejoué s’il est plus court que 32, et mélange longueur, S-box et constantes (`0x243F6A8885A308D3`, `0x9E3779B97F4A7C15`, `0xD6E8FEB86659FD93`, …). Résultat : `reg1`.

La queue ne dépend **que du serial** :

```text
reg2 = 0
reg2 += serial[k] << (56 - 8*k)     # k = 0..7, big-endian
reg3 = ROL( bitperm( sbox_lanes(reg2 ^ 0xF0F1F2F3F4F5F6F7) ), 17 )
```

`sbox_lanes` applique l’opcode 15 sur les lanes 0 à 7. Chaque lane ne touche que son octet : la transformation est une bijection, voie par voie.

Le succès (`0x402725`, `test r10d`) est `reg1 == reg3`, et seulement si le CRC `.text` colle, `TracerPid == 0`, et le `rdtsc` n’a pas dépassé 10⁸ cycles. L’accumulateur (`opcode 17` sur `reg3 ^ reg1`) ne sert pas au test : quand les deux registres sont égaux il vaut 0.

Le token affiché (`0x402732`) est un finalizer type SplitMix64, pas un second secret :

```text
x = reg1 ^ (len << 32) ^ 0x5A5A5A5A5A5A5A5A
x = x + 0x9E3779B97F4A7C15          # add r14 ; ≡ sub 0x61C8864680B583EB
x = (x ^ (x >> 30)) * 0xBF58476D1CE4E5B9
x = (x ^ (x >> 27)) * 0x94D049BB133111EB
token = x ^ (x >> 31)               # %016llX
```

Hex-Rays coupe le `imul` 64 bits en un produit 32 bits `321982955` (`0x133111EB`, bas de la constante) XOR un décalage. L’assembleur à `0x40275D`–`0x402776` est le finalizer ci-dessus.

### Inversion (pour `petik`)

`S256` et `P64` sont bijectives, donc un nom donne un serial unique.

1. Interpréter le préfixe → `reg1`.
2. `y = ROR(reg1, 17)`.
3. Inverse de la permutation : bit `i` de l’entrée = bit `P64[i]` de `y`.
4. Inverse de chaque lane : `S256[(b + 17*L) & 0xFF] ^ ((44*L) & 0xFF) = b'` donne `b` via la table inverse.
5. XOR `0xF0F1F2F3F4F5F6F7`, lire les 8 octets en big-endian, grouper par 4 hex.

Pour `petik` (longueur 5) :

| Étape | Valeur |
|---|---|
| `reg1` | `0x397E73D44FF52D15` (`p,e,t,i,k` rejoués, `index % 5`, sur 32 prises) |
| serial | `585A-57BB-F245-6B39` |
| token | `9C289046554D6A74` |

Le solveur refait exactement ce chemin (`--check` vérifie `reg1 == reg3` sans lancer l’ELF).

## Vérification

OK :

```bash
printf 'petik\n585A-57BB-F245-6B39\n' | ./original/quintessence
# Correct! Serial accepted for this name.
# Proof token: 9C289046554D6A74
# exit 0

printf 'petik\n585a57bbf2456b39\n' | ./original/quintessence
# même token, exit 0
```

KO :

```bash
printf 'petik\n0000-0000-0000-0000\n' | ./original/quintessence
# Invalid serial.   exit 1

printf 'ab\nAAAA-BBBB-CCCC-DDDD\n' | ./original/quintessence
# nom trop court (il faut 3..31) → Invalid serial.   exit 1
```

Un `gdb` attaché met `TracerPid` ≠ 0 : le même serial valide est alors rejeté. Ce n’est pas le prédicat qui change.

## Notes

- Patcher `.text` casse le CRC stocké dans la section `.crc` (`0x4C5AC0`). Le message de succès est en plus masqué par un SplitMix dérivé du résultat VM quand le chemin d’échec est pris (`0xA5A5DEAD5EE0BEEF` est OR-é dans la clé).
- Le budget `rdtsc` (10⁸ cycles) laisse passer un run natif. Un émulateur très lent peut rater un serial pourtant juste.
- Le debugger distant x64dbg ne s’applique pas (ELF Linux). Le reverse statique est passé par le MCP `ida` (idalib), pas par une session GDB.
- Le ZIP interne `quintessence.zip` n’est pas le crackme : l’ELF dedans l’est. Le hash d’`ORIGIN.yml` reste celui du ZIP téléchargé.
