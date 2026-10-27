# lolcrackme1 (jim / JiM~)

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c38b`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c38b) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | crackmes.de / JiM~ |
| **Plateforme** | Windows PE32 GUI, **Visual Basic 6 natif** (MSVBVM60) |
| **SHA-256 (zip)** | `73e0478c43fd0ebc0850ecdc205aea13fd0402e8d259fdcae45d8e2215fd6927` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/lolcrackme1.zip` | archive d'origine (mot de passe `crackmes.one`), contient `lolcrackme1.exe` + `lolcrackme1.txt` |
| `analysis/extracted/` | extraction du zip (exe intact + readme de l'auteur) |
| `analysis/lolcrackme1.objdump.txt` | `objdump -d -M intel` complet |
| `analysis/screenshot-ok.png`, `screenshot-ko.png`, `screenshot-check-disabled.png` | preuves Wine |
| `tools/lolcrackme1-solve.py` | solveur (`-q`, `--check`) |
| `tools/verify-wine.sh` | pilote le vrai exe sous Xvfb+xdotool (à lancer depuis `analysis/extracted`) |

## Réponse

Pas de nom / serial saisi : le crackme est un **clavier de 5 boutons** (`1 2 3 4 5`) + `<` (clear) + `Check`. Il faut trouver la « combinaison » :

> **`2` → `1` → `1` → `5` → `5` → `3`**, puis **Check** → `Correct :)`

Le champ affiche alors `2a1e5c`.

```bash
python3 tools/lolcrackme1-solve.py          # explication complète
python3 tools/lolcrackme1-solve.py -q       # 2 1 1 5 5 3 ; --check = autotest du modèle
```

(Pas d'utilisateur dans ce challenge, donc pas de `petik`.)

## Premier regard

```bash
unzip -P crackmes.one original/lolcrackme1.zip -d analysis/extracted
diec analysis/extracted/lolcrackme1.exe     # PE32, MS Linker 6.0, Visual Basic 6.00 [Native]
strings -n 4 analysis/extracted/lolcrackme1.exe
```

`lolcrackme1.txt` : « Find the valid combination – No Patching ». Strings utiles : `Correct :)` / `We Have a Winner` / `Congratulations!` et `Incorrect :(` / `Unsuccessful`. Import ordinal-only de `MSVBVM60.DLL` (`__vbaStrCat`, `__vbaVarCat`, `__vbaLenBstr`, `__vbaStrCmp`…). Les chaînes VB sont en UTF-16 : `strings -el` ou un petit script Python.

Sous Wine (`xvfb-run -a wine`), la fenêtre est minuscule : boutons `1 2 3 4 5 <`, un champ, `About` et `Check` (grisé au départ).

## Flow

1. Chaque bouton `n` ajoute un caractère à une chaîne `s` stockée dans l'objet form (`[form+0x34]`).
2. Quand `Len(s) = 6` et que son 1er caractère vaut un chiffre pair parmi {2,4,6}, `Check` est activé.
3. `Check` transforme `s` (paires hex → octets) et la compare à une constante de 3 octets.

## Comment on trouve

Ancrage : le code VB est dans `.text` (0x401000–0x403f8c), les handlers d'évènements sont des fonctions consécutives. Les constantes sont dans la zone BSTR autour de `0x401db4–0x401f58` (chaque BSTR = longueur u32 + UTF-16, le pointeur pointe sur les caractères).

**Ordinaux MSVBVM60 utiles** (identifiés par leur usage) : `516` = `Asc`, `608` = `Chr$`, `617` = `Left$`, `632` = `Mid$`, `581` = `Val`, `595` = `MsgBox`, `__vbaLenBstr` = `Len`. Piège : l'ordre des arguments de `__vbaVarCat` — le 1er pushé (= dernier argument) est le résultat, et l'opérande **gauche** du `&` est celui poussé **en dernier** parmi les deux sources ; la lecture « naïve » inverse la concaténation (préfixe au lieu de suffixe), ce qui a été invalidé en observant le texte dans le champ.

### 1. Handlers des boutons (`0x402b30`, `0x402c00`, `0x402da0`, `0x402f40`, `0x4030e0`, `0x403280`)

Exemple, bouton `5` (`0x403280`) :

```asm
403503: mov edx,[esi+0x34]        ; s
4032d5: call __vbaLenBstr          ; Len(s)
4032db: and eax,0x80000001 ...     ; Len(s) Mod 2  (idiome VB6)
4032e7: cmp eax,1
4032ea: jne 0x403352
4032ee: push 0x401e10              ; BSTR "e"   <- Len impair
403352: push 0x401e18              ; BSTR "5"   <- Len pair
        ... Asc(...) ; Chr$(...) ; s = s & ch ; (écrit dans [esi+0x34])
```

Tous les handlers ont la même forme avec les paires de BSTR : `a/1` (`0x401dd0/dd8`), `b/2` (`de0/de8`), `c/3` (`df0/df8`), `d/4` (`e00/e08`), `e/5` (`e10/e18`).
Règle : **Len(s) impair → lettre, Len(s) pair → chiffre**. Les positions 1,3,5 (index humain) sont donc des chiffres, 2,4,6 des lettres `a–e`. Le bouton `<` (`0x403420`) remet `s` à `""` (BSTR vide `0x401e20`).

### 2. Fonction de transformation (`0x402880`)

```
out = ""
For i = 1 To Len(s) : (puis i = i + 1 dans le corps → pas de 2)
    out = out & Chr(Val("&h" & Mid(s, i, 2)))
```

Lue dans l'asm : `Mid$(s,i,2)` (ordinal 632, 4 args, longueur `2` dans le variant `[ebp-0x60]`), concat avec la BSTR `0x401db4` = `"&h"`, `Val`, `__vbaFpI4`, `Chr$`, concat à la sortie. L'incrément manuel `__vbaVarAdd` (`0x402a56`) en plus du `Next` donne bien un pas de 2. Donc chaque paire de caractères = un octet hexadécimal (`2a` → `*`).

### 3. Check (`0x4034c0`)

```asm
4034c0 ...
403528: call [edx+0x6f8]        ; out = transform(s)
403532: push 0x401e28           ; BSTR 6 octets : 2A 00 1E 00 5C 00  = "*" & Chr(30) & "\"
403537: call __vbaStrCmp
        => égal : MsgBox "Correct :)" / "We Have a Winner" / "Congratulations!"
        => sinon : "Incorrect :(" / "Unsuccessful", puis s = ""
```

La cible UTF-16 `2A 00 1E 00 5C 00` = octets `2A 1E 5C` → **hex `2a1e5c`**. Solution unique (transformation injective sur 6 chiffres hex).

### 4. Assemblage de la séquence

`2a1e5c` = `2` `a` `1` `e` `5` `c`. Parité : pos 1 (chiffre) `2` → bouton `2` ; pos 2 (lettre) `a` → bouton `1` ; pos 3 `1` → bouton `1` ; pos 4 `e` → bouton `5` ; pos 5 `5` → bouton `5` ; pos 6 `c` → bouton `3`. D'où **2 1 1 5 5 3** (la parité garantit que chaque bouton produit exactement le caractère voulu — le solveur l'asserte).

### 5. Activation de `Check` (`0x403880`)

`Len(s) = 6` (`cmp eax,6`) puis `Val(Left(s,1))` comparé aux doubles `2.0` (`0x4011a0`), `4.0` (`0x401198`), `6.0` (`0x401190`) ; `Check.Enabled = (x∈{2,4,6})`. Notre premier caractère est `2`, donc OK. Observé : `1b3` (3 car.), `1b3d` (4 car.) et `1b3d5a` (6 car., 1er = 1) laissent `Check` grisé.

## Debug GDB

Non utilisé (reverse statique + Wine ; VB6/PE32 sous Wine).

## Vérification (Wine, binaire d'origine)

Pilotage par `xvfb-run -a` + `xdotool` (clics aux coordonnées des boutons) + capture PIL :

```bash
cd analysis/extracted
xvfb-run -a -s "-screen 0 800x600x24" bash ../../tools/verify-wine.sh "2 1 1 5 5 3" /tmp/out.png   # clics 1..5 puis Check
```

- OK : `2 1 1 5 5 3` → champ `2a1e5c`, MessageBox **`Correct :)`** — [`analysis/screenshot-ok.png`](analysis/screenshot-ok.png)
- KO : `1 2 3 4 5 1` → `1b3d5a`, `Check` grisé (1er chiffre ≠ 2/4/6) — [`analysis/screenshot-ko.png`](analysis/screenshot-ko.png)
- KO : `1 2 3` → `1b3`, `Check` grisé — [`analysis/screenshot-check-disabled.png`](analysis/screenshot-check-disabled.png)

## Notes

- Aucun patch : binaire d'origine non modifié (seulement extrait du zip sous `analysis/extracted/`).
- Pièges : BSTR UTF-16 (le compare ne se voit pas avec `strings` ASCII), ordre des args de `__vbaVarCat`, boucle `For` + incrément manuel (pas de 2), `Check` désactivé tant que la longueur/1er chiffre ne conviennent pas.
- Un `1b3d5a` (6 caractères, 1er chiffre ≠ 2) est rejeté par la gate d'activation, pas par la comparaison.
