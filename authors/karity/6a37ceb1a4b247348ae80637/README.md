# karity's karity

| | |
|---|---|
| **ID** | [`6a37ceb1a4b247348ae80637`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a37ceb1a4b247348ae80637) |
| **Auteur** | karity |
| **Plateforme** | Windows PE64 console, C++ MinGW (stripped) |
| **SHA-256** | `c7e40438bd858d2bd44ce1fd98514ee0a81602f5ba7e524a900cc7f86470c918` |

| Dossier | Contenu |
|---|---|
| `original/karity-crackme-E.exe` | binaire d'origine |
| `tools/karity-solve.py` | solveur + `--check` (Wine) |

## Réponse

Le crackme est un **puzzle d'échecs** : mat en 3 coups des blancs. Pas de username (donc pas d'exemple `petik` côté nom ; `petik` sert juste de remplissage).

```text
petik__f7h6e6g8h6f7!
```

Format : 20 caractères = 7 libres + `f7h6` `e6g8` `h6f7` (UCI) + 1 libre.

```bash
python3 -I tools/karity-solve.py --check
```

## Premier regard

- `file` : PE32+ console x86-64 ; `strings` : `input: `, `good!`, `bad!`, un FEN en clair `5r1k/5Npp/4Q3/8/8/8/8/6K1 b - -`, une constante SHA-256 (IV `6a09e667…`) et un hash hex de 64 car. `9ebc3d39…f4974`.
- `wine` : affiche `input: ` puis `bad!`.

## Flow

1. `main` (VMA `0x14002c500`) lit une ligne, retire CR/LF, exige **longueur 20** (`cmp rax,0x14` en `0x14002c5fb`).
2. Parse le FEN embarqué (`0x14002f060`) dans un tableau de 64 octets (a1=0 … h8=63, `.` = vide).
3. Joue automatiquement un premier coup noir (le roi h8 est en échec par le cavalier f7), puis pour chaque coup lu dans l'entrée aux offsets **7, 11, 15** (`from` = 2 car. `a1`-style, `to` = 2 car.) :
   génère les coups, filtre les légaux (appliquer sur copie + test d'échec `0x14001f080`), vérifie que le coup saisi est dans la liste, l'applique ; les noirs répondent automatiquement.
4. Après le 3ᵉ coup : le roi noir doit être en échec et sans coup légal (**mat**), puis un SHA-256 de l'historique est comparé au hash embarqué → `good!`, sinon `bad!`.

## Comment on trouve

- **Ancrage** : `objdump -d -M intel`, xref sur les chaînes `.rdata` (`0x14002f057` « input: », `0x14002f052` « bad! », `0x14002f04c` « good! »). Pas d'IDA disponible ici : lecture asm + trace gdb attaché à Wine.
- **Format** : `0x1400018a0` convertit `[a-h][1-8]` en `col + 8*(rang-1)` (`lea eax,[rax+rdx*8-0x188]`). La boucle `0x14002c783` incrémente la position de 4 (`add [rsp+0x50],4`) en partant de 7 et s'arrête sur `cmp [rsp+0x50],0xf` → 3 coups aux offsets 7/11/15 ; les 7 premiers et le dernier caractère ne sont pas utilisés (`xxxxxxxf7h6e6g8h6f7x` marche aussi).
- **Piège** : le FEN dit « noirs au trait » mais le premier coup noir est joué par le programme : en dumpant le plateau à `0x14002c806` (breakpoint gdb) on voit le roi en g8, puis h8 après la réplique suivante. Les coups blancs sont donc à chercher après `…Kg8` / réponses du moteur.
- **Solution** : recherche de mat forcé (python-chess, hors dépôt) depuis la position après `Kg8` : seul premier coup gagnant `Nf7-h6+` (`f7h6`) ; réponse unique `Kg8-h8` (gxh6 illégal), puis `Qe6-g8+` (`e6g8`) `Rxg8` et `Nh6-f7#` (`h6f7`).
- Le hash n'est **pas** celui de l'entrée : changer les caractères libres reste `good!`.

## Debug GDB (pas à pas)

```bash
# Wine lit stdin sur une fifo ; on attache gdb au process Windows
mkfifo /tmp/ff; (xvfb-run -a wine original/karity-crackme-E.exe < /tmp/ff &)
sleep 6; gdb -q -batch -p $(pgrep -f '[Z]:.*karity-crackme-E.exe' | tail -1) -x cmds
printf 'xxxxxxxf7d6e6f7g7g6x\n' > /tmp/ff   # une fois gdb attaché
```

`cmds` : `handle SIGSEGV nostop noprint pass` (Wine s'en sert) ; `break *0x14002c806` (après génération des coups) puis `x/s $rsp+0x1c0` = plateau 64 octets, `x/60wx *(long*)($rsp+0x120)` = liste (from,to,promo) de 12 octets par coup ; `break *0x14002c90d` pour voir `edi`/`edx` (coup saisi) quand il est absent de la liste. Pièges : un breakpoint au milieu d'une instruction fait planter ; ASLR Wine sans effet ici (image à `0x140000000`).

## Vérification

```text
$ python3 -I tools/karity-solve.py --check
Réponse : petik__f7h6e6g8h6f7!
OK (good!)
KO attendu sur coup invalide : bad!
```

Binaire d'origine sous Wine : `petik__f7h6e6g8h6f7!` → `good!` ; même chaîne sans le dernier caractère (19 car.) → `bad!` ; `…e6e7…` → `bad!`.
