# saltedMacaroni841's Upgraded Levels Keygen (difficulty 1-3)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/66c724b9b899a3b9dd02ad98) · id `66c724b9b899a3b9dd02ad98`

ELF64 PIE console à 4 niveaux, menu interactif. L'auteur fournit lui-même
**réponses et indices** pour les niveaux 1-3 dans le ZIP (`answers/`,
`hints/`) ; le niveau 4 est un **vrai "écris ton keygen"** à mot de passe
*randomisé à chaque exécution*. Diff. site **2.0** ("1-3" affiché dans le
titre). Famille : [`../README.md`](../README.md) — suite de
[`Levels Keygen!`](../66a288ed90c4c2830c820fa0/).

| Fichier | Rôle |
|---|---|
| [`original/Levels_UPG_Mac841.zip`](original/Levels_UPG_Mac841.zip) | archive d'origine (binaire + `answers/` + `hints/` de l'auteur) |
| [`analysis/extracted/LEVELS_UPGRADED_FINAL/`](analysis/extracted/LEVELS_UPGRADED_FINAL/) | extraction non modifiée (binaire `lvlupByMacaroni841`, `answers/`, `hints/`) |
| [`tools/levels-solve.py`](tools/levels-solve.py) | solveur des 4 niveaux, `--level N`, `--check` |
| [`tools/_level4_patch.gdb.py`](tools/_level4_patch.gdb.py) | script GDB du niveau 4 (lecture + patch mémoire de la réponse du run) |

## Réponse

| Niveau | Entrée | Réponse |
|---|---|---|
| 1 | chaîne libre (ex. `hello`) | la même chaîne XORée par `4` caractère par caractère (ex. `lahhk`) |
| 2 | `argv[1] = "e"` | mot de passe `#q$!Mr` |
| 3 | `argv[1] = "0x3"` | mot de passe `01267567` |
| 4 | — (aléatoire par run) | pas de valeur fixe : voir § "Comment on trouve" |

```bash
python3 tools/levels-solve.py --level 1 --input hello   # calcule + verifie en live
python3 tools/levels-solve.py --level 2                 # argv[1]=e, password=#q$!Mr
python3 tools/levels-solve.py --level 3                  # argv[1]=0x3, password=01267567
python3 tools/levels-solve.py --level 4                  # exploite le niveau 4 via GDB
python3 tools/levels-solve.py --check                     # les 4 niveaux d'affilee, 0/1
```

## 1. Premier regard

```bash
unzip -l original/Levels_UPG_Mac841.zip
```

```text
LEVELS_UPGRADED_FINAL/answers/ans_{1,2,3,4}
LEVELS_UPGRADED_FINAL/hints/level_{1,2,3}/hint_*
LEVELS_UPGRADED_FINAL/lvlupByMacaroni841
```

**Les réponses des niveaux 1-3 sont données par l'auteur** (`ans_1`,
`ans_2`, `ans_3`, détaillées et pédagogiques) ; `ans_4` est volontairement
vide de réponse : *"The road ends here. Use what you've learned to try
and write a keygen for this level."* Binaire **stripped**, PIE, pas de
protection notable (reverse via le MCP `ida`, pas de symboles).

## 2. Niveaux 1-3 (anchoring, MCP `ida`)

### Niveau 1 — `sub_1456`

```c
fgets(s, 21, stdin);               // la chaine saisie
for (i = 0; i < strlen(s); i++) s[i] ^= 4;
// ... relis la version XORee, strcmp == check
```

Exactement ce que décrit `ans_1` : XOR chaque caractère par `4`. Vérifié
avec `hello` → `'h'^4='l'`, `'e'^4='a'`, `'l'^4='h'`, `'l'^4='h'`,
`'o'^4='k'` → `lahhk`.

### Niveau 2 — `sub_15CA(argv)`

```c
char s2[23];
qmemcpy(&s2[7], "0123456789abcdef", 16);   // leurre : jamais vu par strcmp
strcpy(s2, "1d86ce");                       // ecrase s2[0..6] -> NUL a l'indice 6
// -> s2 == "1d86ce" (6 car. ASCII = 0x31 0x64 0x38 0x36 0x63 0x65)
for (i = 0; i < strlen(password); i++) { password[i] ^= 0x12; password[i] += i; }
if (argv[1] && argv[1][0] == 'e' && strcmp(password, s2) == 0) WIN;
```

