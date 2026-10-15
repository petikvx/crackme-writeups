# King of Asgard

| | |
|---|---|
| **ID** | [`6acf9047ace07d1c3fbc4c0f`](https://crackmes.one/crackme/6acf9047ace07d1c3fbc4c0f) |
| **Auteur (site)** | fon37 |
| **Auteur (local)** | fon37 |
| **Plateforme** | Unix/linux — ELF64 x86-64, C/C++ (GCC 15.3, Debian), packé UPX |
| **Difficulté (site)** | 3.0 (Medium) |
| **SHA-256** | `75d29387437885e492567fde58ff7975fe9683009d9ae8600d19739b3db5106b` |
| **Status** | ✅ solved |

> *Loki hid a secret inside this binary. As the God of Mischief, things are never as simple as they seem.*

## Solution

```text
CMO{IamLokiofAsgardandIamburdenedwithgloriouspurpose}
```

```console
$ ./crackme
Enter the flag: CMO{IamLokiofAsgardandIamburdenedwithgloriouspurpose}
You Win!
```

Ce n’est pas un keygen : le flag est unique (pas de dépendance au nom d’utilisateur). Avec l’entrée d’exemple `petik`, le binaire répond `Invalid Length` (il faut 53 caractères).

## 1. Premier regard — comment on trouve le packer

```console
$ file original/crackme
ELF 64-bit LSB shared object, x86-64, statically linked, no section header
$ strings -n 4 original/crackme | head -3
UPX!
...
```

6 Ko, aucune section, un marqueur `UPX!` et des bouts de chaînes tronqués (`Ente`, `e flag: `, `#k y,misse>a colu`) : c’est un **UPX** standard (non altéré). On décompresse dans `analysis/` (on ne touche jamais `original/`) :

```console
$ upx -d -o analysis/crackme.unpacked original/crackme
     22871 <-      6088   26.62%   linux/amd64   crackme.unpacked
```

On obtient un PIE dynamique, strippé, qui importe juste `puts`, `__isoc23_scanf`, `strlen`. Les chaînes deviennent lisibles :

```text
Invalid Length
You Win!
Enter the flag: 
%255s
i think you missed a column, try again
YAY:hq…                                  ← en fait des octets « cible » binaires
1I_kN0w_Wh4T_K1nD_0F_g0d_I_Need_T        ← « 1 » = dernier octet de la cible, puis la clé
d_TO_B3e                                 ← fin de la clé (immédiat movabs)
```

La chaîne `I_kN0w_Wh4T_K1nD_0F_g0d_I_Need_T…` ressemble à un flag mais c’est un **leurre** : c’est la clé XOR (« I know what kind of god I need to be »). C’est la « malice » de Loki annoncée dans la description.

## 2. `main` (0x1080)

`puts("Enter the flag: ")`, `scanf("%255s", buf)`, puis `check(buf)` en 0x1200. Rien d’autre.

## 3. La vérif (0x1200) — comment on trouve l’algo

`objdump -d -M intel analysis/crackme.unpacked`, fonction en 0x1200 :

1. **Construction de la clé** sur la pile à `rsp+0x00` :
   - 2 × `movdqa` depuis `.rodata` 0x2090 et 0x20a0 → 32 octets `I_kN0w_Wh4T_K1nD_0F_g0d_I_Need_T` (le `1` qui précède dans `strings` est en 0x208f, il appartient au bloc cible) ;
   - `movabs rax, 0x6533425f4f545f64` ; `mov [rsp+0x1d], rax` → écrit `d_TO_B3e` à partir de l’octet 29.
   - Clé finale (37 octets, indices 0..36) : `I_kN0w_Wh4T_K1nD_0F_g0d_I_Need_TO_B3e`.
2. **Construction de la cible** à `rsp+0x30` : 3 × `movdqa` depuis 0x2060/0x2070/0x2080 (48 octets) puis `movabs rax, 0xc958122179310ac0` écrit à `rsp+0x5d` → 53 octets (0x30 + 0x2d + 8 = 0x65).
3. `strlen(buf) == 0x35` (53), sinon `Invalid Length`.
4. Boucle sur `i = 0..52` :

   ```asm
   mov    eax, 0x49                ; 1er tour : al = 0x49 = key[0] ('I')
   ...
   mul    rdi                      ; rdi = 0xdd67c8a60dd67c8b  → division par 37
   shr    rdx, 5
   lea    rax, [rdx+rdx*8]
   lea    rdx, [rdx+rax*4]         ; rdx = (i/37)*37
   sub    rax, rdx                 ; i % 37
   movzx  eax, byte [rsp+rax]      ; al = key[i % 37]
   xor    al, byte [rbx+rcx]       ; ^ flag[i]
   rol    al, 3
   cmp    byte [rsi], al           ; == target[i] ?
   ```

   La constante magique `0xdd67c8a60dd67c8b` suivie de `shr 5` et de `q*9*4 + q` = `q*37` est le classique *modulo par une constante* de GCC : `i % 37`.

   Détail : avant d’entrer dans la boucle (saut direct en 0x12ea), `eax` est initialisé à l’immédiat **0x49** : c’est simplement `key[0]` = `'I'`, que GCC connaît à la compilation et propage au lieu de le relire sur la pile. Attention à ne pas prendre le `1` affiché par `strings` pour le premier octet de la clé.

5. Un octet différent → `i think you missed a column, try again` ; les 53 bons → `You Win!`.

## 4. Inversion

`rol` et `xor` sont réversibles :

```text
flag[i] = ror8(target[i], 3) ^ key[i % 37]
```

Le solveur [`tools/king-of-asgard-solve.py`](tools/king-of-asgard-solve.py) relit `.rodata` dans `analysis/crackme.unpacked`, reconstruit clé et cible exactement comme le code (y compris les deux `movabs` qui écrasent la fin), puis applique la formule :

```console
$ python3 tools/king-of-asgard-solve.py
CMO{IamLokiofAsgardandIamburdenedwithgloriouspurpose}
```

(« I am Loki of Asgard and I am burdened with glorious purpose », la réplique du film *Avengers*.)

## 5. Vérification

Sur le binaire **d’origine** (packé, non patché), en natif : voir [`analysis/verify.txt`](analysis/verify.txt).

```console
$ echo 'CMO{IamLokiofAsgardandIamburdenedwithgloriouspurpose}' | ./original/crackme
Enter the flag: 
You Win!
$ echo petik | ./original/crackme
Enter the flag: 
Invalid Length
```

## Contenu

```
original/crackme              # binaire d'origine (UPX)
analysis/crackme.unpacked     # upx -d
analysis/text.asm             # objdump -d de .text
analysis/verify.txt           # trace de vérification
tools/king-of-asgard-solve.py # solveur
```
