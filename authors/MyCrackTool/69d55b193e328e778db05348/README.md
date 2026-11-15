# MyCrackTool's learn for begineer

| | |
|---|---|
| **ID** | [`69d55b193e328e778db05348`](https://crackmes.one/crackme/69d55b193e328e778db05348) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | MyCrackTool |
| **Plateforme** | Linux ELF64 x86-64 (C++, GCC, PIE) — `download.bin` est en fait un **ZIP** |
| **SHA-256** | `99ed9b524f11be23508b3439252043bbdab8786a8e25f1cbad8b15acb9e41849` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP chiffré (mdp `crackmes.one`) contenant `beginner_ladder_pack.zip` (non modifié) |
| `analysis/pack/` | contenu extrait du zip interne : `easy_find_text`, `mid_math_xor`, `hard_mem_rip` (+ `.exe` Windows et `README.md` de l'auteur) |
| `tools/ladder-solve.py` | solveur + `--check` (extrait le zip d'origine et teste les 3 binaires) |

## Réponse

C'est un pack de **trois** crackmes (menu `1` = chinois, `2` = anglais, puis la saisie) :

| Niveau | Réponse |
|---|---|
| easy | `kali` |
| mid | pass 1 = `kali`, pass 2 = `777` |
| hard | `kali_secret_<time(0)/10>_key` — dynamique, change toutes les 10 s |

```bash
python3 tools/ladder-solve.py        # affiche les réponses (clé hard pour l'instant)
python3 tools/ladder-solve.py -q
python3 tools/ladder-solve.py --check
```

Pas d'username dans ce challenge (pas de `petik` à montrer).

## Premier regard

```bash
diec original/download.bin          # ZIP
python3 -I -c "import zipfile; z=zipfile.ZipFile('original/download.bin'); print(z.infolist())"
# -> beginner_ladder_pack.zip, flag_bits=1 (chiffré) ; mdp du site : crackmes.one
```

Le zip interne contient les 3 ELF, leurs versions `.exe` et un `README.md` (chinois + anglais) qui décrit
les niveaux : *easy* = `strings`, *mid* = « XOR 0x42 », *hard* = clé en mémoire dynamique.
`diec` : ELF64, GCC, glibc 2.4 ; les symboles C++ ne sont pas strippés et les fonctions
ont des noms chinois (`第一关` = « niveau 1 », `验证一下` = « vérifie », `现刷的钥匙` = « clé fraîchement générée »).

## Flow

Chaque binaire affiche `1 中文 / 2 english`, lit un entier (`cin >> int`, simple choix de langue :
seul le texte change) puis lit une ou deux chaînes (`cin >> std::string`).

## Comment on trouve

### easy — `easy_find_text`

`objdump -s -j .rodata easy_find_text` : à l'offset `0x2008` on trouve `kali\0` juste après
le `_IO_stdin_used`, avant les messages. Un `strings` aurait suffi (c'est l'objectif de l'auteur).
Le check est un `operator==(std::string, const char*)` (→ `char_traits::compare` → `memcmp`) contre ce `kali`.
Test : `printf '2\nkali\n' | ./easy_find_text` → « you find it good job ».

### mid — `mid_math_xor`

`objdump -d -M intel mid_math_xor` : `main` (0x13ce) lit deux chaînes et appelle
`第一关` (0x1309) puis `第二关` (0x1331).

```asm
; 第一关 : même operator== contre la chaîne en .rodata 0x2008 -> "kali"
131d: lea rdx,[rip+0xce4]      # 0x2008
132a: call operator==(string, const char*)

; 第二关
135c: cmp rax,0x3              ; length() == 3 sinon faux
136e: mov WORD PTR [rbp-0xb],0x7575 ; \
1374: mov BYTE PTR [rbp-0x9],0x75   ; / "uuu" = 0x75 0x75 0x75
...
1399: cmp al,0x37              ; chaque s[i] (i=0..2) comparé à 0x37 = '7'
```

Le « XOR 0x42 » : `0x75 ^ 0x42 = 0x37 = '7'`. Le tableau `uuu` est donc bien le chiffré de `777`, mais
le code ne le déchiffre pas : il compare directement chaque octet à `0x37`. Résultat identique : `777`
(et le message de succès le confirme : *« part 2 is 777 »*).
Piège : si on saisit `uuu` en croyant devoir fournir la valeur chiffrée → refus.

### hard — `hard_mem_rip`

Aucune chaîne secrète en dur, sauf un **format** en `.rodata` `0x3008` : `kali_secret_%ld_key`.
`main` (0x25b7) → `验证一下` (0x254d) :

```asm
2574: call 现刷的钥匙          ; construit un std::string "clé attendue"
2587: call operator==(string, string)   ; saisie == clé ?
```

`现刷的钥匙` (0x2449) :

```asm
2474: call time(0)
247c: movabs rdx,0x6666666666666667 ; division signée par 10 (réduction de force : mul-high + sar 2)
2489: imul rdx ; sar rax,2 ; sar rcx,63 ; sub rax,rcx   ; rax = time(0) / 10
24ac: lea rdx,[rip+0xb55]      ; "kali_secret_%ld_key"
24b3: mov esi,0x40
24c0: call snprintf            ; buf[64]
```

Donc clé = `"kali_secret_%ld_key" % (time(0) // 10)` : valable pendant une fenêtre de 10 s. La clé
n'est jamais dans le binaire — c'est ce que l'auteur appelle « la chercher en mémoire » avec un
debugger (breakpoint sur `operator==`, le 2e `std::string` contient la clé). Pour un solveur il suffit de
recalculer la formule au moment de la saisie (l'heure est lue **après** la saisie, d'où un petit risque
de chevauchement de fenêtre → le solveur réessaie).

Message d'échec (« too slow find memory address and break ») si la clé est périmée.

## Vérification

Tout est rejoué sur les binaires natifs extraits du zip d'origine par `--check` :

```text
$ python3 tools/ladder-solve.py --check
easy_find_text  ['kali']                     OK     # "you find it good job"
easy_find_text  ['nope']                     OK     # "no try one more time"   (KO)
mid_math_xor    ['kali', '777']              OK     # "very good ... part 2 is 777"
mid_math_xor    ['kali', '778']              OK     # "no you try deeper"      (KO)
hard_mem_rip    <hard_key>                   OK     # "you are god"
hard_mem_rip    ['kali_secret_0_key']        OK     # "too slow ..."           (KO)
```

Pas de GDB ni de debugger utilisé : reverse 100 % statique (`objdump`) + exécution native.

## Notes

- Le ZIP du site contient un ZIP chiffré avec le **même** mot de passe `crackmes.one`.
- Les `.exe` du pack sont les équivalents Windows (non analysés).
- Le « XOR 0x42 » de *mid* est un leurre pédagogique : la valeur saisie est `777` en clair.
- Le niveau *hard* dépend de l'horloge : pas de réponse fixe, d'où le solveur qui calcule à la volée.
