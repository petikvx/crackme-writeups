# crackmes.de's encrypted_v._2_find_the_right_word_to_pass (Korrect2.exe) by servitute

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3bc`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3bc) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (servitute) |
| **Plateforme** | Windows PE32 console, MinGW (gcc 2.x), section `.xxx` ajoutée (stub) |
| **SHA-256 (zip)** | `32f6c945d4f8e343c472d13668f0c6cbde2b0210a4d2d22f5f6068b67907c6e0` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/Korrect2_updated.zip` | archive d'origine (mot de passe zip `crackmes.one`), contient `Korrect2.exe` |
| `analysis/extracted/Korrect2.exe` | exe extrait (copie de travail, `original/` intact) |
| `tools/korrect2-solve.py` | solveur + `--check` (Wine/xvfb) |

## Réponse

**Mot de passe : `tschichold`** (pas de user, `petik` sans objet).

```bash
python3 -I tools/korrect2-solve.py -q        # tschichold
python3 -I tools/korrect2-solve.py --check   # lance l'exe sous xvfb-run wine
```

Le leurre `brunelleschi` (en clair dans `.rdata`) affiche `Ahahah! No!`. En pratique le test réel est **bien plus faible** que le mot complet : seul `input[5] == 'c'` compte (voir plus bas), donc `xxxxxcyy` passe aussi ; `tschichold` est le mot voulu par l'auteur (Jan Tschichold).

## Premier regard

```bash
file Korrect2.exe     # PE32 console i386, 8 sections
diec Korrect2.exe     # MinGW [stripped]
strings -n 6 Korrect2.exe
```

- Chaînes : `What's the right word to enter?`, `brunelleschi`, `Yes! Es ist gut!`, `Ahahah! No! Try again...`, `Nein! Try again...`, `pause`.
- Sections `.text .data .rdata .bss .idata .stab .stabstr` + une **`.xxx`** (0x600 octets @`0x408000`) ; l'**entry point est dans `.xxx`** (`0x408061`) → le titre « encrypted » : un stub (type PE-packer/crypter, `pusha`, `call $+5`/`pop ebp` delta, résolution `LoadLibraryA`/`GetProcAddress`, relocs/imports, `int3` + SEH) précède le vrai code MinGW. L'exe est tronqué (table de symboles) : `objdump -d` direct échoue → on désassemble les sections à la main.

## Flow

1. Stub `.xxx` (`0x408061`) → rend la main au CRT MinGW (`0x401000`, SEH de `__main`).
2. `main` @`0x4012b0` : banner, `gets(buf)` (`buf = ebp-0x78`), puis boucle de « tests ».
3. `strcmp(buf, "brunelleschi")` @`0x4015e2` → si égal, code `0x2b2` → `Ahahah! No!`.
4. Sinon, drapeau `[ebp-0xb8]` : `0` → `Yes! Es ist gut!`, `0x2b2` → `Ahahah!`, autre → `Nein!`.

## Comment on trouve le prédicat

Ancrage : `.text` est à l'offset fichier `0x400` (VMA `0x401000`) ; extraction + désassemblage brut :

```bash
unzip -P crackmes.one original/Korrect2_updated.zip -d analysis/extracted
dd if=Korrect2.exe of=/tmp/text.bin bs=1 skip=$((0x400)) count=$((0xe00))
objdump -D -M intel -b binary -m i386 --adjust-vma=0x401000 /tmp/text.bin
```

(Piège : le `-d` classique échoue — « file truncated » ; et lire à `0x401440` en mode binaire donne du `(bad)` si on tombe au milieu d'une instruction : redémarrer à une frontière connue, ici `0x401426`.)

`main` initialise 11 variables locales puis boucle 0x299/12 fois (c'est du bruit : une boucle `cmp [ebp-0xb0],0x64` vide, un `strlen`, deux écritures `'z'`,`'i'` hors du mot). Chaque itération recalcule le même jeu de variables :

```asm
40140a: cmp  BYTE PTR [ebp-0x73],0x63   ; buf[5] == 'c' ?
40140e: jne  40141c
401410: mov  [ebp-0xb0],0               ; oui -> 0
40141c: mov  [ebp-0xb0],0xffffffe0      ; non -> -32
401426: cmp  BYTE PTR [ebp-0x77],0x73   ; buf[1] == 's' -> [ebp-0x8c]=0 sinon -2
401442: cmp  BYTE PTR [ebp-0x78],0x74   ; buf[0] == 't' -> [ebp-0x90]
...
```

`buf[i]` = `[ebp-0x78+i]`. Table complète (variable, octet comparé) :

| i | attendu | variable | i | attendu | variable |
|---|---|---|---|---|---|
| 0 | `t` (0x74) | `ebp-0x90` | 5 | `c` (0x63) | `ebp-0xb0` |
| 1 | `s` (0x73) | `ebp-0x8c` | 6 | `h` (0x68) | `ebp-0xa8` |
| 2 | `c` (0x63) | `ebp-0x98` | 7 | `o` (0x6f) | `ebp-0x94` |
| 3 | `h` (0x68) | `ebp-0xa4` | 8 | `l` (0x6c) | `ebp-0xa0` |
| 4 | `i` (0x69) | `ebp-0x9c` | 9 | `d` (0x64) | `ebp-0xac` |

→ `t s c h i c h o l d` = **`tschichold`** (les chaînes ne sont pas dans le binaire : ce sont des immediates `cmp byte`, d'où l'absence dans `strings`).

Décision finale (`0x401552`) :

```asm
401552: mov eax,[ebp-0xb0] ; mov [ebp-0xb8],eax    ; flag = var de buf[5]
40155e: cmp [ebp-0xb8],0 ; jne 4015d4              ; le « tout à zéro » (0x401565..) ne peut
        ...                                        ; qu'AFFECTER flag à 0 (déjà 0 ici)
4015e2: call strcmp(buf,"brunelleschi") ; test eax,eax ; jne 4015f5
4015eb: mov [ebp-0xb8],0x2b2                       ; leurre
4015f5: cmp [ebp-0xb8],0 -> « Yes! » ; ==0x2b2 -> « Ahahah! » ; sinon « Nein! »
```

Le flag final vaut donc simplement la valeur de la variable de `buf[5]` (0 ssi `buf[5]=='c'`) ; les neuf autres comparaisons sont calculées mais **jamais lues** (et `ebp-0x88` reste à 0xc, jamais assignée : même le « tout à zéro » ne pourrait pas s'appliquer). Conséquence : tout mot dont le 6ᵉ caractère est `c` est accepté, sauf `brunelleschi` dont le 6ᵉ est `l`, de toute façon rejeté.

## Vérification

```bash
printf 'tschichold\n' | xvfb-run -a wine Korrect2.exe     # Yes! Es ist gut!
```

| Entrée | Résultat |
|---|---|
| `tschichold` | `Yes! Es ist gut!` |
| `xxxxxcyy` | `Yes! Es ist gut!` (validation faible : seul `buf[5]=='c'`) |
| `abcde` / `test` | `Nein! Try again...` |
| `brunelleschi` | `Ahahah! No! Try again...` (leurre) |

`tools/korrect2-solve.py --check` rejoue ces cas contre l'exe extrait de `original/`.

## Notes

- GDB/x64dbg/IDA non utilisés : reverse statique (`objdump` binaire) + preuve Wine.
- Le stub `.xxx` n'a pas eu besoin d'être analysé à fond : le code de `main` est en clair dans `.text`.
- `brunelleschi` est un faux mot de passe volontaire ; `gets` sans limite (overflow possible, hors sujet).
