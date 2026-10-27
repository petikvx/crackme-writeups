# Crackme #1 (Crackme_Number_one_V1.1) by D!PSW!TCH

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c393`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c393) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (D!PSW!TCH) |
| **Plateforme** | Windows PE32 GUI, Borland Delphi 7 (Turbo Linker 2.25) |
| **SHA-256 (zip)** | `2ec37b83e686f5306367681751699a5b59999e7b332af74ddffd4664b6637699` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Crackme_Number_one_V1.1.zip` | archive d'origine (mot de passe `crackmes.one`), non modifiée |
| `analysis/extract/Crackme_Number_one_V1.1.exe` | exe extrait du zip (copie de travail) |
| `analysis/screenshot-ok.png`, `screenshot-ko.png` | saisies Wine (cas OK / KO) |
| `tools/crackme1-solve.py` | keygen |

## Réponse

Le serial dépend du nom (≥ 5 caractères) et fait `3 × (len(nom) − 1)` chiffres.

| Name | Serial |
|---|---|
| `petik` | **`123171149197`** |
| `Hello_World` | `143187108196191143181187168188` |

```bash
python3 tools/crackme1-solve.py petik        # name=petik serial=123171149197
python3 tools/crackme1-solve.py petik -q     # serial seul
```

## Premier regard

```bash
unzip -P crackmes.one original/*.zip -d analysis/extract
file analysis/extract/*.exe     # PE32 GUI, i386
diec analysis/extract/*.exe     # Borland Delphi 7, Turbo Linker 2.25
strings -n 5 …exe | grep -i "Too bad\|well done"
```

Fenêtre Delphi « Crackme #1 by D!PSW!TCH » : deux `TEdit` (Name pré-rempli `D!PSW!TCH`, Serial pré-rempli `Serial`) et un bouton OK. Pas de MessageBox : le verdict (`Too bad` / `well done`) est écrit dans la **caption d'une fenêtre** (visible via `xdotool getwindowname`, pas sur une capture sans window manager).

## Flow

`OnClick` du bouton OK, VMA `0x4544d4` (fichier `0x538d4`). Les chaînes `Too bad` (`0x454708`) et `well done` (`0x454718`) s'y trouvent juste derrière (`strings -t x` donne `53b08` / `53b18`). Les deux `TEdit` sont `[form+0x2f8]` (Name) et `[form+0x2fc]` (Serial) ; `0x4335a4` = `GetText`, `0x404148` = `Length`, `0x407fc0` = `StrToInt`, `0x4335d4` = `SetText`.

## Comment on trouve le prédicat

Ancrage : `strings -t x` → `Too bad` à `0x53b08`, donc le handler est juste avant ; désassemblage `objdump -d -M intel --start-address=0x454480 --stop-address=0x454740`.

1. **Longueurs** :
   ```asm
   call Length(Name) ; cmp eax,5 ; jl bad          ; Name >= 5
   call Length(Name) ; dec eax ; jle bad ; [ebp-14]=eax   ; n = len-1 itérations
   ...
   lea eax,[eax+eax*2] ; sub eax,3 ; cmp avec Length(Serial) ; jne bad
   ```
   → `len(serial) == 3*len(nom) − 3 = 3*(len-1)`.

2. **Boucle** `esi = 1 .. len-1` (indice Delphi 1-based de la 2ᵉ lettre) :
   ```asm
   al = Name[esi-1]  (mov al,[eax+esi-1])   ; a = lettre précédente (0-based esi-1)
   bl = Name[esi]    (mov bl,[eax+esi])     ; b = lettre suivante
   eax = a * (esi+1)                         ; imul edx
   edx = b * esi ; ebx = eax - edx           ; v = a*(i+1) - b*i
   ```
3. **Normalisation de `v`** (ebx) :
   ```asm
   cmp ebx,1 ; jge ok ; neg ebx              ; si v < 1 : v = -v  (0 reste 0)
   cmp ebx,0x64 ; jge L1
   L0: add ebx,0x64 ; cmp ebx,0x64 ; jle L0  ; si v < 100 : do { v += 100 } while (v <= 100)
   L1: cmp ebx,0x3e8 ; jl ok2
   L2: sub ebx,0x64 ; cmp ebx,0x3e8 ; jge L2 ; tant que v >= 1000 : v -= 100
   ```
   Résultat dans `[100 ; 999]` (v = 100 pile est conservé ; v = 0 → 200).
4. **Comparaison** : les 3 caractères `Serial[3i-3 .. 3i-1]` (0-based) sont concaténés (`0x402a38`/`0x402a08`, concat Delphi) puis `StrToInt` ; `cmp ebx, eax` doit être égal. Un compteur `[ebp-4]` est incrémenté à chaque tour réussi et comparé à `len-1` pour afficher `well done`.

Donc le serial est la concaténation des `v_i` sur 3 chiffres.

Exemple `petik` (p=112, e=101, t=116, i=105, k=107) :

| i | a (Name[i-1]) | b (Name[i]) | `a*(i+1) - b*i` | normalisé | 
|---|---|---|---|---|
| 1 | `p` 112 | `e` 101 | 224 − 101 = 123 | 123 |
| 2 | `e` 101 | `t` 116 | 303 − 232 = 71 | 71 → 171 |
| 3 | `t` 116 | `i` 105 | 464 − 315 = 149 | 149 |
| 4 | `i` 105 | `k` 107 | 525 − 428 = 97 | 97 → 197 |

→ `123 171 149 197` = `123171149197`.

Piège : la boucle `add 100` est un do-while (`jle`) : un `v` < 100 donne `v+100` si ce résultat est > 100, mais `v=0` passe par 100 et finit à 200 — d'où la boucle explicite dans le solveur (`aaaaa` → `197197197197`, vérifié).

## Vérification (Wine + Xvfb, binaire d'origine)

Pilotage par `xdotool` (clic dans les champs, saisie, clic sur OK) ; lecture de la caption de la fenêtre résultat :

```bash
xvfb-run -a -s "-screen 0 800x600x24" bash run.sh petik 123171149197   # -> "well done"
xvfb-run -a -s "-screen 0 800x600x24" bash run.sh petik 123171149198   # -> "Too bad"  (dernier chiffre faux)
xvfb-run -a -s "-screen 0 800x600x24" bash run.sh petik 12317114919    # -> "Too bad"  (mauvaise longueur)
xvfb-run -a -s "-screen 0 800x600x24" bash run.sh Hello_World 143187108196191143181187168188  # -> "well done"
xvfb-run -a -s "-screen 0 800x600x24" bash run.sh aaaaa 197197197197   # -> "well done"
```

Captures des saisies : [`screenshot-ok.png`](analysis/screenshot-ok.png) (petik / `123171149197`), [`screenshot-ko.png`](analysis/screenshot-ko.png) (`…198`). Le verdict n'apparaît que dans le titre de la fenêtre (pas de WM sous Xvfb), d'où le `getwindowname`.

## Notes

- Binaire Delphi non packé, pas d'anti-debug rencontré ; reverse 100 % statique (`objdump`), la preuve est faite en live sous Wine. GDB/x64dbg/IDA non utilisés.
- Les noms de moins de 5 caractères sont rejetés ; un nom de 5 caractères donne un serial de 12 chiffres.
