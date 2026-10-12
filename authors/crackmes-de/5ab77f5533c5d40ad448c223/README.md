# asm_keygen_me_2 by kkr_we_rule

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c223`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c223) · [ORIGIN](ORIGIN.yml) |
| **Auteur** | KKR (réimport crackmes.de, local `crackmes-de`) |
| **Publié** | 2018-03-25 (keygenme d'octobre 2010) |
| **Plateforme** | Windows PE32 GUI, assembleur Win32 (4 Ko, pas de packer), boîte de dialogue |
| **Difficulté** | 2.0 |
| **SHA-256 exe** | `011f9da0e351b3324c25bcde84b3c3ad654995e623104385cca7cc08c511f898` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/KeygenMe2.zip`, `original/KeygenMe2/KeyGen ME - 2.exe`, `original/KeygenMe2/ReadMe.txt` | archive + binaire d'origine + consignes |
| `analysis/disasm.txt` | `objdump -d -M intel` de `.text` (tout le programme) |
| `tools/asm_keygen_me_2-keygen.py` | keygen (`-q`, `--check SERIAL`) |
| `tools/drive.c`, `tools/verify-wine.sh` | preuve live sous wine/Xvfb |
| `analysis/wine-run.txt` | sortie de la preuve live (3 OK, 3 KO) |

## Réponse

Serial au format **`A-B`** (deux entiers décimaux) avec `A + B == K(nom)` et ni `A` ni `B` multiple de 3.

```
Nom    : petik
Serial : 2--2            (K = 0 : A = 2, B = -2)

Nom    : crackmes
Serial : 2-2727326       (K = 2727328)
```

```bash
python3 tools/asm_keygen_me_2-keygen.py petik             # serial : 2--2
python3 tools/asm_keygen_me_2-keygen.py petik --check 2--2   # OK
tools/verify-wine.sh petik 2--2                           # MessageBox « Congratz!! / Well Done. Now write a KeyGen. »
```

Le nom doit faire **au moins 4 caractères**.

## Premier regard

```
KeyGen ME - 2.exe: PE32 executable for MS Windows 4.00 (GUI), Intel i386, 3 sections (.text/.data/.rsrc)
```

Code de 0x3DA octets, assembleur pur, pas de packer : `objdump` suffit. Imports : `DialogBoxParamA`, `GetDlgItemTextA`, `MessageBoxA`, `EndDialog` (user32), `lstrcpynA`, `lstrcpyA`, `lstrlenA`, `RtlZeroMemory` (kernel32), `StrToIntA` (shlwapi).

Chaînes : `Well Done. Now write a KeyGen.` / `Congratz!!` et `Nah.. Go look some more !` / `Not even close!`. `ReadMe.txt` : « *Keygen is the only soln as always* ».

## Flow

1. `0x401000` : `DialogBoxParamA(…, 0x65, …, DlgProc=0x401028)`.
2. `DlgProc` : `WM_COMMAND` / `0x3EB` (bouton) → `check(hDlg)` en `0x401066`.
3. `check` :
   - nom (`0x3E9` → `0x402000`) : `GetDlgItemTextA` doit renvoyer **> 3**, sinon sortie muette ;
   - serial (`0x3EA` → `0x402100`) : non vide, et doit contenir un `-`, sinon « Nah.. » ;
   - découpage au premier `-` : `A` → `0x402400`, `B` → `0x402500` (via `lstrcpynA` / `lstrcpyA`) ;
   - calcul de `K(nom)`, puis trois tests sur `A` et `B` ;
   - à la fin, `0x401319` remet tous les buffers à zéro (`RtlZeroMemory`).

## Comment on trouve le prédicat

### Découpage du serial (`0x4010AF..0x401103`)

```asm
4010b4: movzx ax, byte [esi]      ; parcourt le serial
4010b8: cmp   ax, '-'             ; premier '-'
4010c1: jne   ...                 ; pas de '-' → 0x4011fb (« Nah.. »)
4010c8: mov   byte [esi], 0       ; coupe la chaîne
4010d7: lstrcpynA(0x402200, serial, idx+1)   → A
4010e6: lstrcpyA (0x402400, 0x402200)
4010ee: inc esi / lstrcpyA(0x402300, esi)    → B (tout ce qui suit le premier '-')
401103: lstrcpyA (0x402500, 0x402300)
```

`B` peut donc lui-même commencer par un `-` : `2--2` donne `A = "2"`, `B = "-2"`.

### Deux hashs 16 bits du nom

`0x401222` (résultat `h1` dans `ecx`) :

