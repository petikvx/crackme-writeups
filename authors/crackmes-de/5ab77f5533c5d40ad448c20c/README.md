# crackme_0.68 by bswap (crackmes.de)

« KeygenMe 0.68 » de Bswap (2002), « 100% written in Masm 7.0 … It has no dirty tricks. But it is a little tricky.
The key checking routine are only 282 bytes! ». Goal : *make a keymaker*.

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c20c> · [`ORIGIN.yml`](ORIGIN.yml)
- **Auteur** : crackmes.de (mirror) / bswap
- **Plateforme** : Windows **PE32** GUI (MASM), packé **FSG 1.31** (site : Unspecified/other) — difficulté 2.0
- **Archive** : `original/keygenme068.zip` → `KeygenMe068.exe` + `ReadMe.txt`
- **SHA-256 zip** : `8f91bb084cc1da93375037f87d2c84057e12020c93150e60a5acf46c0d646984`
- **Statut** : résolu, vérifié **sous wine/Xvfb** sur le binaire original packé (smiley = bitmap 501)

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/KeygenMe068.exe` | binaire d’origine (packé FSG, non patché) |
| `tools/unfsg-unicorn.py` | unpack FSG par émulation Unicorn → `analysis/KeygenMe068-unfsg.bin` + `analysis/imports.txt` |
| `tools/emu-check.py` | exécute le **vrai** code (init + check) du dump sous Unicorn |
| `tools/keygenme068-solve.py` | keymaker (code d’entrée + name + key) + `--check` |
| `tools/verify-wine.sh` | preuve live : wine + Xvfb + xdotool, visage comparé aux bitmaps ressources |
| `analysis/bitmap500-triste.png` / `bitmap501-smiley.png` | les deux bitmaps de statut (extraits des ressources) |
| `analysis/registered-petik.png` | capture OK |
| `analysis/ko-petik_petik_Tx.png`, `analysis/ko-key-sans-r.png` | captures KO |

## Réponse

Trois saisies successives :

| Étape | Contrainte | Exemple **`petik`** |
|---|---|---|
| 1. « Enter code to entry » | `c[0]==c[11]`, `c[2]==c[9]`, `c[0]!=c[9]` (≥ 12 car., 15 max) | **`petikabcdtep`** |
| 2. Name (16 car. max) | `name[12:14] == "Tl"` (≥ 14 car.) | **`petik_petik_Tl`** |
| 3. Key | 4ᵉ caractère `'r'` (le reste est ignoré) | **`petr`** |

```
$ python3 tools/keygenme068-solve.py
Code d'entrée = petikabcdtep
Name          = petik_petik_Tl
Key           = petr
```

Le « keygen » attendu (name → key) est donc trompeur : la key est **lavée** par le calcul et c’est le **nom** qui doit
contenir `Tl` aux positions 12–13.

## Premier regard

```
$ diec original/KeygenMe068.exe          → Packer: FSG(1.31)
$ objdump -h …                            → 2 sections sans nom, imports LoadLibraryA / GetProcAddress seulement
```

## Comment on trouve

### 0. Unpack

`tools/unfsg-unicorn.py` (repris du [keygenme_0.72](../5ab77f5533c5d40ad448c203/) du même auteur, IAT FSG à
`0x417470/0x417474`) : `LoadLibraryA` / `GetProcAddress` simulés, arrêt au premier `EIP` dans la section 1
→ **OEP = 0x401000**, dump `analysis/KeygenMe068-unfsg.bin`. La table d’imports reconstruite (`analysis/imports.txt`)
permet de repérer l’IAT (`0x402000..0x402098`) et de nommer les thunks `jmp [0x4020xx]` dans le désassemblage
(capstone sur le dump).

### 1. Le dialogue d’entrée (`0x401d0a`)

Au lancement, une petite fenêtre « Enter code to entry the Keygenme 0.68 » (edit `0xFA`, `EM_LIMITTEXT 15`). À chaque
`WM_COMMAND` de l’edit (donc à chaque frappe) :

```asm
401d71 call GetDlgItemTextA(hDlg, 0xfa, 0x403214, 0x10)
401d7a mov al, [0x403214] / mov ah, [0x403216] / bswap eax     ; c0, c2 en haut
401d87 mov al, [0x40321c] / mov ah, [0x40321e]                 ; c8, c10
401d92 mov bl, [0x403215] / mov bh, [0x403217] / bswap ebx     ; c1, c3 en haut
401da0 mov bl, [0x40321d] / mov bh, [0x40321f]                 ; c9, c11
401dac bswap eax                                               ; al = c0, ah = c2
401dae cmp al, bh / jne     ; c0 == c11
401db2 cmp bl, ah / jne     ; c9 == c2
401db6 cmp al, bl / je      ; c0 != c9
401dbe DestroyWindow + SetTimer(1000 ms) → EndDialog → dialogue principal
```

Les `bswap` brouillent la lecture mais, une fois les octets placés, il ne reste que 3 égalités. `petik` + `abcd`
+ `t` (=c2) + `e` (libre) + `p` (=c0) → `petikabcdtep`.

### 2. Le flag de la key (`0x4014a8`)

```asm
4014a8 cmp word [ebp+0x10], 0xc9 / je        ; toute notification de l'edit Key
4014c8 call GetDlgItemTextA(hDlg, 0xc9, 0x403224, 5)   ; 4 car. max → eax = min(len, 4)
4014cd add al, 0x6e
4014cf cmp al, [0x403227]                    ; 4e caractère
4014d7 mov dword [0x40305c], 1               ; flag « on peut tester »
```

Avec ≥ 4 caractères : `4 + 0x6E = 0x72 = 'r'`. Sans ce flag le bouton Register (`0x12D`) ne fait **rien**
(`cmp [0x40305c], 1 / jne`). Le flag est remis à 0 après un succès.

### 3. Register (`0x40152f`) — la key passe à la moulinette

- Name → `0x40322a` (16 car.), Key → `0x40323b` (16 car.).
- Conversion « hex » de la key en 8 octets à `0x40327f` (`sub 0x30`, `sub 7`, majuscules ; `dec ecx` + `loop` = 8 tours).
- Puis **0x3999 tours** sur `eax = dword[0..3]`, `ecx = dword[4..7]` :

  ```asm
  4015e9 add ecx, 0x2345
  4015ef sub eax, 0x7890
  4015f4 shr eax, 2           ; perte de 2 bits par tour
  4015f7 add al, [edi]        ; table 0x4032a4+i
  4015f9 bswap eax
  4015fb sub cl, [edi+1]
  4015fe shl ecx, 2           ; ecx d'origine entièrement sorti après 16 tours
  ```

  Avec `shl 2` sur `ecx` et `shr 2` + `bswap` sur `eax`, l’entrée est oubliée après quelques dizaines de tours :
  le résultat ne dépend que de la table. Vérifié en exécutant le vrai code sous Unicorn sur 300 keys aléatoires :
  **toujours** `T = 09 4C 95 64 6C 78 06 F3` (les 8 octets suivants, `0x403287..`, restent à 0).

- **Piège 1 : la table n’est pas dans le fichier.** `0x4032a3..+0x4000` est remplie au `WM_INITDIALOG`
  (`0x401394` : `eax = 0xdeacdf + 0x21`, `mov [edx], al / xor ax, cx / xor bl, cl / sub al, bl`, 0x4000 tours).
  Sur le dump brut (table à 0) on obtient un faux `T` (`… aa aa`) : `tools/emu-check.py` exécute d’abord cette init.

- Le nom est ensuite modifié : `name[15-i] += [0x4032bc+i]` (`0x40162c`, 16 tours) → `name'[j] = name[j] + ADD[j]`,
  `ADD = 38 E8 D2 17 E4 3C 82 5F 60 C0 02 27 AC 94 52 FF`.

