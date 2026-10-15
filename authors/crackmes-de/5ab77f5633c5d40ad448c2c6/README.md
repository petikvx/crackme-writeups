# crackmes.de's patchme_1 by doomsweek

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2c6`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2c6) |
| **Auteur (site)** | crackmes.de (auteur réel : d00msweek / doomsweek) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 GUI, Visual Basic 6 **natif** (MSVBVM60) |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `1b5c37f0d8939d9b67de07db32b155c3263a013994eacb79c04c6cf5336f304f` |
| **SHA-256 (PatchME1.exe)** | `018a0d02220c4a219abf223bf70ab682cee0782edf12a1598f2b47ce0cb2845c` |

## Origine

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2c6
- Download : https://crackmes.one/download/crackme/5ab77f5633c5d40ad448c2c6
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Contenu

```
original/   PatchME1.exe, d00msweek.nfo, patchme1.zip
analysis/   disasm-handlers.txt, original-nag.png, patched-good-msgbox.png
tools/      patchme1-patch.py (patcher), verify-wine.sh (preuve wine)
```

## Énoncé

Le `d00msweek.nfo` (CP437) dit simplement :

> Make the nag disappear and the "good" MsgBox appear!

Pas de serial : c'est un **patchme** pur. Il faut que le programme, au
lancement, n'affiche plus le nag et affiche directement la « bonne » MsgBox.

## Reconnaissance

```
$ file PatchME1.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386, 3 sections
$ diec PatchME1.exe
Linker: Microsoft Linker(6.0) / Compiler: Visual Basic(6.00.8041)[Native]
```

`strings` montre trois forms :

| Form | Contenu | Rôle |
|---|---|---|
| `Form1` | caption `NaG!!!        -PatchME by d00msweek`, label « NAG !!!… Kick me … » | **nag** (form de démarrage) |
| `Form2` | « Nah !? WRONG! », « SOLVED !? », « wahahaha… » | leurre (mauvaise MsgBox) |
| `Form3` | « It was t0000 easy for you ! … », « Don't forget To EmAil me … » | la « bonne » form |

et les chaînes de MsgBox `Hindi !, Wrong !` / `Hindi ?` (« hindi » = « non » en
tagalog) et `PatchME Solved ! Good BYe`.

Au lancement original sous wine, seule la fenêtre `NaG!!! -PatchME by d00msweek`
apparaît (`analysis/original-nag.png`).

## Reverse

Le code natif est minuscule : trois procédures d'événement (voir
`analysis/disasm-handlers.txt`). Les imports sont ordinaux MSVBVM60 :
`#595` = `rtcMsgBox`, `#100` = `ThunRTMain`, plus `__vbaVarDup`,
`__vbaFreeVarList`, `__vbaEnd`.

| Adresse | Handler | Ce qu'il fait |
|---|---|---|
| `0x402710` | `Form1.Command1_Click` | `AddRef(Me)` → `__vbaEnd` (le bouton du nag quitte) |
| `0x402780` | `Form2.Command1_Click` | `MsgBox "Hindi !, Wrong !", vbQuestion (0x20), "Hindi ?"` → `End` |
| `0x4028a0` | `Form3.Command1_Click` | `MsgBox "PatchME Solved ! Good BYe", vbExclamation (0x30), "BYE"` → `End` |

Aucune branche conditionnelle à inverser : aucun code n'affiche jamais Form2 ou
Form3. Le « bon » message n'est atteignable qu'en changeant ce que le runtime
VB lance au démarrage.

### Structures VB6

En-tête `VB5!` à `0x401314` (offset fichier = RVA, alignements 0x1000) :

- `+0x2c lpSubMain = 0` → pas de `Sub Main`, le runtime charge la form de démarrage ;
- `+0x44 wFormCount = 3`, `+0x4c lpGuiTable = 0x4013a8`.

GUI table : 3 entrées de `0x50` octets.

| # | `+0x24` id | `+0x28` flags | `+0x40` taille | `+0x48` lpForm |
|---|---|---|---|---|
| 0 Form1 | 0 | **`0x110`** | `0x153` | `0x4011c0` |
| 1 Form2 | 1 | `0x180` | `0x177` | `0x402270` |
| 2 Form3 | 2 | `0x180` | `0x1ec` | `0x4023e8` |

Essais menés sous wine (tous reproductibles) :

- permuter les entrées 0 et 2 entières, ou seulement id/flags → toujours le nag
  (ou crash quand on donne `0x110` à Form3) : la form est identifiée par son GUID
  / son objet, pas par sa place dans la table ;
- `Form1.flags 0x110 → 0x100` → **plus aucune form** n'est chargée : le bit
  `0x10` est celui de la *form de démarrage* ;
- mettre `0x190` à Form3 ne suffit pas à la faire démarrer.

Conclusion : on retire le bit startup du nag et on fournit un **`Sub Main`**
(champ `lpSubMain`) qui appelle directement le handler de Form3.

## Patch

Code cave (zéros) en fin de `.text` à `0x402d00` :

```asm
402d00: 68 20 2d 40 00     push offset fakeMe      ; « Me » factice
402d05: e8 96 fb ff ff     call 0x4028a0           ; Form3.Command1_Click
402d0a: 33 c0              xor  eax, eax
402d0c: c3                 ret
402d20: dd 0x402d24                                ; fakeMe -> vtbl
402d24: dd 0, 0x402d30, 0x402d30                   ; QueryInterface, AddRef, Release
402d30: c2 04 00           ret 4                   ; AddRef/Release no-op
```

Le handler ne se sert de `Me` que pour `call [vtbl+4]` (AddRef) au début et
`call [vtbl+8]` (Release) à la sortie — un objet factice avec deux `ret 4`
suffit. Il appelle ensuite `rtcMsgBox` puis `__vbaEnd`, donc le programme quitte
proprement après le clic sur OK.

Octets modifiés :

| Offset | Avant | Après | Effet |
|---|---|---|---|
| `0x13d0` (GUI[0]+0x28) | `10 01 00 00` | `00 01 00 00` | Form1 (nag) n'est plus la form de démarrage |
| `0x1340` (VB5!+0x2c) | `00 00 00 00` | `00 2d 40 00` | `lpSubMain = 0x402d00` |
| `0x2d00…0x2d33` | zéros | cave ci-dessus | faux Sub Main |

Reproductible : [`tools/patchme1-patch.py`](tools/patchme1-patch.py) (vérifie
les octets attendus avant d'écrire). SHA-256 du binaire patché :
`390e87df1b038367461311d632d80957072e507837179fdfa91d2b3b0e42c4e3`.

## Vérification (wine + runtime VB6)

```
$ tools/verify-wine.sh
/tmp/PatchME1-patched.exe écrit ; sha256 = 390e87df…c4e3
fenêtre : PatchME1        # fenêtre cachée ThunderRT6Main du runtime
fenêtre : BYE             # MsgBox « PatchME Solved ! Good BYe »
```

Plus de fenêtre `NaG!!!` ; la MsgBox de réussite apparaît seule au lancement
(`analysis/patched-good-msgbox.png`). Avant patch, seule la fenêtre `NaG!!!`
était visible.

Variante plus simple (mais incomplète) testée aussi : `jmp 0x4028a0` à
`0x402710` → la bonne MsgBox s'affiche quand on clique sur le bouton du nag,
mais le nag reste visible, donc ne remplit pas l'énoncé.

## Status

- [x] reverse
- [x] write-up
- [x] solveur (patcher + vérif wine)
