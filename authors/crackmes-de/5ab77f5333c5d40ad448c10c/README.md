# recoded_keygenme_1 (recoded)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5333c5d40ad448c10c) · id `5ab77f5333c5d40ad448c10c`  
> Import crackmes.de — auteur **recoded**.

PE32 GUI **MASM** minuscule (3584 octets). Dialog `REcodeD KeygenMe #1` : name + serial, bouton **Register**. L’énoncé (`Read Me.txt`) demande un **keygen**, pas un patch.

| Fichier | Rôle |
|---|---|
| [`original/KeygenMe.exe`](original/KeygenMe.exe) | PE32 GUI (ne pas patcher) |
| [`original/KeygenMe_1.zip`](original/KeygenMe_1.zip) | archive auteur |
| [`original/Read Me.txt`](original/Read%20Me.txt) | énoncé |
| [`tools/recoded-kg1-solve.py`](tools/recoded-kg1-solve.py) | keygen + `--check` GUI |

## Réponse

| Champ | Valeur |
|---|---|
| Name | **`petik`** (4…19 caractères) |
| Serial | **`0C1D98B6-7D4A3072-07D08290-E41E90EA`** |

```bash
python tools/recoded-kg1-solve.py -q --user petik
# 0C1D98B6-7D4A3072-07D08290-E41E90EA
python tools/recoded-kg1-solve.py --check
# predicat: OK  petik → 0C1D98B6-…  seed=00401284
# gui: Congratulations!
# check: OK
```

OK : MessageBox `Congratulations!` / *Nice work. Now write a keygen for it.*  
KO : `Error!` / *Invalid Credentials.*

Le serial dépend du **name** et du pointeur `off_403087` (anti-debug). En usage normal (pas de debugger, ≥100 ms après l’ouverture), la graine du 4ᵉ round est **`0x401284`**.

---

## 1. Premier regard

```text
KeygenMe.exe: PE32 GUI Intel 80386, ImageBase 0x400000, EP RVA 0x1000
sha256  a1237b572ae7788fe07f6dbace38f173098542a114fd1871d9931cd73e65eec0
md5     ddfffa91418747b2e3482e3c6c9f3703
size    3584
```

Imports `user32` : `DialogBoxParamA`, `GetDlgItemTextA`, `SetDlgItemTextA`, `SetTimer`, `MessageBoxA`, `EndDialog`.  
Template dialog `0x65` : edits **1001** (name) / **1002** (serial), boutons **1003** Register / **1004** Exit, static **1006** (bannière défilante).

x32dbg MCP : `NO_TARGET`. Reverse **statique** IDA (MCP `ida`, base `0x400000`).

---

## 2. Flow

`start` `@ 0x401000` : `GetModuleHandleA` + `DialogBoxParamA(0x65, DialogFunc)`.

`DialogFunc` `@ 0x401028` :

1. `WM_INITDIALOG` (0x110) → `SetTimer(100 ms)`.
2. `WM_TIMER` (0x113) id 1 → scroller `sub_40122D` (anti-debug + `SetDlgItemTextA` sur 1006).
3. `WM_COMMAND` 1003 → check `sub_4010EF`.
4. 1004 / `WM_CLOSE` → `EndDialog`.

---

## 3. Comment on trouve le prédicat

### Format du serial

`GetDlgItemTextA(1002, 0x40303F, 40)` doit renvoyer **eax = 35**.  
`sub_4010A2` n’accepte que `0-9A-Fa-f` et un tiret aux indices `i` tels que `(i+1) % 9 == 0` (i = 8, 17, 26). Ces tirets sont **écrasés par un NUL**.

```text
AAAAAAAA-BBBBBBBB-CCCCCCCC-DDDDDDDD
 ^G0@40303F  ^G1@403048  ^G2@403051  ^G3@40305A
```

Quatre C-strings hex de 8 caractères, parsées par `sub_401304` (nibble MSB first → uint32).

Name : `GetDlgItemTextA(1001, 0x403197, 20)`, longueur **≥ 4**.

### Les quatre rounds (`sub_4010EF`)

Boucle `dword_4031B9 = 0..3`. Pour chaque round :

