# acheylate's Beat The Game

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aca57316349e4b2540c7018) · id `6aca57316349e4b2540c7018`

ELF64 **Rust** / **macroquad 0.4.16** (miniquad 0.4.11), PIE, **non strippé**. Diff. site **4.0**.  
Description : mini-jeu, **100 points** pour gagner, **1 point / seconde**, mort à **10 s**. Patch autorisé. Points en **u32**. Inlining retiré sur quelques fonctions. Pas de crypto.

Famille acheylate (Rust) : [`Find the password`](../6aac1a0c585e8875bcbec009/) · [Windows](../6aac22ff48cda5a2aaa3de2d/) · [`State Machine`](../6ac400c80885f990699dc134/).

| Fichier | Rôle |
|---|---|
| [`original/game`](original/game) | binaire (ne pas patcher ici) |
| [`tools/beat-the-game-solve.py`](tools/beat-the-game-solve.py) | signatures, simulateur, `--patch` |
| [`analysis/game-update.pseudoc`](analysis/game-update.pseudoc) | Hex-Rays `is_win` / `is_dead` / tick |
| `analysis/game.always-win` | patch 1 octet (généré par le solveur) |
| `analysis/game.wrap` | patch `inc`→`dec` (généré par le solveur) |

## Réponse

Pas de password / serial. L’objectif est **`YOU WIN` / `Crackme solved!`**.

| Mode | Idée | Résultat |
|---|---|---|
| vanilla | 10 s de jeu | **`YOU DIED`**, score 10 |
| **always-win** | `is_win` : `cmp edi, 100` → `cmp edi, 0` | victoire **frame 0** (u32 ≥ 0) |
| **wrap** | `inc edi` → `dec edi` | au 1er tick, score `0xffffffff` ≥ 100 |

```bash
python tools/beat-the-game-solve.py --check
python tools/beat-the-game-solve.py --patch always-win   # → analysis/game.always-win
python tools/beat-the-game-solve.py --patch wrap         # → analysis/game.wrap
# Linux :
chmod +x analysis/game.always-win
./analysis/game.always-win    # overlay YOU WIN / Crackme solved!
```

Pas de username / `petik` : le crackme ne prend pas de login.

---

## 1. Premier regard

```text
game: ELF 64-bit LSB pie executable, x86-64, dynamically linked, not stripped
sha256  ec2b7da945bc097547b34fe0d61a89871fa045faefc5229feafd7162786f9e96
md5     c68d00ea799162ae760d4cd32100a4dd
size    1539712
entry   0x5d750
rustc   8bab26f4f68e0e26f0bb7960be334d5b520ea452
```

ZIP site (password `crackmes.one`) : un seul fichier `game`.  
Dépendances runtime Linux : OpenGL / X11 ou Wayland (`libGL`, `libX11`, …) — fenêtre **macroquad**.

Strings utiles (collées dans `.rodata`, pas toujours des C-strings propres) :

```text
Score:
Time left:
YOU DIED
YOU WIN
Crackme solved!
Press R to restart
src/main.rs
```

Le crate applicatif s’appelle **`game`** (hash `Cs8mv6bOVvuTp_4game` / `game[6168806178d44bfd]`). Symboles non strippés :

| Symbole | VA | Taille |
|---|---|---|
| `game::main` | `0x72180` | 346 |
| `game::is_win` | `0x722e0` | **7** |
| `game::is_dead` | `0x722f0` | **11** |
| `game::overlay` | `0x72300` | 371 |
| `Game::draw` | `0x72480` | 1953 |
| `Game::update` | `0x72c50` | 514 |

`main` alloue le titre **`crackme`** (deux immediates LE `63617263` / `656D6B63`) et lance `Window::from_config` avec la closure `amain`. Fenêtre 800×600 (`0x25800000320` = `800 | 600<<32`).

Les labels site *Anti-disassembly / Junk bytes* ne se voient pas sur le prédicat : `is_win` / `is_dead` sont des fonctions minuscules (inlining retiré, comme annoncé). Un `nop` dans la boucle de score est du padding compilateur.

---

## 2. Flow

1. Boucle macroquad : chaque frame `Game::update(dt)` puis `Game::draw`.
2. Déplacement **WASD** / flèches, clamp sur un plateau 700×400 (offset écran centré).
3. Deux accumulateurs `f32` reçoivent `dt` :
   - `elapsed` (+0xC) — mort si ≥ 10.0 ;
   - `score_acc` (+0x10) — tant que ≥ 1.0 : `acc -= 1`, **`score++`** (u32).
4. `is_win(score)` → `state = 2` (win) ; sinon `is_dead(elapsed)` → `state = 1`.
5. `draw` affiche `Score: {score} / 100`, `Time left: {10 - elapsed}`, barre de vie. Overlay :
   - state 1 → `YOU DIED` + `Press R to restart` ;
   - state 2 → **`YOU WIN`** + **`Crackme solved!`**.
6. `R` si `state != 0` : reset position (350, 200), score/temps/state à 0.

Sans patch : au bout de 10 s on a ~10 points → mort, jamais 100.

---

## 3. Comment on trouve le prédicat

### 3.1 Ancrage

Binaire **non strippé** : les noms Rust v0 suffisent. MCP IDA (`open_database` sur `original/game`) :

