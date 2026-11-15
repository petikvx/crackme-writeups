# antilagvip's hard crackme

| | |
|---|---|
| **ID** | [`6af862c64b6d53e8802ed5cf`](https://crackmes.one/crackme/6af862c64b6d53e8802ed5cf) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | antilagvip |
| **Plateforme** | Windows PE64 (MinGW-w64, C++), console |
| **SHA-256 (ZIP `original/download.bin`)** | `dc118127f6adad064fddeb5b0d3d1494c1c08ab554b218bc1c96d86c549c8181` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | archive d'origine (c'est un **ZIP**, mot de passe `crackmes.one`), intouchée |
| `analysis/crackme_med.exe` | `unzip -P crackmes.one original/download.bin` (copie de travail, 954 368 o) |
| `tools/antilagvip-hard-solve.py` | **keygen** (`-q`, `--check`) |
| `tools/vm_disasm.py` | déchiffre + désassemble le bytecode de la VM |
| `tools/vm-emu.py` | émulateur Python de la VM (recoupe le keygen) |

## Réponse

Pas de user : le serial fait **24 caractères** de l'alphabet `ABCDEFGHJKLMNPQRSTUVWXYZ23456789`.
Les 12 premiers sont libres, les 12 derniers en dépendent.

| 12 premiers (libres) | Serial complet |
|---|---|
| `PETKPETKPETK` | **`PETKPETKPETKMQZ2KFCJZ3CC`** |
| `ABCDEFGHJKLM` | `ABCDEFGHJKLM55ZGJEQX9532` |

```bash
python3 -I tools/antilagvip-hard-solve.py          # serial: PETKPETKPETKMQZ2KFCJZ3CC
python3 -I tools/antilagvip-hard-solve.py -f ABCDEFGHJKLM
python3 -I tools/antilagvip-hard-solve.py --check  # rejoue via xvfb-run wine
```

