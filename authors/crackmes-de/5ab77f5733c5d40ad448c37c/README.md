# Crackme#1 / crackme1_lucky — KLiZMA

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c37c`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c37c) — voir [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (KLiZMA) |
| **Plateforme** | Windows PE32 console (i386), MinGW, packé FSG 2.0 |
| **SHA-256 zip** | `34e6325129e72561e46860ca70d74bcdcd0f1c3d4c3c656cf7f0326e935e6abc` (mot de passe `crackmes.one`) |
| **Type** | serial numérique unique (`scanf("%ld")`), pas de nom → pas de `petik` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Crackme#1_by_KLiZMA.zip` | archive d'origine (`crackme.exe` + `rulz.txt`), non modifiée |
| `tools/crackme1-lucky-solve.py` | solveur / validateur ; `--check` lance l'exe d'origine sous Wine (cas OK + KO) |
| `tools/crackme1-unpack.py` | dépack FSG par émulation unicorn → `analysis/crackme1-fsg-image.bin` |
| `analysis/crackme1-orig.exe` | `crackme.exe` extrait du zip |
| `analysis/rulz.txt` | consignes de l'auteur (« unpack it, find serial, keygen, tutorial ») |
| `analysis/crackme1-fsg-image.bin` | image `0x400000..0x408000` après décompression FSG |
| `analysis/crackme1-unpacked-0x401000.asm` | `objdump -D` du code dépacké |

## Réponse

| Serial (exemple) | `123006` |
|---|---|
| Règle | entier 0..999999 ; avec 6 chiffres `abcdef` : `a+b+c == d+e+f` |

```bash
python3 tools/crackme1-lucky-solve.py            # 123006
python3 tools/crackme1-lucky-solve.py -q         # serial seul
python3 tools/crackme1-lucky-solve.py --serial 100001   # valide un autre serial (local)
python3 tools/crackme1-lucky-solve.py --check    # exécute l'exe d'origine sous Wine (OK + KO)
```

## Premier regard

```text
$ file crackme.exe
PE32 executable for MS Windows 4.00 (console), Intel i386 (stripped to external PDB), 2 sections
$ diec crackme.exe
PE32  Packer: FSG(2.0)
$ strings -n 4 crackme.exe     # presque rien : seulement "…FSG!" et des miettes de la stub
```

Deux sections sans nom : `0x401000` (vide, `0x6000` octets virtuels, destination du dépack) et `0x407000` (données compressées, `0x859` octets). L'EP est `0x400154`, **dans l'en-tête PE** : c'est la stub FSG (`xchg esp,[0x40781c]` / `popa` / boucle de décompression LZ avec `call [ebx]`…). La section 2 contient aussi les noms `LoadLibraryA` / `GetProcAddress` utilisés par la stub.

## Dépack (étape 1 de `rulz.txt`)

Pas besoin d'UPX ici : on **émule** la stub avec unicorn (même méthode que pour les autres KLiZMA du dépôt, ex. `crackme_4_combo`) :

1. mapper `0x400000..0x408000`, y copier l'en-tête (`0x200` premiers octets) et la section 2 à `0x407000` ;
2. pile à `0x5f0000`, démarrer à `0x400154` ;
3. la stub décompresse vers `0x401000`, puis tente de résoudre les imports (appel vers une adresse non mappée : `UC_ERR_FETCH_UNMAPPED` à `0x783a`, observé) : l'exception est attendue, le code est **déjà** décompressé à ce moment ;
4. dumper l'image.

```bash
python3 tools/crackme1-unpack.py     # → analysis/crackme1-fsg-image.bin
strings -n 6 analysis/crackme1-fsg-image.bin   # Your serial: / Good! Write tutorial! / Not valid! Try again! / 6 chars, plz
objdump -D -b binary -m i386 -M intel --adjust-vma=0x400000 --start-address=0x401000 --stop-address=0x407000 analysis/crackme1-fsg-image.bin
```

Piège : l'EP n'est pas dans une section et la stub n'a pas d'API Windows réelle sous unicorn → on ne cherche pas à « finir » le dépack proprement, on prend l'image dès que le code apparaît à `0x401000` (début `55 89 e5 83 ec 18…`).

