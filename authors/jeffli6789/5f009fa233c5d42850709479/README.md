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

## 3. Vérification

```bash
python3 tools/maze-solve.py --check
# Welcome… Well done! / OK (len=1252)
```

---

## 5. Notes

- Voir [`analysis/notes.md`](analysis/notes.md).
- Famille : [x86](../5f01df5633c5d4285070948b/), [wallpaper](../69a2911b7a778cfffbfb67ca/).
