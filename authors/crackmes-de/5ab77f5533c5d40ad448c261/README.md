# crackmes.de's baby_crackme_2 by haiklr

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c261`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c261) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (auteur réel : haiklr) |
| **Plateforme** | Windows PE32 GUI, MASM32, x86 |
| **Difficulté** | 2.0 |
| **SHA-256 (zip site)** | `136cab5bfd730b1ec12b97be7f3f7c6511e456429ab18a7318e79ee8f7a1997d` |
| **SHA-256 (exe)** | `24f0d5f330397da0db3127cd2e9a9c6b7bd182beb709813ea62121a1bec10466` |

Crackme **keyfile** : la fenêtre n’a qu’un bouton `Play`, aucune saisie. Tout se joue dans un fichier
nommé `BC#2` lu dans le répertoire courant.

## Fichiers

| Chemin | Contenu |
|---|---|
| `original/Baby_Crackme_#2.zip` | archive crackmes.one (mdp `crackmes.one`) |
| `original/Baby Crackme #2.exe` | PE MASM32 (extrait du zip interne) |
| `tools/haiklr-baby2-solve.py` | générateur du keyfile `BC#2` + revalidation du prédicat |
| `tools/BC#2` | keyfile exemple (20 octets) |
| `tools/verify-click.c` | petit pilote Win32 (mingw) : clique `Play` et lit la MessageBox sous Wine |

## Réponse

Keyfile **`BC#2`** (20 octets, hex) :

```
0a0b0c0d0e 706574696b 4344 2353 2d2d2d2d2d2d
```

Soit `\x0a\x0b\x0c\x0d\x0e` + `petik` (libre) + `CD` + `#S` + `------` (libre).
Résultat : MessageBox **« Winneur ! » / « Congratz ! Send me your solution ! »**.

```
python3 tools/haiklr-baby2-solve.py -o "BC#2"   # à côté de l'exe
```

## Premier regard

- DIE : MASM32, linker MS 5.12, 4 sections, `.text` de 0x452 octets seulement.
- Imports : `CreateFileA`, `ReadFile`, `DialogBoxIndirectParamA`, `MessageBoxA`… pas de `GetDlgItemText` → keyfile.
- `.data` @ `0x403000` : la chaîne `BC#2` (nom du fichier), puis `Congratz ! Send me your solution !` / `Winneur !` et `Try again !` / `Loser !`.
- Le dialogue est construit en mémoire (template `DLGTEMPLATE` à la main) ; `WM_COMMAND` id `0x3e8` (bouton `Play`) appelle la routine de vérification `0x401000`.

## Prédicat (routine `0x401000`)

1. `CreateFileA("BC#2", GENERIC_READ, …, OPEN_EXISTING)` ; échec → *Loser*.
2. `ReadFile(h, 0x4030ac, 0x14, …)` → buffer `k[0..19]`.
3. **Suite consécutive** : pour `i = 1..4`, `k[i] - k[i-1] == 1`.
4. **Somme de carrés** : `k0² + k1² + k2² == k3² + k4²`.
   Avec `k = a, a+1, …, a+4` : `3a² + 6a + 5 = 2a² + 14a + 25` ⇒ `a² − 8a − 20 = 0` ⇒ **`a = 10`**
   (la célèbre identité `10² + 11² + 12² = 13² + 14² = 365`). Octets `0a 0b 0c 0d 0e`.
5. **Octets 10–11** (`0x4030b6/b7`) : `k11 − k10 == 1` et `k10·k11 − 0x1145 == k10 + k11`.
   Avec `x = k10` : `x² − x − 4422 = 0`, discriminant `17689 = 133²` ⇒ **`x = 67`** → `CD`.
6. **Octets 12–13** (`p = k12`, `q = k13`) :
   `n = (10p + q)² + (10q + p) + 2` doit être un **carré parfait**. Le test est fait à la FPU :
   `fild n ; fsqrt` puis `fild n ; fsqrt ; frndint ; fsub st, st(1) ; ftst` → il faut `round(√n) == √n`.
   (Le résultat `n` est écrit en `0x4030b0`, donc il écrase `k4..k7`, mais après leur vérification.)
   Le cas `√n = 10p + q + 1` donne `8q = 19p − 1`, ex. `p = 3, q = 7` (`37² + 75 = 38²`).
   Le solveur choisit le premier couple imprimable : `p = '#' (35)`, `q = 'S' (83)` :
   `433² + 867 = 188356 = 434²`.
7. Octets 5–9 et 14–19 : jamais lus → libres.

## Preuve

Sous Wine (xvfb) : `bc2.exe` lancé dans un dossier contenant `BC#2`, puis `verify-click.exe`
(`PostMessage(WM_COMMAND, 0x3e8)` sur la fenêtre « Baby Crackme #2 ») :

```
avec tools/BC#2           → Winneur ! | Congratz ! Send me your solution !
avec "AAAAAAAAAAAAAAAAAAAA" → Loser ! | Try again !
```
