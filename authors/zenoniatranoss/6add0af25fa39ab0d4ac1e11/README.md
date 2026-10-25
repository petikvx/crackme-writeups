# zenoniatranoss's zenobiatranoss

| | |
|---|---|
| **ID** | [`6add0af25fa39ab0d4ac1e11`](https://crackmes.one/crackme/6add0af25fa39ab0d4ac1e11) |
| **Auteur** | zenoniatranoss |
| **Plateforme** | Linux ELF64 x86-64 (PIE, stripped, GCC 13.3) |
| **SHA-256** | `34401d07af8833445093fa059b23d29b118c3dbd8f25ed71ed5d086381b722e7` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme` | binaire d'origine (non patché ; pas de bit exécutable → `cp` + `chmod +x` ailleurs) |
| `tools/zenobiatranoss-solve.py` | keygen (meet-in-the-middle sans dépendance) + `--check` |

## Réponse

Il n'y a pas de nom d'utilisateur : la clé est un simple argv de 24 caractères. Il existe de très nombreuses clés valides (20 octets libres pour un hash 32 bits). Celle produite par le solveur :

```text
PETI-MKZE-RKNO-BIYC-GATR
```

```bash
python3 -I tools/zenobiatranoss-solve.py --check original/crackme   # -q pour la clé seule
```

## Premier regard

- `file` : ELF64 PIE stripped. Imports : `strlen`, `clock_gettime`, `puts`, `__fprintf_chk`.
- `strings` : seulement `usage: %s <key>`. Les messages sont absents en clair : `.rodata` contient `1b 39 39 3f 29 29 7a …`, soit les messages XORés par `0x5a` (`Access Denied.` / `Access Granted. Well done.`). La routine à `0x1520` fait le `xor 0x5a` puis `puts`.
- Le binaire n'est pas exécutable dans `original/` : `cp original/crackme /tmp/c && chmod +x /tmp/c`.

## Flow

1. `argc == 2`, sinon `usage`.
2. `strlen(argv[1]) == 0x18` (24), sinon « Access Denied ».
3. `clock_gettime(CLOCK_MONOTONIC)` avant, et deux fois plus tard (anti-debug).
4. Calcul d'un hash 32 bits dans `ebx` ; test de 4 tirets ; `ebx == 0x9ae078de` → « Access Granted. Well done. ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/crackme` ; tout le prédicat tient dans la fonction principale à `0x10e0` (pas de `main` symbolisé, appelée depuis `_start` en `0x1448`). Le compilateur/obfuscateur a *aplati* le flot : une variable d'état `eax` (`0x1490`, `0x83cb`, `0x6566`…) pilote une cascade de `cmp/je/jg` qui réordonne les blocs.

**Lecture** : chaque bloc est de la forme

```asm
movzx eax, BYTE PTR [rbp+0x8]   ; k[8]  (rbp = argv[1])
rol   ebx, 5
add   eax, 0xf8
xor   ebx, eax                  ; ebx = rol(ebx,5) ^ (k[8]+0xf8)
```

Pour retrouver l'ordre réel, on suit l'état : départ `eax=0x1490` → `0x1409` → `0x1364` → `11e8` → `1217` → `1255` → fall-through `12be` → `1326` → `eax=0x83cb` → `11ba` → `1350` → `13c6` → `1397` → `11a7` → `eax=0x6566` → `13d6` (test final). Ordre obtenu :

| Étape | Opération |
|---|---|
| init | `b = (k[13]+0x193) ^ 0x04c20484` |
| 1 | `k[8]+0xf8`, `k[2]+0x3e`, `k[0]+0`, `k[22]+0x2aa` (chacun : `b = rol(b,5) ^ (k[i]+add)`) |
| 2 | `b = rol(b,3)^0x2d2d2d2d`, puis `k[7]+0xd9`, `k[16]+0x1f0` |
| 3 | `k[1]+0x1f`, `k[23]+0x2c9`, `k[3]+0x5d`, `k[15]+0x1d1`, `k[6]+0xba` |
| 4 | deux fois `b = rol(b,3)^0x2d2d2d2d` |
| 5 | `k[21]+0x28b`, `k[12]+0x174`, `k[10]+0x136`, `k[5]+0x9b`, `k[20]+0x26c` |
| 6 | `k[18]+0x22e`, `k[11]+0x155`, `k[17]+0x20f` |
| fin | `b == 0x9ae078de` |

Les 20 indices hors `4, 9, 14, 19` sont tous consommés exactement une fois. Ces quatre indices sont les tirets exigés (`cmp BYTE PTR [rbp+N], 0x2d` + `cmovne r12d,0` aux adresses `0x11ea`, `0x129a`, `0x12ad`, `0x13d8`) : format `XXXX-XXXX-XXXX-XXXX-XXXX`. (Le `0x2d2d2d2d` est un clin d'œil aux tirets, mais c'est juste une constante de mélange.)

**Piège anti-debug** : deux blocs (`0x1217` et `0x12e4`) appellent `clock_gettime` et, si plus de `0x4c4b401` ns (≈80 ms) se sont écoulées depuis le début, ajoutent `0x9e3779b9` / `0x85ebca6b` à `ebx` → hash faux sous un pas-à-pas lent (gdb avec breakpoints). Le solveur modélise le cas rapide, qui est le cas normal.

**Inversion** : chaque étape `b' = rol(b,5) ^ (k+add)` est bijective, donc `b = ror(b' ^ (k+add), 5)`. Comme le hash ne fait que 32 bits pour 20 octets, on fixe 14 caractères (`PETIKZENOBIATRANOSS…`), puis on fait un *meet-in-the-middle* sur l'état juste après `k[20]` : en avant on énumère `k[10],k[5],k[20]` dans `[A-Z0-9]`, en arrière depuis `0x9ae078de` on énumère `k[17],k[11],k[18]` ; 36³ états de chaque côté, une collision dans une table suffit (~quelques secondes).

## Debug GDB

Non utilisé (reverse 100 % statique, vérifié en exécution native). À noter : sous gdb, les breakpoints dépassent facilement le seuil de 80 ms et casseraient le hash (voir piège ci-dessus).

## Vérification

```text
$ python3 -I tools/zenobiatranoss-solve.py --check original/crackme
key = PETI-MKZE-RKNO-BIYC-GATR | modèle python: True
binaire: rc=0 stdout='Access Granted. Well done.'
```

Cas KO (copie exécutable du binaire) : dernier caractère changé (`…GATS`), un tiret remplacé (`…RKNOXBIYC…`), longueur ≠ 24 (`short`) → tous `Access Denied.`.

## Notes

- Aucun nom/serial couplés : une seule condition sur la clé, d'où une infinité de solutions ; le solveur n'en donne qu'une.
- Le flot aplati n'est qu'un obstacle de lecture, pas du vrai chiffrement.
