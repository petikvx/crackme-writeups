# crackmes.de's crackme05 by attilhaz

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c317`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c317) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (AttilhaZ, 2004) |
| **Plateforme** | Windows PE32 GUI, Visual Basic 6 **natif** (pas de P-Code) |
| **SHA-256 (zip)** | `88ec7e13a59142438874af61f50dd8065a4f3b1817c8f999389c62aef8747346` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme05.zip` | archive d'origine (mot de passe `crackmes.one`), contient `Crackme05.exe` + `Readme.txt` |
| `analysis/x/` | zip extrait (copie de travail, `original/` intact) |
| `analysis/screenshot-ok.png` / `screenshot-ko.png` | preuve Wine : bon serial / mauvais serial |
| `tools/crackme05-solve.py` | solveur (`-q`, `--check` = preuve live Wine + cas KO) |

## Réponse

| Entrée | Valeur |
|---|---|
| **Serial** | **`Ap49-mn41`** |
| Nom / user | aucun champ « nom » : un seul `Text1` (« Serial: »). `petik` n'est donc pas applicable, et sert ici de cas KO. |

```bash
python3 tools/crackme05-solve.py -q          # Ap49-mn41
python3 tools/crackme05-solve.py --check     # lance l'exe sous Xvfb+Wine, bon + mauvais serial
```

## Premier regard

```
$ file Crackme05.exe   # PE32 executable (GUI) Intel i386, 3 sections
$ diec Crackme05.exe   # Linker: MS Linker 6.0 ; Compiler: Visual Basic 6.00 [Native]
```

- Le `Readme.txt` : « find the correct serial… No patches are allowed! » (cible : débutants en « reversing VB »).
- Importe seulement `MSVBVM60.DLL` : `__vbaStrCat`, `__vbaStrCmp`, `__vbaStrMove`, `__vbaFreeStrList`, `__vbaObjSet`, ordinaux `rtcMsgBox` (595)…
- Chaînes UTF-16 utiles (offsets fichier = VA − 0x400000) : `0x19ac "Great!!! Your serial is right!!!"`, `0x1a10 "Now send me your solution!!!"`, `0x1908 "Crackme05 - Written by AttilhaZ"`.
- L'IAT commence en `0x401000`, le code VB à partir de ~`0x402240`. L'entry (`0x4011e0`) ne fait que `push 0x401438 ; call ThunRTMain` (header VB) → inutile à lire.

## Flow

GUI : menu `File` / `?`, label « Serial: », `Text1`, bouton OK (`Command1`). Le handler du bouton (`0x4022f0`) lit `Text1.Text`, construit le serial attendu, compare, et affiche la MsgBox « Great!!! » si égal. Sinon : rien (pas de message d'échec).

## Comment on trouve

**Ancrage** : on cherche les `call [import]` de `__vbaStrCat` (`0x401014`) et `__vbaStrCmp` (`0x401040`) dans `objdump -d -M intel Crackme05.exe` ; ils sont tous dans le handler `0x4022f0`. (Table d'imports décodée à la main en Python : `0x401014 = __vbaStrCat`, `0x40108c = __vbaStrMove`, `0x401074 = __vbaFreeStrList`.)

**Lecture du handler** (extrait commenté) :

```asm
402379  call [__vbaObjSet]            ; objet Text1
402388  call [ecx+0xa0]               ; Text1.Text -> BSTR [ebp-0x18]
4023a6  mov  eax,[ebp-0x18]
4023af  push eax                      ; ← 1er arg de StrCmp : le texte saisi (reste sur la pile)
4023b0  push 0x40196c                 ; BSTR "A"
4023b5  push 0x401974                 ; BSTR "p"
4023ba  call esi                      ; __vbaStrCat   -> "Ap"
4023c7  call edi                      ; __vbaStrMove  (stocke dans [ebp-0x1c])
4023c9  push eax ; push 0x40197c ; call esi   ; cat avec "4"
... 0x401984 "9", 0x40198c "-", 0x401994 "m", 0x40199c "n", 0x40197c "4", 0x4019a4 "1"
402433  call [__vbaStrCmp]            ; texte saisi  vs  chaîne construite
402452  neg esi / sbb / inc / neg     ; idiome VB : 0 -> False(0), sinon True(-1)
40247a  cmp si,bx ; je 0x402592       ; False -> saute la MsgBox « Great!!! »
```

**Constantes** : les pointeurs sont des BSTR (préfixe longueur 4 octets, données UTF-16). Lus dans le fichier :

| VA | octets | caractère |
|---|---|---|
| `0x40196c` | `41 00` | `A` |
| `0x401974` | `70 00` | `p` |
| `0x40197c` | `34 00` | `4` |
| `0x401984` | `39 00` | `9` |
| `0x40198c` | `2d 00` | `-` |
| `0x401994` | `6d 00` | `m` |
| `0x40199c` | `6e 00` | `n` |
| `0x4019a4` | `31 00` | `1` |

**Piège : l'ordre de concaténation.** Les concat s'enchaînent avec des pushes dans l'ordre inverse de l'appel (`cat(x, y)` dépend de la convention du runtime VB `stdcall` et du reload du résultat). Ma première lecture « chaque nouveau caractère est préfixé » donnait `14nm-94pA` (l'inverse exact) : **faux**. Au lieu de deviner, j'ai tracé les appels sous Wine (`WINEDEBUG=+relay`) : `msvbvm60` appelle `oleaut32.VarBstrCmp(L"14nm-94pA", L"Ap49-mn41")` → la chaîne construite est bien `Ap49-mn41`, c.-à-d. les constantes dans l'ordre de leur apparition dans le code : `A p 4 9 - m n 4 1` (le texte saisi est l'argument de gauche). Avec `Ap49-mn41`, `VarBstrCmp` renvoie `1` (`VARCMP_EQ`).

Assemblage : `A` `p` `4` `9` `-` `m` `n` `4` `1` → **`Ap49-mn41`**. Aucune dépendance au nom ni à la machine (serial constant).

## Prédicat consolidé

```
expected = "A"+"p"+"4"+"9"+"-"+"m"+"n"+"4"+"1" = "Ap49-mn41"
Text1.Text == expected   (comparaison texte VB, sensible à la casse)
```

## Debug GDB / x64dbg

Non utilisés (reverse statique + trace Wine `+relay` ; MCP x32dbg non sollicité, aucun process actif sur ce binaire).

## Vérification

```bash
$ python3 tools/crackme05-solve.py --check
Serial : Ap49-mn41
serial correct  -> MsgBox OK
petik (mauvais) -> pas de MsgBox (attendu)
```

- OK : `Ap49-mn41` → MsgBox « Great!!! Your serial is right!!! » — [`analysis/screenshot-ok.png`](analysis/screenshot-ok.png).
- KO : `petik-bad` / `14nm-94pA` (mon premier essai, inversé) → aucune MsgBox — [`analysis/screenshot-ko.png`](analysis/screenshot-ko.png).
- Trace `+relay` : `VarBstrCmp(L"Ap49-mn41", L"Ap49-mn41") = 1` (EQ).

## Notes

- Sous Wine/Xvfb, les clics souris `xdotool` n'atteignent pas le bouton ; Tab + `space` fonctionne.
- Un échec n'affiche rien : il faut donc détecter la MsgBox (3ᵉ fenêtre) ou tracer `VarBstrCmp`.
- Pas de patch : `original/` non modifié (le zip n'a été extrait que sous `analysis/x/`).