```text
_RNvCs8mv6bOVvuTp_4game6is_win      @ 0x722e0
_RNvCs8mv6bOVvuTp_4game7is_dead     @ 0x722f0
_RNvMCs8mv6bOVvuTp_4gameNtB2_4Game6update
```

Xrefs `YOU WIN` / `Crackme solved!` → `Game::draw` (`cmp ebp, 2` / `cmp ebp, 1`) → `game::overlay`.

PIE, image base 0 : **file offset = VA − 0x1000**.

### 3.2 `is_win` / `is_dead`

```asm
; game::is_win  VA 0x722e0  file 0x712e0
722e0:  cmp    edi, 0x64        ; 83 FF 64
722e3:  setnb  al               ; unsigned >=  (0F 93 C0)
722e6:  ret                     ; C3

; game::is_dead VA 0x722f0  file 0x712f0
722f0:  ucomiss xmm0, dword [rip+10.0]   ; dword_1F6F4 = 10.0
722f7:  setnb  al
722fa:  ret
```

Hex-Rays :

```c
bool is_win(unsigned int score) { return score >= 0x64; }
bool is_dead(float elapsed)     { return elapsed >= 10.0; }
```

`setnb` = `setae` = **≥ unsigned**. Tout `u32` est `>= 0`. D’où le patch 1 octet `64 → 00`.  
Même comparaison unsigned : `0xffffffff >= 100` est vrai — d’où le wrapping.

### 3.3 Tick dans `Game::update`

Après le déplacement (normalisation du vecteur WASD × vitesse × `dt`, clamp) :

```asm
; rbx = Game*
movsd   xmm0, qword ptr [rbx+0Ch]   ; (elapsed, score_acc)
; xmm3 = dt splatté
addps   xmm3, xmm0
movlps  qword ptr [rbx+0Ch], xmm3
ucomiss xmm0, 1.0                   ; lane score_acc
mov     edi, [rbx+8]                ; score
jb      skip_inc
; boucle :
addss   xmm0, -1.0
inc     edi                         ; VA 0x72e14  file 0x71e14  FF C7
ucomiss xmm0, 1.0
jnb     loop
movss   dword ptr [rbx+10h], xmm0
mov     [rbx+8], edi
skip_inc:
call    game::is_win                ; edi = score
test    al, al
jz      check_dead
mov     byte ptr [rbx+14h], 2       ; WIN
ret
check_dead:
call    game::is_dead               ; xmm0 = elapsed
; si oui : [rbx+14h] = 1
```

Layout `Game` :

| Off | Type | |
|---|---|---|
| +0 / +4 | `f32` x, y | restart `350.0`, `200.0` (`qword_1ADE0`) |
| +8 | `u32` score | |
| +0xC | `f32` elapsed | `is_dead` |
| +0x10 | `f32` score_acc | 1 point par seconde entière |
| +0x14 | `u8` state | 0 / 1 mort / 2 win |

Si `state != 0`, seul `R` (`is_key_pressed(82)`) reset.

### 3.4 Assemblage des patches

**always-win** (immédiat) :

```text
file 0x712e2 : 64 → 00     cmp edi, 100  →  cmp edi, 0
```

`is_win` est appelé **chaque frame** avant `is_dead`. Score initial 0, `0 >= 0` unsigned → `state = 2` tout de suite.

**wrap** (hint u32) :

```text
file 0x71e14 : FF C7 → FF CF     inc edi → dec edi
```

Au premier passage `score_acc >= 1.0` (≈ 1 s) : `score = 0 - 1` wrapping → `0xffffffff`, `is_win` vrai. La mort à 10 s n’a plus le temps d’arriver.

Autre option (non générée) : patcher `is_dead` pour qu’il ne déclenche jamais, attendre ~100 s — le score incrémenté gagne « honnêtement ». Plus lent, même prédicat.

---

## 4. Prédicat consolidé

```text
chaque frame (state == 0) :
  elapsed   += dt
  score_acc += dt
  while score_acc >= 1.0:
      score_acc -= 1.0
      score = (score + 1) & 0xffffffff     # wrap : score - 1
  if score >= 100: state = WIN             # always-win : >= 0
  elif elapsed >= 10.0: state = DEAD
```

Simulateur dans le solveur (`simulate(10)` → mort score 10 ; `simulate(1, wrap=True)` → win `0xffffffff`).

---

## 5. Vérification

```text
python tools/beat-the-game-solve.py --check
vanilla 10s → YOU DIED score=10
wrap 1s    → YOU WIN  score=0xffffffff
always-win : cmp edi, 0 (unsigned) on first frame
OK
```

`--check` ancre `sha256`, les 7 octets de `is_win`, les 11 de `is_dead`, et `FF C7` du tick. Il **n’exécute pas** le GUI (ELF Linux + OpenGL). Preuve live = lancer `analysis/game.always-win` sous Linux.

KO vanilla : laisser tourner 10 s → overlay rouge `YOU DIED`.  
Edge wrap : `dec` sur 0, pas un `sub` saturant — c’est bien du wrapping Rust `u32`.

---

## 6. Notes

- Ce n’est **pas** un keygen name→serial. Titre fenêtre `crackme`.
- `Score: ` / `Time left: ` passent par `alloc::fmt::format` (arguments `Display`), pas des C-strings `printf`.
- `is_win(0)` vanilla est faux ; le patch `cmp edi, 0` s’appuie sur **unsigned**.
- Base IDA : `analysis/game.i64` (gitignorée).
