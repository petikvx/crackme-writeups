# crackmes.de's crackme06 by attilhaz

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c30c`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c30c) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | attilhaz (mirror crackmes.de) |
| **Plateforme** | Windows PE32 GUI, Visual Basic 6 **natif** (MSVBVM60) |
| **SHA-256 (zip)** | `1514adf801b56263aaa2ba0d89006ef0a9f28d2e29102e8af268b17f97c0b3ca` |
| **Type** | patch (pas de serial) |

## Fichiers

| Chemin | Contenu |
|---|---|
| `original/crackme06.zip` | archive d'origine (mdp `crackmes.one`) : `Crackme06.exe` + `Readme.txt` — jamais modifiée |
| `tools/crackme06-solve.py` | extrait l'exe du zip, patche **une copie** → `analysis/Crackme06-full.exe` |
| `analysis/Crackme06-full.exe` | exe patché (DEMO → FULL) |
| `analysis/screenshot-ko-demo.png` / `screenshot-ok-registered.png` | Wine, avant / après |

## Réponse

Le `Readme.txt` le dit : *« you must change the caption of the DEMO VERSION label »*. Il faut que `Label2.Caption == "FULL VERSION"` ; alors la zone License affiche **`REGISTERED`**.

```bash
python3 -I tools/crackme06-solve.py --check     # → analysis/Crackme06-full.exe
```

Patch : 12 octets en offset fichier **0x1369** : `DEMO VERSION` → `FULL VERSION` (même longueur, l'octet de taille `0x0c` à 0x1368 reste valable).
Pas de login : `petik` n'a pas lieu d'être ici (aucune saisie).

## Premier regard

```bash
unzip -P crackmes.one original/crackme06.zip -d /tmp/c06
file Crackme06.exe     # PE32 GUI i386, 3 sections
diec Crackme06.exe     # Microsoft Linker 6.0, Visual Basic 6 [Native]
strings -n 5 Crackme06.exe ; strings -el -n 3 Crackme06.exe
```

`strings -el` (UTF-16) donne les textes VB : `Change DEMO VERSION words in FULL VERSION to register this crackme!!! You must see REGISTERED in the license box!`, `How to register?`, `FULL VERSION`, `REGISTERED`, `Great. Now send me your solution!!!`, `Bye Bye`. En ANSI : la ressource de form (`Form1`, `Label2`, `DEMO VERSION`, `UNREGISTERED`…).

## Flow

Form1 : `Label2` (« DEMO VERSION »), `Text1` (« UNREGISTERED », en lecture seule), bouton `Command1` « How to register? », `Label3` « Written By AttilhaZ ».

Trois handlers VB natifs dans `.text` :

| VA | Rôle |
|---|---|
| `0x402020` | probablement `Command1_Click` : `MsgBox` avec l'indice « Change DEMO VERSION words in FULL VERSION… » (via `rtcMsgBox` `0x40101c`, 0x40 = Information) |
| `0x402120` | handler d'événement (très probablement `Timer1_Timer` : la capture montre le texte basculer sans interaction ; type d'événement non confirmé dans la table d'événements VB) : `If Label2.Caption = "FULL VERSION" Then Text1.Text = "REGISTERED"` |
| `0x402250` | handler d'événement (probablement `Text1_Change`, non confirmé) : si `Text1.Text = "REGISTERED"` → MsgBox « Great. Now send me your solution!!! » |

## Comment on trouve

1. **Ancrage** : `objdump -d -M intel Crackme06.exe > d.txt`. Les imports `__vbaStrCmp` / `__vbaObjSet` pointent vers du code VB natif (pas du p-code), donc lisible. On cherche les références vers les chaînes UTF-16 : `FULL VERSION` à `0x401dfc` (fichier `0x1dfc`) et `REGISTERED` à `0x401e1c`.
2. **Lecture** du handler `0x402120` :

```asm
402160  mov  edx,[esi]
40216b  call [edx+0x30c]        ; Form1.Label2 (accesseur de contrôle)
402177  push eax / call ebx     ; __vbaObjSet
402187  call [ecx+0x50]         ; Label2.Caption (get) -> BSTR en [ebp-0x18]
4021a3  push 0x401dfc           ; L"FULL VERSION"
4021a8  call [0x401038]         ; __vbaStrCmp  (binaire, sensible à la casse)
4021b3  neg edi / sbb / inc / neg ; edi = (cmp==0) ? -1 : 0   (True/False VB)
4021c9  test di,di / je 40220f  ; si faux -> rien
4021d1  call [ecx+0x300]        ; Form1.Text1
4021e0  push 0x401e1c           ; L"REGISTERED"
4021e8  call [eax+0xa4]         ; Text1.Text = "REGISTERED" (put)
```

3. **Décodage** : aucun calcul, c'est une comparaison de chaîne constante. Il suffit donc que la caption devienne `FULL VERSION` — soit en la modifiant au runtime, soit (patch propre) dans la ressource de form.
4. **Où est la caption** : `strings -t x` donne `DEMO VERSION` ANSI à `0x1369` ; `xxd -s 0x1340 -l 0x60` montre le contexte `Label2 … 01 01 0c 00 'DEMO VERSION'` : propriété Caption sérialisée, préfixée par sa longueur (`0x0c`). `FULL VERSION` fait aussi 12 caractères : on remplace sur place, sans toucher au reste.
5. **Piège** : deux encodages. La constante de comparaison `FULL VERSION` est en UTF-16 (`0x1dfc`, ne pas la toucher : ce serait changer le prédicat) ; la caption à patcher est la version **ANSI** de la ressource form (`0x1369`). `strings` simple voit la seconde, `-el` la première.

Pas de GDB ni x64dbg/IDA utilisés : analyse statique (objdump) + Wine.

## Vérification

```bash
python3 -I tools/crackme06-solve.py --check
WINEDEBUG=-all xvfb-run -a -s "-screen 0 800x600x24 -fbdir /tmp/fb" \
  bash -c 'wine analysis/Crackme06-full.exe & sleep 12; cp /tmp/fb/Xvfb_screen0 out.xwd; kill %1'
```

| Cas | Résultat |
|---|---|
| Original (KO) | `DEMO VERSION` / `UNREGISTERED` — [screenshot](analysis/screenshot-ko-demo.png) |
| Patché (OK) | `FULL VERSION` / **`REGISTERED`** — [screenshot](analysis/screenshot-ok-registered.png) |

Les deux captures ont été prises sous Wine (xvfb, ~12 s après lancement) : l'original affiche UNREGISTERED, la copie patchée REGISTERED.

## Notes

- Le binaire sous `original/` n'est pas touché : le patch se fait sur copie dans `analysis/`.
- Le message « Great. Now send me your solution!!! » est déclenché par le changement de `Text1` ; il n'a pas été capturé sous Xvfb (le MsgBox n'apparaît pas dans la capture).
- Aucun serial : c'est un crackme « patch », comme l'indique `Readme.txt`.
