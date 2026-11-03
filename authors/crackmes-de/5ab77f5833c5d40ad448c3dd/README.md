# keygenmev1_seasy — Keygenmev1 by d9a (pxor)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3dd`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3dd) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (pxor) — dialogue « Keygenmev1 by d9a », asm pur |
| **Plateforme** | Windows PE32 GUI (dialogue), 4 sections, ~4,6 Ko |
| **SHA-256 zip** | `8ec56e94ab88f0cae3237bd8e0f637c9ac6d5116e22767061364d0ed9df2a2b6` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/keygenmy.zip` | archive d'origine (non modifiée, mot de passe `crackmes.one`) |
| `analysis/extracted/keygenmy.exe` | exe extrait du zip (SHA-256 `b40fb658…c44f`) |
| `analysis/wine-verification.txt` | sortie du harness Wine (cas OK et KO) |
| `tools/keygenmev1-solve.py` | keygen / `--check` (modèle fidèle du handler) |
| `tools/wine-harness.c` | harness mingw : lance l'exe, remplit les 2 edits, clique Check, dumpe les fenêtres |

## Réponse

Keygen **nom → serial**. Serial = `AAAAAAAA-BBBBBBBB` (2 × 8 hexa **MAJUSCULES**).

| Nom | Serial |
|---|---|
| `petik` | **`00001002-DFBB71CC`** |
| `Bob` | `00001000-ED7D974D` |

```bash
python3 tools/keygenmev1-solve.py --name petik      # name=petik serial=00001002-DFBB71CC
python3 tools/keygenmev1-solve.py --name petik -q   # serial seul
python3 tools/keygenmev1-solve.py --check petik 00001002-DFBB71CC   # OK / KO
```

Nom : 3 à 31 caractères. `A` est libre (le keygen prend `0x1000` et monte), `B` en découle.

## Premier regard

```text
$ unzip -P crackmes.one original/keygenmy.zip -d analysis/extracted
$ file analysis/extracted/keygenmy.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386, 4 sections
```

- Imports minimaux (`DialogBoxParamA`, `SendDlgItemMessageA`, `MessageBoxA`, `EndDialog`…) : aucune API `GetDlgItemText`, tout passe par `SendDlgItemMessageA`.
- `strings` ne donne **aucun** message : les textes (« Good job… ») sont chiffrés dans `.data` (`0x403003`, `0x40301c`) et déchiffrés à la volée par la routine `0x401352` (`ror` 1/2/3 par octet), puis effacés par `0x401382`.
- Début de `.text` (`0x401000..0x4010a2`) : junk anti-désassemblage / SEH (`eb 01` + octets parasites, accès `dr0-dr7`) — **jamais exécuté** : l'entry point est `0x4010a3` (`and eax,0xff0000` pour obtenir hInstance=0x400000 — suppose `eax=entry`, comportement XP ; voir pièges).

## Flow

`DialogBoxParamA` → DlgProc `0x4010c0` :

| Message | Action |
|---|---|
| `WM_COMMAND` id `0x3ea` (1002, **Check**) | vérif name/serial, handler `0x401178` |
| id `0x3eb` / `0x3ec` | Exit / About (déchiffre et affiche un MessageBox) |
| `WM_INITDIALOG` | icône |

Contrôles : edit name = `0x3e8` (1000), edit serial = `0x3e9` (1001).

## Comment on trouve le prédicat

**Ancrage** : `objdump -d -M intel --start-address=0x401178 analysis/extracted/keygenmy.exe` ; .data brut à l'offset fichier `0xA00` (VA `0x403000`). Le handler est dans `0x401178..0x401350`.

### 1. Longueur du nom

```asm
401187: call SendDlgItemMessageA(hDlg, 0x3e8, WM_GETTEXTLENGTH=0xe, 0, 0)   ; eax = len
40118c: mov ecx,eax ; inc ecx
40118f: mov ebx,0x40312f ; xlat           ; al = table[len]
401195: rol eax,5 ; add eax,eax ; imul eax,eax ; neg eax
40119f: cmp eax,0 ; je fail
```

La table `0x40312f` vaut `0,0,0,1,1,…,1,0` : **zéro pour len 0..2 et ≥32**, 1 entre 3 et 31. Le `rol/add/imul/neg` n'est que de l'enrobage : non nul ⇔ `table[len]≠0`. Donc **3 ≤ len ≤ 31**.

### 2. Nom étendu à 32 octets

Le nom est lu (`WM_GETTEXT`) à `0x4031ab` puis **répété cycliquement** jusqu'à 32 octets (`rep movs` en boucle, `0x4011c2..0x4011e2`) : `petik` → `petikpetikpetikpetikpetikpeti`+`kp`… (`pad32()` dans le solveur).

### 3. Longueur du serial

Même principe avec la table `0x403163` : `add eax,eax ; rol eax,cl ; not ; add cl,al ; ror ; add eax,eax ; cmp eax,0xfffff92e`. Je l'ai rejoué pour toutes les longueurs : **seule len = 17 passe** (`0xfffff92e`). Piège : `cl` est modifié avant `push ecx`, donc la taille passée à `WM_GETTEXT` est `0xb3` (sans conséquence, ≥ 18).

### 4. Parsing `AAAAAAAA-BBBBBBBB`

```asm
40123f: cmp al,'-' ; jne loop ; cmp ecx,9 ; jne fail     ; tiret en 9e position
40124c: mov byte [esi-1],0                                ; coupe la chaîne
401265-401291: chiffres '0'-'9' ou 'A'-'Z' (-0x37), ebx |= d ; rol ebx,4 ; … ; ror ebx,4
401296: mov [edx*4+0x4031c8], ebx      ; edx=2 puis 1
```

1ʳᵉ moitié → `[0x4031d0]` = **A**, 2ᵉ moitié → `[0x4031cc]` = **B** (int32 signés). Les lettres sont acceptées jusqu'à `Z` (`-0x37`) mais seules `0-9A-F` donnent un hexa propre : minuscules refusées (`<0x41`… `>0x5A`).

### 5. Hash du nom (0x4012a2..0x4012c0)

```asm
xor eax,eax ; mov ebx,eax ; xor ecx,ecx        ; <-- ecx = 0 UNE seule fois
L: lodsb                    ; al = octet du nom étendu (haut de eax conservé !)
   add ebx,eax
   add cl,bl                ; cl s'ACCUMULE d'un tour à l'autre
   rol ebx,cl ; ror eax,cl
   add eax,ebx ; neg eax
   dec edx ; jne L           ; 32 tours
