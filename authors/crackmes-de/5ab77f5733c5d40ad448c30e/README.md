# crackmes.de's crackme04 by attilhaz

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c30e`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c30e) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | attilhaz (mirror crackmes.de) |
| **Plateforme** | Windows PE32 GUI, Visual Basic 6 **natif** (MSVBVM60) |
| **SHA-256 (zip)** | `02c1d6d41c0a03c152c722b86bb89affedba27c3940eba6d98de685a5dd609ac` |
| **Type** | patch (pas de serial) |

## Fichiers

| Chemin | Contenu |
|---|---|
| `original/crackme04.zip` | archive d'origine (mdp `crackmes.one`) : `Crackme04.exe` + `Readme.txt` — jamais modifiée |
| `tools/crackme04-solve.py` | extrait l'exe du zip, patche **une copie** → `analysis/Crackme04-patched.exe` |
| `analysis/Crackme04-patched.exe` | exe patché (boucle infinie neutralisée) |

## Réponse

Le `Readme.txt` : *« you must block the NAG cicle! You can patch it! »*. Le crackme affiche en boucle une MsgBox « Infinity cicle » ; il faut casser cette boucle.

```bash
python3 -I tools/crackme04-solve.py --check     # → analysis/Crackme04-patched.exe
```

Patch : 2 octets en offset fichier **0x1f35** (VA `0x401f35`) : `eb 91` (`jmp 0x401ec8`, retour au début de la boucle) → `eb 00` (`jmp` vers l'instruction suivante, donc sortie de la fonction).
Aucune saisie : `petik` n'a pas lieu d'être ici.

## Premier regard

```bash
unzip -P crackmes.one original/crackme04.zip -d /tmp/c04
file Crackme04.exe     # PE32 GUI i386, 3 sections
diec Crackme04.exe     # Microsoft Linker 6.0, Visual Basic 6 [Native]
strings -n 5 Crackme04.exe ; strings -el -n 4 Crackme04.exe
```

- `strings -el` (UTF-16) : `Block my infinity cicle!!! If my cicle is enabled, then exit from this crackme using CTRL+ALT+CANC.` (texte de la MsgBox) et `Infinity cicle` (titre).
- `strings` ANSI (ressource de form) : `Form1`, `Command1`, `Text1`, `Label1`, `Great work. You have patch me!!!…`.
- Imports `MSVBVM60` : `__vbaNew2`, `__vbaVarDup`, `__vbaFreeVarList`… et `rtcMsgBox` via la table d'imports (appel indirect `ds:0x40101c`).

## Flow

Au lancement une fonction VB (`0x401e60`) entre dans une boucle : MsgBox « Infinity cicle », OK, MsgBox de nouveau, etc. Le formulaire ne devient jamais utilisable tant que la boucle tourne. Le message de victoire (`Great work. You have patch me!`) est une chaîne de la ressource de form.

## Comment on trouve

Ancrage : `objdump -d -M intel Crackme04.exe` (code VB natif, pas de symboles), fonction à `0x401e60`.

```asm
401ec8: mov ecx,0xa                 ; boucle : prépare les Variants d'arguments de MsgBox
401ecd: mov eax,0x80020004          ; VT_ERROR / paramètre optionnel absent
...
401eeb: mov DWORD PTR [ebp-0x74],0x8 ; Variant de type VT_BSTR (0x8) : texte = 0x401c40
401ef2: call esi                    ; __vbaVarDup (esi = [0x401074])
401f01: mov DWORD PTR [ebp-0x64],0x8 ; idem, titre = 0x401b74
401f08: call esi
401f19: push 0x30                   ; style = vbExclamation
401f1c: call edi                    ; rtcMsgBox (edi = [0x40101c])
401f30: call ebx                    ; __vbaFreeVarList (ebx = [0x401008]) → 5 variants libérés
401f32: add  esp,0x14
401f35: jmp  0x401ec8               ; <<< boucle infinie : retour au début
401f37: push 0x401f5b               ; épilogue VB normal (push ret-addr ; jmp ret ; …)
401f3c: jmp  0x401f5a
```

Le `jmp 0x401ec8` en `0x401f35` (`eb 91`, déplacement −0x6f) est la seule arête de retour : pas de condition de sortie. Remplacer le déplacement par `00` fait tomber l'exécution sur `0x401f37`, l'épilogue normal de la fonction (restauration de la SEH `fs:[0]`, `ret 4`).
Les octets vérifiés dans le fichier : `83 c4 14 eb 91 68 5b 1f` en `0x1f32` (`.text` mappé à l'identique, RVA = offset fichier).

Pièges : les textes de MsgBox sont en **UTF-16** (invisibles avec `strings` simple) ; et la MsgBox s'affiche **une fois** même après le patch (le patch supprime la répétition, pas le premier appel).

## Vérification

Wine sous `xvfb-run -a`, fenêtres listées avec `xdotool search --name . getwindowname`, puis touche Entrée envoyée à la MsgBox :

| Binaire | Après Entrée (×3, 3 s d'écart) |
|---|---|
| original (zip, non modifié) | la fenêtre **« Infinity cicle »** réapparaît à chaque fois (boucle) |
| `analysis/Crackme04-patched.exe` | plus de MsgBox : seules restent les fenêtres `Crackme04` (form) |

Pas de screenshot (ni `import` ni `xwd` sur la machine) ; vérification par énumération des fenêtres.

## Notes

- Les `Command1` / `Text1` / `Label1` du formulaire n'ont pas été étudiés en détail : le seul objectif du Readme est de bloquer le nag, ce que fait le patch.
- `original/` n'est jamais modifié ; le patch est appliqué à une copie extraite en mémoire.
