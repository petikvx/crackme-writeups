# crackmes.de's anonimoser_crackme_ii by anonimoser

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2e7`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2e7) |
| **Auteur (site)** | crackmes.de (auteur d'origine : AnonimoSer) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 GUI, Borland Delphi, packé UPX 1.21 |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `cec31a34d9f79005f065148b9eb1bcb36828c734f0a9c5c03d6463d4cf9ff691` |

## Solution

Keygen nom → code. Exemple : **nom `petik` → code `18177601272JJIONGBDJJ-AS`** (vérifié sous wine : MessageBox « Ok, lo lograste! »).

```bash
python3 tools/crackmes-de-anonimoser_crackme_ii-solve.py petik
# petik -> 18177601272JJIONGBDJJ-AS
```

## Origine

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2e7
- Download : https://crackmes.one/download/crackme/5ab77f5633c5d40ad448c2e7
- ZIP password : `crackmes.one`

Le zip contient `crackme2.zip` qui contient `AnonimoSer CrackME II.exe` (le crackme) et `web.exe` (petit lanceur de la page web de l'auteur, sans intérêt, non exécuté).

## 1. Premier regard

```bash
file "original/AnonimoSer CrackME II.exe"   # PE32 GUI, UPX compressed
diec "original/AnonimoSer CrackME II.exe"   # Borland Delphi, Turbo Linker 2.25, UPX 1.21
cp "original/AnonimoSer CrackME II.exe" analysis/unpacked.exe && upx -d analysis/unpacked.exe
```

Le DFM (ressource de la fiche) donne l'interface : `Edit1` (« Nombre », MaxLength), `Edit2` (« Codigo »), `BitBtn1` (**désactivé** au départ, `OnClick = BitBtn1Click`), `BitBtn2` « Salir ». Les deux champs ont `OnKeyUp = editcheck`.

## 2. Trouver les gestionnaires

La table des méthodes publiées Delphi (`word taille, dword adresse, shortstring nom`) donne directement :

| Méthode | Adresse |
|---|---|
| `nosice` (OnCreate, anti-SoftICE) | `0x45B6A0` |
| `editcheck` | `0x45B990` |
| `BitBtn1Click` | `0x45B9C0` |
| `BitBtn2Click` | `0x45B70C` |

`editcheck` et `BitBtn1Click` appellent tous les deux la même fonction booléenne **`0x45B71C`** :

- `editcheck` : si elle renvoie 1, `BitBtn1.Enabled := True`, sinon `False`. Le bouton ne s'allume donc **que si le code est déjà correct**.
- `BitBtn1Click` : si 1, `MessageBox("AnonimoSer Crackme I … Bien hecho cracker …", "Ok, lo lograste!")`, sinon `ShowMessage("Hey, cobarde.... Haciendo trampas?")` puis `Halt` (on a forcé le bouton).

Désassemblage de la fonction : [`analysis/check-0x45b71c.asm`](analysis/check-0x45b71c.asm).

## 3. La routine `0x45B71C`

Appels RTL reconnus : `0x42514C` = `TControl.GetText`, `0x407AE0` = `Trim`, `0x407E5C` = `StrLen`, `0x407B94` = `IntToStr`, `0x407BC4` = `StrToInt`, `0x403AA4` = char → string, `0x403B84` = `LStrCat`, `0x403C3C` = `LStrCatN`, `0x403C8C` = `LStrCmp`.

Avec `N = Trim(Edit1.Text)`, `C = Trim(Edit2.Text)`, `n = len(N)` :

1. `N` et `C` non vides, et `n ≥ 5`.
2. `v = N[0] · Σ N[i] · (6·n)` (multiplications `imul` 32 bits signées), `S1 = IntToStr(v)`.
3. Pour chaque caractère `c` de `N` : `v += c`, puis on ajoute à `acc` la somme des chiffres de `IntToStr(v)` (`StrToInt` sur chaque caractère).
4. `acc := acc · esi`, où `esi` est le compteur de la dernière boucle interne en sortie, soit `len(IntToStr(v_final)) + 1` (subtilité : le compteur n'est pas remis à zéro).
5. `S1 := S1 + IntToStr(acc)`.
6. `T` = pour chaque paire de chiffres consécutifs de `S1` : `chr(0x41 + S1[i] + S1[i+1])`.
7. Code attendu = `S1 + T + "-AS"` (chaîne `-AS` à `0x45B98C`), comparé à `C` par `LStrCmp`.

Exemple `petik` : `Σ = 541`, `v = 112·541·30 = 1817760` ; boucle → `acc = 159`, `v_final = 1818301` (7 chiffres) donc `acc·8 = 1272` → `S1 = 18177601272` ; `T = JJIONGBDJJ` (1+8→J, 8+1→J, …) → `18177601272JJIONGBDJJ-AS`.

> Les valeurs restent positives pour des noms courts ; si `v` devenait négatif, `StrToInt('-')` lèverait une exception dans le programme. Le solveur le signale.

## 4. Vérification

Sur serveur sans écran, le script [`tools/wine-xdotool-check.sh`](tools/wine-xdotool-check.sh) lance le binaire d'origine sous `xvfb-run -a wine`, tape le nom puis le code avec `xdotool`, passe au bouton et appuie sur Entrée, puis liste les fenêtres visibles :

```text
$ xvfb-run -a tools/wine-xdotool-check.sh petik 18177601272JJIONGBDJJ-AS
visible: AnonimoSer CrackME II
visible: Form1
visible: Ok, lo lograste!
```

Contrôle négatif (`…BDJX-AS`) : le bouton reste désactivé, la tabulation tombe sur « Salir », le programme se ferme sans message de succès.

## Contenu

```
original/   # zip d'origine + crackme2.zip extrait (exe Delphi UPX, web.exe)
analysis/   # check-0x45b71c.asm (routine de vérif, après upx -d)
tools/      # keygen Python + script de vérification wine/xdotool
```

## Status

- [x] reverse
- [x] write-up
- [x] solveur
