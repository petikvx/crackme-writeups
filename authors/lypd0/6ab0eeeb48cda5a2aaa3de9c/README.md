# lypd0's Lantern01

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ab0eeeb48cda5a2aaa3de9c) · id `6ab0eeeb48cda5a2aaa3de9c`

PE64 console **C**, MSVC 19.51 (Visual Studio 2026), image base `0x140000000`.  
Deux XOR : le password est comparé à une table, le flag n'est décodé qu'après.  
Famille : [`../README.md`](../README.md).

| Fichier | Rôle |
|---|---|
| [`original/lantern01.exe`](original/lantern01.exe) | binaire |
| [`tools/lantern01-solve.py`](tools/lantern01-solve.py) | password + flag / `--check` (Wine) |

## Réponse

| | |
|---|---|
| **Password** | `copper-owl-42` |
| **Flag** | `FLAG{first_steps_1ab4f81e16df4d5c}` |
| OK | `Unlocked! Your flag is:` puis le flag (exit 0) |
| KO | `Incorrect password. Try again.` (exit 1) |

```bash
python3 tools/lantern01-solve.py -q
# copper-owl-42
# FLAG{first_steps_1ab4f81e16df4d5c}
printf '%s\n\n' copper-owl-42 | wine original/lantern01.exe
python3 tools/lantern01-solve.py --check
```

Le second retour à la ligne répond à `Press Enter to exit.`

---

## 1. Premier regard

```text
lantern01.exe: PE32+ console, x86-64, MSVC 19.51 / linker 14.51
sha256  7820d39cb87d0d709eb7188f0ad048b5425fe130fc8f26749e036f81d9bab79f
size    148992
entry   0x1400017d0
```

```bash
file original/lantern01.exe
strings -n 4 -a original/lantern01.exe | grep -E 'Lantern|Password|Unlocked|Incorrect'
```

Le dialogue est en clair, dans `.data` (VMA `0x140023000`, fichier `0x21a00`) :

```text
Lantern 01 - beginner crackme
Recover the password or change the success path. No tricks.
Password:
Unlocked! Your flag is:
Incorrect password. Try again.
Press Enter to exit.
```

Pas de password ni de `FLAG{…}` dans `strings`. L'auteur dit de retrouver le password, ou de patcher le chemin de succès. Ici on retrouve le password.

`.text` fait `0x16940` octets, presque tout le CRT. Le check tient au début de la section.

---

## 2. Flow

La fonction utile commence à **`0x140001120`** (cookie de pile MSVC : `xor` avec `[0x1400230c0]`, vérifié par `0x140001540` au retour).

1. Deux `puts` (`0x1400051f8`) : bandeau, puis la phrase « Recover the password… ».
2. `puts` de `Password: `.
3. Lecture d'au plus `0x80` octets dans `[rsp+0x30]` (`0x140004f90`, thunk `fgets`), puis `strcspn` sur `"\r\n"` (`0x14002305c`) et un NUL à la coupure.
4. Appel **`0x140001000`** avec le buffer. Retour non nul → succès.
5. Succès : `Unlocked! Your flag is:` puis **`0x140001080`**, qui décode et affiche le flag. Échec : `Incorrect password. Try again.`
6. `Press Enter to exit.` puis une lecture (`0x1400050f8`). Exit 0 si le check a réussi, 1 sinon.

---

## 3. Comment on trouve le password et le flag

### 3.1 Ancrage

Les chaînes sont à des VMA fixes. Un `lea rcx, [rip+…]` dans `.text` les référence :

| VMA du `lea` | Cible | Rôle |
|---|---|---|
| `0x140001141` | `0x140023000` | bandeau |
| `0x140001159` | `0x140023060` | `Password: ` |
| `0x1400011d7` | appel `0x140001000` | check |
| `0x1400011e0` | `0x140023070` | succès |
| `0x1400011ec` | appel `0x140001080` | décodage du flag |
| `0x1400011fb` | `0x140023088` | échec |