`strcpy(s2, "1d86ce")` tronque le buffer juste après les 6 caractères
voulus par `ans_2` (`0x31 0x64 0x38 0x36 0x63 0x65` = `"1d86ce"` en ASCII) ;
le `qmemcpy` des 16 chiffres hexa est un pur leurre, jamais comparé. En
inversant `password[i] = (target[i] - i) ^ 0x12` pour chaque position
(exactement la méthode d'`ans_2`), on obtient `"#q$!Mr"`, avec
`argv[1][0] == 'e'` (d'où `*(argv+1)` déréférencé deux fois dans le
pseudocode : `argv[1]` pointeur non nul, puis `argv[1][0]`).

### Niveau 3 — `sub_178D(argv, argc)`

```c
char v19[8] = "L0x31yy";
...
if (strlen(v19) > 3) strncat(dest, &v19[1], 3);   // dest = "0x3" (v19[1..3])
...
if (argc > 1 && strcmp(s1, "...warcrime...") == 0 && /* 7 comparaisons d'octets obfusquees */
    && argv[1] && argv[1][0] && strcmp(dest, argv[1]) == 0)
    WIN;
```

Beaucoup de variables mortes (`v9..v12`, les décalages bit à bit, le
`strcpy` de chaînes jamais relues) — exactement ce qu'`ans_3` annonce :
*"GCC permits this"*. Le seul test qui compte sur `argv` est
`strcmp(dest, argv[1])` avec `dest` construit depuis `"L0x31yy"[1..3]` =
`"0x3"` : **`argv[1]` doit être la chaîne littérale `"0x3"`** (pas l'octet
`0x03`). Le mot de passe (`"01267567"`) vient directement d'`ans_3`,
vérifié en live.

## 3. Niveau 4 — le vrai keygen (`sub_2373`)

```c
srand(time(NULL));
v5 = rand() % 4;  v6 = rand() % 3;  v7 = rand() % 5;   // choix d'affichage (ascii art, mot "Shlunga")
for (i = 0; i <= 5; i++) { v9[i] = rand() % 40; v13[i] = v14[v9[i]]; }  // 6 mots de la "prophecy"
// ... affiche l'ascii-art + la "prophecy" (6 mots tires de v14[40]) ...
fgets(s, 100, stdin);                                   // le mot de passe tape par l'utilisateur
for (j = 0; j <= 5; j++) v2 += (v9[j] > 20) ? -1 : 1;    // signe de v2 selon les tirages precedents
// ... construit un buffer de 6 octets ("la bonne reponse") a partir de v5, v6, v7,
//     du signe de v2 et d'une table d'octets fixe (v15), via sub_21C5 -> sub_205B -> sub_1E95 ...
if (memcmp(reponse, s, 6) == 0) WIN; else { sleep(1); retry; }  // sub_1DDF
```

Tout est **randomisé à chaque exécution** (`srand(time(NULL))`), mais rien
n'est caché : les mots de la "prophecy" et le mot ("Hunga/Bunga/.../
Skrunga Shlunga") viennent de `v13`/`v10`/`v12`, des tableaux affichés
directement — en théorie, un vrai keygen externe pourrait rejouer les
mêmes 40 mots (`v14`, extractibles du binaire) pour retrouver `v5`, `v6`,
`v7`, `v9[]` à partir du **texte affiché**, puis recalculer les 6 octets
de la réponse avec la même logique obfusquée (`sub_21C5`/`sub_205B`/
`sub_1E95`, une cascade de comparaisons `a11[a10]==a11[k]` byte-à-byte sur
des chaînes choisies dynamiquement).

### Pourquoi un oracle GDB plutôt qu'un keygen "pur Python"

La cascade `sub_21C5` → `sub_205B` → `sub_1E95` sélectionne, à chaque
niveau d'imbrication, l'un de plusieurs **jeux d'offsets fixes** (`2,4` ou
`7,4,9,9` dans `sub_205B` par exemple) selon des comparaisons
auto-référentielles sur les octets d'une chaîne dynamiquement choisie
(`a11[a10]==a11[0]`, `==a11[1]`, etc.) pour aller piocher des octets dans
un tableau constant (`v15`) et construire la réponse finale. C'est
reproductible à la main (c'est juste de l'arithmétique déterministe), mais
fastidieux et fragile à retranscrire sans erreur en dehors du binaire —
alors que le process **a déjà calculé la bonne réponse en mémoire, avant
même de lire notre saisie** (tout ce calcul dépend de `rand()`, pas de
l'entrée utilisateur). Plutôt que de retranscrire cette cascade
octet-par-octet en Python (risque d'erreur non détectée), on utilise GDB
comme **oracle + correcteur**, ce que l'énoncé du niveau autorise
explicitement :

> "IN THIS LEVEL, ANYTHING GOES EXCEPT PATCHING JUMPS OR ADDING NOPS!"

### L'exploit (`tools/_level4_patch.gdb.py`)

**Ancrage** : `sub_1DDF` (adresse fichier `0x1ddf`) est le dernier
comparateur :

```c
int sub_1DDF(_BYTE *a1, _BYTE *a2) {   // a1 = RDI = la bonne reponse (deja calculee)
    if (a1[0]==a2[0] && ... && a1[5]==a2[5]) return 1;   // a2 = RSI = notre saisie
    return 2;
}
```

1. `starti` (le binaire est PIE ; on laisse GDB le charger puis on lit sa
   base réelle via `info proc mappings` plutôt que de la deviner).
2. `break *(base + 0x1ddf)` — pile **avant** la première comparaison.
3. On fait avancer le menu jusqu'au niveau 4 et on tape **n'importe quelle**
   chaîne de 6 caractères comme mot de passe (elle ne sera jamais
   vraiment comparée).
4. Au breakpoint : on lit les 6 octets à `$rdi` (la vraie réponse de **ce**
   run, déjà calculée) et on les **écrit** à `$rsi` (où `fgets` avait
   stocké notre saisie bidon) — un patch de **données**, pas de code.
5. `continue` : `sub_1DDF` compare désormais `a1` à `a1` → `1` →
   `*LEVEL 4 [! COMPLETE !]*`.

```python
# extrait de tools/_level4_patch.gdb.py
def on_stop(event):
    rdi = int(gdb.parse_and_eval("$rdi"))
    rsi = int(gdb.parse_and_eval("$rsi"))
    answer = gdb.selected_inferior().read_memory(rdi, 6)
    gdb.selected_inferior().write_memory(rsi, answer)   # patch donnees, pas de jump/nop
    gdb.execute("continue")
```

## 4. Debug GDB (pas à pas)

```bash
gdb -q -batch -x tools/_level4_patch.gdb.py --args ./lvlupByMacaroni841 \
  <<< $'4\n\nAAAAAA\n\n5\n\n'
```

- `starti` arrête l'inférieur à `_start` dans `ld-linux-x86-64.so.2`
  (avant même le chargement de `lvlupByMacaroni841`). `info proc mappings`
  donne la base réelle du binaire (`r--p` sur son propre chemin) : avec
  `set disable-randomization on`, elle est stable (`0x555555554000` dans
  cet environnement), mais la calculer dynamiquement rend le script
  portable sans dépendre de cette valeur précise.
- Breakpoint posé sur `base + 0x1ddf` (`sub_1DDF`) : `$rdi` = pointeur vers
  la réponse déjà calculée, `$rsi` = pointeur vers notre saisie (`fgets`
  l'a stockée **avant** ce point, mais ça n'a aucune importance puisqu'on
  l'écrase).
- Après le patch + `continue` : `*LEVEL 4 [! COMPLETE !]*` s'affiche, puis
  le programme retourne au menu normalement (pas de crash, rien de cassé).
- **Piège** rencontré en développant ça : rediriger la sortie du binaire
  (ou de GDB) vers un **fichier** sans bornes est dangereux — si la
  séquence de touches envoyée ne correspond pas exactement au protocole du
  menu (`sub_12C9` : chiffre+Entrée **puis** Entrée seule pour "charger"),
  le programme boucle indéfiniment en réaffichant le menu sur une entrée
  stdin épuisée (EOF immédiat sur `fgets`), et le fichier de sortie peut
  grossir sans limite (vécu : 5 Go avant que le disque `/tmp` du
  bac à sable ne sature). Toujours utiliser `timeout` **et** laisser l'outil
  capturer la sortie lui-même (borné), jamais une redirection manuelle
  `> fichier` sans limite de taille.

## 5. Vérification

```text
$ python3 tools/levels-solve.py --check
level1=True level2=True level3=True level4=True

$ python3 tools/levels-solve.py --level 4
...
LEVEL4_ANSWER 2b5126262a40
...
*LEVEL 4 [! COMPLETE !] (How did you not rip your hair out?)*
OK
```

Edge case : lancer le niveau 2 avec `argv[1]` absent ou différent de `e`
(ex. sans argument) → `*LEVEL 2 FAILED TRY AGAIN*` même avec le bon mot de
passe `#q$!Mr` — confirme que le check sur `argv[1]` est bien actif et pas
un leurre.

## 6. Notes

- Dépôt original : l'auteur fournit lui-même les réponses 1-3 dans le
  ZIP ; ce write-up les **ancre** dans le désassemblage/pseudocode (MCP
  `ida`) plutôt que de les recopier brutes, et les **vérifie en live**
  contre le binaire. Le niveau 4 (non documenté par l'auteur) est
  entièrement résolu ici par reverse + exploitation dynamique.
- Le patch mémoire du niveau 4 est **data-only** (buffer de saisie),
  jamais le code — respecte explicitement la règle du niveau
  ("except patching jumps or adding nops").
- `original/Levels_UPG_Mac841.zip` reste intact ;
  `analysis/extracted/` est son extraction non modifiée.
