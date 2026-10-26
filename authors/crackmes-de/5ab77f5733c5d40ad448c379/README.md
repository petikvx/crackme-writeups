# CrackMe #6 — « The KLiZMA's ASCII Table » (crackme_6_ascii) — KLiZMA

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c379`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c379) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | KLiZMA (crackmes.de) |
| **Plateforme** | MS-DOS, MZ 16 bits réel, Borland C++ 1991 (TLINK 5.0) |
| **SHA-256 (zip)** | `544f14b7c614cf16313244dc6f7341a1bf2e420d0ef3459f28634e1a210c186d` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/CrackMe_#6_by_KLiZMA.zip` | archive d'origine (mot de passe `crackmes.one`), intacte |
| `analysis/extract/CRACKME.EXE`, `readme.txt` | contenu du zip extrait (copie de travail) |
| `analysis/extract/dis.txt` | désassemblage `ndisasm -b16 -e 0x200` |
| `tools/crackme6-ascii-solve.py` | solveur / vérificateur (`--check`) |
| `tools/dosrun.py` | mini-émulateur DOS (unicorn, INT 21h/10h/1Ah) |

## Réponse

| Name | Serial |
|---|---|
| `petik` (n'importe quoi) | **`666`** |

```bash
python3 tools/crackme6-ascii-solve.py --name petik        # Name: petik / Serial: 666
python3 tools/crackme6-ascii-solve.py --check             # preuve via émulation
```

Le **nom est ignoré** par le binaire ; seul le serial compte (`666`, décimal).

## Premier regard

```
$ file CRACKME.EXE   -> MS-DOS executable, MZ for MS-DOS
$ diec CRACKME.EXE   -> Borland C/C++(1991), TLINK 5.0, table de symboles TDS
$ strings -n4 ...    -> "Name: ", "Serial: ", "%s", "%ld", "%c %3d", ".:: The KLiZMA's ASCII Table::."
```

Le readme demande un couple Name/Serial pour « enregistrer » la table ASCII. Entête MZ : `cparhdr=0x20` (code à l'offset fichier `0x200`), `CS:IP = 0:0`, `SS=0x2c7`, `SP=0x80`. Le segment de données commence à la valeur `0x26f` paragraphes (`mov dx,0x26f` en `0000`), donc **DS:0 = offset fichier `0x200 + 0x26f0 = 0x28f0`**.

Pas de DOSBox/DOSEMU ni de Wine NTVDM sur la machine (Wine 64 bits ne lance pas le 16 bits) : preuve par émulation unicorn, voir plus bas.

## Flow

`main` (offset code `0x291`) : efface l'écran, affiche l'en-tête, `scanf("%s")` du nom, `scanf("%ld")` du serial, compare, puis soit affiche la table ASCII (32..255) soit termine.

## Comment on trouve

1. **Ancrage** : `ndisasm -b16 -e 0x200 CRACKME.EXE > dis.txt`. Les chaînes sont dans DS à `0xaa…` ; avec la base `0x28f0` on lit :
   `python3 -c "d=open('CRACKME.EXE','rb').read();print(d[0x28f0+0xaa:0x28f0+0x110])"` →
   `\n.:: The KLiZMA's ASCII Table::.\0` (0xaa), `\n\nName: \0` (0xcb), `%s` (0xd4), `\nSerial: \0` (0xd7), `%ld` (0xe1), `\n.::…\0` (0xe5), `%c %3d  ` (0x106).
2. **Lecture de `main`** (extraits commentés) :

```asm
000002A9  mov ax,0xaa / push / call 0x209f   ; printf("\n.:: The KLiZMA's ASCII Table::.")
000002B1  mov ax,0xcb / push / call 0x209f   ; printf("\n\nName: ")
000002B9  lea ax,[bp-0x1] ; push ax          ; buffer nom = bp-1 (1 octet !)
000002BD  mov ax,0xd4 ; push ax ; call 0x245c ; scanf("%s", &[bp-1])
000002C6  mov ax,0xd7 ... call 0x209f        ; printf("\nSerial: ")
000002CE  lea ax,[bp-0x6] ; push ax
000002D2  mov ax,0xe1 ; push ax ; call 0x245c ; scanf("%ld", &[bp-6])   ; long = bp-6..bp-3
000002DB  cmp word [bp-0x4],0                ; mot haut du long == 0
000002DF  jnz bad
000002E1  cmp word [bp-0x6],0x29a            ; mot bas == 0x29a
000002E6  jnz bad
000002E8  ... printf(0xe5) ; jmp 0x2f7       ; OK
bad:      xor ax,ax ; push ax ; call 0x3a6   ; exit(0)
```

3. **Décodage** : le long lu par `%ld` occupe `[bp-6..bp-3]` ; le test impose `high == 0` et `low == 0x29a`, donc serial = `0x29a` = **666** (clin d'œil au nombre de la bête). Le nom n'est référencé nulle part dans la comparaison.
4. **Boucle de sortie** (`0x2f8`–`0x329`) : pour `si` de 0x20 à 0x34, positionne le curseur (`gotoxy`, `0x1589`) et imprime, par pas de `0x15`, `printf("%c %3d  ", c, c)` pour `di` ≤ 0xff : la table ASCII 32..255 en colonnes.
5. **Pièges** :
   - `strings` ne montre pas les offsets DS ; il faut calculer la base DS depuis `mov dx,0x26f` (startup Borland, `[cs:0x28d]`).
   - Le nom est lu dans un buffer de **1 octet** (`bp-1`) avec `%s` : un nom long écrase le serial/le frame (stack overflow) — d'où l'utilité d'un nom court (`petik` fait 5 octets + NUL ; il déborde sur `bp-6..bp-2` mais **avant** que le serial soit lu, donc sans effet sur la comparaison, `scanf("%ld")` réécrit ensuite la zone).
   - Le début de `0x16f` (somme des 0x2f premiers octets de DS comparée à 0xd5c) est le contrôle d'intégrité Borland (copyright/`Null pointer assignment`), pas une protection du crackme.

## Prédicat consolidé

```
valide  <=>  (long)strtol_like(serial_saisi) == 666   (high word 0, low word 0x29a)
```

## Vérification

Pas de GDB ni de x64dbg (binaire DOS 16 bits, pas de debugger disponible) : reverse statique + émulation. `tools/dosrun.py` charge le MZ (relocations appliquées, PSP en `0x1000`), émule `INT 21h` (30h, 35h/25h, 3Fh stdin, 40h stdout, 44h, 4Ch…), `INT 10h`, `INT 1Ah`, et exécute le **vrai CRACKME.EXE d'origine** (instruction par instruction) :

```
$ python3 tools/crackme6-ascii-solve.py --check
Name: petik
Serial: 666
serial=666    table ASCII affichée=True (attendu True) -> OK
serial=667    table ASCII affichée=False (attendu False) -> OK
serial=66202  table ASCII affichée=False (attendu False) -> OK     # 666 + 65536 : mot haut != 0
```

Serial correct : la table ASCII (`  32 … 255`) est affichée puis le programme attend une touche (`INT 21h AH=07h`, intercepté). Serial faux : retour immédiat au DOS (`exit(0)`) sans table.

## Notes

- Ce n'est **pas** un name→serial : le nom n'intervient pas.
- Limite de la preuve : émulation unicorn, pas DOSBox ; les chemins d'E/S console sont simplifiés (stdin ligne par ligne), mais le prédicat testé est celui du binaire d'origine.
- `original/` n'a pas été modifié ; l'EXE extrait est sous `analysis/extract/`.
