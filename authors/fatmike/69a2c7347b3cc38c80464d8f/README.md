# Fatmike's Crackme #10 — RecordPlayer (crackmes.one CTF 2026)

| | |
|---|---|
| **ID** | [`69a2c7347b3cc38c80464d8f`](https://crackmes.one/crackme/69a2c7347b3cc38c80464d8f) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | Fatmike |
| **Plateforme** | Windows PE64 GUI (MSVC 2022, C++, WinMM `waveOut*`) |
| **ZIP** | `original/Crackme10.zip` (mot de passe `crackmes.one`), contient `RecordPlayer.exe` |
| **SHA-256 (exe)** | `c0846e7b630e3d307ed795378b5346b90cc524a508d35a118979f85938d0f5a3` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/Crackme10.zip` | archive d'origine (non modifiée) |
| `analysis/extract/Crackme#10/` | exe extrait du ZIP + README de l'auteur |
| `analysis/run/RecordPlayer-patched.exe` | copie patchée (2 octets) — **hors `original/`** |
| `analysis/screenshot-ko-original.png` / `screenshot-ok-patched.png` | preuve Wine |
| `tools/recordplayer-solve.py` | solveur : flag, `--check`, `--patch` |
| `tools/wine-live.sh` | harnais Xvfb + Wine + xdotool + ffmpeg |

## Réponse

Flag : **`CMO{y0u_g0t_r1ckr0ll3d}`** (il s'affiche dans la fenêtre « WELL DONE! » après PLAY une fois les deux « switches » corrigés).

```bash
python3 -I tools/recordplayer-solve.py "analysis/extract/Crackme#10/RecordPlayer.exe"          # flag
python3 -I tools/recordplayer-solve.py "analysis/extract/Crackme#10/RecordPlayer.exe" --check  # OK
python3 -I tools/recordplayer-solve.py "analysis/extract/Crackme#10/RecordPlayer.exe" --patch analysis/run/RecordPlayer-patched.exe
```

Pas de username : pas d'exemple `petik` applicable.

## Premier regard

- `file` : PE32+ GUI x86-64 ; `diec` : MSVC 19.44 / VS2022.
- `strings` : rien d'exploitable (pas de flag en clair, `Unable to retrieve the skin.`, URLs crackmes.one).
- Ressources (pefile) : `SOUND/141` = **WAV 720 702 octets** (PCM 8 bits, mono, 44 100 Hz, ≈ 16,3 s), `BINARY/111` = `RGNDATA` (forme de la fenêtre skinnée), bitmaps du skin, 3 dialogues (principal, About, « Well done »).
- Imports `WINMM` : `waveOutOpen / PrepareHeader / Write` → le programme joue le WAV lui-même.
- README de l'auteur : deux « switches » sous PLAY (sens de rotation + pitch) sont cassés, à réparer.

## Flow

PLAY (`0x3e9`) → charge la ressource 141, règle sens + pitch, ouvre `waveOut` et pousse des buffers de 0x2000 octets. Re-cliquer PLAY arrête la lecture. Après ≈ 3 s de lecture correcte, une fenêtre affiche le flag.

## Comment on trouve

**Ancrage** : pas d'IDA sur la machine → `objdump -d -M intel` (listing `full.asm`, 5255 lignes), pefile/capstone. Les xrefs sur `waveOutWrite` (`0x140006310`) mènent à la classe lecteur : `0x140002310` (remplissage des buffers, octet par octet), `0x140001e20` (lecture rééchantillonnée), `0x140001030` (hash).

**1. Les « switches » = deux paramètres en dur dans le handler PLAY** (`0x140003860`, cmd `0x3e9`) :

```asm
140003923: mov edx,0x8d          ; ressource SOUND 141
140003928: call 0x140001f50      ; parse l'en-tête WAV
14000392d: mov dl,1              ; <- switch 1
14000392f: mov rcx,[rbx+0x50]
140003933: call 0x140003a00      ;   [rcx+0x18] = (dl^1)*2-1  → dl=1 : pas = -1 (marche arrière)
140003938: mov dl,1              ; <- switch 2
14000393e: call 0x140003a20      ;   [rcx+0x1d] = dl         → dl=1 : lecture « pitchée »
```

Le défaut du constructeur (`0x1400016f0`) est déjà `pas = -1`. Avec `dl=0` : pas = `+1` (sens normal) et pitch brut.

**2. Le mode pitch** (`0x140001e20`) : interpolation linéaire avec une vitesse `[+0x158]` qui dérive (`+= [+0x160]*cst`, `[+0x160]` change de signe aux bornes) → le flux n'est plus la suite d'octets du WAV. Avec `[+0x1d]=0`, `0x140002310` lit `data[pos]` puis `pos += pas`.

**3. Le check caché** (`0x140002310`, suite du remplissage) : chaque octet joué est empilé dans une deque (`[r14+0x110]`). Dès que la deque contient 23 octets (taille du vecteur clé `[r14+0x138..0x140]`), il calcule `m[i] = fenêtre[i] ^ clé[i]` puis `FNV-1a-32(m)` (`0x140001030` : `h=0x811c9dc5; h=(h^b)*0x1000193`) et compare à `[r14+0x150]`. Égalité → callback (`[rcx+0x10]`) avec `m` : c'est le texte de la fenêtre « WELL DONE ».

Constantes posées par le constructeur `0x1400016f0` :

```asm
mov DWORD [rbp-0x28],0xfc3d2b30 ... ; clé 23 octets (immédiates u32 LE)
mov DWORD [rdi+0x150],0x18940a3d    ; hash cible
```

Clé = `30 2b 3d fc f6 b6 06 3b 0e b1 ed c0 e1 48 07 0c 0b bb f4 f9 48 01 19`.

**4. Assemblage de la réponse (sans lancer le programme)** : le flux joué correctement est simplement `data` du WAV dans l'ordre. On glisse une fenêtre de 23 octets, on XOR avec la clé et on teste FNV-1a. Une seule position passe : **octet 132 300 = 3,000 s** (132300/44100) →

```
fenêtre ^ clé = 43 4d 4f 7b ... 64 7d = "CMO{y0u_g0t_r1ckr0ll3d}"
```

Dans le sens inverse ou avec le pitch dérivant, cette fenêtre n'apparaît jamais dans le flux → pas de flag. Le WAV est donc l'« enregistrement » dans lequel le flag est caché (jeu de mot « rickrolled » : on s'est fait avoir).

**Pièges** : (a) `strings` ne voit rien, le flag n'existe nulle part en clair ni dans le binaire (il faut clé + audio) ; (b) le pitch n'est pas un simple resampling constant : tester seulement `reverse` ne suffit pas ; (c) les deux « switches » ne sont pas des contrôles UI cliquables — ce sont les `mov dl,1`.

## Debug GDB

Non utilisé (PE sous Wine, reverse statique + exécution Wine).

## Vérification

Sous Xvfb sans carte son, `waveOutOpen` réussit quand même (device nul de Wine) et le compteur d'octets avance, ce qui suffit au check.

```bash
# KO : exe d'origine, PLAY, 8 s → aucune fenêtre
FMEXE=RecordPlayer.exe        tools/wine-live.sh "820,522" out.png 6
# OK : exe patché (b2 01 → b2 00 en 0x2d2d+1 / 0x2d38+1 du fichier), PLAY, 8 s → WELL DONE + flag
FMEXE=RecordPlayer-patched.exe tools/wine-live.sh "820,522" out.png 8
```

| Cas | Capture |
|---|---|
| KO — original, lecture inversée/pitchée | [`screenshot-ko-original.png`](analysis/screenshot-ko-original.png) |
| OK — patché, flag affiché | [`screenshot-ok-patched.png`](analysis/screenshot-ok-patched.png) |

Dans la capture OK, la fenêtre affiche bien `CMO{y0u_g0t_r1ckr0ll3d}`, identique au flag calculé hors-ligne par le solveur (`--check` : OK).

## Notes

- Le flag n'est pas « saisi » : c'est un **patch** (2 octets, fichier `0x2d2e` et `0x2d39`, VA `0x14000392e` / `0x140003939`) qui restitue l'audio d'origine. L'original reste intact dans le ZIP.
- Le solveur calcule le flag **sans** exécuter le binaire (clé + hash + WAV) ; la preuve Wine confirme la même valeur.
