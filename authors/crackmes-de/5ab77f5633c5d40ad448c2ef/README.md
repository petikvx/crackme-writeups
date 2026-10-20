# crackmes.de — keygenme#2 by saytos

| | |
|---|---|
| Page | [crackmes.one 5ab77f5633c5d40ad448c2ef](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2ef) |
| Auteur | saytos (archive crackmes.de, 2007) |
| Plateforme | Windows PE32 x86, MASM, GUI (DialogBoxParamA) |
| Difficulté | 2.0 |
| Règles (Readme.txt) | keygen + source ; **pas** de self-keygen, patch ni serial fishing |
| Statut | ✅ keygen |

Le ZIP du site contient un second ZIP `keygenme#2_saytos.zip` (conservé tel quel dans `original/`) qui renferme `keygenme#2.exe` et `Readme.txt`.

## Solution (nom `petik`)

```text
Nom    : petik
Serial : CDC64CCB9A59F8E590BFX214497A1E6$-31B8E0E5501DFF9B
```

```bash
python3 tools/keygenme2-solve.py petik
python3 tools/unicorn-check.py          # exécute les vraies routines MD5/TEA du binaire
```

## Premier regard

```bash
file keygenme#2.exe        # PE32 GUI i386, 4 sections, pas de packer (diec : rien)
strings -n 5 keygenme#2.exe
```

Chaînes utiles : `%.8x%.8x%.8x%.8x`, `%.8x%.8x`, `crackmes`, `Hmm,but who name?`, `Heh,what must check?`, `Serial is not valid...` et un bloc chiffré (XOR `0x40`) de 0x2c octets à `0x4081f6` qui donne **`Yeep! Now write tut and send to crackmes.de!`**. Imports : `GetDlgItemTextA`, `lstrcatA`, `lstrcpyA`, `CharUpperA`, `wsprintfA`, et `winmm` (musique de fond, sans intérêt).

## Le handler du bouton CHECK (`WM_COMMAND`, id `0x3E9`, 0x4010c8)

1. `RtlZeroMemory` des buffers : nom `0x408065` (0x1e), copie `0x4080b5` (0x64), serial `0x408083` (0x32), attendu `0x408237` (0x32).
2. `GetDlgItemTextA(0x3EB, nom, 0x14)` → vide = « Hmm,but who name? » ; `GetDlgItemTextA(0x3ED, serial, 0x32)` → vide = « Heh,what must check? ».
3. Filtres rapides sur le serial tapé : longueur `>= 0x31` (49), `serial[6] == 'C'`, `serial[0x14] == 'X'`, `serial[0x1f] == '$'`.
4. Calcul du serial attendu :

```asm
4011a4  lstrcatA(0x4080b5, nom)              ; copie du nom
4011b3  dec dl                               ; longueur passée au hash
4011c0  call 0x403e14 (0x4080b5, len, 0x4082a1) ; MD5 → écrit le hexdigest dans 0x4080b5
4011ca  call 0x406840 (0x4081af)             ; clé TEA = "crackmes\0Hmm,but"
4011d9  call 0x406878 (nom, nom)             ; TEA-encrypt des 8 premiers octets du nom
4011f5  wsprintfA(0x40826a, "%.8x%.8x", [nom+4], [nom])
4011fd  mov byte [0x408269], '-'
40120e  lstrcpyA(0x408237, md5hex) ; lstrcatA(0x408237, "-" + tea)
401222  [0x40823d] = 'C' ; [0x40824b] = 'x' ; CharUpperA ; [0x408256] = '$'
401249  boucle `loop` : compare len(serial) caractères avec 0x408237
```

Si tout correspond, le message XOR 0x40 est déchiffré une fois et affiché dans le champ serial.

### 0x403e14 = MD5

Padding `0x80` + longueur en bits sur 64 bits, constantes d'init `0x67452301 / 0xefcdab89 / 0x98badcfe / 0x10325476`, 64 étapes. En fin de fonction chaque mot d'état est byte-swappé (`xchg ah,al / rol eax,16 / xchg ah,al`) puis imprimé en `%.8x` x4 : c'est exactement le `hexdigest()` standard.

### 0x406840 / 0x406878 = TEA

`0x406840` charge 16 octets à partir de `0x4081af` en big-endian (`bswap`) : `"crackmes" 00 "Hmm,but"`. `0x406878` est un TEA classique : `delta = 0x9E3779B9`, boucle jusqu'à `sum == 0xC6EF3720` (32 cycles), mots d'entrée et de sortie en big-endian. Le bloc chiffré remplace les 8 premiers octets du buffer nom (complété par des zéros). (`0x406904` est le déchiffrement, inutilisé ici.)

Le `wsprintfA("%.8x%.8x", [nom+4], [nom])` lit ces 8 octets en little-endian, mot haut d'abord : le résultat est l'hexa des 8 octets chiffrés **dans l'ordre inverse**.

## Algorithme du serial

```text
s = md5_hex(nom) + "-" + hex(reverse(TEA_k(nom[:8] complété par \0)))   # 32 + 1 + 16 = 49 car.
s[6] = 'C' ; s[20] = 'x' ; s = upper(s) ; s[31] = '$'
```

Ces positions forcées coïncident avec les filtres de l'étape 3 (`'C'`, `'X'` après majuscules, `'$'`), ce qui confirme la lecture.

## Vérification

- `tools/unicorn-check.py` charge les sections du PE et exécute **les routines d'origine** `0x403e14` (MD5, avec son `wsprintfA` remplacé par un stub Python) puis `0x406840`/`0x406878` (TEA), applique ensuite les mêmes retouches que `0x4011fd`–`0x40123a` et compare au keygen : identique pour `petik`, `crackmes`, `saytos2007` et `A`.
- **Limite Wine** : sous Wine, le binaire plante dans le MD5 (`page fault` en `0x403E29`). Le `dec dl` après `lstrcatA` suppose que `edx` vaut `strlen(nom)+1` en sortie de `lstrcatA` (comportement de l'XP SP2 de l'auteur) ; l'implémentation Wine laisse une valeur quelconque dans `edx`, d'où une longueur énorme. Le keygen prend donc `len = strlen(nom)`, la seule valeur cohérente avec le buffer de 0x64 octets. Vérification live non faisable sous Wine sans patch, ce que les règles interdisent.

## Fichiers

- `original/keygenme#2_saytos.zip` : archive interne d'origine (exe + Readme.txt)
- `tools/keygenme2-solve.py` : keygen
- `tools/unicorn-check.py` : exécution des routines du binaire sous unicorn