### 4. Piège 2 : `repne cmpsw`

```asm
401639 mov cl, 8 / mov edi, 0x40322a / mov esi, 0x40327f
401645 repne cmpsw          ; répète TANT QUE les mots DIFFÈRENT
401648 jne 0x401688         ; aucun mot égal → bitmap 500 (triste)
40165d LoadBitmapA(0x1f5)   ; un mot égal → bitmap 501 (smiley)
```

`repne` (et non `repe`) : il suffit qu’**un seul** des 8 mots de 16 bits de `name'` soit égal au mot de `T` au même
indice. On calcule `name[j] = T[j] - ADD[j]` pour chaque mot :

| mot k | octets name[2k], name[2k+1] | imprimable ? |
|---|---|---|
| 0 | `d1 64` | non |
| 1 | `c3 4d` | non |
| 2 | `88 3c` | non |
| 3 | `84 94` | non |
| 4 | `a0 40` | non |
| 5 | `fe d9` | non |
| **6** | **`54 6c` = `Tl`** | **oui** |
| 7 | `ae 01` | non |

→ un nom d’au moins 14 caractères avec `Tl` en positions 12–13 : `petik_petik_Tl`. Le reste du nom et toute la key
(hors `'r'` en 4ᵉ position) sont libres.

## Vérification

```
$ tools/verify-wine.sh petikabcdtep petik_petik_Tl petr analysis/registered-petik.png
entrée OK, fenêtre : KeygenMe 0.68   -=Bswap=-
visage : SMILEY (bitmap 501) = enregistré  [d501=15.1 d500=38.9]
$ tools/verify-wine.sh petikabcdtep petik_petik_Tx petr analysis/ko-petik_petik_Tx.png
visage : TRISTE (bitmap 500) = refusé
$ tools/verify-wine.sh petikabcdtep petik_petik_Tl petx analysis/ko-key-sans-r.png
visage : TRISTE (bitmap 500) = refusé            # flag jamais posé, le bouton ne fait rien
$ tools/verify-wine.sh petikabcdxep petik_petik_Tl petr
code d'entrée refusé                              # c9 != c2
```

- **Live** : binaire original packé sous wine + Xvfb (2026-10-12), saisies et clic `xdotool` ; le visage affiché est
  comparé aux deux bitmaps ressources extraits (`analysis/bitmap50x-*.png`). Captures :
  [OK](analysis/registered-petik.png) · [KO nom](analysis/ko-petik_petik_Tx.png) · [KO key](analysis/ko-key-sans-r.png).
- **Émulation** : `tools/emu-check.py` exécute le vrai code (init `0x401394` + check `0x40158f..0x401648`) ;
  `name_ok()` du solveur concorde avec Unicorn sur 3 000 noms aléatoires (0 écart).

## Notes

- Pas de GDB : reverse statique sur le dump + Unicorn, preuve wine.
- La conversion hex de la key et les 0x3999 tours sont du **leurre** (résultat constant) ; l’auteur avait prévenu :
  « no dirty tricks, but a little tricky ».
