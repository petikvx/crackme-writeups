# whyyourapedme's study get PASSWORD

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ab6d7680f207ab92d0ae018) · id `6ab6d7680f207ab92d0ae018`

PE64 GUI, MSVC 19.50 (Visual Studio 2026), image base `0x140000000`, **aucune IAT**.
`.text` est chiffré ; le stub d'entrée le déchiffre, résout `kernel32` via le PEB, lit un password, puis le passe à une petite VM.
Famille : [`../README.md`](../README.md).

| Fichier | Rôle |
|---|---|
| [`original/find_me.exe`](original/find_me.exe) | binaire d'origine (`.text` chiffré) |
| [`analysis/find_me.dec.exe`](analysis/find_me.dec.exe) | même image, `.text` déchiffré (objdump) |
| [`tools/find-me-solve.py`](tools/find-me-solve.py) | password / `--check` (prédicat + Wine) |

## Réponse

| | |
|---|---|
| **Password** | `rtasz` |
| OK | `password: OK` |
| même longueur, mauvais | `password: NOP=` |
| plus court | `password: NOP<` |
| plus long | `password: NOP>` |

```bash
python3 tools/find-me-solve.py -q
# rtasz
printf 'rtasz\n' | wine original/find_me.exe
python3 tools/find-me-solve.py --check
```

---

## 1. Premier regard

```text
find_me.exe: PE32+ GUI, x86-64, 3 sections, 8192 octets
sha256  c811f6b8d13183cae12ff19ed0e3a8c2c85b3a8d3906e6bdd924e9bcfb4e9150
linker  Microsoft 14.50.35227, MSVC 19.50, subsystem GUI
entry   RVA 0x2390
IAT     vide (export / import / reloc absents)
```

```bash
file original/find_me.exe
objdump -p original/find_me.exe | head
strings -n 5 original/find_me.exe | head
```

`strings` ne sort que des noms de sections (`.text$mn`, `.rdata$voltmd`, …) et des fragments d'opcodes. Pas de `password`, pas de `OK`. La page du site décrit quand même les quatre réponses : `OK`, `NOP<`, `NOP=`, `NOP>`.

`objdump -d` sur l'original est illisible partout sauf les **13 octets** du stub, à `0x140002390`.

---

## 2. Flow

Le stub (juste après la zone chiffrée) :

1. `gs:[0x60]` → PEB, image base à `PEB+0x10`.
2. Clé 32 bits = `TimeDateStamp XOR ROL(SizeOfImage, 13)`.
3. XOR tournant de `0x138b` octets à partir de RVA `0x1000` (`ror` de la clé de 8 bits à chaque octet).
4. `jmp` image_base + `0x1d80`.

`0x140001d80` (code clair) :

1. Parcourt `PEB.Ldr.InMemoryOrderModuleList` et FNV-1a 32 (offset `0x811c9dc5`, prime `0x01000193`, ASCII forcé en minuscules) sur le nom UTF-16. Cherche `kernel32.dll` → `0xa3e6f6c3`.
2. Même FNV sur les exports : `AttachConsole`, `AllocConsole`, `GetStdHandle`, `GetFileType`, `WriteFile`, `ReadFile`, `ExitProcess`.
3. `GetStdHandle(-10)` / `GetStdHandle(-11)`. Si `GetFileType(stdout) != 3` (`FILE_TYPE_PIPE`), `AttachConsole(-1)` puis `AllocConsole` si besoin, et on relit les handles.
4. Décode `password: ` sur la pile et `WriteFile`. `ReadFile` jusqu'à `0x78` octets, coupe sur `\r` ou `\n`.
5. Bits d'anti-debug dans `ebx` (voir notes).
6. Appel de la VM `0x140001000` (`ecx` = flags, `rdx` = buffer, `r8` = 0).
7. `al != 0` → message `OK`. Sinon la longueur du buffer choisit `NOP<` (**< 5**), `NOP=` (**== 5**), `NOP>` (**> 5**).
8. `WriteFile` du message, `ExitProcess(0)`.

Le password fait donc **5 octets** : un essai de longueur 5 qui échoue affiche `NOP=` (« same length, wrong characters » sur la page).

---

## 3. Comment on trouve le password

### 3.1 Déchiffrer `.text`

Ancrage : `objdump -d -M intel --start-address=0x140002390 original/find_me.exe`.