```

Pièges : la boucle reboucle en `0x4012b2` (après le `xor ecx,ecx`) donc **`cl` s'accumule** ; et `lodsb` ne remplace que `al`. Ma 1ʳᵉ version du solveur remettait `cl` à zéro à chaque tour → hash faux → serial rejeté sous Wine ; c'est la comparaison avec une émulation Unicorn de `0x4012a2..0x4012f0` qui a révélé la divergence (`petik` : H réel = `0xcff8f56c`).

### 6. Test FPU (0x4012c3..0x4012f9)

```asm
fld tbyte [0x403197]    ; x = 1.22   (0x9c28f5c28f5c28f6, exp 0x3fff)
fld tbyte [0x403197]
fimul dword [0x4031cc]  ; st0 = x·B
fmulp st1               ; st0 = x²·B
fld tbyte [0x4031a1]    ; y ≈ 0.4883 (0xfa0f9096bb98c7e3, exp 0x3ffd)
fimul dword [0x4031d0]  ; st0 = y·A
fsub st1,st             ; st1 = x²·B − y·A
fincstp                 ; st0 = x²·B − y·A
fistp [esp] ; fild [esp] ; ficom [esp+4]   ; arrondi au plus proche vs H (pushé en 0x4012c2)
fstsw ax ; sahf ; jne fail
```

Condition : **`round(x²·B − y·A) == H`** (int32 signé). Décodage des `long double` : mantisse/2⁶³ · 2^(exp−0x3fff).

### 7. Assemblage (exemple `petik`)

1. `H(petik)` = `0xcff8f56c` = −805 767 828.
2. Choisir `A = 0x1002` (4098).
3. `B ≈ (H + y·A)/x²` ≈ -541363764 ; on cherche l'entier B dont la valeur exacte est à < 0,25 d'un entier (évite les égalités d'arrondi) → `B = 0xDFBB71CC` (= -541363764 signé).
4. Serial = `%08X-%08X` → **`00001002-DFBB71CC`**.

Le succès affiche un MessageBox (titre déchiffré) ; l'échec efface silencieusement `0x4031ab..` (`rep stos`, 0x32 octets) sans message.

## Vérification

Harness Wine (`tools/wine-harness.c`, fixe `eax=entry` puis envoie `WM_SETTEXT` aux deux edits et `WM_COMMAND 0x3ea`) :

```bash
i686-w64-mingw32-gcc -o /tmp/harness.exe tools/wine-harness.c -luser32
xvfb-run -a wine /tmp/harness.exe analysis/extracted/keygenmy.exe petik 00001002-DFBB71CC
```

| Nom | Serial | Résultat Wine |
|---|---|---|
| `petik` | `00001002-DFBB71CC` | **OK** : MessageBox « Good job young crax0r :P » — *Good job keygen this bitch and send me sources+tutorial :D (pxor@go2.pl)* |
| `Bob` | `00001000-ED7D974D` | **OK** (même MessageBox) |
| `LongNameLongNameLongNameLongNa` (31) | `00001002-C7CD2F57` | **OK** |
| `petik` | `00001001-450D4FE4` (serial invalide) | **KO** : pas de MessageBox |

Trace complète : [`analysis/wine-verification.txt`](analysis/wine-verification.txt). Pas de session GDB : reverse statique + Unicorn (prototype) + Wine.

## Notes

- Pas un serial fixe : dépend du nom, mais A est libre ⇒ une infinité de serials par nom.
- Les messages sont chiffrés (`ror` 1/2/3 cyclique) : `strings` ne montre rien d'utile.
- Le préambule `0x401000..0x4010a2` est du leurre ; le vrai code démarre en `0x4010a3`.
- Sous Wine, l'`eax` initial n'est pas l'entry point : le harness le force pour que `and eax,0xff0000` donne `hInstance=0x400000` (même astuce que serialiseme).