```bash
objdump -d -M intel --start-address=0x140001000 --stop-address=0x140001250 original/lantern01.exe
```

### 3.2 Check du password (`0x140001000`)

```asm
140001009:  mov    rcx, [rsp+0x40]       ; buffer
14000100e:  call   0x140016f30            ; strlen MSVC (scan jusqu'au NUL)
140001013:  cmp    rax, 0xd
140001017:  je     0x14000101d
140001019:  xor    eax, eax               ; longueur ≠ 13 → échec
14000101b:  jmp    0x140001072

14000101d:  mov    qword [rsp+0x20], 0    ; i = 0
140001035:  cmp    qword [rsp+0x20], 0xd
14000103b:  jae    0x14000106d             ; i == 13 → succès
14000104d:  movzx  eax, byte [buf+i]
140001050:  xor    eax, 0x37
140001053:  lea    rcx, [rip+0x172c6]     ; 0x140018320  table
14000105f:  movzx  ecx, byte [rcx+i]
140001063:  cmp    eax, ecx
140001065:  je     0x14000106b             ; octet suivant
140001067:  xor    eax, eax               ; écart → échec
14000106d:  mov    eax, 1
```

`0x140016f30` est le `strlen` du CRT (alignement sur 8, scan du NUL). La table est en `.rdata` :

```text
VMA    0x140018320
fichier 0x17120
54 58 47 47 52 45 1a 58 40 5b 1a 03 05
```

Inversion, octet par octet :

```text
password[i] = table[i] ^ 0x37
```

| i | `table[i]` | `^ 0x37` | car |
|---|---|---|---|
| 0 | `54` | `63` | `c` |
| 1 | `58` | `6f` | `o` |
| 2 | `47` | `70` | `p` |
| 3 | `47` | `70` | `p` |
| 4 | `52` | `65` | `e` |
| 5 | `45` | `72` | `r` |
| 6 | `1a` | `2d` | `-` |
| 7 | `58` | `6f` | `o` |
| 8 | `40` | `77` | `w` |
| 9 | `5b` | `6c` | `l` |
| 10 | `1a` | `2d` | `-` |
| 11 | `03` | `34` | `4` |
| 12 | `05` | `32` | `2` |

Lecture : `copper-owl-42` (13 octets). `0x1a ^ 0x37` donne le tiret, pas une lettre : la table n'est pas de l'ASCII en clair.

### 3.3 Décodage du flag (`0x140001080`)

Appelé seulement si le check a renvoyé 1. Boucle `i` de 0 à `0x21` inclus (34 octets) :

```asm
1400010ab:  cmp    qword [rsp+0x20], 0x22
1400010b1:  jae    0x1400010d1             ; i >= 34 → fin
1400010b3:  lea    rax, [rip+0x17276]     ; 0x140018330
1400010bf:  movzx  eax, byte [rax+i]
1400010c3:  xor    eax, 0x5a
1400010cb:  mov    byte [rsp+i+0x30], al
; … NUL, puis puts du buffer
```

Les 34 octets sont à `0x140018330` (fichier `0x17130`). Trois `00` séparent la table du password (`0x140018320`, 13 octets) de ce bloc, aligné sur 16 :

```text
1c 16 1b 1d 21 3c 33 28 29 2e 05 29 2e 3f 2a 29
05 6b 3b 38 6e 3c 62 6b 3f 6b 6c 3e 3c 6e 3e 6f
39 27
```

