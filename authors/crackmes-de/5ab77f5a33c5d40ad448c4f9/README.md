# ps3crackme1 — macabre (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5a33c5d40ad448c4f9 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : **PowerPC 64-bit** (Linux sur PS3), non strippé, avec un programme **SPE (Cell SPU)** embarqué (libspe2)
- Archive : `original/ps3crackme1.zip` → `ps3crackme1/ps3crackme1` + `README.txt`
- Règles de l'auteur : « Don't patch unless it's to make a self keygen. Serial Fishing is fine. »

## Réponse

| Username | Serial |
|---|---|
| `petik12` | `00f00o3` |
| `Macabre1` | `3j0f0jjf` |
| `ps3_user` | `0fjzfzz0` |

```bash
python3 -I tools/ps3crackme1-solve.py petik12 --check
# username: petik12 / serial: 00f00o3 / check: OK (modèle statique …)
```

Règle : le serial a **la même longueur** que le username (7 à 45 caractères, `> 6`) et
`serial[i] = "jxzilaoq013-fs"[ S_i mod 14 ]` avec `S_i = Σ_{j≤i} ((2·u_j) XOR (4·u_j))`.

> ⚠ **Pas d'exécution possible** : ni PS3 ni émulateur Cell ici. La règle est établie par lecture du listing SPU (IDA, module SPU) ; `--check` ne fait que rejouer la formule (preuve statique, **non** exécutée sur le binaire).

## Premier regard

```text
$ file ps3crackme1/ps3crackme1
ELF 64-bit MSB executable, 64-bit PowerPC, ... dynamically linked, interpreter /lib64/ld64.so.1, with debug_info
$ strings -n 5 ps3crackme1 | grep -E "Enter|Good|Bad|jxz|spe_"
Enter your username: Enter serial: Good boy! Registered: Now write a tutorial  Bad boy! UnRegistered
jxzilaoq013-fs   spe_context_create  spe_program_load  spe_context_run  libspe2.so.2
```

Deux ELF dans le fichier : l'ELF PPC64 (hôte) et, à l'offset `0xe80`, un ELF **EM_SPU (23)** de 4,5 Ko : le vrai test.

## Flow

**Hôte** (`main` @`0x10000978`, `ps3crackme1.i64.c`) :

```c
char user[46], serial[46]; int result = 0;      // contigus sur la pile : user @-0x80, serial @-0x52, result @-0x24
fgets(user, 46, stdin); fgets(serial, 46, stdin);  // '\n' retiré
spe_context_create / spe_program_load / spe_context_run(.. &struct ..)   // le SPU DMA la structure (0x60 octets)
puts(result == 1 ? "Good boy!\nRegistered: Now write a tutorial" : "Bad boy!\nUnRegistered");
```

**SPU** (`analysis/ps3crackme1/spu.elf`, listing `spu.elf.asm`, `sub_160` = `main`) :

1. `mfc_get` de 0x60 octets (`wrch ch16..ch23`, commande `0x40`) → copie locale `{user, serial, result}`.
2. Recopie la table `"jxzilaoq013-fs"` (14 caractères, constante `xmmword_BF0` du `.text` SPU) sur la pile, `L = strlen = 14` (`sub_710`).
3. `strlen(user) > 6` (`clgti r2,r2,6`) et `strlen(user) == strlen(serial)` (`ceq`), sinon sortie sans positionner le résultat.
4. Pour `i = 0 … len-1` (`loc_3C0…`) :
   ```asm
   rotqby/andi  r6 = u[i] & 0xFF ; r2 = u[i] & 0xFF
   a            r6, r6, r2          ; 2·u
   shli         r2, u, 2            ; 4·u
   xor          r3, r6, r2          ; (2u) ^ (4u)
   a            sum, sum, r3        ; var_D0 += …
   … division signée sum / L (restoring division : quotient → r9, reste → r10) …
   lr           r2, r10             ; <- on utilise le RESTE : index = sum mod 14
   lqx/rotqby   r2 = table[index]
   ceqb         serial[i] == table[index] ? sinon mismatches++
   ```
5. `mismatches == 0` → `result = 1`, `mfc_put` (commande `0x20`) de la structure vers l'hôte ; l'hôte affiche « Good boy! ».

## Comment on trouve

**Ancrage** : `bash -ic 'decc ps3crackme1'` donne l'hôte PPC64 (`main` ci-dessus, 232 lignes) ; l'ELF SPU est extrait à l'offset `0xe80` (`\x7fELF` + `e_machine = 0x17`) puis désassemblé avec `bash -ic 'decasm spu.elf'` (le module SPU d'IDA désassemble, Hex-Rays ne décompile pas le SPU).

Les pièges de lecture :
- le code est en `-O0` : chaque variable passe par `lqd/stqd` + `cwd/shufb` (insertion dans un quadword de pile) ;
- la division n'est pas une instruction (le SPU n'en a pas) : routine de division restaurante ; **on garde le reste** (`lr r2, r10`), pas le quotient (qui est ensuite écrasé : `r9` sert d'adresse) ;
- les octets sont lus avec `lqx` + `rotqby` (adresse + `0xD` pour aligner sur le slot préféré) ;
- l'indice tombe dans `[0,13]` grâce au `mod 14` : aucune lecture hors table.

Exemple `petik12` : `u = 70 65 74 69 6b 31 32`

| i | `(2u)^(4u)` | `S_i` | `S_i mod 14` | `T[...]` |
|---|---|---|---|---|
| 0 `p` | 288 | 288 | 8 | `0` |
| 1 `e` | 350 | 638 | 8 | `0` |
| 2 `t` | 312 | 950 | 12 | `f` |
| 3 `i` | 374 | 1324 | 8 | `0` |
| 4 `k` | 378 | 1702 | 8 | `0` |
| 5 `1` | 166 | 1868 | 6 | `o` |
| 6 `2` | 172 | 2040 | 10 | `3` |

Résultat : `00f00o3`.

## Fichiers

- `analysis/ps3crackme1/` : `ps3crackme1`, `README.txt`, `ps3crackme1.i64.c` (hôte), `spu.elf` (SPE extrait), `spu.elf.asm` (listing IDA)
- `tools/ps3crackme1-solve.py` : keygen (+ recalcul de la formule)