## Flow

`main` @`0x401290` (MinGW, `__main` en `0x4014b0`) :

```asm
4012ba  mov  [esp],0x403000        ; "\nYour serial: "
4012c1  call 0x401920              ; printf
4012cd  mov  [esp],0x40300f        ; "%ld"
4012d4  call 0x401910              ; scanf(&serial)
4012d9  mov  eax,[ebp-4]
4012df  call 0x401310              ; check(serial)
4012e4  cmp  eax,1
4012e7  jne  0x4012f7
4012e9  mov  [esp],0x403013        ; "\nGood! Write tutorial!"
4012f7  mov  [esp],0x40302a        ; "\nNot valid! Try again!"
401303  call 0x401890              ; _getch (attente d'une touche)
```

## Comment on trouve le prédicat

**Ancrage** : après le dépack, on cherche les chaînes (`0x403000`) puis leurs xrefs — `main` charge `0x40300f` (`%ld`) puis appelle `0x401310` avec le long lu. Tout le contrôle est dans cette fonction.

**1. Garde de plage** (`0x401317`)

```asm
cmp  DWORD PTR [ebp+8],0      ; js  -> message
cmp  DWORD PTR [ebp+8],0xf423f ; jg -> message   (0xf423f = 999999)
```

Hors de `[0, 999999]`, le programme affiche `6 chars, plz` (`0x403041`) mais **ne quitte pas** et poursuit le calcul : la garde n'est qu'informative, on reste dans la plage de toute façon.

**2. Extraction des chiffres** (`0x401334`) — boucle `i = 0..5` :

```asm
imul ecx, 0x66666667 ; sar edx,2 ; … sub edx,eax   ; q = n / 10  (division par 10 par multiplication magique)
shl eax,2 ; add eax,edx ; add eax,eax              ; q*10 = (q<<2 + q) * 2
sub ecx,eax                                        ; r = n - 10*q = n % 10
mov [ebx],al                                       ; buf[i] = r
mov [ebp+8], q                                     ; n = q
```

`ebx = ebp-8+i-0x20 = ebp-0x28+i` : le **chiffre des unités est dans `buf[0]`**, puis dizaines, etc. (ordre inversé, `buf[5]` = chiffre de plus fort poids).

**3. Comparaison** (`0x40138d`)

```asm
movsx edx,[ebp-0x28] ; movsx eax,[ebp-0x27] ; add edx,eax ; movsx eax,[ebp-0x26] ; lea ecx,[edx+eax]  ; ecx = buf0+buf1+buf2
movsx edx,[ebp-0x25] ; movsx eax,[ebp-0x24] ; add edx,eax ; movsx eax,[ebp-0x23] ; lea eax,[edx+eax]  ; eax = buf3+buf4+buf5
cmp ecx,eax ; jne -> return 0 ; sinon return 1
```

Donc `u + d + c == m + dm + cm` : somme des 3 chiffres de poids faible = somme des 3 de poids fort. C'est le « ticket chanceux » (*lucky ticket*), d'où le nom `crackme1_lucky`. La condition est symétrique, donc inutile de se soucier de l'ordre des chiffres.

**4. Assemblage de la réponse** : `123006` → chiffres `1,2,3 | 0,0,6` → 6 == 6 ✔. `123457` → 6 ≠ 16 ✘. Il y a 55 252 tickets valides sur 10⁶ (dont `000000`).

## Vérification

```text
$ python3 tools/crackme1-lucky-solve.py --check
serial = 123006  (valide)
--- 123006:
Your serial:
Good! Write tutorial!
--- 123457:
Your serial:
Not valid! Try again!
check OK
```

(exécution de l'exe d'origine extrait du zip, sous `xvfb-run -a wine`, entrée par stdin.)

## Notes

- Aucun GDB / debugger live utilisé : reverse statique du code dépacké + émulation unicorn, preuve finale sous Wine.
- Pas de nom → l'exemple `petik` ne s'applique pas.
- `rulz.txt` demande de dépacker, trouver le serial, écrire un keygen et un tutoriel : le solveur sert de keygen (n'importe quel ticket équilibré marche), ce README de tutoriel.
