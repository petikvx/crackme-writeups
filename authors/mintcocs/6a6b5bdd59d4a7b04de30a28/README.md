# mintcocs's learning_vm

| | |
|---|---|
| **ID** | [`6a6b5bdd59d4a7b04de30a28`](https://crackmes.one/crackme/6a6b5bdd59d4a7b04de30a28) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | mintcocs |
| **Plateforme** | macOS, Mach-O **arm64**, Objective-C (mini-VM) |
| **SHA-256** (`original/download.bin`, un ZIP) | `8e4809f8abcae4a86b3e1c6e574bfb30a21a1474171ae813e114edf9f874fa75` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mot de passe `crackmes.one`), contient `vm` — non modifié |
| `analysis/vm` | `vm` extrait (Mach-O arm64, sha256 `15bcb2c0…05bb`) |
| `analysis/vm.arm64.txt` | désassemblage capstone de `__text` |
| `tools/learning-vm-solve.py` | solveur + émulateur du bytecode (`--check`) |

## Réponse

Pas de user : un seul code de 21 caractères.

> **`@m@z1n9!_y0u_g07_7h15`**

```bash
python3 tools/learning-vm-solve.py          # code : @m@z1n9!_y0u_g07_7h15
python3 tools/learning-vm-solve.py -q --check
```

## Premier regard

- `original/download.bin` commence par `PK\x03\x04` : c'est un ZIP chiffré (pas un exécutable). `unzip -P crackmes.one` / `zipfile` → un seul fichier `vm` (51 648 octets).
- `vm` : magic `0xfeedfacf`, cputype `0x100000c` = **arm64 Mach-O**. Impossible à lancer sur cette machine Linux (pas de macOS, pas de qemu-user pour Mach-O) → analyse **statique** uniquement, voir « Vérification ».
- Strings utiles : `give me the code: `, `%c`, `Unknown opcode: %02X`, classe ObjC `VM` avec ivars `_registers`, `_memory`, `_pc`, `_flags`, `_program` et méthodes `fetchByte`, `fetchWord`, `updateZeroFlagWithValue:`, `run`.

## Flow

`main` (`0x100000978`) : crée un `NSData` de **0x64 octets** depuis `__const` (`0x100001de4`, offset fichier `0x1de4`), `-[VM initWithProgram:]` copie ce blob dans `memory[0x100]` (initWithProgram @ `0x100000a40`, registres `r0..r3` à `+8`, mémoire à `+0xc`, `pc` u16 à `+0x10c`, flags à `+0x10e`), affiche `give me the code: ` puis `-[VM run]`.

## Comment on trouve

**Ancrage.** Désassemblage avec capstone (`CS_ARCH_ARM64`) de `__text` (`0x978`, taille `0x13b0`) → `analysis/vm.arm64.txt`. `-[VM run]` @ `0x100000c3c` : `fetchByte` (`0x100000b50` : `mem[pc++]`), `fetchWord` (`0x100000b84` : little-endian), puis un `br` sur une **jump table** de 256 `int32` relatifs à `0x100000ca8`, stockée en `0x100001e48`. En résolvant la table on obtient les handlers :

| Opcode | Handler | Sémantique (lue dans l'asm) |
|---|---|---|
| `01 r imm8` | `0x100000cbc` | `r = imm8` (flag Z mis à jour) |
| `12 r` | `0x1000010bc` | `r++` |
| `30 a b` | `0x1000015f4` | `Z = (ra - rb) & 0xff == 0` |
| `40 w` / `41 w` / `42 w` | `0x10000169c`… | `JMP` / `JZ` / `JNZ` (test `flags & 1`) |
| `60 r addr16 n` | `0x1000017ec` | `fgets` ; copie ≤ n octets (stop sur `\n`/NUL) en `mem[addr+i]`, `r` = longueur |
| `61 a b` | `0x100001968` | `x = ra ^ rb ; ra = rol8(x,1)` (`eor`, puis `(x<<1) \| (x>>7)`) |
| `64 d base16 i` | `0x100001ad0` | `rd = mem[base + ri]` |
| `65 addr16` | `0x100001b98` | affiche la chaîne C à `mem[addr]` (`putchar`) |
| `ff` | `0x1000017dc` | halt |

(Les autres — ADD/SUB/XOR/AND/OR/NOT/ROL/ROR, LOAD/STORE — existent mais ne servent pas ici.)

**Le bytecode.** On dumpe les 100 octets (`__const`) :

```
00: 40 33 00                      JMP 0x0033
03: 80 db 37 9a 57 72 96 6f 60 32 04 e2 7b 38 10 4e 22 2a 84 6b bc   <- T[0..20], 21 octets
18: "OK\0"   1b: "NO\0"
33: 60 00 1e 00 15                READ r0 -> mem[0x1e], max 21
38: 01 00 00 / 01 01 00           r0 = 0 (acc) ; r1 = 0 (i)
3e: 64 02 1e 00 01                r2 = mem[0x1e + r1]       (caractère saisi)
43: 61 00 02                      r0 = rol8(r0 ^ r2, 1)
46: 64 03 03 00 01                r3 = mem[0x03 + r1]       (T[i])
4b: 30 00 03 ; 42 60 00           CMP r0,r3 ; JNZ 0x60 (-> "NO")
51: 12 01 ; 01 02 15 ; 30 01 02 ; 42 3e 00   i++ ; boucle tant que i != 21
5d: 65 18 00 ff                   "OK"       60: 65 1b 00 ff   "NO"
```

**Prédicat.** `acc = 0 ; pour i in 0..20 : acc = rol8(acc ^ code[i], 1) ; exiger acc == T[i]`. Piège : le buffer de saisie `0x1e..0x32` finit pile avant le code (`0x33`) — 21 caractères exactement.

**Inversion.** `acc_i = T[i]` donc `code[i] = ror8(T[i],1) ^ T[i-1]` (avec `T[-1] = 0`). Ex. `i=0` : `ror8(0x80,1)=0x40`, `^0` = `0x40` = `@` ; `i=1` : `ror8(0xdb,1)=0xed`, `^0x80` = `0x6d` = `m` ; `i=2` : `ror8(0x37,1)=0x9b`, `^0xdb` = `0x40` = `@`… → `@m@z1n9!_y0u_g07_7h15` (leetspeak « amazing! you got this »).

## Vérification

- **Pas d'exécution native du Mach-O** (arm64 macOS indisponible ici) : aucune preuve live contre le binaire. À la place, `--check` charge le blob **directement depuis `vm`** (extrait du ZIP d'origine), et l'exécute dans un émulateur Python des opcodes ci-dessus :

```text
$ python3 tools/learning-vm-solve.py --check
code : @m@z1n9!_y0u_g07_7h15
emul OK -> 'OK' ; emul 'A'*21 -> 'NO'
```

- Le fait que le résultat soit une phrase lisible en leetspeak est un fort indice de justesse. Un test réel sur macOS reste à faire par le lecteur.

## Notes

- Le ZIP `download.bin` n'a pas été décompressé par le script de scaffold ; `vm` est extrait sous `analysis/`.
- Pas de GDB/x64dbg/IDA MCP utilisés (statique + capstone).
