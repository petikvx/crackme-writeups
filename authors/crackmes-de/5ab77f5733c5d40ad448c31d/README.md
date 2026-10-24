# crackmes.de's crackme02 by attilhaz

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c31d`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c31d) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (AttilhaZ, 2004) |
| **Plateforme** | Windows PE32 GUI, Visual Basic 6 **natif** (MSVBVM60) |
| **SHA-256 (zip)** | `1956a342b1530ace780f44152d685d72f6c0d0e2a69db21614f6c0f04c071fb5` |
| **SHA-256 (`Crackme02.exe`)** | `4e83b1be12a5272e8777f3d60231cc4810e06bb8a9ca3a985bb35c64426fcb1f` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme02.zip` | archive d'origine (mot de passe `crackmes.one`) : `Crackme02.exe` + `Readme.txt` |
| `analysis/x/` | zip extrait (copie de travail, `original/` intact) |
| `analysis/dis.txt` | `objdump -d -M intel` de l'exe (recon) |
| `analysis/crackme02-patched.exe` | exe patché généré par le solveur |
| `tools/crackme02-solve.py` | patcheur + `--check` (preuve live Wine, cas OK et KO) |

## Réponse

Aucun serial : le `Readme.txt` dit *« you must delete the NAG Screen! You can patch it! »*. Le crackme est un **patch**.

| Offset fichier | VA | Avant | Après | Effet |
|---|---|---|---|---|
| `0x22e0` | `0x4022e0` | `55 8b ec` | `c2 04 00` | le handler qui affiche la MsgBox « NAG » retourne immédiatement (`ret 4`) |

```bash
python3 tools/crackme02-solve.py          # écrit analysis/crackme02-patched.exe
python3 tools/crackme02-solve.py --check  # Xvfb + Wine : patché -> pas de NAG, origine -> NAG
```

Pas de nom d'utilisateur dans ce crackme (donc pas d'exemple `petik`).

## Premier regard

```bash
unzip -P crackmes.one original/crackme02.zip -d analysis/x
diec analysis/x/Crackme02.exe      # PE32, MS Linker 6.0, Visual Basic 6.00.8041 [Native]
strings -n 5 analysis/x/Crackme02.exe
strings -el -n 3 analysis/x/Crackme02.exe
```

- `strings -el` (UTF-16) : `Remove Me`, `NAG`, `There isn't any rule. You can patch me!!!`, `Rulez`, `About`, `Written for you by AttilhaZ!!!`.
- `strings` ASCII : noms de contrôles (`Text1..3`, `Label1`, `Line1`), `Remove the NAG screens!!!!`, import `__vbaVarDup`, etc.
- Lancé sous Wine (`xvfb-run`/Xvfb) : **avant** la fenêtre principale (152×122, titre `Crackme02`), une MsgBox d'icône critique, titre **`NAG`**, texte « Remove Me », bloque l'exécution.

## Flow

VB6 natif : le code utilisateur est du x86 classique dans `.text`, appelé via une table d'événements (`05 00 08 00 <thunk>` à `0x401093`, 4 entrées). Les 4 handlers (prologue `55 8b ec`, `ret 4` final car stdcall avec `Me` en argument) :

| Handler (VA) | Rôle |
|---|---|
| `0x402100` | MsgBox « Written for you by AttilhaZ!!! » (titre `About`, style `0x40` info) |
| `0x402210` | affiche l'autre Form (objet global `0x4032d4`, appel `[vtbl+0x10]` = `Show`) |
| `0x4022e0` | **MsgBox « Remove Me », style `0x10` (critique), titre `NAG`** |
| `0x402400` | MsgBox « There isn't any rule. You can patch me!!! » (titre `Rulez`) |

## Comment on trouve

1. **Ancrage** : `objdump -d -M intel analysis/x/Crackme02.exe > analysis/dis.txt` (offset fichier = VA − 0x400000, `.text` à `0x1000`). Les chaînes UTF-16 `Remove Me` / `NAG` sont à `0x4019dc` (`ebp-0x5c` = prompt `0x4019dc`, titre `NAG` juste derrière).
2. **Lecture** — handler `0x4022e0` :

```asm
4022e0: push ebp / mov ebp,esp ...        ; prologue VB (SEH, frame)
402365: mov  [ebp-0x6c], 0x4019f4         ; titre  "NAG"
40236f: mov  [ebp-0x5c], 0x4019dc         ; prompt "Remove Me"
40238a: push 0x10                         ; vbCritical
40238d: call [0x40101c]                   ; rtcMsgBox
...
4023f1: ret  4
```

   Pas de condition, pas de variable testée : le NAG est inconditionnel, déclenché à l'ouverture. Les autres handlers (`About`, `Rulez`) ont une structure identique mais d'autres chaînes.
3. **Identification du bon handler** : en essayant les candidats, seul le patch de `0x4022e0` fait disparaître la fenêtre `NAG` (vu avec `xdotool search --onlyvisible`, qui liste `Crackme02` + `NAG` à l'origine, `Crackme02` ×2 après patch — la 1×1 est la fenêtre cachée du runtime VB).
4. **Patch** : remplacer le prologue par `c2 04 00` (`ret 4`) — le handler est stdcall avec 1 argument (`Me`), donc `ret 4` rend la pile cohérente. Alternative équivalente : NOPer le `call [0x40101c]` n'est pas viable (stdcall à 5 arguments, il faudrait aussi rééquilibrer la pile), d'où le choix du `ret 4` en tête de handler.
5. **Piège** : l'offset fichier. Mon premier essai à `0x12e0` (au lieu de `0x22e0`) tapait dans des données (`2e 6f 72`) : rien n'était patché et le NAG restait. Le `assert` sur `55 8b ec` dans le solveur évite ça.

## Vérification

```text
$ python3 tools/crackme02-solve.py --check
patché -> .../analysis/crackme02-patched.exe (sha256 9be7f2141ab5cf9856fe6fd074892ae52d9551f8fc02a31e4b6866db0807d2e1)
  0x22e0: 558bec -> c20400
[patché]  fenêtres: ['Crackme02', 'Crackme02'] -> NAG non
[origine] fenêtres: ['Crackme02', 'NAG'] -> NAG OUI
CHECK OK
```

- OK : exe patché sous Wine → plus de MsgBox, la fenêtre principale apparaît directement.
- KO / témoin : exe d'origine → fenêtre `NAG` présente.

## Notes

- Aucun check GDB/x64dbg n'a servi : reverse statique + preuve Wine.
- `original/` n'est jamais modifié ; le patch est écrit dans `analysis/`.
- Ce n'est *pas* un crackme à serial : rien à saisir.
