# jeffli6789 — Maze

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5f009fa233c5d42850709479) · id `5f009fa233c5d42850709479`

ELF64 statique (~1 Mo) : labyrinthe **en code** (stubs `.text`), moves `1..4`.  
Auteur : [jeffli6789](https://crackmes.one/user/jeffli6789).

| Fichier | Rôle |
|---|---|
| [`maze`](original/maze) | binaire |
| [`maze-solve.py`](tools/maze-solve.py) | BFS + `--check` (fd 2) |
| [`notes.md`](analysis/notes.md) | layout cellules |

## Réponse

Chemin BFS **1252** chiffres (`1`=haut, `2`=gauche, `3`=droite, `4`=bas) — généré par le solveur :

```bash
python3 tools/maze-solve.py -q          # path seul
python3 tools/maze-solve.py --check     # Well done!
```

---

## 1. Premier regard

```text
ELF 64-bit LSB executable, x86-64, statically linked, stripped
sha256: 30040775a6b836f28fb025a1677d14a8afc243f70259065b64ebd7f71337fa43
Welcome to the maze! / Please type you input: / Well done!
```

**Piège** : `sys_read` sur **fd 2** (stderr). TTY OK ; pipe stdin seul → échec.

---

## 2. Prédicat

Grille de stubs (pas de carte data) :

| | |
|---|---|
| Taille cellule | `0x6a` |
| Largeur | `0x65` (101) |
| Départ | `0x4716d0` |
| Sortie | `0x4cb2c8` (`mov eax,1; ret`) |
| Mur | `xor eax,eax; ret` |

Chaque corridor lit un char `1..4` et saute à la cellule voisine.

---

## Debug GDB (pas à pas)

ELF64 **statique / stripped**, pas de PIE. Entry `0x4000b0`. Le labyrinthe est **du code** (stubs), pas une grille data.

### 3.1 Piège fd=2 sous GDB

```bash
gdb -q ./original/maze
(gdb) starti
(gdb) x/15i $rip
```

| Adresse | Rôle |
|---|---|
| `0x4000c9` | `write(1, …)` — banner |
| `0x4000d0` | `mov edi, 2` puis `read` — **lit sur stderr** |
| `0x4000f0` | `call 0x4716d0` — cellule départ |
| `0x4000f5` | `test al, al` → succès / fail |

```text
(gdb) break *0x4000e4          # syscall read
(gdb) run
(gdb) print $rdi               # doit être 2
(gdb) print/x $rsi             # buffer @ 0x70815c
```

Sous GDB interactif, le TTY alimente souvent fd 0 **et** 2 → OK.  
`run < fichier` ou un pipe **stdin seul** → le `read(2, …)` échoue / path vide.

Astuce : `run 2< <(python3 tools/maze-solve.py -q)` ou laisser le solveur `--check` gérer les fds.

### 3.2 Cellule départ / sortie

```text
(gdb) x/20i 0x4716d0           # départ
# lit *rdi (char), compare 1..4, ajuste rbx/rcx, saute au voisin
(gdb) x/3i 0x4cb2c8            # sortie
# mov eax, 1 ; ret
```

Mur typique ailleurs : `xor eax, eax ; ret` (AL=0 → fail au retour du parcours).

### 3.3 Suivre un mauvais coup

```text
(gdb) break *0x4716d0
(gdb) # fournir un path court faux via stderr
(gdb) run 2<<< $'1\n'
(gdb) stepi                    # voir quel voisin / mur
(gdb) print $al                # au retour vers 0x4000f5
```

### 3.4 Succès

Le path BFS fait **1252** coups — trop long à stepper. Breaker la sortie :

```text
(gdb) break *0x4cb2c8
(gdb) # input via solveur / redirection fd 2
(gdb) continue
# hit → eax=1 → "Well done!"
```

Ou hors GDB : `python3 tools/maze-solve.py --check`.

---

## 3. Vérification

```bash
python3 tools/maze-solve.py --check
# Welcome… Well done! / OK (len=1252)
```

---

## 5. Notes

- Voir [`analysis/notes.md`](analysis/notes.md).
- Famille : [x86](../5f01df5633c5d4285070948b/), [wallpaper](../69a2911b7a778cfffbfb67ca/).
