# crackmes.de's crackme_4 by magenta

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c35c`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c35c) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (magenta) |
| **Plateforme** | Windows PE32 GUI, Visual Basic 5 (code natif, `MSVBVM50.DLL`) |
| **SHA-256 (zip)** | `a731d997b683339a01451cc415fc90ecbe3e588a964f9b07a9c7f08d72a5eb0c` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/magenta4.zip` | archive d'origine (mot de passe `crackmes.one`) : `Crackme#4.exe` + `Crackme#4.txt` |
| `analysis/extract/` | contenu dézippé (non patché) |
| `analysis/command1_click.annotated.txt` | désassemblage de `Command1_Click` avec les imports VB annotés |
| `analysis/screenshot-ok.png`, `screenshot-ko.png` | preuve Wine/xvfb |
| `tools/magenta4-solve.py` | solveur / keygen (`-q`, `--all N`, `--check PW`) |
| `tools/annotate-pe.py` | capstone + pefile : annote les `call [IAT]` |

## Réponse

Mot de passe = **8 chiffres** `d1…d8` (le premier ≠ 0) tels que :

```
d1*d2 + d5*d6 + d7 − d8 − (10*d3 + d4) = 10
```

| Exemple | |
|---|---|
| **`10001190`** | première solution du solveur |
| `25000000`, `93100007` | autres solutions (testées en live) |

```bash
python3 tools/magenta4-solve.py            # Password: 10001190
python3 tools/magenta4-solve.py -q         # 10001190
python3 tools/magenta4-solve.py --all 5
python3 tools/magenta4-solve.py --check 93100007   # OK
```

Le `.txt` de l'auteur le dit : « There should be more than only one good key » — il y en a des milliers. (Pas de champ user : pas de `petik` ici.)

## Premier regard

```bash
file original/…           # PE32, GUI, i386
diec Crackme#4.exe        # Microsoft Visual Basic (5.0)
strings -n 4 Crackme#4.exe
```

`strings` révèle `MSVBVM50.DLL`, `Command1_Click`, `Timer1_Timer`, et tous les `__vbaVar*` (`VarMul`, `VarAdd`, `VarSub`, `VarCmpEq/Lt/Gt`, `VarOr`, `VarTstEq`, `LenVar`), plus les ordinaux 581/595/632. Les chaînes UTF-16 (`You must enter a 8 number password`, `Error`, `Well done`, `Congratulations`, `You failed, try again looser`) sont dans la zone de métadonnées VB. L'UI : un `Text1`, un bouton `Ok` (`Command1`), un `Timer1` (qui ne fait que bouger le titre `Magenta [GD]`).

## Flow

1. `Command1_Click` (code natif @ `0x402040`, pas de P-code).
2. `Val(Text1.Text)` → Variant Double.
3. Si `Len(v) = "" Or Len(v) < 8 Or Len(v) > 8` → MsgBox « You must enter a 8 number password ».
4. `d1..d8 = Mid(v, i, 1)` (Variants String).
5. Calcul arithmétique en Variants, comparé à `10` → « Well done » / « You failed… ».

## Comment on trouve le prédicat