| i | enc | `^ 0x5a` | i | enc | `^ 0x5a` |
|---|---|---|---|---|---|
| 0 | `1c` | `F` | 17 | `6b` | `1` |
| 1 | `16` | `L` | 18 | `3b` | `a` |
| 2 | `1b` | `A` | 19 | `38` | `b` |
| 3 | `1d` | `G` | 20 | `6e` | `4` |
| 4 | `21` | `{` | 21 | `3c` | `f` |
| 5 | `3c` | `f` | 22 | `62` | `8` |
| 6 | `33` | `i` | 23 | `6b` | `1` |
| 7 | `28` | `r` | 24 | `3f` | `e` |
| 8 | `29` | `s` | 25 | `6b` | `1` |
| 9 | `2e` | `t` | 26 | `6c` | `6` |
| 10 | `05` | `_` | 27 | `3e` | `d` |
| 11 | `29` | `s` | 28 | `3c` | `f` |
| 12 | `2e` | `t` | 29 | `6e` | `4` |
| 13 | `3f` | `e` | 30 | `3e` | `d` |
| 14 | `2a` | `p` | 31 | `6f` | `5` |
| 15 | `29` | `s` | 32 | `39` | `c` |
| 16 | `05` | `_` | 33 | `27` | `}` |

Lecture : `FLAG{first_steps_1ab4f81e16df4d5c}`.

Premier octet, pour fixer le XOR : `0x1c ^ 0x5a = 0x46` (`F`). `0x05 ^ 0x5a = 0x5f` (`_`).

```python
blob = open("original/lantern01.exe", "rb").read()
table = blob[0x17120:0x17120+13]   # VMA 0x140018320
enc = blob[0x17130:0x17130+34]     # VMA 0x140018330, 3 octets nuls entre les deux
password = bytes(b ^ 0x37 for b in table)  # b"copper-owl-42"
flag = bytes(b ^ 0x5A for b in enc)        # b"FLAG{first_steps_1ab4f81e16df4d5c}"
```

Équivalent :

```c
int check(const char *s) {
    if (strlen(s) != 13) return 0;
    static const unsigned char table[] = {
        0x54,0x58,0x47,0x47,0x52,0x45,0x1a,0x58,0x40,0x5b,0x1a,0x03,0x05
    };
    for (int i = 0; i < 13; i++)
        if ((unsigned char)(s[i] ^ 0x37) != table[i]) return 0;
    return 1;
}
/* succès : puts("Unlocked! Your flag is:"); puis flag[i] = enc[i] ^ 0x5a */
```

---

## 4. Vérification

Console, Wine suffit (pas de GUI).

```bash
python3 tools/lantern01-solve.py -q
printf '%s\n\n' copper-owl-42 | wine original/lantern01.exe ; echo exit:$?
printf '%s\n\n' copper-owl-99 | wine original/lantern01.exe ; echo exit:$?
printf '%s\n\n' petik | wine original/lantern01.exe ; echo exit:$?
python3 tools/lantern01-solve.py --check
```

OK :

```text
Lantern 01 - beginner crackme
Recover the password or change the success path. No tricks.
Password: Unlocked! Your flag is:
FLAG{first_steps_1ab4f81e16df4d5c}
Press Enter to exit.
exit:0
```

KO, 13 octets faux (`copper-owl-99`) et mot trop court (`petik`) : `Incorrect password. Try again.`, exit 1.

`--check` envoie le password reconstruit, le mot de 13 octets faux, et `petik`. Il exige `Unlocked!` et le flag sur le bon chemin, et `Incorrect password.` sur les deux autres.

---

## 5. Notes

- Le flag n'est pas le password. `copper-owl-42` ouvre l'affichage ; `FLAG{first_steps_1ab4f81e16df4d5c}` est le second XOR, exécuté seulement si le check renvoie 1.
- Les deux constantes sont distinctes : `0x37` pour le password, `0x5a` pour le flag. En `.rdata`, `0x140018320` (13 octets) puis 3 NUL, puis le flag à `0x140018330`.
- `0x140001127` / `0x140001084` posent le cookie de pile. Ce n'est pas le prédicat.
- L'auteur autorise aussi de « changer le chemin de succès ». Patcher le `je` en `0x1400011de` afficherait le flag sans password ; la voie documentée ici est le password.
