# ShadowLegion — TermBreaker

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a9950e9cab6678aefe9dc90) · id `6a9950e9cab6678aefe9dc90`

Crackme **ELF64** GUI **Qt 6.11** (terminal CRT / OpenGL). Un seul champ : *system code*.
Auteur : [ShadowLegion](https://crackmes.one/user/ShadowLegion).

Dossier : `authors/shadowlegion/6a9950e9cab6678aefe9dc90/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`TermBreaker`](original/TermBreaker) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`termbreaker-solve.py`](tools/termbreaker-solve.py) | générateur + `--check` live |
| [`tb-live-preload.cpp`](tools/tb-live-preload.cpp) | LD_PRELOAD (inject code / capture MessageBox) |
| [`TermBreaker.i64.c`](analysis/TermBreaker.i64.c) | Hex-Rays (`decc`) |

## Réponse

Pas de username — uniquement un **system code** 8 caractères `[A-Z0-9]`.

| Code | Score Σ(i+1)·ord |
|---|---|
| **`TERMATUR`** | **2856** |
| `TERMAFYY` | 2856 |
| `OPERATOR` | 2812 (invalide) |

```bash
python3 tools/termbreaker-solve.py -q
# TERMATUR

# live (Qt 6.11 dans LD_LIBRARY_PATH, voir § Vérification)
python3 tools/termbreaker-solve.py --check TERMATUR
# QLabel::setText AUTHENTICATING...
# ACCESS GRANTED - WELCOME, OPERATOR
# QMessageBox text=ACCESS GRANTED!
# Congratulations, you cracked it!
# TERMATUR score=2856 -> OK
```

---

## 1. Premier regard

```text
file original/TermBreaker
# ELF 64-bit LSB pie executable, x86-64, dynamically linked, stripped

diec → GCC + Qt(6.X)
sha256: d4054e820a667ab52e62b0a2b315f76c789185e26d409e983fbfcb0d70eaf806
```

Strings UI :

```text
MAINFRAME ACCESS TERMINAL v2.7
TYPE SYSTEM CODE TO AUTHENTICATE
AWAITING INPUT...
AUTHENTICATING...
ACCESS GRANTED - WELCOME, OPERATOR
ACCESS GRANTED!
Congratulations, you cracked it!
AUTHENTICATION FAILED - CODE REJECTED
```

Le binaire exige **`qt_version_tag@Qt_6.11`** (section `.qtversion` = 6.11.2) + `libQt6OpenGLWidgets`.  
Sur Ubuntu 26.04 (Qt apt 6.10), il faut une install locale 6.11 (ex. `aqtinstall`, sans compte Qt).

```bash
python3 -m pip install aqtinstall
python3 -m aqt install-qt linux desktop 6.11.2 linux_gcc_64 --outputdir "$HOME/Qt"
export LD_LIBRARY_PATH="$HOME/Qt/6.11.2/gcc_64/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
chmod +x original/TermBreaker
./original/TermBreaker
```

Décompile :

```bash
bash -ic 'decc original/TermBreaker'
# → analysis/TermBreaker.i64.c (déplacé depuis original/)
```

---

## 2. Flow

```text
QApplication / MainWindow (thème amber CRT + QOpenGLWidget overlay)
  QLineEdit (maxLength = 8)  —  returnPressed
    → sub_60B0 (auth)
         len == 8 ?
         chaque wchar UTF-16 ∈ [A-Z] ∪ [0-9] ?
         score == 2856 ?
           oui → label vert + QMessageBox « ACCESS GRANTED! »
           non → label rouge « AUTHENTICATION FAILED… », clear + refocus
```

Le rendu CRT (shaders scanline / curvature) est cosmétique : le prédicat est dans `sub_60B0`.

---

## 3. Prédicat

`QLineEdit::text()` → `QString` UTF-16 (`ushort *`). Longueur dans le champ size (= 8).

Charset (par caractère) :

```c
((c - 'A') <= 25) || ((c - '0') <= 9)   // A-Z ou 0-9 uniquement
```

Score (confirmé asm `0x62b9`…`0x62f0`, cible `cmp ebp, 0xb28`) :

```text
score = 1·c0 + 2·c1 + 3·c2 + 4·c3 + 5·c4 + 6·c5 + 7·c6 + 8·c7
      = Σ (i+1) * ord(code[i])     // i = 0..7
accepté ⇔ score == 2856
```

Beaucoup de solutions (espace `[0-9A-Z]^8` ∩ hyperplan). `TERMATUR` est un exemple thématique valide.

Pseudo Hex-Rays (extrait `sub_60B0`) :

```c
QLineEdit::text(&qs);
if (qs.size != 8) goto fail;
// charset A-Z / 0-9 sur qs.utf16[0..7]
score = c0 + 2*c1 + 3*c2 + 4*c3 + 5*c4 + 6*c5 + 7*c6 + 8*c7;
if (score == 2856) { /* ACCESS GRANTED */ }
else fail;
```

---

## 4. Vérification

```bash
python3 tools/termbreaker-solve.py TERMATUR
# TERMATUR score=2856 valid=True

python3 tools/termbreaker-solve.py --check TERMATUR
# … ACCESS GRANTED! … -> OK
```

`--check` compile si besoin `tools/tb-live-preload.so` (g++ + headers Qt 6.11), lance le **binaire d’origine** avec `LD_PRELOAD` : injection du code dans le `QLineEdit`, `returnPressed`, capture du `QMessageBox`. Platform `offscreen` : l’overlay OpenGL râle, l’auth Qt Widgets passe quand même.

Lancement manuel GUI (avec display) :

```bash
export LD_LIBRARY_PATH="$HOME/Qt/6.11.2/gcc_64/lib"
./original/TermBreaker
# saisir TERMATUR + Entrée
```

---

## 5. Notes

- Ce n’est **pas** un keygen name→serial : un seul code système.
- Minuscules / symboles rejetés ; longueur ≠ 8 aussi.
- Packer : non. Strip : oui. Difficulté réelle = lire le poids 1..8 + cible 2856 (et brancher Qt 6.11 pour la preuve live).
- Copie `analysis/TermBreaker.qt610` : expérience de contournement ELF `Qt_6.11`→`Qt_6.10` ; la preuve « propre » utilise Qt 6.11 + l’original.