```text
ebx = target
pour chaque octet c du name (longueur renvoyée par GetDlgItemTextA) :
    si c != ' ' :
        ebx -= ROR32( (mul * (c & 0xFF)) & 0xFFFFFFFF , 19 )
ebx == 0  sinon Invalid Credentials
```

| Round | `mul` (`dword_40308B`) | `target` (parse hex) |
|---|---|---|
| 0 | G1 `@ 0x403048` | G0 `@ 0x40303F` |
| 1 | G2 `@ 0x403051` | G1 `@ 0x403048` |
| 2 | G3 `@ 0x40305A` | G2 `@ 0x403051` |
| 3 | **`off_403087`** (pointeur code) | G3 `@ 0x40305A` |

Donc `G0 = fold(G1)`, `G1 = fold(G2)`, `G2 = fold(G3)`, `G3 = fold(seed)` avec

```text
fold(mul, name) = Σ ROR32(mul * c, 19)   pour c ≠ espace
```

`imul` 32-bit : seuls les 32 bits bas du produit comptent (`ror eax, 13h`).

### Hex parser `sub_401304` `@ 0x401304`

Parcourt `strlen` octets, nibble `(val & 0xF) << 4*(len-1-i)`.  
Chiffre : `al - '0'`. Lettre : `sub al, 'W'` + `adc dl, 0` / `shl dl, 5` pour coller A–F et a–f sur 10–15. Sortie hex **majuscule** acceptée.

### Anti-debug : la graine du round 3

`.data` initialise `off_403087 = 0x4012A2`. Le scroller finit par `jmp off_403087` :

```text
4012A2  mov eax, fs:[30]        ; PEB
        mov eax, [eax+2]        ; BeingDebugged
        test al, al
        jz  40127A              ; pas de debugger
        mov off_403087, 4012BE  ; skip vers SetDlgItemTextA
40127A  mov off_403087, 401284
401284  ; même test PEB
        jz  SetDlgItemTextA
        mov off_403087, 4012BE
4012BE  SetDlgItemTextA(1006, buffer scroller)
```

Sans debugger, dès le **premier** `WM_TIMER` (100 ms) : `off_403087 = 0x401284`.  
C’est cette valeur que le round 3 utilise comme `mul` (pas un des blocs hex). Un debugger qui pose `BeingDebugged` bascule le seed sur **`0x4012BE`**. Avant le premier tick, le seed est encore **`0x4012A2`**.

Le keygen par défaut vise le cas GUI réel : process non débogué, utilisateur plus lent que 100 ms → `--seed 401284`.

### Keygen (exemple `petik`)

```text
seed = 0x401284
G3 = fold(seed, "petik") = 0xE41E90EA
G2 = fold(G3,   "petik") = 0x07D08290
G1 = fold(G2,   "petik") = 0x7D4A3072
G0 = fold(G1,   "petik") = 0x0C1D98B6
serial = 0C1D98B6-7D4A3072-07D08290-E41E90EA
```

`--seed 4012A2` / `4012BE` si on veut les deux autres pointeurs.

---

## 4. Vérification

```text
python tools/recoded-kg1-solve.py --check
predicat: OK  petik → 0C1D98B6-7D4A3072-07D08290-E41E90EA  seed=00401284
gui: Congratulations!
check: OK
```

KO utile : name `abc` (longueur 3) → le solveur refuse ; serial 35 chars hors hex → `Invalid Credentials.`

Preuve live : `WM_CHAR` dans les edits 1001/1002 (un `SetDlgItemText*` depuis Python **64-bit** ne met pas à jour le texte ANSI vu par `GetDlgItemTextA` dans le PE32), puis `BM_CLICK` sur Register. RPM : buffer `0x40303F` = `0C1D98B6` + NUL + `7D4A3072` + … (tirets déjà NUL), `off_403087 = 0x401284`, MessageBox **Congratulations!**.

x32dbg : pas de session sur cet exe.

---

## 5. Notes

- Les espaces dans le name sont **ignorés** par `fold` mais comptent dans la longueur (≥ 4).
- Le 4ᵉ groupe hex n’est **pas** une constante : c’est `fold` du pointeur anti-debug.
- La bannière `*** REcodeD - KeygenMe #1 *** …` est cosmétique (`dword_40306B = 0x82` caractères visibles).
- Ne pas patcher `original/KeygenMe.exe`.
