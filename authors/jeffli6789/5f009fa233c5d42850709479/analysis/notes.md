# jeffli6789's Maze — notes / prédicat

## Surface

- ELF64, statically linked, stripped (~1.0 MiB).
- `start` @ `0x4000b0` :
  1. `sys_write(1, banner, 0x2e)` — *"Welcome to the maze!"* + *"Please type you input: "*
  2. **`sys_read(2, buf, 0x2710)`** — lit sur **stderr (fd 2)**, pas stdin
  3. `call 0x4716d0` ; si `AL≠0` → *"Well done!"* sinon *"Try again!"*
  4. `int 0x80` / `sys_exit`

En terminal interactif, fd 0/1/2 sont le même TTY → taper au clavier fonctionne.
Sous pipe (`echo … | ./maze`) l’input sur stdin **échoue** ; il faut alimenter fd 2.

## Prédicat = labyrinthe en code

Pas de grille dans `.data`. Le « maze » est une **grille de stubs** dans `.text`,
pas de `0x6a` (106) octets, largeur `0x65` (101).

| Cellule | Octets typiques | Effet |
|---|---|---|
| Corridor (mover) | `8a 07 48 ff c7 3c 0a … ff e0 31 c0 c3` | lit 1 char ; `1..4` → jump relatif ; `\n`/autre → `xor eax,eax; ret` |
| Mur | `31 c0 c3` (+ nops) | échec immédiat |
| Sortie | `b8 01 00 00 00 c3` | `mov eax,1; ret` → succès |

Entrée = première cellule mover @ **`0x4716d0`**.
Sortie unique @ **`0x4cb2c8`** (offset +3468 cellules = row 34, col 34 depuis le départ si origin=start).

### Dispatch d’un corridor

```text
al = *rdi++
if al == '\n': return 0
al -= '0'
switch al:
  1 → delta = -1 * 0x65 * 0x6a   # haut
  2 → delta = -1 * 1   * 0x6a   # gauche
  3 → delta = +1 * 1   * 0x6a   # droite
  4 → delta = +1 * 0x65 * 0x6a   # bas
  else → return 0
jmp  (adresse_de_la_cellule_courante + delta)
```

Implémentation réelle : `imul` puis `lea rax,[rip]` @ `…727` (−0x57 → base cellule) + `add rax,rbx` + `jmp rax`.

Atterrir sur un **mur** → ret 0. Atterrir sur la **sortie** → ret 1 (sans lire plus).

## Solution

Chemin BFS le plus court (chiffres `1`–`4` uniquement), longueur **1252** :

```text
4444221122221111331133334433443344333344334433113333443333113311111111112211113333331122113311221111113333444444444444442244224433442244443333113344442222444433444422442244442244221111224444221111111122111122442211224444443344222222442244224433334422222244333333444444333311331133331111224422111111224422111133333333442244333333333333113311113311331111334433331122113333331122111111221133331122222244444433444422112211111122112211331133443333333333334422443333331133331122113311221111112222113311334433113333111111221111224444221111111111224422443344444444222244222211221122444444333333443344443333442244224422222222221111333333331122112211224422442244442211111133113311222211111111221111331133334433111122112244222244221122111122113333334422443333111133443333113344334422443344443333111122111111333344224433331133331133334433331133444422222222224444443311113333333344444422111122444444334444334444222244222244333344333344222244222244334444442222442222443333442222224422443333444444333344444422224444334433333311113333334444221122444433334444444422444422224422444444444444442211111111222244334444222222442222222211224422221111333333334433331133331111224422221111221111221122221111112244444444444444442211221133111111222211331133111111113333334433442244
```

Vérif live : `python3 tools/maze-solve.py --check` → `Well done!`.

## Stats grille (scan aligné sur `0x4716d0`)

- ~4998 corridors, ~5202 murs, 1 sortie (dans la fenêtre `.text` alignée).
