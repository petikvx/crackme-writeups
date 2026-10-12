# crackme_2.0_by_c0de0f by c0de0f (crackmes.de)

« CrackMe 2.0 » — c0de0f (2002).

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1ff>
- **Plateforme** : Windows **PE32** GUI, **Visual Basic 6 natif** (site : Unspecified/other) — difficulté 1.0
- **Archive** : `original/c0de0f_crackme_2.zip` → `CrackMe.exe` + `C0DE0F.NFO`
- **SHA-256 zip** : `89992c7dfc52e5f927ac452275944bd19f588043c1d2057f7ef2e7e94ae2eaac`
- **Statut** : résolu, vérifié **sous wine** (runtime VB6) : MessageBox « win »

## Solution

Pas de nom : le serial dépend **de la date du jour** (horloge locale).

```
serial = jour × mois × 1440 + année
```

```
python3 tools/c0de0f-crackme-2-solve.py              # aujourd'hui
174826                                               # 2026-10-12 : 12×10×1440 + 2026
python3 tools/c0de0f-crackme-2-solve.py 2002-11-28
445522
```

Taper le serial, **Check** → le bouton **Register** (grisé) s’active → **Register** → « win ».

## Comment on trouve

1. `diec` : VB6 *native* ; chaînes UTF-16 : `win`, `Losserrrr…`, `dd`, `mm`, `yyyy`, `hh` ;
   contrôles `Text1`, `Command2` (*Check*), `Command1` (*Register*, désactivé), `Temp` (TextBox cachée).
   Imports utiles : `__vbaVarMul`, `__vbaVarAdd`, `__vbaStrCmp`.
2. On annote les appels via l’IAT (`objdump` + `pefile`) et on repère trois handlers :
   - `0x402250` (chargement de la Form) : quatre fois `ord610`/`ord612` (date / heure courantes) suivis de
     `ord660` (`Format(var, fmt)`) avec `"dd"`, `"mm"`, `"yyyy"`, `"hh"`. Puis
     `__vbaVarMul(mm, dd)`, `__vbaVarMul(·, 1440)` (`0x5a0`, `vbInteger`), `__vbaVarAdd(yyyy, ·)`,
     `__vbaStrVarMove` → écrit dans `Temp.Text` (vtable `+0xa4`, `put_Text`). `"hh"` n’est pas utilisé.
     Les opérandes sont des chaînes (`"12"`, `"10"`, `"2026"`) : VB convertit en nombres dès qu’un opérande est numérique.
   - `0x401fb0` (*Check*) : `__vbaStrCmp(Temp.Text, Text1.Text)` ; égal → `Command1.Enabled = True`
     (vtable `+0x8c`, valeur `-1`), sinon `MsgBox "Losserrrr…"`.
   - `0x401ea0` (*Register*) : `MsgBox "win"`.

## Vérification

```
tools/verify-wine.sh 174826     # MSGBOX_OnInit L"win"
tools/verify-wine.sh 123456     # MSGBOX_OnInit L"Losserrrrrrrrrrrrrrrrrrrrrrrrrrrrr"
```

Binaire original (non patché) sous wine/Xvfb le 2026-10-12 : xdotool tape le serial, clique *Check* puis
*Register* ; texte lu via `WINEDEBUG=+msgbox`. Le serial n’est valable que le jour où on le calcule.