```nasm
mov  rax, gs:[0x60]
mov  rbx, [rax+0x10]          ; ImageBase
mov  eax, [rbx+0x3c]
lea  rdx, [rbx+rax]           ; PE
mov  esi, [rdx+8]             ; TimeDateStamp
mov  eax, [rdx+0x50]          ; SizeOfImage
rol  eax, 0xd
xor  esi, eax
lea  rdi, [rbx+0x1000]
mov  ecx, 0x138b
xor  [rdi], sil
ror  esi, 8
inc  rdi
dec  ecx
jnz  ...
lea  rax, [rbx+0x1d80]
jmp  rax
```

Sur ce fichier : `TimeDateStamp = 0x174f5631`, `SizeOfImage = 0x5000`, `ROL32(0x5000, 13) = 0x0a000000`, clé `0x1d4f5631`.

```python
key = 0x174F5631 ^ ((0x5000 << 13) | (0x5000 >> 19)) & 0xFFFFFFFF
# 0x1d4f5631, puis ror 8 à chaque octet, 0x138b octets dès RVA 0x1000
```

Le résultat est [`analysis/find_me.dec.exe`](analysis/find_me.dec.exe). Tout le reverse qui suit est sur cette image.

### 3.2 Les quatre messages ne sont pas des C-strings

À `0x140001f41` (prompt) puis `0x1400021b0` / `0x140002205` / `0x140002262` / `0x1400022bd` (réponses), le compilateur pose un blob et une clé dword, et boucle `n` fois :

```text
out[i] = enc[i] XOR key_byte(i AND 3) XOR ((i >> 1) + i*0x41)
```

| Blob (LE) | clé | n | clair |
|---|---|---|---|
| `85 c5 97 dd 84 cd 9c c4 c3 88 e8` | `0x6a67e5f5` | 11 | `password: \0` |
| `03 96 de 3a 4a` | `0xf4509c4c` | 5 | `OK\r\n\0` |
| `c9 18 da ae 8c 5b 80` | `0x56091687` | 7 | `NOP<\r\n\0` |
| `5f 0d 69 eb 1a 4e 33` | `0x12ba0311` | 7 | `NOP=\r\n\0` |
| `90 86 12 4a d5 c5 48` | `0xb0c188de` | 7 | `NOP>\r\n\0` |

Le choix `NOP<` / `NOP=` / `NOP>` est un `cmp edx, 5` sur le `strlen` de l'entrée, **après** le retour de la VM. Succès (`al != 0`) ignore la longueur et affiche `OK`.

### 3.3 La VM

`0x140001000` zéro une grande zone pile, copie au plus 15 octets de l'entrée vers `scratch+0x300` (le buffer d'entrée est **dans** le scratch : `rbp = rsp+0x100`, copie à `rbp+0x200`), et pose 16 octets de clé à `scratch+0x80`. Sans debugger ce sont les constantes :

```text
d8 d9 ac f7 15 38 26 c1 af f9 2c f9 d0 de 96 8d
```

Les 16 premiers octets **bruts** de `.rdata` (RVA `0x3000`) sont copiés à `scratch+0x100`. Le bytecode est ce même `.rdata`, mais chaque octet est décodé à la volée :

```text
dec(i) = raw[i] XOR 0x96 XOR (0xae - i*0x51)   # mod 256
```

L'opcode est le mot `dec(ip) | dec(ip+1)<<8`. Le fetch avance déjà `ip` de 2 avant le `switch` : un opcode sans opérande (`0x15b3`, vu deux fois dans le flux) est un **nop**, pas une boucle infinie.

Mémoire VM : 256 octets (`rbp+0x300`). Scratch : index 16 bits depuis `rsp`.

Le programme utile tient en `0x325` octets décodés. Linéarisé :

```text
state[0..15] = 41 5f 36 f8 3f 67 91 8b 0f ab 0e 02 c6 b2 da 7e
répéter 0x15 fois:                 # mem[0x13]
    répéter 0x15 fois:             # mem[0x14], reset à chaque tour externe
        state[i] ^= scratch[0x300+i]   # password, pad 0
        state[i] ^= scratch[0x100+i]   # header brut
        state[i] += state[i+1]         # i = 0..14, puis state[15] += state[0] déjà mis à jour
        state[i] = rol8(state[i], state[(i+5) mod 16] & 7)
        state[i] ^= state[(i+9) mod 16] + (0x38*i)
acc = 0
acc |= state[i] XOR scratch[0x80+i]   pour i = 0..15
si acc == 0: scratch[0] = 1, halt     # al = 1 → OK
sinon:       scratch[0] = 0, halt     # al = 0 → NOP*
```

`rol` et le dernier `xor` lisent la case source **déjà mise à jour** quand son indice est plus petit que `i` (le sens du parcours). `0x15 × 0x15 = 441` tours. Les `dec/jnz` sont aux RVA décodés `0x22c` (interne → `0x48`) et `0x231` (externe → `0x44`, qui recharge le compteur interne).

