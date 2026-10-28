# crackmes.de's boons_crackme_1 — Boon's crackme #1 (Boon)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3bb`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3bb) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | Boon (mirror crackmes.de → compte `crackmes.de`) |
| **Plateforme** | Windows PE32 GUI (MASM32, dialogue), x86 |
| **SHA-256 (zip)** | `8cfcb3659a494f12f667686304acc62262c2b37bc79a2b05d634f2bd1079903c` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme1.zip` | archive d'origine (mot de passe `crackmes.one`), non modifiée |
| `analysis/extracted/` | `Boon's crackme #1.exe` + `readme.txt` extraits |
| `analysis/boon1-patched.exe` | copie patchée générée par le solveur |
| `tools/boons-crackme1-solve.py` | patcheur (`--check`, `-q`, `-o`) |

## Réponse

Il n'y a **pas de mot de passe valide** : le champ n'est jamais comparé. Le but (cf. `readme.txt`) est de **patcher** pour que *n'importe quel* mot de passe (ex. `petik`) soit accepté. Il faut patcher **deux endroits** (2 octets chacun) :

| VA | offset fichier | avant | après | rôle |
|---|---|---|---|---|
| `0x40109b` | `0x49b` | `eb 16` | `90 90` | `jmp` vers « Sorry, you're wrong » |
| `0x402044` | `0x844` | `eb 16` | `90 90` | copie que le thread anti-patch réécrit |

```bash
python3 -I tools/boons-crackme1-solve.py          # -> analysis/boon1-patched.exe
python3 -I tools/boons-crackme1-solve.py --check  # vérifie les octets d'origine
```

## Premier regard

```bash
unzip -P crackmes.one original/crackme1.zip -d analysis/extracted
diec analysis/extracted/*.exe     # MASM32, PE32, 4 sections, pas de packer
strings -n 6 analysis/extracted/*.exe
```

Strings parlantes : `Sorry ,but you're wrong :(`, `Yay!`/`You did it`, `Rule1:Don't mess with threads , please`, `ooh ,you changed the name of the window =O`, et imports `WriteProcessMemory`, `CreateThread`, `FindWindowA`, `GetWindowThreadProcessId`, `Beep`. Un crackme à patch avec un **anti-patch**.

## Flow

`objdump -d -M intel` (le binaire fait 0x26e octets de code, tout se lit à la main). Entry `0x401000` : `DialogBoxParamA` avec la DlgProc `0x401028`.

- `WM_INITDIALOG` (`0x110`, `0x40102b`) : deux `CreateThread` sur `0x4011ea`.
- `WM_COMMAND` / OK (`0x3eb`, `0x401079`) : `GetDlgItemTextA(dlg, 0x3ed, buf@0x4031c8, 0x28)` puis `call 0x401208` → `push 0x40302b; jmp 0x40109b`.
- `0x40109b : eb 16` → `0x4010b3` : `MessageBoxA("Sorry ,but you're wrong :(", "Oh my", MB_ICONERROR)`.
- Le chemin succès existe juste derrière (`0x40109d`) : `MessageBoxA("You did it…", "Yay!", 0)`. Il n'est atteint que si le `jmp` disparaît.

## Comment on trouve

1. **Le texte saisi n'est lu que pour être copié dans `0x4031c8`** : aucune comparaison. Le seul « prédicat » est le `jmp short` inconditionnel `eb 16` en `0x40109b`. Pas de keygen possible → patch.
2. **Patch naïf = échec** : NOPer `0x40109b` seul affiche toujours « Oh my » (testé). Cause : le thread `0x4011ea` :

```asm
4011ea  push 0x1f4              ; Sleep(500)
4011ef  call Sleep
4011f4  push 2                  ; taille
4011f6  push 0x402044           ; source : eb 16  (dans .rdata)
4011fb  push 0x40109b           ; destination : le jmp
401200  call 0x401111           ; wrapper WriteProcessMemory(GetCurrentProcess(), ...)
401205  jmp  0x4011ea           ; boucle infinie
```

   Toutes les 500 ms, `WriteProcessMemory` restaure `eb 16` depuis `0x402044`. Le wrapper `0x401111` fait aussi un `FindWindowA(NULL, "Boon's crackme #1")` : renommer la fenêtre déclenche le message « you changed the name of the window » + `Beep` (c'est la « Rule1 » côté crackme). Il empile des arguments en 16 bits (`push ax`) pour brouiller la lecture des paramètres de `WriteProcessMemory` (nSize = octet `[ebp+0x10]` = 2).
3. **Patch complet** : NOPer le jump **et** sa copie source en `.rdata` (`0x402044`) ; le thread réécrit alors `90 90` en boucle, sans effet. Alternative équivalente : neutraliser les `CreateThread`.
4. Pièges : `0x401208` empile `0x40302b` (adresse de string, pas de code) avant le `jmp` — pur bruit, `leave` rétablit la pile ; les `jmp ds:[IAT]` en `0x401214…0x401268` masquent les API (résolues via la table `0x402000`, ex. `0x401262` = `Sleep`, `0x401268` = `WriteProcessMemory`, `0x40123e` = `Beep`).

## Debug GDB

Non utilisé (reverse statique + preuve live sous Wine).

## Vérification

Wine sous Xvfb, saisie `petik` + Entrée via `xdotool`, lecture des titres de fenêtres :

```bash
xvfb-run -a -s "-screen 0 800x600x24" bash run.sh <exe>   # wine <exe>; xdotool type petik; key Return; liste des fenêtres
```

| Binaire | Résultat |
|---|---|
| original (`petik`) | MessageBox **`Oh my`** (KO attendu) |
| patch `0x40109b` seul | **`Oh my`** (le thread restaure `eb 16`) |
| patch complet (`boon1-patched.exe`, `petik`) | MessageBox **`Yay!`** ✔ |

(Pas de screenshot : outil de capture absent ; vérification par titre de fenêtre.)

## Notes

- `original/` jamais modifié : le patch est écrit dans `analysis/`.
- Ce n'est pas un keygen : aucun mot de passe n'est attendu, `petik` est juste l'exemple saisi.
