# genass3's Continental

| | |
|---|---|
| **ID** | [`698907e7e2ba6023bfaca9fe`](https://crackmes.one/crackme/698907e7e2ba6023bfaca9fe) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | genass3 |
| **Plateforme** | Windows PE64 console (mingw, strippé) |
| **SHA-256** | `a97a0b18c563bbcdee4184dd5fb391fa6c76d2969ced58da53fc8df0dd8b01a3` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/continental.exe` | binaire d'origine (non modifié) |
| `tools/continental-solve.py` | solveur (`-q`, `--len`, `--check` via Wine) |

## Réponse

**Password : `D100?2ICH`** (9 caractères)

```bash
python3 -I tools/continental-solve.py          # password = D100?2ICH
python3 -I tools/continental-solve.py --check  # lance le vrai exe sous xvfb-run + wine
```

Le prédicat n'est pas injectif : plusieurs mots de passe sont valides (voir plus bas), et même un simple préfixe comme `D` passe.
Pas de login dans ce crackme (donc pas d'exemple `petik`).

## Premier regard

- `file` : PE32+ console x86-64, strippé ; `strings` : `Enter the password: `, `Your privileges are reinstated.` / `Enjoy your stay.`, `Your membership to The Continental has been revoked.`, et des chaînes de debug de VM (`PC: %02X  SP: %d`, `Flags: Z=%d S=%d C=%d O=%d`, `Step limit of %d reached`).
- Ces chaînes de trace indiquent une **mini-VM** ; le texte de succès est dans `.rdata` à `0x140015048` / `0x140015068`.

## Flow

`main` (`0x140012f70`, trouvé via la xref sur `Enter the password`) :

1. `0x140001710` = **callback TLS** (appelé aussi avant `main`) : détections anti-debug (`NtQueryInformationProcess` 7/0x1e, `PEB.BeingDebugged`, timing `QueryPerformanceCounter` > 10 ms, `0xCC` en début de fonction…) qui posent des bits dans une variable TLS ;
2. `0x1400016e0 → 0x140001f10` relit ces flags (déchiffrés par XOR avec une clé TLS) → `esi` ; **flags = 0 si rien n'est détecté** ;
3. lecture du password (`scanf`-like, longueur 1..16 sinon « Critical Error ») ;
4. `0x140002190` renvoie le pointeur de fonction `0x140001f80` = **exécuteur VM** `vm(buf, len, flags)` ;
5. `memcmp(sortie_vm, 0x1400150b8, len) == 0` → « Enjoy your stay », sinon « revoked ».

## Comment on trouve

**Ancrage.** `objdump -d -M intel original/continental.exe`, puis `objdump -s -j .rdata` pour les adresses de chaînes, xref sur `Enter the password` → `main`. (`decc`/MCP `ida` indisponibles dans cette session : tout lu à l'`objdump`.)

**VM (`0x140001f80`).** Mémoire VM de 0x400 octets : le bytecode (0x37 octets, posé par des `movabs` sur la pile puis copié à l'offset 0) et le password recopié à l'offset `0x100`. Registres initiaux : `R0=0x100` (pointeur entrée), `R1=len`, `R2=flags`. Le dispatcher `0x140002790` est un `jmp` via table de 256 `int32` à `0x140015234` ; instructions de 2 à 4 octets, `op a b c`.

Opcodes utilisés (lus dans les handlers) : `01` ADD, `06` MOV, `07` CMP, `0e` MOV imm16, `0f` XOR, `10` XORI, `11` SHL, `12` SHLI, `21` JNZ, `22` LOADB, `25` STOREB, `26` ANDI, `00` HALT.

**Bytecode désassemblé** (offsets VM) :

```text
00: 0e 03 0000     R3 = 0            ; i
04: 0e 07 0001     R7 = 1
08: 01 04 00 03    R4 = R0 + R3      ; &pass[i]
0c: 22 05 04       R5 = mem[R4]      ; c
0f: 10 05 05 aa    R5 ^= 0xAA
13: 0f 05 05 02    R5 ^= R2          ; k (clé, init = flags)
17: 06 06 02       R6 = R2
1a: 26 06 06 0f    R6 &= 0x0F
1e: 11 05 05 06    R5 <<= R6         ; shift (PAS rotation : bits perdus)
22: 25 05 04       mem[R4] = R5 (octet bas)
25: 12 02 02 01    R2 <<= 1
29: 10 02 02 55    R2 ^= 0x55
2d: 01 03 03 07    R3 += R7
31: 07 03 01       CMP R3, R1
34: 21 08          JNZ 08
36: 00             HALT
```

**Prédicat consolidé.** Avec `k₀ = flags = 0`, `kᵢ₊₁ = (kᵢ << 1) ^ 0x55` :

```text
out[i] = ((pass[i] ^ 0xAA ^ kᵢ) << (kᵢ & 0xF)) & 0xFF   ==   TARGET[i]
TARGET = ee c0 00 00 b0 58 80 d0 88 00 00 00 00 00 00 00   (0x1400150b8)
kᵢ     = 00 55 ff 1ab 303 653 cf3 19b3 3333 ...
```

**Pièges / assemblage.**
- Le `<<` perd des bits → plusieurs caractères possibles par position : i=1 : `! ) 1 9 A I Q Y a i q y` ; i=2,3 : *n'importe quoi* (`kᵢ&0xF = 0xF`/`0xB` → tout est décalé hors de l'octet, sortie 0) ; i=4 : `?` ou `_` ; i=5 : `2 R r` ; i=6 : `) I i` ; i=7 : `# C c` ; i=8 : `( H h`.
- `i=0` : seul `D` (`0x44 ^ 0xAA = 0xEE`).
- `memcmp` n'est fait que sur `len` octets : tout **préfixe** de la cible est accepté (`D`, `D1`…). Le « vrai » mot de passe voulu fait 9 caractères.
- Le solveur prend le premier alphanumérique de chaque ensemble : `D 1 0 0 ? 2 I C H` → `D100?2ICH` (`?` seul choix non alnum en position 4 hors `_`).

## Debug GDB / x64dbg

Non utilisés : reverse 100 % statique + preuve sous Wine.

## Vérification

```text
$ python3 -I tools/continental-solve.py --check
password = D100?2ICH
OK (Enjoy your stay)

$ printf 'D100?2ICH\n' | xvfb-run -a wine original/continental.exe
Enter the password: Your privileges are reinstated.
Enjoy your stay.

$ printf 'D\n'   | xvfb-run -a wine original/continental.exe   # préfixe : accepté
Enjoy your stay.
$ printf 'xyz\n' | xvfb-run -a wine original/continental.exe   # KO
Your membership to The Continental has been revoked.
```

## Notes

- Si un debugger est détecté (flags ≠ 0), `k₀ ≠ 0` : la VM produit une autre sortie et le bon mot de passe est refusé — le solveur suppose **flags = 0** (cas Wine/natif propre, vérifié).
- Aucun patch de `original/`.