Les rotations dépendent des données : on n'inverse pas le password par un XOR final. Comme seuls 5 octets sont libres (le reste du buffer est 0) et que le charset tenu par l'auteur est des lettres, un brute `a-z` (`26^5`) suffit. En C, 8 threads, environ 10 s : **`rtasz`**.

État initial et premier XOR pour `rtasz` (`72 74 61 73 7a`), header `H`, `X = password_pad XOR H` :

| | octets |
|---|---|
| `C` | `41 5f 36 f8 3f 67 91 8b 0f ab 0e 02 c6 b2 da 7e` |
| `H` | `70 d4 9a 6c b4 90 5f be f8 5c 10 93 3c 18 d5 81` |
| `X` | `02 a0 fb 1f ce 90 5f be f8 5c 10 93 3c 18 d5 81` |
| `C XOR X` | `43 ff cd e7 f1 f7 ce 35 f7 f7 1e 91 fa aa 0f ff` |
| cible `K` | `d8 d9 ac f7 15 38 26 c1 af f9 2c f9 d0 de 96 8d` |

Après 441 tours, `state == K` seulement pour `rtasz` dans `a-z` de longueur 5. `aaaaa` finit sur `9d 9f 04 b9 …` et la VM renvoie 0.

---

## 4. Prédicat

```python
C = bytes.fromhex("415f36f83f67918b0fab0e02c6b2da7e")
H = bytes.fromhex("70d49a6cb4905fbef85c10933c18d581")
K = bytes.fromhex("d8d9acf7153826c1aff92cf9d0de968d")

def rol(v, n):
    n &= 7
    return v if n == 0 else ((v << n) | (v >> (8 - n))) & 0xFF

def accepts(pw: bytes) -> bool:
    x = [((pw[i] if i < len(pw) else 0) ^ H[i]) for i in range(16)]
    s = list(C)
    for _ in range(21 * 21):
        s = [(s[i] ^ x[i]) & 0xFF for i in range(16)]
        for i in range(15):
            s[i] = (s[i] + s[i + 1]) & 0xFF
        s[15] = (s[15] + s[0]) & 0xFF
        for i in range(16):
            s[i] = rol(s[i], s[(i + 5) & 15] & 7)
        for i in range(16):
            s[i] ^= (s[(i + 9) & 15] + 0x38 * i) & 0xFF
    return bytes(s) == K
```

`accepts(b"rtasz")` est vrai. Le binaire, lui, ne regarde que les 15 premiers octets copiés, et coupe au premier `\r` / `\n`.

---

## 5. Vérification

Wine, stdout capturé (subsystem GUI, mais `WriteFile` sur le handle console / pipe) :

```text
printf 'rtasz\n'  | wine original/find_me.exe    → password: OK
printf 'aaaaa\n'  | wine original/find_me.exe    → password: NOP=
printf 'ab\n'     | wine original/find_me.exe    → password: NOP<
printf 'rtaszX\n' | wine original/find_me.exe    → password: NOP>
```

Les quatre sortent avec le code 0 (`ExitProcess(0)` même en échec). Le solveur matche la chaîne, pas le code de sortie.

```bash
python3 tools/find-me-solve.py --check
```

---

## 6. Notes

- Pas d'IAT : tout passe par le PEB. Un dump `strings` / `objdump` de l'original ne montre pas le check.
- Les opcodes VM `0x15b3` / `0xbe44` / `0x96ff` retombent sur le fetch **sans** opérande. L'`ip` a déjà été avancé de 2 : ce sont des nops. Les prendre pour des boucles infinies désynchronise le désassemblage.
- Anti-debug, combiné dans `ebx` puis XOR-é dans les 16 octets de cible (les constantes de `K` sont exactement ces masques ; flags nuls ⇒ cible = `K`) :
  - bit 0 : `PEB.BeingDebugged`
  - bit 1 : `PEB.NtGlobalFlag & 0x70`
  - bit 2 : `NtQueryInformationProcess(-1, ProcessDebugPort=7)` renvoie un port non nul (`ntdll.dll` hashé en UTF-16, export `0xddeaabca`)
  - bit 4 : `rdtsc` autour d'une boucle de `0x186a0` (delta nul ou `> 0x5f5e100`)
- Un debugger qui lève un de ces bits change `K`. Le password ci-dessus est celui du processus **non** débogué, celui que Wine exécute.
- `x64dbg` / `x32dbg` n'étaient pas joignables pendant ce reverse. La preuve est le prédicat rejoué et Wine.
