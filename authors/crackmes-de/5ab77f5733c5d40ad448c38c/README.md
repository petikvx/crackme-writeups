# bfcrackme (JiM~) — brainfuck compilé en .COM DOS

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c38c`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c38c) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de — JiM~ (« Brainfuck Crackme By JiM~ », 01/12/2006) |
| **Plateforme** | DOS `.COM` 16 bits (1785 octets) + source brainfuck `bfcrackme.txt` |
| **SHA-256 (zip)** | `e38d8c61ee084c302db447b6e9847cccfe7b889f1c20fc12d834a1c7c9815556` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/bfcrackme.zip` | archive d'origine (mot de passe `crackmes.one`) : `BFCRACKME.COM` + `bfcrackme.txt` |
| `tools/bfcrackme-solve.py` | solveur : interpréteur BF sur le `.txt` + `--check` = émulation unicorn du `.COM` |

## Réponse

Le crackme demande **un seul caractère** (pas de user → pas de `petik` ici).

> **Octet attendu : `0xD0` = 208 = `╨` (CP437)** — à saisir par **Alt+208** (pavé numérique) sous DOS/DOSBox.

```bash
python3 tools/bfcrackme-solve.py          # Octet attendu : 208 = 0xD0
python3 tools/bfcrackme-solve.py --check  # rejoue le BFCRACKME.COM émulé (échantillon de 8 entrées ; --full = 256)
```

Sortie attendue du crackme : `Congratualtions :)` (faute d'orthographe de l'auteur, c'est bien la chaîne du binaire).

## Premier regard

```bash
unzip -P crackmes.one original/bfcrackme.zip -d /tmp/bf   # hors du dépôt
file /tmp/bf/BFCRACKME.COM        # data (pas d'en-tête, COM = flat binary)
ndisasm -b16 -o0x100 /tmp/bf/BFCRACKME.COM | head -60
```

Le `.txt` annonce : *« Simply find the correct input character! … This file is the source code »* avec les règles « pas de patch, pas de bruteforce ». Le source est donc du brainfuck, et le `.COM` en est la compilation.

## Flow

Début du `.COM` (org 0x100) :

```asm
100: mov si,0xfe70        ; \ boucle d'init : met à 0 la « tape » (SI = pointeur de cellule)
103: dec si               ; |
104: mov byte [si],0      ; |
107: cmp si,0x528f ; jnz  ; /
10D: jmp 0x12f            ; saute le sous-programme de lecture/écriture
10F: mov ah,8 ; int 21h   ; « , »  : lecture d'un caractère sans écho (1 appel)
     cmp al,0Dh → xor al,7 ; mov [si],al
11B: mov ah,2 ; mov dl,[si] ... int 21h   ; « . » : écriture (0Ah envoyé en 0Dh+0Ah)
12F: inc si / add byte [si],6 / ...       ; corps traduit : > + - < ... [ ] une instruction BF = 1-2 opcodes
```

Chaque `>` `<` `+` `-` devient `inc/dec si`, `add/sub byte [si],n` ; `[` `]` deviennent `cmp byte [si],0 / jz near` et `jmp` ; `,` et `.` sont des `call` vers les deux petites routines INT 21h (AH=8 / AH=2). Autrement dit **le binaire n'a rien de plus que le `.txt`** : tout se lit dans le brainfuck.

## Comment on trouve la réponse

### 1. Ancrage

Le prédicat est dans `bfcrackme.txt`, juste après le banner imprimé (`BFCrackme By JiM~ / Find the password / Have fun! :)` — de longues suites `>++++[-<++++++++++>]<+++.` qui construisent chaque lettre par multiplication de cellules). La seule instruction `,` du programme est ici :

```brainfuck
<[-]>[-],                      lit UN caractère dans la cellule 0 (c0 = input)
>++++++++++++++++++++          cellule 1 = 20
[-<---------->]                c0 -= 10 par tour, 20 tours  → c0 -= 200
<--------                      c0 -= 8                      → c0 = input - 208
>>>>>[-]+<<<<<                 cellule 5 = 1 (drapeau « bon »)
[                              si c0 != 0 (mauvais) :
  >>>>>[-]<<<<<>[-]>>+[...]      → efface le drapeau et imprime « Wrong :( »
<]
>>>>>[                         si drapeau (c5) toujours 1 (c0 == 0) :
  >>+[-<++++++++++>]<+++.---.…   → imprime « \r\nCongratualtions :) »
[-]]
```

### 2. Décodage

Le test est donc `input − (20×10 + 8) == 0` modulo 256, soit :

```text
input = 20*10 + 8 = 208 = 0xD0      ('╨' en CP437)
```

C'est le fameux « caractère » : un octet non imprimable en ASCII, d'où la saisie Alt+208.

### 3. Pièges

- Le `.txt` commence par de la prose contenant des `.`, `,`, `-`, `+`, `>`, `<` (ex. `Enjoy! :)`, `Simply find the correct input character!`) : il faut ne démarrer l'interpréteur **qu'à partir du vrai programme** (`>++++++[-<`), sinon la prose est exécutée (le solveur coupe à cet endroit).
- Cellules sur **8 bits avec wrap-around** (`add byte [si]` dans le `.COM`) : 208 est atteint par `input − 208 ≡ 0 (mod 256)`, pas par une soustraction « négative » ; un seul octet convient.
- Le `.COM` convertit `0Dh` en entrée (`xor al,7` → `0Ah`) et `0Ah` en sortie en `0Dh 0Ah` : l'écho de la sortie contient des `\r\r\n` doublés dans l'émulation, sans incidence sur le résultat.
- Pas de bruteforce interdit par l'auteur ici : on **calcule** le prédicat ; l'énumération des 256 octets ne sert que de preuve de l'unicité.

## Vérification

Pas de DOSBox/DOSEMU dans l'environnement : la preuve « binaire d'origine » est une **émulation x86-16 avec unicorn** du `BFCRACKME.COM` extrait de l'archive (stubs `INT 21h` AH=8 pour l'entrée, AH=2 pour la sortie, `INT 20h`/RET vers le PSP pour la fin) — pas une exécution DOS réelle.

| Entrée | Sortie du `.COM` émulé |
|---|---|
| `0xD0` (208) | `BFCrackme By JiM~ / Find the password / Have fun! :)╨ / Congratualtions :)` ✅ |
| `A` (65), `0x00`, `0xCF`, `0xD1`, `0xFF`… | `… Wrong :(` ❌ |

Balayage complet des 256 valeurs (fait pendant le reverse, aussi disponible via `--check --full`, ~6 min) : **255 × `Wrong :(`, 1 × `Congratualtions :)` (208)**. Le même résultat est obtenu avec l'interpréteur BF sur le `.txt` (`solve()`), ce qui confirme que `.COM` et source coïncident.

## Notes

- Pas de GDB/x64dbg/IDA utilisés (reverse statique du brainfuck + émulation unicorn).
- Non testé sur un vrai DOS/DOSBox : si votre clavier ne donne pas `╨` (CP437) avec Alt+208, c'est une question de page de code, l'octet à fournir reste `0xD0`.
