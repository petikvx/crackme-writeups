# VSEC Challenger Num #2

| | |
|---|---|
| **ID** | [`6acc0cbbace07d1c3fbc4afb`](https://crackmes.one/crackme/6acc0cbbace07d1c3fbc4afb) |
| **Auteur** | [vsec](https://crackmes.one/user/vsec) |
| **Plateforme** | Windows PE64 console, C++ MinGW (GCC 16.1.0 / MSYS2), image base `0x140000000` |
| **SHA-256** | `b0589d591573f981b12c9cb841676abc6b34fcc49a14c0d97b4c7294fb0fde69` |
| **Série** | #2 — le #1 est [Challenger No.1](../6acace8cca34abba98f8305a/) (Go / garble, autre prédicat) |

## Fichiers

| Chemin | Rôle |
|---|---|
| [`original/Challenger_2.exe`](original/Challenger_2.exe) | binaire d'origine, non patché |
| [`tools/vsec2-solve.py`](tools/vsec2-solve.py) | keygen (`--user`, `-q`, `--check`) |
| [`analysis/Challenger_2.exe.i64`](analysis/Challenger_2.exe.i64) | base IDA (gitignorée) |
| [`ORIGIN.yml`](ORIGIN.yml) | métadonnées |

## Réponse

Le serial a la forme `XXXXX-XXXX-XXXX-XXXX` (alphabet base32 sans `I`, `O`, `0`, `1`). Le flag imprimé est **fixe**.

| Username | Serial | Flag |
|---|---|---|
| `petik` | `EWB9M-AC59-WZB4-CMYW` | `CMO{K3YG3-N1US-R3V3-RS3D}` |
| `alice` | `NFTNS-AC59-FHR2-N4R9` | le même flag |

```bash
python3 tools/vsec2-solve.py --user petik -q
python3 tools/vsec2-solve.py --user petik --check
```

Username accepté : 4 à 20 octets. En dessous, le binaire refuse avant même de lire les quatre mots du serial.

## Premier regard

```text
PE32+ console x86-64, 10 sections, 1 327 104 octets
.text 0x129c50   .rdata 0x152f0   .bss 0x129200
EP RVA 0x1460
imports : KERNEL32, msvcrt, libstdc++-6, libgcc_s_seh-1
```

Pas un binaire Go (`go version -m` refuse). Les chaînes utiles ne sont pas en clair :

| VA | Décodage |
|---|---|
| `sub_140003590` index 0, 1, 2 | `=== VSEC Challenger #2 ===\nUsername: ` / `Serial  : ` / `\n` |
| `byte_140142600` XOR `0x5A` (38) | `[+] ACCESS GRANTED. Capture the flag:\n` |
| `byte_1401425D0` XOR `0x5A` (19) | `[-] ACCESS DENIED.\n` |
| `0x140142580` | `ABCDEFGHJKLMNPQRSTUVWXYZ23456789` |

Le déchiffreur d'invite (`sub_140003590`) mélange l'index avec la constante d'or `0x9E3779B97F4A7C15`, un pas FNV `0x100000001B3` et un fmix64 (`0xFF51AFD7ED558CCD` / `0xC4CEB9FE1A85EC53`). RTTI autour de `0x1401414A0` : lambdas `parse`, `ucrc`, `uhash`, `validate`, `chk`, `main`.

Huit fonctions d'environ 130 Ko sont des interpréteurs aplatis (control-flow flattening, état mélangé par le même fmix64). Chacune appelle en boucle un petit helper. Le prédicat lisible est dans ces helpers, pas dans les drivers.

## Flow

`start` → `sub_140001040` → driver `sub_14012AA20` → primitive `sub_14010BC50` (switch sur `dword [rdx]`, cas 0..0x18). À l'entrée, `mov r10, [rcx]` : `r10` est l'objet « registres » de la VM, et le contexte `Ctx` est `*(u64*)(r10+0x10)`.

| Opcode | Rôle |
|---|---|
| 0, 2 | imprime l'invite (chaînes 0 et 1) |
| 1 | `getline` dans la `std::string` à `*regs` (username) |
| 3 | `getline` dans la `std::string` à `regs+8` (serial) |
| 4 | met `Ctx` (0x50 octets) à zéro |
| 5 | `Ctx+0x30 = 0x1234567890ABCDEF` |
| 6 | driver `sub_140088F30`, callback `xor eax,eax; ret`. Résultat stocké à `Ctx+0x38`. Observé **0** (et le keygen qui suppose 0 passe pour `petik` et `alice`) |
| 7 | refuse si `(len-4) > 0x10` (donc len ∈ [4, 20]), puis parse via `sub_140002440` |
| 10 | `uhash` → `Ctx+0` |
| 11 | `ucrc` → `Ctx+0x28` |
| 12..15 | copie les quatre mots du parse vers `Ctx+8/+0x10/+0x18/+0x20` |
| 16 | `validate` (`sub_1400C9FE0`) |
| 0x13 / 0x18 | GRANTED / DENIED |
| 0x16 | émet un caractère du flag (la chaîne finale est constante) |

`Ctx` : `+0` uhash, `+8` W0, `+0x10` W1, `+0x18` W2, `+0x20` W3, `+0x28` ucrc, `+0x30` magique, `+0x38` résultat de l'op 6, `+0x40` octet de succès.

## Comment on trouve le prédicat

### Ancrage

Les invites XOR et l'alphabet sortent d'un `objdump` / d'un XOR `0x5A` sur `.rdata`. Le switch principal est `sub_14010BC50` (table `0x14013F2EC`). Le parse est le cas 0 de `sub_140002440` : longueur 20 et `serial[5] == serial[10] == serial[15] == '-'`.

Le décodage des groupes n'est pas un base32 classique « LSB d'abord ». Un essai différentiel sous Wine+GDB (un seul caractère passé de `A` à `B`) donne :

| Serial | Mot touché |
|---|---|
| `BAAAA-AAAA-AAAA-AAAA` | W0 = `0x100000` |
| `ABAAA-AAAA-AAAA-AAAA` | W0 = `0x8000` |
| `AAAAA-BAAA-AAAA-AAAA` | W1 = `0x8000` |
| `AAAAA-AAAA-BAAA-AAAA` | W2 = `0x8000` |
| `AAAAA-AAAA-AAAA-AAAB` | W3 = `1` |

Le premier caractère d'un groupe est donc le poids fort. Groupe 0 = 5 caractères = 25 bits (W0). Groupes 1..3 = 4 caractères = 20 bits (W1, W2, W3). `A` vaut 0, donc `AAAAA-AAAA-AAAA-AAAA` décode en zéros et atteint quand même `validate`.

### Les cinq comparaisons

`validate` est le driver `sub_140049050` plus la primitive `sub_1400C9FE0` (`cmp dword [rdx], 0x21`). La table de sauts **sur disque** (`0x14013ADE0`) pointe au milieu des instructions : les cibles réelles sont le registre au `jmp rax` vivant (`0x1400CA000`). Cinq handlers comparent, puis appellent l'enregistreur `sub_140048F90(ctx, sete, index)`.

CHK0, handler `0x1400CA400`, index 0. `rax` est masqué puis comparé à W0 :

```asm
mov  rax, [r9+0x38]          ; Ctx+0x38
xor  rax, 0x1ffffff
and  rax, [rdx]              ; slot dérivé de uhash
cmp  rax, [r9+0x8]           ; W0
sete dl
```

CHK1, `0x1400CA3A0`, index 1. `0x14012A730` est `__popcountdi2` :

```asm
mov  rcx, [r9+0x10]          ; W1
call 0x14012a730             ; popcount → edx
mov  eax, [r9+0x38]
xor  eax, 0xa                ; attendu
cmp  eax, edx
```

CHK2, `0x1400CA330`, index 2. Division non signée, reste contre `Ctx+0x38 ^ 3` :

```asm
xor  edx, edx
mov  rcx, [r9+0x38]
mov  rax, [r9+0x10]          ; W1
mov  r8, rcx
xor  rcx, 3                  ; reste attendu
xor  r8, 7                   ; diviseur
div  r8                      ; reste dans rdx
cmp  rdx, rcx
```

CHK3 (`0x1400CA250`, index 3) et CHK4 (`0x1400CA068`, index 4) ont la même forme que CHK0, avec le masque `0xfffff` et la comparaison à W2 puis W3.

Avec `Ctx+0x38 == 0` cela se lit :

- W0 = bits bas 25 du slot uhash, après deux xorshift et un mul
- `popcount(W1) == 10` et `W1 % 7 == 3`
- W2, W3 = bits bas 20 de deux slots mélangés avec W0/W1

Les handlers qui nourrissent ces slots (toujours `Ctx+0x38 == 0`) :

| Site | Effet sur le slot |
|---|---|
| `0x1400CA478` puis `0x1400CA430` | xorshift droit de 0x1D, puis de 0x20, sur le slot de W0 |
| `0x1400CA458` | `slot *= 0x85ebca6b` (le `xor Ctx+0x38` disparaît) |
| `0x1400CA2A8` | `slot += 0x5f3a1` |
| `0x1400CA2C8` / `0x1400CA1F0` | `slot ^= W0` |
| `0x1400CA1D0` | `slot += W1` |
| `0x1400CA2F0` | produit `(0x9e3779b1 * W1)` relu plus loin |
| `0x1400CA0C0` | `slot *= 0x2545f491` |
| `0x1400CA098` | xorshift droit de 0x11 |
| `0x1400CA100` | `slot = mix(slot, 0xb)` via `sub_1400A95D0` |

`sub_140002940`, passé en callback à ce `mix`, est `xor eax, eax; ret`. Le mélange est le driver de 130 Ko, pas le callback.

### uhash et ucrc

`uhash` (opcode 10) appelle le driver `sub_1400EB250`. Sa primitive `sub_1400CA520` fait, pour chaque octet du username :

```asm
movzx edx, byte [rbx]
xor  rax, rdx
imul rax, r12                 ; r12 = 0x100000001b3
; puis mix(rax, 0x11) → r13
shr  rax, 9
xor  rax, r13
```

`ucrc` (opcode 11, driver `sub_1400CA860`, primitive `sub_140002140`) est un CRC-32 réfléchi, polynôme `0xEDB88320`, sans XOR final dans la primitive :

```asm
xor  edx, eax                 ; edx = état, eax = octet
; 8 fois : bit0 ? (shr ^ 0xedb88320) : shr
```

L'init et l'enrobage (longueur, mélange du driver) ne sont pas un `crc32(username)` à graine fixe : l'inverse du CRC de `petik` (`0x150ba164`) ne retombe pas sur la graine de la chaîne vide. Le solveur rejoue donc les trois drivers (`sub_1400EB250`, `sub_1400CA860`, `sub_1400A95D0`) sous Unicorn. `chrono::now` est renvoyé constant : le témoin de temps (`sub_140001670`) compare le delta à `-999` et renvoie 1 dans les deux cas, et le digest colle à la trace live.

Vecteur du mélangeur, W0 = W1 = 0, username `petik` : `mix(0x150ba164, 0xb) = 0xa85d0b2000`.

### Assemblage pour `petik`

| Étape | Valeur |
|---|---|
| uhash | `0x57634e89518bf5ca` |
| ucrc | `0x150ba164` |
| W0 = low25(xorshift_0x20(xorshift_0x1d(uhash) * 0x85ebca6b)) | `0x4a07eb` → `EWB9M` |
| W1 = plus petit 20 bits avec popcount 10 et `n % 7 == 3` | `0xb7f` → `AC59` |
| W2 = low20(xorshift_0x14(((0x9e3779b1 * W1) ^ W0) + 0x5f3a1)) | `0xa5c3a` → `WZB4` |
| entrée mix = `(ucrc ^ W0) + W1`, param `0xb` | |
| W3 = low20(xorshift_0x11((mix ^ W2) * 0x2545f491)) | `0x12ed4` → `CMYW` |

Serial : `EWB9M-AC59-WZB4-CMYW`.

Piège : lire l'opcode dans `*r8` à l'entrée des primitives donne n'importe quoi (`4264520736` sur une trace). L'opcode est `dword [rdx]`, et seulement **avant** que le prologue l'ait consommé. À `0x14010BC7C`, `rcx` est déjà écrasé : le pointeur de registres sauvé est `r10`.

## Prédicat

```python
MASK = 0xFFFFFFFFFFFFFFFF

def xs(x, sh):
    x &= MASK
    return ((x >> sh) ^ x) & MASK

def keygen(uhash, ucrc, mix):
    w0 = xs(xs(uhash, 0x1D) * 0x85EBCA6B, 0x20) & 0x1FFFFFF
    w1 = min(n for n in range(1 << 20) if n.bit_count() == 10 and n % 7 == 3)
    w2 = xs(((0x9E3779B1 * w1) ^ w0) + 0x5F3A1, 0x14) & 0xFFFFF
    mixed = mix(((ucrc ^ w0) + w1) & MASK, 0xB)
    w3 = xs((mixed ^ w2) * 0x2545F491, 0x11) & 0xFFFFF
    return w0, w1, w2, w3
```

Encodage, poids fort en tête, alphabet `ABCDEFGHJKLMNPQRSTUVWXYZ23456789` :

```text
char[i] = alphabet[(value >> (5 * (nchars - 1 - i))) & 31]
groupes : 5, 4, 4, 4 caractères, séparés par '-'
```

## Debug GDB (pas à pas)

GDB sert à lire les mots décodés et les cinq `cmp`. Le binaire tourne sous Wine ; `winedbg --gdb` ne reçoit pas le stdin du programme si on le lance depuis le tty du debugger. Recette qui marche : spin à l'entrée sur une **copie**, stdin redirigé, attach sur le PID Wine.

```bash
# copie uniquement — original/ reste intact
cp original/Challenger_2.exe /tmp/vsec2/
# offset fichier de l'EP : 0x400 + (0x1460 - 0x1000) = 0x860
# octets d'origine : 48 8b 05 19 16 14 00
printf '\xeb\xfe' | dd of=/tmp/vsec2/Challenger_2.exe bs=1 seek=$((0x860)) conv=notrunc
printf 'petik\nAAAAA-AAAA-AAAA-AAAA\n' > /tmp/vsec2/in.txt
WINEDEBUG=-all wine /tmp/vsec2/Challenger_2.exe < /tmp/vsec2/in.txt &
# PID Wine (pas le PID Linux — sinon erreur 87), champ info proc, zéros de tête retirés
winedbg --command 'info proc'
winedbg --gdb 0x<pid>
```

Sous GDB, image de préférence tenue (`0x140001460`) :

```text
set {char[7]}0x140001460 = {0x48,0x8b,0x05,0x19,0x16,0x14,0x00}
break *0x14010bc50          # opcode = *(unsigned int*)$rdx  (à l'entrée)
break *0x1400ca000          # jmp de validate : $rax = handler
break *0x1400ca419          # CHK0
break *0x1400ca3c8          # CHK1  eax = attendu, edx = popcount
break *0x1400ca351          # CHK2  rdx = reste, rcx = attendu
break *0x1400ca26f          # CHK3
break *0x1400ca087          # CHK4
```

Pour `petik`, uhash `0x57634e89518bf5ca` et ucrc `0x150ba164` sont stables d'un run à l'autre. Un serial construit avec le W2 du cas « mots à zéro » (`0x5f3a1`) passe CHK0..CHK2 et rate CHK3 : l'attendu devient `0xa5c3a` dès que W0/W1 sont les bons. Même phénomène pour CHK4 (`0x856e6` tant que W2 n'est pas mêlé, `0x12ed4` après).

## Vérification

Wine, binaire d'origine, DLLs MinGW à côté d'une copie (`libstdc++-6`, `libgcc_s_seh-1`, `libwinpthread-1`) :

```text
petik / EWB9M-AC59-WZB4-CMYW
=== VSEC Challenger #2 ===
Username: Serial  : [+] ACCESS GRANTED. Capture the flag:
CMO{K3YG3-N1US-R3V3-RS3D}

alice / NFTNS-AC59-FHR2-N4R9
[+] ACCESS GRANTED … même flag

petik / AAAAA-AAAA-AAAA-AAAA
[-] ACCESS DENIED.

ab / EWB9M-AC59-WZB4-CMYW
[-] ACCESS DENIED.     (longueur < 4)
```

Les deux GRANTED sortent 0, les deux DENIED aussi : le code de sortie ne porte pas le résultat.

## Notes

- Les tables de sauts statiques des primitives sont décalées (cibles au milieu d'une instruction). Seul le `jmp rax` vivant donne le handler.
- `sub_140002940` n'est pas le mélange de W3. C'est un stub ; `sub_1400A95D0` fait le travail.
- W1 n'est pas unique. `0xb7f` est le plus petit qui passe. Le groupe 2 du serial (`AC59`) est donc le même pour tous les usernames tant que `Ctx+0x38` reste 0.
- Le flag ne dépend pas du username. `CMO{K3YG3-N1US-R3V3-RS3D}` se lit « KEYGENIUS REVERSED ».
- x64dbg / x32dbg : handshake MCP en échec au début de la session, pas de trace live de ce côté.
