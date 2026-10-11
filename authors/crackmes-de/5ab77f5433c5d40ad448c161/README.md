# nts_crackme6 by cyclops (crackmes.de)

| | |
|---|---|
| Page | [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c161) · [ORIGIN.yml](ORIGIN.yml) |
| Auteur | cyclops (réimport crackmes.de, 2018-03-25) |
| Plateforme | Windows 32 bits, GUI MFC 4.2 (MSVC 6.0) |
| Difficulté | 2.0 |
| Objectif | « Create a working keyfilegen » (`Readme6.txt`) |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/NTS-Crackme6.zip` | archive d’origine (`Crackme6.exe`, `Readme6.txt`, `ReadMe-NTS-.txt`) |
| `tools/crackmes-de-nts-crackme6-solve.py` | générateur de `Key.cyc` |
| `analysis/wine-click-ok.sh` | preuve live : lance l’exe sous Wine, clique OK, capture l’écran |
| `analysis/screenshot-ok.png` / `screenshot-ko.png` | captures Wine (bon / mauvais keyfile) |

## Réponse

Fichier **`Key.cyc`** dans le répertoire courant du crackme :

```
ligne 1 : nom (5 à 28 caractères) + '\n'
ligne 2 : base64( 30 premiers octets de nom·nom·nom… )
```

Exemple avec **`petik`** :

```
petik
cGV0aWtwZXRpa3BldGlrcGV0aWtwZXRpa3BldGlr
```

```bash
./tools/crackmes-de-nts-crackme6-solve.py -o Key.cyc            # petik
./tools/crackmes-de-nts-crackme6-solve.py --name petikvx -o Key.cyc
```

Puis lancer `Crackme6.exe` et cliquer **OK** : le champ Status passe de « Un Registered!!! » à « Regged!!! ».

## Premier regard

```
$ file Crackme6.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386, 4 sections
$ diec Crackme6.exe
Microsoft Visual C/C++ 6 (12.00.8168) [C++], MFC 4.2, pas de packer
```

`strings` donne l’essentiel :

- `Un Registered!!!`, `Regged!!!`, `Key.cyc`, `r` → un keyfile ouvert en lecture ;
- imports MSVCRT `fopen` / `fgets` / `fclose` ;
- une chaîne bizarre `|$$$}rstuvwxyz{$$$$$$$>?@ABC…XYZ[\]^_`abcdefghijklmnopq` : c’est la **table de décodage base64 classique** (indexée à partir de `'+'`, valeur = octet − `0x3e`, `$` = caractère invalide).

## Flow

Le dialogue affiche « Un Registered!!! » au démarrage (`0x4012f0`, `SetDlgItemText(0x3e8, …)`).
Le bouton OK appelle `0x401490` :

```asm
4014b1  push 0x403048            ; "r"
4014b8  push 0x403040            ; "Key.cyc"
4014bf  call [fopen]
4014cc  je   0x401520            ; pas de fichier → rien
4014d9  push 0x1f / lea eax,[esp+0x10] / call [fgets]   ; ligne 1 : nom (31 max)
4014e3  push 0x2d / lea ecx,[esp+0x40] / call [fgets]   ; ligne 2 : clé (45 max)
4014f2  call 0x401410            ; check(nom, clé)
4014fa  test eax,eax
4014fe  push 0x403034            ; "Regged!!!"
401505  push 0x403020            ; "Un Registered!!!"
40150a  push 0x3e8 → SetDlgItemTextA
```

## Comment on trouve le prédicat

Ancrage : `objdump -d -M intel Crackme6.exe`, xref de `push 0x403040` (`Key.cyc`) → `0x401490`, puis la fonction appelée `0x401410`.

### `0x401410` — check(nom, clé)

```asm
401420  mov edi,ebp ; repnz scasb ; not ecx ; dec ecx   ; ecx = strlen(nom)
401429  mov esi,ecx ; dec esi                          ; n = strlen - 1
40142f  mov [esi+ebp],al                               ; nom[n] = 0  → coupe le '\n' de fgets
40142c  cmp esi,5  / jl  KO                            ; 5 ≤ n
401434  cmp esi,0x1c / jg KO                           ;     n ≤ 28
401449  repnz scasb ...                                ; strlen(clé)
401450  call 0x401190(clé, len, out)                   ; décodage base64
40145c  mov eax,ebx ; cdq ; idiv esi                   ; edx = i % n
401461  movsx ecx,[edx+ebp]                            ; nom[i % n]
401467  mov dl,[esp+ebx+0x10]                          ; out[i]
40146b  cmp edx,ecx / jne fin
40146f  inc ebx / cmp ebx,0x1e / jl boucle             ; i = 0..29
401478  cmp ebx,0x1e / sete al                         ; OK ssi les 30 octets collent
```

Donc : **les 30 octets décodés de la ligne 2 doivent être le nom répété** (`nom[i % n]`).
Piège : le programme retire toujours le dernier caractère de la ligne 1 (il suppose le `\n` de `fgets`) ;
sans retour à la ligne, le nom perd sa dernière lettre.

### `0x401190` — décodeur

Pour chaque caractère `c` de la clé :

```asm
4011ae  cmp al,0x2b / jb invalide      ; c < '+'
4011b6  cmp al,0x7a / ja invalide      ; c > 'z'
4011c3  mov al,[eax+0x40227d]          ; table (cf. strings) indexée par c
4011cd  cmp al,0x24 / jne +            ; '$' = invalide
4011d5  add al,0xc3 ; 4011d7 dec al    ; valeur = table[c] - 0x3e  (6 bits)
```

Tous les 4 caractères, `0x401150` reconstitue 3 octets :

```asm
out[0] = (v0 << 2) | (v1 >> 4)
out[1] = (v1 << 4) | (v2 >> 2)
out[2] = (v2 << 6) |  v3
```

C’est exactement base64 (`A`→0 … `/`→63). Un groupe incomplet (le `\n` final de la ligne 2) est ignoré.
30 octets = 40 caractères base64, sans `=` (30 est multiple de 3), ce qui tient dans le `fgets(…, 0x2d)`.

### Assemblage pour `petik`

1. `n = 5`, `nom·nom·… [:30]` = `petikpetikpetikpetikpetikpetik`
2. base64 → `cGV0aWtwZXRpa3BldGlrcGV0aWtwZXRpa3BldGlr`
3. `Key.cyc` = `petik\n` + cette ligne.

## Vérification (live Wine)

```bash
cd /tmp/nts6 && 7z x -pcrackmes.one …/original/NTS-Crackme6.zip
./tools/crackmes-de-nts-crackme6-solve.py -o Key.cyc
xvfb-run -a -s "-screen 0 640x480x24" analysis/wine-click-ok.sh ok.png
```

| Cas | Key.cyc | Résultat |
|---|---|---|
| OK | `petik` / `cGV0…BldGlr` | **Regged!!!** — [screenshot-ok.png](analysis/screenshot-ok.png) |
| KO | `petik` / dernier caractère base64 changé (`…BldGlx`) | Un Registered!!! — [screenshot-ko.png](analysis/screenshot-ko.png) |

## Notes

- Pas d’anti-debug, pas de packer : la difficulté est de reconnaître base64 derrière la table de décodage décalée.
- Le nom n’est jamais saisi dans la fenêtre : tout vient du keyfile, lu à chaque clic sur OK.
- Reverse 100 % statique (objdump) + preuve live Wine ; GDB non utilisé.