(`I` n'est pas dans l'alphabet : `petik` ne passe donc pas, d'où `PETK…`.)

## Premier regard

```bash
unzip -P crackmes.one original/download.bin -d /tmp/x   # → crackme_med.exe
diec crackme_med.exe                                   # PE64
strings -n 4 crackme_med.exe | grep -E 'serial|NO|OK'  # .rdata 0x1400bf000 : "serial: ", "NO", "OK"
```

`file` ne sait pas lire `download.bin` : c'est un ZIP. Le binaire demande `serial: ` puis répond `NO` ou `OK`.
Les gros `strings` sont du libstdc++ (MinGW), sans intérêt. Les offsets de la section `.rdata` : VA 0x1400bf000 = fichier 0xbc800.

## Flow

`main` = `0x1400b8460`. Les xrefs vers `"serial: "` (0x1400bf000) puis `"NO"` (0x1400bf009) y mènent.

1. `getline` du serial.
2. Filtrage (`0x1400b855a…`) : on jette tab (9), espace (32) et `-` (45) via `bt 0x200100000200` ; les `a-z` sont passés en majuscules.
3. **Longueur exactement 0x18 = 24**, sinon `NO`.
4. `IsDebuggerPresent` / `CheckRemoteDebuggerPresent`, puis une boucle de 200 000 tours de splitmix64 chronométrée (`QueryPerformanceCounter`, seuil 40 ms, constantes `1000.0` / `40.0` en `.rdata`). Résultat → **graine** de la VM : `0x1f123bb5159a55e5` si tout va bien, `0x4eff1cbe69856fb0` sinon (bytecode alors déchiffré en bouillie → `NO`). C'est un piège anti-debug / anti-lenteur.
5. Boucle d'interprétation (`0x1400b8740`) d'une mini-VM dont le bytecode (0x258 octets, `.rdata` 0x1400bf0a0) est **chiffré**. `OK` n'est affiché que par l'opcode 23 avec 0 au sommet de pile.

## Comment on trouve le prédicat

### 1. Déchiffrement du bytecode
À `0x1400b8740` (et dans le helper `0x1400014f0`) :

```asm
lea  ecx,[r10+1]          ; pc+1
imul rcx,rdi              ; *0x9e3779b97f4a7c15
xor  rdx,seed ; add rdx,rdi
; shr 30/xor, imul 0xbf58476d1ce4e5b9, shr 27/xor, imul 0x94d049bb133111eb, shr 31/xor  = splitmix64
; z = ((z>>0x1d) ^ (z>>0x34)) & 0xff
xor  r9b,[0x1400bf0a0+pc] ; octet chiffré
cmp  r9b,0x17 ; ja fail   ; 24 opcodes -> table 0x1400bf014
```

`dec(pc) = ((mix(((pc+1)*G ^ seed)+G) >> 29) ^ (… >> 52)) & 0xff ^ table[pc]` avec `G = 0x9e3779b97f4a7c15`.
Avec la bonne graine, 512/598 octets sont des opcodes valides (vs 68 avec l'autre) — c'est ce qui confirme laquelle est la bonne (`python3 -I tools/vm_disasm.py`).

### 2. Jeu d'instructions (table de sauts `0x1400bf014`, handlers 0x1400b88xx–8dxx)
Une seule pile de 64 qwords (`rsp+0x1d0`), 16 registres (`rsp+0x150`), 12 octets de « mémoire » (`rsp+0x138`), pile d'appels de 8.

| op | nom | effet |
|---|---|---|
| 0 | PUSH | imm64 LE (octets pc+1..pc+8, chacun déchiffré) |
| 1-6 | ADD SUB MUL XOR AND OR | `a op b` (b = sommet) |
| 7 / 8 | SHR / ROL | `a >> b` / `rol(a,b)` |
| 9 | HASH | `splitmix64(x + G)` |
| 10 | INPUT | `input[i]` (0 si hors borne) |
| 11 / 18 | MEM / MSTORE | lecture / écriture `mem[i]` (i<12) |
| 12 | LEN | longueur du serial |
| 13 / 14 | ALPHA / RALPHA | `"ABCDEFGHJKLMNPQRSTUVWXYZ23456789"[x&31]` / indice inverse |
| 15 | TAB | table de 12 dwords `{7,2,11,4,9,0,6,3,10,1,8,5}` (`0x1400bf300`) |
| 16 / 17 | RLOAD / RSTORE | registre `r[byte]` |
| 19 / 20 / 21 / 22 | JMP / JZ / CALL / RET | cible = u16 LE |
| 23 | END | dépile ; `0` → `OK` |

### 3. Programme déchiffré (extrait commenté)
```text
000 r0 = 0x8a5cd789635d2dff ; r2 = 12 ; r3 = 0
021 CALL 1b3                      ; r0 = F(r0, input[0..11])
024 boucle 0x800 + (12&15)*0x25 = 2492 fois :  r0 = HASH(r0 ^ (0x94d049bb133111eb + i*0x9e3779b9))
086 r9 = r0
    r0 = F(r9 ^ 0xd1b54a32d192ed03, input[0..11])           ; r3=0
    r6 = r0
    r0 = F(r9 ^ 0x2545f4914f6cdd1d, input[11..0])           ; r3=1 (ordre inverse)
    r4 = HASH(r6 ^ r0 ^ r9 ^ 0x94d049bb133111eb)
0ea mem[i] = ALPHA[(r4 >> 5i) & 31]   pour i<12
13d pour i<12 :
      y = (HASH(0x2b992ddfa23249d6 ^ i*G) >> 29) & 31
      c = ALPHA[(RALPHA(mem[TAB[i]]) + y) & 31]
      r7 |= c ^ input[12+i]
1b0 END r7                        ; il faut r7 == 0
1b3 F(r0, v[0..11]) :
      r0 ^= 12 * 0x2545f4914f6cdd1d
      pour i : r8 = HASH((v[i] + (i+1)*G) ^ r0) ; r0 = rol(r8,17) ^ (r8>>7)
      r0 = HASH(r0) ; RET
```

Autrement dit : les 12 premiers caractères alimentent un hash qui fixe `mem[0..11]`, et les 12 suivants doivent être **exactement** `c_i` — d'où le keygen direct : choisir 12 caractères, calculer les 12 autres.

### 4. Exemple pas à pas (`PETKPETKPETK`)
`r0 = F(0x8a5c…, "PETKPETKPETK")` → 2492 tours → `r9` → `r6`, `r4` → `mem` → `c_i` = `MQZ2KFCJZ3CC` (voir `tools/antilagvip-hard-solve.py`, fonction `keygen`).

### Pièges
- `download.bin` est un ZIP, pas le PE.
- Premier essai raté : j'avais oublié le `CALL 1b3` en `0x021` **avant** la boucle de 2492 tours (le programme déchiffré montre bien `r0` modifié) ; `vm-emu.py` a servi à localiser l'écart (valeur de `r0` au premier tour) → `NO` partout.
- Deux graines possibles selon le test anti-debug / timing : sous debugger ou machine lente, bytecode illisible, `NO` systématique.
- `a op b` : `b` est le premier dépilé (`sub rdx,r8`).
- L'alphabet exclut `I`, `O`, `0`, `1` : le premier half doit être dans l'alphabet pour que le keygen soit défini (le binaire accepterait d'autres octets, mais l'`INPUT` serait hors alphabet ; on reste simple).

## Debug GDB / x64dbg / IDA
Non utilisés : IDA (`decc`) absent sur la machine ; reverse **statique** (`objdump -d -M intel` + déchiffrement Python) et preuve live sous Wine. Pas de walkthrough GDB inventé.

## Vérification (Wine, `xvfb-run -a wine analysis/crackme_med.exe`)

| Entrée | Sortie |
|---|---|
| `PETKPETKPETKMQZ2KFCJZ3CC` | `serial: OK` |
| `PETK-PETK-PETK-MQZ2-KFCJ-Z3CC` (tirets ignorés) | `serial: OK` |
| `petkpetkpetkmqz2kfcjz3cc` (minuscules) | `serial: OK` |
| `ABCDEFGHJKLM55ZGJEQX9532` | `serial: OK` |
| `PETKPETKPETKMQZ2KFCJZ3CD` (dernier car. modifié) | `serial: NO` |
| `SHORT` | `serial: NO` |

## Status

- [x] reverse
- [x] write-up
- [x] solveur