**Ancrage** : `objdump -d --start-address=0x402040` (le code est tout en bas de `.text`, après les structures VB : header `VB5!`, tables d'objets, chaînes). Les appels se font par `call [0x4041xx]` dans l'IAT ; comme `objdump` ne les nomme pas, `tools/annotate-pe.py` (pefile + capstone) ajoute `; __vbaVarMul` etc. Résultat : `analysis/command1_click.annotated.txt`.

**Entrée** :

```asm
402126  call [0x404154]   ; __vbaObjSet      (Text1)
402138  call [edx+0xa0]                      (get_Text)
40215b  call [0x404208]   ; ordinal 581      (Val : BSTR -> double sur la FPU)
40216d  fstp qword [ebp-0x164]               ; Variant type 5 (Double) -> ebp-0x74 via __vbaVarMove
```

**Test de longueur** (4021a0–40225b) : trois `__vbaLenVar` sur `[ebp-0x74]` comparés à `""`, `8` (`__vbaVarCmpLt`) et `8` (`__vbaVarCmpGt`), combinés par `__vbaVarOr`, puis `__vbaBoolVarNull` ; vrai → MsgBox d'erreur. Donc exactement 8 caractères **après `Val`** : pas de zéro en tête (`Val("01000000")` = 1000000 → 7 car.).

**Découpage** (402341–402542) : huit `rtcMidCharVar` (ordinal 632) avec `start = 1..8`, `len = 1` ; les résultats sont rangés (via `__vbaVarMove`) dans :

| digit | d1 | d2 | d3 | d4 | d5 | d6 | d7 | d8 |
|---|---|---|---|---|---|---|---|---|
| Variant | `ebp-0x44` | `-0x54` | `-0x64` | `-0x84` | `-0x94` | `-0xa4` | `-0xb4` | `-0xc4` |

**Calcul** (402544–4025d4). Convention des helpers VB : `__vbaVarOp(res, p2, p3)` avec les paramètres poussés de droite à gauche — c'est-à-dire que `p2` est l'opérande **droit** et `p3` le gauche (piège ci-dessous).

```asm
402559  Mul(res=ec,   p2=d2, p3=d1)            ; ec  = d1*d2
402574  Add(res=fc,   p2=d4, p3=d3)            ; fc  = d3 + d4   (String+String => CONCATENATION)
40257e  Sub(res=10c,  p2=fc, p3=ec)            ; 10c = ec - fc   = d1*d2 - "d3d4"
40259a  Mul(res=11c,  p2=a4, p3=94)            ; 11c = d5*d6
4025a4  Add(res=12c,  p2=11c, p3=10c)          ; 12c = d5*d6 + 10c
4025b5  Add(res=13c,  p2=b4, p3=12c)           ; 13c = 12c + d7
4025c6  Sub(res=14c,  p2=c4, p3=13c)           ; 14c = 13c - d8
4025d4  VarMove -> ebp-0xd4
40261b  __vbaVarTstEq(10, [ebp-0xd4])           ; == 10 ?  non -> 40288b "You failed"
```

D'où `d1*d2 − (d3‖d4) + d5*d6 + d7 − d8 = 10`, avec `d3‖d4` = concaténation des deux **chaînes** (Add de deux Variants String ⇒ concat en VB), donc `10*d3 + d4`.

### Pièges

- **Concaténation vs addition** : `Mid` renvoie des Variants String ; `d3 + d4` n'additionne pas, il concatène (`"3"+"1"="31"`). Seule opération de la formule dans ce cas ; les `Mul` convertissent en nombres, et `Add/Sub` avec un opérande numérique sont numériques.
- **Ordre des opérandes** : mon premier modèle supposait `res, gauche, droite` et donnait `d8 − (…) = 10` ; il échouait en live (`11000009` → « You failed »). L'ordre réel est inversé (opérande gauche = dernier poussé sur la pile sauf `res`) : le test discriminant `93100007` (OK) / `93010007` (KO) — mêmes chiffres échangés en d3/d4 — a tranché à la fois le signe et l'ordre de concaténation.
- `Val` : le texte doit être un nombre de 8 chiffres sans zéro initial ; `Len` s'applique au Double reconverti en chaîne.

## Debug GDB / x64dbg

Non utilisés (pas de GDB sur un PE VB natif ; aucune session x32dbg active). Reverse statique (`objdump` + `annotate-pe.py`) + validation dynamique par Wine/xvfb. IDA MCP non utilisé.

## Vérification

Banc d'essai : `xvfb-run -a -s "-screen 0 800x600x24"`, `wine c4.exe` (le vrai `MSVBVM50.DLL` est présent dans le préfixe Wine), `xdotool` clique la zone de texte (75,53), tape le mot de passe, clique `Ok` (75,93), capture via `PIL.ImageGrab`. La MsgBox s'ouvre en bas de l'écran virtuel (coupée sur les captures).

| Mot de passe | Attendu (solveur) | Wine |
|---|---|---|
| `10001190` | OK | « **Well done** » — [`analysis/screenshot-ok.png`](analysis/screenshot-ok.png) |
| `25000000` | OK | « Well done » |
| `93100007` | OK | « Well done » |
| `93010007` | KO (d3/d4 inversés) | « You failed, try again looser » — [`analysis/screenshot-ko.png`](analysis/screenshot-ko.png) |
| `11000009` | KO | « You failed, try again looser » |
| `12345678` | KO | « You failed, try again looser » |

## Notes

- Rien n'est patché ; `original/` intact.
- Il s'agit d'un keygen « famille de solutions » : toute chaîne de 8 chiffres vérifiant l'équation passe.