```asm
401238: movzx ax, byte [esi]   ; ax = c
40123c: add  dx, ax            ; dx += c
40123f: imul dx, ax            ; dx *= c
401243: xor  dx, ax
401246: shl  dx, 2
40124a: shr  ax, 2             ; ax = c >> 2 pour la suite du tour
40124e: xor  dx, ax
401251: add  dx, dx
401254: sub  dx, ax
401257: ror  dx, 4
40125b: xor  dx, ax
40125e: sub  dx, ax
401261: xor  dx, ax
```

`0x401273` (résultat `h2` dans `edx`) : `bx = ((((bx + c) ^ c) - c) & c)` par caractère. Le `and` final avec le caractère courant fait que `h2` est souvent petit, voire nul (`petik` → `h2 = 0`).

### Clé `K` (`0x401134..0x40117F`)

```asm
401134: push 3 / push h1 / call 0x4012f3   ; 0x4012f3(x, n) = x^n  (imul en boucle) → h1³
401141: sub  eax, h1                       ; g1 = h1³ - h1
40115b: ...                                ; g2 = h2³ - h2
401173: xor eax, ecx                       ; g1 ^ g2
401175: and eax, ecx                       ; & g2
401177: add eax, ecx                       ; + g2   → v
40117a: call 0x4012aa                      ; ebx = f(v)
40117f: mov [0x4027ec], ebx                ; K
```

`0x4012aa` a l'air de faire « +1 si impair », mais le `mov ebx,[ebp+8]` en `0x4012c3` écrase toujours le résultat : **`K = v`** dans tous les cas.

```asm
4012b6: idiv ecx (2) / cmp edx,0 / je 4012c3
4012bd: mov ebx,[ebp+8] / add ebx,1     ; jamais conservé…
4012c3: mov ebx,[ebp+8]                 ; … écrasé ici
```

### Tests sur `A` et `B` (`0x40118B..0x4011E3`)

`0x4012ca(3, x)` est un **PGCD d'Euclide** par `idiv` signé, résultat dans `ebx` :

```asm
4012d5: cmp ebx, 0 / je fin
4012da: mov esi, ebx / mov ecx, ebx
4012de: cdq / idiv ecx           ; edx = eax mod ebx
4012e1: mov ebx, edx / mov eax, esi
4012e7: mov ebx, esi             ; ebx = dernier diviseur non nul = pgcd
```

```asm
401198: call 0x4012ca(3, StrToIntA(A)) / cmp ebx,1 / jne KO   ; A non multiple de 3
4011b3: call 0x4012ca(3, StrToIntA(B)) / cmp ebx,1 / jne KO   ; B non multiple de 3
4011db: add eax, ecx                                          ; A + B
4011dd: cmp [0x4027ec], eax / jne KO                          ; == K
```

## Prédicat consolidé

```
h1, h2 = hash16_1(nom), hash16_2(nom)        len(nom) >= 4
K = (((g1 ^ g2) & g2) + g2) mod 2^32          avec g = h³ - h (mod 2^32)
serial = A "-" B
valide ⇔ pgcd_x86(3, A) == 1  et  pgcd_x86(3, B) == 1  et  A + B == K (mod 2^32)
```

Le keygen prend `A` petit (1 ou 2) et `B = K - A` (en entier signé 32 bits), en vérifiant les deux PGCD avec une émulation fidèle de la routine (`idiv` tronqué vers 0).

## Vérification

`tools/verify-wine.sh` lance l'exe d'origine sous `wine` dans un Xvfb ; `tools/drive.c` (compilé avec `i686-w64-mingw32-gcc`) remplit les deux champs, envoie `WM_COMMAND(0x3EB)` et lit la MessageBox (`analysis/wine-run.txt`) :

```
== petik 2--2             → Congratz!!       [Well Done. Now write a KeyGen.]
== petik 1--1             → Not even close!  [Nah.. Go look some more !]
== crackmes 2-2727326     → Congratz!!
== crackmes 1-2727327     → Not even close!  (2727327 est multiple de 3)
== kkr_we_rule 1-71743    → Congratz!!
== kkr_we_rule 1-71742    → Not even close!  (somme fausse)
```

## Notes

- **Piège du PGCD signé** : `1--1` a la bonne somme (0) mais échoue. Avec `idiv` signé, la routine renvoie `-1` pour `pgcd(3, -1)` (`3 idiv -1` laisse un reste 0, et le dernier diviseur vaut `-1`), et `-1 ≠ 1`. En revanche `pgcd(3, -2)` donne bien `1`, d'où le choix `2--2` pour `petik`. Le keygen teste chaque candidat avec cette émulation plutôt qu'avec un `% 3` naïf.
- Un `A = 0` laisserait `esi` non initialisé dans la routine (la boucle ne tourne pas) : le keygen ne l'utilise jamais.
- Il existe une infinité de serials valides par nom : seul le couple (somme, non-multiples de 3) compte.
- Pas de patch : l'exe d'`original/` n'est pas modifié.
