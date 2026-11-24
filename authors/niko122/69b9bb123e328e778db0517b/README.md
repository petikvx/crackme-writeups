# niko122's niko's vm final!! :)

| | |
|---|---|
| **ID** | [`69b9bb123e328e778db0517b`](https://crackmes.one/crackme/69b9bb123e328e778db0517b) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | niko122 |
| **Plateforme** | Windows PE64 (MSVC 2026, console), mini-VM chiffrée + anti-debug |
| **SHA-256** | `6d7b03835fc87c47280d58fa0a6775ac32554e79253fbafbb540b21f2cac29e0` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/vm-final.exe` | binaire d'origine (non modifié) |
| `tools/niko122-solve.py` | solveur (`-q`, `--check`) |
| `tools/trace-vm.gdb` | script gdb : trace du dispatch et des octets fetchés par la VM |
| `analysis/ghidra-decomp-all.c` | décompilation Ghidra headless de tout le binaire |
| `analysis/gdb-trace-excerpt.txt` | extrait de la trace gdb (opcode CHECK) |

## Réponse

Pas de username : le programme demande seulement un mot de passe (84 caractères).

```text
HELLO! - HELLO! - I HOPE YOU ENJOY THIS CRACK ME IT TOOK ME A WHILE - !@#$%^&*()_+-=
```

```bash
python3 tools/niko122-solve.py -q
python3 tools/niko122-solve.py --check original/vm-final.exe   # xvfb-run + wine
```

## Premier regard

- `file` : PE32+ console x86-64, 7 sections dont une section atypique `.vmgrd` (code de la VM : 0x14000d000, 0x7c9 octets).
- Imports quasi vides (pas de `ReadFile` / `WriteFile`) : les API sont résolues à la main (parcours du PEB, hash djb2 `0x1505`, cf. `FUN_140001a00`, `FUN_140006f00`).
- `strings` ne montre ni « Wrong » ni « password » : tous les messages sont chiffrés dans le bytecode.
- Sous Wine : `password: ` puis `Wrong` pour une mauvaise entrée, `Correct` pour la bonne.

## Flow

1. `main` (`FUN_1400067f0`, appelée depuis le CRT en `0x14000baf3`) alloue un contexte VM de 0x4d0 octets et appelle un générateur de programme (`FUN_1400068b0`, appelé via un pointeur XOR-ofusqué `FUN_14000d730`).
2. Le générateur émet dans un `vector<byte>` (ctx+0x200) un **bytecode** : ops = `ctx[n]` où `n` est l'index du handler (la table opcode→handler est mélangée à chaque run, d'où `ctx[0x17]`, `ctx[0x1e]`…).
3. Le bytecode est chiffré (`FUN_1400061e0`, flux ChaCha-like), posé entre deux pages `PAGE_NOACCESS`/`GUARD` (handler VEH `FUN_1400039d0` qui hache l'adresse fautive → chaîne d'intégrité).
4. L'interpréteur `FUN_140003ea0` déchiffre chaque octet à la volée (`FUN_140004850` = fetch), traduit l'opcode via la table ctx+0x3a0 puis appelle un des 32 handlers de la table `0x14000e320`.
5. Deux programmes se suivent : (a) PRINT du prompt, (b) lecture de l'entrée, **CHECK**, CMP, saut, PRINT `Wrong`/`Correct`.

## Comment on trouve

**Ancrage.** Pas de `idat` sur la machine : Ghidra 12.2 headless (JDK 25) avec un petit `GhidraScript` qui décompile toutes les fonctions (`analysis/ghidra-decomp-all.c`). On part de `main`, puis de la boucle d'interprétation `FUN_140003ea0` (appel indirect `call [rdx+rax*8]` en `0x140004731`).

**Jeu d'instructions** (table `0x14000e320`, index = numéro de handler) — registres r0..r7 en ctx+0, r≥8 = registre scratch global :

| # | Handler | Rôle |
|---|---|---|
| 0 | `4d30` | `MOVI reg, imm32` |
| 1-3 / 4-5 | `4e10 4e70 4ed0` / `4f30 4fb0` | ADD, SUB, MUL / DIV, DIVMOD |
| 6-11 | `5030 5090 50f0 5150 5180 51e0` | XOR, AND, OR, NOT, SHL, SHR |
| 12 | `4db0` | MOV |
| 13 | `5240` | CMP → flag (ctx+0x49) |
| 14-16 | `52a0 52e0 5320` | JMP, JE, JNE (adresse u16) |
| 17-18, 20 | `5360 53b0 5410` | PUSH, POP, CALL |
| 22 | `54c0` | affiche un entier |
| 23 | `55c0` | **PRINT chiffré** (clé u32, longueur u16, données) |
| 29 | `5b40` | READ (ReadFile 1 octet à la fois jusqu'à `\n`) |
| 30 | `5da0` | **CHECK** : compare le tampon d'entrée à un secret chiffré inline |
| autres | `5870 5890 5a10 54b0 5b00 5b20` | memset/memcpy/NOP |

**Le CHECK (handler 30, `0x140005da0`).** Opérandes lus avec `FUN_140004850` : `dst` (1 octet), `offset` entrée (u16), `key` (u32), `len` (u16), puis `len` octets de ciphertext. Pseudo-code commenté :

```c
key  = u9<<24 | u8<<16 | u7<<8 | u6;
u22  = (key ^ 0x271f43d9) * 0x9E3779B9 ^ 0xcafebabe;     // -0x61c88647
u1   = (key ^ 0x064d7cf8) + u22;
K2   = ((key >> 16) >> 3 | key << 13) ^ 0x13371337;
for (i = 0; i < len; i++) {
    ks = chacha_like(i ^ u1 ^ 0x99f0b3d4, K2, u22, u1);   // 3 passes + 1 partielle de QR (rot 16/12/8/7)
    mismatch |= input[i] ^ ks_byte(i & 3) ^ ct[i];
}
if (strlen(input) != len) mismatch |= 0xff;
dst = (mismatch != 0);
```

Donc `input[i] = ct[i] ^ keystream(key, i)` : le mot de passe se **calcule**, sans avoir à le brute-forcer. Le compte de passes du ChaCha-like est le piège : on compte les rotations `<<0x10 / <<0xc / <<8 / <<7` dans le décompilé (3 passes complètes + `16,12,8` puis XOR final), pas 4 passes complètes.

**Récupération des constantes.** Elles sont émises en clair (avant chiffrement du flux) par `FUN_1400068b0` :
- ciphertext = 21 dwords posés aux `0x140006b15…0x140006ba1` (`0x88199109`, `0x89bc333f`, …, `0x9173bb49`) = 84 octets = `0x54` ;
- `key = 0xd8e0bc14` (dword `[rbp+0x1f]`), longueur `0x54`.

**Validation du port du keystream.** Le même algorithme est utilisé par le PRINT (handler 23, clé `0x3d`, 11 octets `86 0d c8 53 31 be ff e2 02 45 11`) : déchiffré avec `ks()` on obtient `password: \0`, ce qui prouve que le keystream est bon (première version erronée : 4 passes au lieu de 3 → bouillie d'octets).

**Assemblage.** `pw[i] = ct[i] ^ ks(0xd8e0bc14, i)` pour `i = 0..83` → la phrase ci-dessus (84 caractères).

## Debug GDB (pas à pas)

Utilisé pour confirmer le flux d'exécution sans casser l'anti-debug (la VM appelle `NtQueryInformationProcess`, `GetThreadContext`, `NtSystemDebugControl`, QPC timing…) :

```bash
mkfifo in.fifo; (sleep 300 > in.fifo &)                  # garde le fifo ouvert
xvfb-run -a wine vm-final.exe < in.fifo > run.out &      # affiche "password: " puis attend
PID=$(pgrep -f 'Z:.*vm-final.exe' | head -1)
gdb -q -p $PID -batch -x tools/trace-vm.gdb > gdb.out &  # attache AVANT d'envoyer l'entrée
echo petik > in.fifo
```

- Breakpoints **matériels** (`hbreak`, pas d'octet `int3` → l'auto-intégrité du code ne bouge pas) :
  - `*0x140004731` = `call [rdx+rax*8]` du dispatch : `rax` = n° de handler ;
  - `*0x140004a62` = `ret` du fetch `FUN_140004850` : `al` = octet d'opérande déchiffré.
- Trace observée (extrait `analysis/gdb-trace-excerpt.txt`) : `idx=0 (MOVI r3,0)`, `idx=0 (MOVI r6,0)`, NOP×2 (`idx=28`, `31`), puis **`idx=30`** avec les octets `03 | 00 00 | 14 bc e0 d8 | 54 00 | 09 91 19 88 3f 33 bc 89 …` = dst `r3`, offset 0, clé `0xd8e0bc14`, longueur 84, ciphertext. Ensuite `idx=13` (CMP), `idx=16` (JNE), `idx=23` (PRINT « Wrong »), `idx=27`.
- Pièges : attacher gdb à un process Wine = attacher le process Linux `Z:\…\vm-final.exe` (pas `wine`), les HW breakpoints évitent la détection des `int3` ; `pkill -f vm-final` tue aussi le shell si la ligne de commande contient « vm-final ».

## Vérification

```text
$ python3 tools/niko122-solve.py --check original/vm-final.exe
password : HELLO! - HELLO! - I HOPE YOU ENJOY THIS CRACK ME IT TOOK ME A WHILE - !@#$%^&*()_+-=
OK  -> 'password: Correct'
KO  -> 'password: Wrong'          # entrée "petik"
```

`original/vm-final.exe` jamais modifié (SHA-256 identique).

## Notes

- Le crackme est surtout de l'obfuscation (VM, opcodes mélangés par run, page-guard, anti-debug) autour d'un simple « déchiffre le secret avec une clé en clair dans le bytecode ». La réponse ne dépend pas de la table opcode→handler aléatoire.
- Pas d'username : le `petik` d'exemple sert seulement de cas KO.
