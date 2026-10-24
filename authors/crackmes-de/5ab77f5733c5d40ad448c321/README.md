# crackmes.de's crackme26 by attilhaz

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c321`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c321) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (AttilhaZ, 2004) |
| **Plateforme** | Windows PE32 GUI, Visual Basic 6 **natif** (MSVBVM60) |
| **SHA-256 (zip)** | `82817cd96933c66fa13f7d714a732829504d669ede9ebd215da08234b5eb1216` |
| **SHA-256 (`Crackme26.exe`)** | `8dfcd48d96916803ab62163780270389b17c7c74da64ae222fb410b2ae8f8f9a` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme26.zip` | archive d'origine (mot de passe `crackmes.one`) : `Crackme26.exe` + `Readme.txt` |
| `analysis/x/` | zip extrait (copie de travail) |
| `analysis/code.txt` | `objdump -d -M intel` du code utilisateur (VA `0x4103e0`–`0x411640`) |
| `analysis/screenshot-menu.png`, `screenshot-register.png`, `screenshot-ok.png` | menu `?`, boîte Register, MsgBox « Good » |
| `tools/crackme26-solve.py` | solveur + `--check` (Xvfb + Wine + xdotool, cas OK **et** KO) |

## Réponse

Le `Readme.txt` demande « Find the correct serial » (« AntiDebugger protection », « better if you don't patch it »). Il n'y a **pas de nom** : une seule zone « Insert serial ».
Le serial est une **constante** ; pas d'utilisateur, donc pas d'exemple `petik`.

| Serial |
|---|
| **`360119036`** |

```bash
python3 tools/crackme26-solve.py          # serial=360119036 (lu dans le binaire)
python3 tools/crackme26-solve.py -q
python3 tools/crackme26-solve.py --check  # Xvfb + Wine : bon serial -> « Good », serial+"1" -> « Try again »
```

Utilisation à la main : lancer `Crackme26.exe`, menu **`?` > Register**, taper `360119036`, **Check**.

## Premier regard

```bash
unzip -P crackmes.one original/crackme26.zip -d analysis/x
diec analysis/x/Crackme26.exe     # PE32, MS Linker 6.0, Visual Basic 6.00.8041 [Native]
strings -n 6 analysis/x/Crackme26.exe
strings -el -n 3 analysis/x/Crackme26.exe
```

- Les `strings` sont quasi muets : seulement les imports `MSVBVM60`, des chemins du projet (`...\My Crackme\Crackme26\Progetto1.vbp`), des noms de formulaires (`Form1/2/3`, `Label1`) et la version info. **Aucun texte de réponse** : les messages sont fabriqués **caractère par caractère** à l'exécution (voir plus bas).
- Imports parlants : `__vbaR8Str` (= `Val`), `__vbaVarTstNe`, `__vbaStrCat`, `__vbaStrCmp`, `__vbaNew2`, et des **ordinaux** `595` (MsgBox), `612`, `100` (ThunRTMain).
- Piège de lecture : `objdump` sur tout `.text` donne du bruit. De `0x402000` à `0x405fff` (entropie ≈ 7,9) ce sont des **JPEG** (fond d'écran « AttilhaZ ») et, de `0x407000` à `0x410000`, des tables VB (formulaires/contrôles) — pas du code. Le **code utilisateur** ne démarre qu'à `0x4103e0` (`e9e9e9e9 cccccccc` puis prologues `55 8b ec`).
- Au lancement (Wine, `xvfb-run -a wine`) : fenêtre 399×194 avec menus `File > Exit` et `? > About / Register` (les libellés `About`, `Register`, `Exit` se lisent dans la table de menu en `0x40612c`…).

## Flow

| Fonction (VA) | Rôle |
|---|---|
| `0x4103f0`… | handlers `Form_Load` / `About` / `Exit` (petits, `ret 4`) |
| **`0x4106a0`** | **`Command1_Click`** du formulaire Register (`ret 4` en `0x411636`) |

`Command1_Click` (`0x4106a0`) enchaîne :

1. `On Error Resume Next` (`__vbaOnError(1)`, `0x4107ac`).
2. `t1 = ordinal_612()` stocké en `[ebp-0x30]` (`0x4107b9`–`0x4107cf`).
3. `If Text1.Text <> "" Then` (`__vbaStrCmp(Text, "")`, `0x410823`–`0x41084b`) :
   `t2 = ordinal_612()` puis `__vbaVarTstNe(t2, t1)` (`0x410883`) ; si **différents** → MsgBox « Error. A debugger is loading... » (garde anti-debug).
4. **Test du serial** (`0x410c5b`) : `Val(Text1.Text)` (`__vbaR8Str`, `0x410ca4`) comparé au double en `0x401138` via `fcomp` ; **différent** → MsgBox « Wrong serial. » (`0x4112fe`).
5. Seconde garde Timer (`0x410cfd`–`0x410d31`) ; si les deux lectures diffèrent → « Error. A debugger is loading... » ; sinon → MsgBox **« Good » / « Correct serial »** (`0x41111b`, style `0x40`).

## Comment on trouve

**Ancrage.** Pas de chaîne exploitable → on part du code. Dans le dump de `0x4103e0`, le seul handler qui lit une `TextBox` (`call [eax+0x300]` puis `__vbaObjSet`, `call [edx+0xa0]` = `Text`), appelle `__vbaR8Str` et finit par `ret 4` après des `push 0x10/0x40` + appel de l'ordinal `595` (MsgBox) est `0x4106a0`.

**Le test du serial** (extrait commenté) :

```asm
410c5b  mov  [ebp-4], 9
410c62  mov  edx,[ebx]            ; Me
410c65  call [edx+0x300]          ; Me.Text1
410c73  call __vbaObjSet
410c82  call [ecx+0xa0]           ; Text1.Text -> BSTR [ebp-0x44]
410ca3  push eax
410ca4  call __vbaR8Str           ; Val(Text) -> ST0 (double)
410caa  fcomp qword ptr [0x401138]; compare à la constante
410cb0  fnstsw ax
410cb2  test ah,0x40              ; C3 = égal
410cb5  jne  410cbe              ; égal -> eax=0
410cb7  mov  eax,1 ... neg eax   ; différent -> eax=-1 (True)
410cd9  cmp  di,si ; je 410cf6   ; True -> 410cde -> jmp 4112fe (Wrong serial)
```

C'est donc `If Val(Text1.Text) <> K Then MsgBox "Wrong serial."`. Reste à lire `K` :

```bash
xxd -s 0x1138 -l 8 analysis/x/Crackme26.exe
# 00000000: 0000 00fc fa76 b541
python3 -c "import struct;print(struct.unpack('<d',bytes.fromhex('000000fcfa76b541'))[0])"
# 360119036.0
```

`0x41b576fafc000000` (IEEE-754 double) = **360119036.0** → serial `360119036`.
(`Val` ignore le texte après les chiffres, donc `360119036abc` passerait aussi ; la forme canonique est `360119036`.)

**Messages construits caractère par caractère.** Chaque lettre est un BSTR de 1 caractère en `.text` (`0x407344` = `E`, `0x40734c` = `r`, `0x407354` = `o`, `0x40735c` = `.`, …) ; le code fait une longue chaîne de `__vbaStrCat` (`call esi`) / `__vbaStrMove` (`call edi`) qui **préfixe** chaque lettre, puis `MsgBox(prompt, style, title)` (ordinal 595). Décodage depuis les `push 0x4073xx` de chaque bloc :

| Bloc (VA) | Style | Titre | Texte |
|---|---|---|---|
| `0x410d37` (et `0x410892`) | `0x10` | `Error` | `Error. A debugger is loading...` |
| `0x41111b` | `0x40` | **`Good`** | **`Correct serial`** |
| `0x4112e7` | `0x10` | `Try again` | `Wrong serial.` |

**Anti-debug.** Les deux `ordinal_612()` encadrent le code ; sous un debugger pas à pas les deux valeurs diffèrent et on obtient « Error. A debugger is loading... » au lieu du verdict. Sous Wine sans debugger elles sont égales (une valeur d'horloge qui change pile entre deux appels pourrait en théorie donner un faux positif ; il suffit de re-cliquer Check).

## Debug GDB / x64dbg

Aucun : reverse **100 % statique** (`objdump`, lecture VB6 natif) + preuve Wine. Pas de MCP debugger actif sur ce binaire.
Le dump mémoire du process Wine (`/proc/<pid>/mem`) n'a servi qu'à confirmer que la zone `0x402000–0x405fff` n'est pas du code chiffré/décompressé à l'exécution (elle reste identique : ce sont les JPEG).

## Vérification

`python3 tools/crackme26-solve.py --check` (Xvfb + Wine + xdotool : clic menu `?` → `Register`, saisie, Check) :

```text
serial=360119036
[OK] serial=360119036 fenêtres=['Crackme26', 'Crackme26', 'Good', 'Register'] -> ok
[KO] serial=3601190361 fenêtres=['Crackme26', 'Crackme26', 'Register', 'Try again'] -> ok
CHECK OK
```

- Cas OK : MsgBox `Good` / « Correct serial » — voir [`analysis/screenshot-ok.png`](analysis/screenshot-ok.png).
- Cas KO (serial + `1`) : MsgBox `Try again` / « Wrong serial. ».
- Boîte de saisie : [`analysis/screenshot-register.png`](analysis/screenshot-register.png) ; menu : [`analysis/screenshot-menu.png`](analysis/screenshot-menu.png).

## Notes

- Le fichier `original/` n'a pas été modifié (pas de patch ; le readme demande de ne pas patcher).
- Ce n'est **pas** un keygen name→serial (contrairement à crackme22) : le serial est une constante flottante de 8 octets.
- `strings` seul ne donne rien ; il faut savoir que les chaînes sont reconstruites lettre à lettre et que les gros blocs à haute entropie sont des images.
