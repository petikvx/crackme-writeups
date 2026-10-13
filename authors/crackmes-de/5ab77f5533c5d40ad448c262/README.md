# crackmes.de's baby_crackme_1 by haiklr

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c262`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c262) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (auteur réel : haiklr) |
| **Plateforme** | Windows PE32 GUI, MASM32, x86 |
| **Difficulté** | 2.0 |
| **SHA-256 (zip site)** | `999093a3e0f246d112d539fdc18a6777d18607a19693fd3e9ab76be0cfe75734` |
| **SHA-256 (exe)** | `ba6ff9077f3b753af01951138cdfa650aae00c4836bbf5bf3a331e448c55a866` |

Serial seul (pas de nom), 29 caractères. Readme intégré (bouton `About`) : *« bruteforcing is forbidden »*.

## Fichiers

| Chemin | Contenu |
|---|---|
| `original/Baby_Crackme_#1.zip` | archive crackmes.one (mdp `crackmes.one`) |
| `original/Baby Crackme #1.exe` | PE MASM32 (extrait du zip interne) |
| `tools/haiklr-baby1-solve.py` | générateur de serial (construction directe, pas de bruteforce) + `--check` |
| `tools/verify-click.c` | pilote Win32 (mingw) : remplit l’edit, clique `Play`, lit la MessageBox sous Wine |

## Réponse

```
123490798638;1061110611203486
```

Autre serial valide : `1000:07:699:999:1000010080000`.
Résultat : MessageBox **« Winneur ! » / « Congratz ! Send me your solution ! »**.

## Premier regard

- DIE : MASM32, `.text` de 0x846 octets ; dialogue construit en mémoire (`DialogBoxIndirectParamA`).
- `WM_COMMAND` : id `0x3e8` (`Play`) → vérification `0x401000` ; id `0x3e9` (`About`) → règles.
- Saisie : `GetDlgItemTextA(hDlg, 0x3ea, buf@0x40316c, 0x1e)`.

## Prédicat (`0x401000`)

1. Longueur **exactement 29** (`cmp eax, 0x1d`).
2. Chaque caractère dans `'0'..'?'` (`0x30 ≤ c < 0x40`) ; il est converti en « chiffre » `d[i] = c − 0x30`
   (donc `:`=10, `;`=11, … `?`=15) et stocké en `0x403000+i`.
3. Le caractère `'7'` apparaît **une seule fois** (compteur `edx == 1`), et `buf[6] == '7'`.
4. `d0, d4, d8, d12, d16, d21 ≠ 0`.
5. La routine `0x4011e9` (`v = v*10 + d`) découpe les chiffres en six nombres :
   `N1 = d0..d3`, `N2 = d4..d7`, `N3 = d8..d11`, `N4 = d12..d15`, `N5 = d16..d20`, `N6 = d21..d28`.
6. Avec les chiffres de N2 (`d4 d5 d6 d7`) comme multiplicateurs de N1 :
   - `d7·N1 == N5`
   - `d6·N1 == N3` → `N3 = 7·N1` (puisque `d6 = 7`)
   - `d5·N1 == 0` → `d5 = 0`
   - `d4·N1 == N4`
   - `N5 + 10·N3 + 1000·N4 == N6`

## Construction

On choisit `N1`, `a = d4`, `b = d7` puis on écrit chaque nombre sur sa largeur fixe. Comme les
« chiffres » peuvent valoir jusqu’à 15, une valeur trop grande pour sa largeur s’encode quand même
(`11106` sur 4 positions = `;106`), et un 7 interdit peut être évité de la même façon.

Exemple `N1 = 1234`, `a = 9`, `b = 9` :

| Bloc | Valeur | Encodage |
|---|---|---|
| N1 | 1234 | `1234` |
| N2 | a,0,7,b | `9079` |
| N3 = 7·N1 | 8638 | `8638` |
| N4 = 9·N1 | 11106 | `;106` |
| N5 = 9·N1 | 11106 | `11106` |
| N6 = N5 + 10·N3 + 1000·N4 | 11203486 | `11203486` |

## Preuve

Sous Wine (xvfb), `verify-click.exe <serial>` (`SetDlgItemText(0x3ea)` + `WM_COMMAND 0x3e8`) :

```
123490798638;1061110611203486 -> Winneur ! | Congratz ! Send me your solution !
1000:07:699:999:1000010080000 -> Winneur ! | Congratz ! Send me your solution !
12349079863811106112034860000 -> Loser ! | Try again !
```
