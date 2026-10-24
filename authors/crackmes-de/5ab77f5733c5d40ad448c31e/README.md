# crackmes.de's crackme22 by attilhaz

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c31e`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c31e) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (AttilhaZ, 2004) |
| **Plateforme** | Windows PE32 GUI, Visual Basic 6 **natif** (MSVBVM60) |
| **SHA-256 (zip)** | `25342385e7e696b82808ee994cb06d13a9d0f0bbcbd3c63c662ee61d2001496d` |
| **SHA-256 (`Crackme22.exe`)** | `9cf8323e01c8a384b6fc206f7c7229cb0074ac778888868cc5e93084df47b9c0` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme22.zip` | archive d'origine (mot de passe `crackmes.one`) : `Crackme22.exe` + `Readme.txt` |
| `analysis/x/` | zip extrait (copie de travail) |
| `analysis/dis.txt` | `objdump -d -M intel` de `.text` (recon) |
| `tools/crackme22-solve.py` | keygen + `--check` (preuve live Wine/xdotool, cas OK et KO) |

## Réponse

Le `Readme.txt` demande : serial pour son nom, patch, keygen. Ici : **keygen name → serial** (max 13 caractères).

| Name | Serial |
|---|---|
| `petik` | **`1229112695117`** |

```bash
python3 tools/crackme22-solve.py petik          # name=petik -> serial=1229112695117
python3 tools/crackme22-solve.py -q petik
python3 tools/crackme22-solve.py --check        # Xvfb + Wine : bon serial -> « Congrats!!! », serial+"1" -> « Error »
```

## Premier regard

```bash
unzip -P crackmes.one original/crackme22.zip -d analysis/x
diec analysis/x/Crackme22.exe      # PE32, MS Linker 6.0, Visual Basic 6.00.8041 [Native]
strings -n 5 analysis/x/Crackme22.exe
strings -el -n 3 analysis/x/Crackme22.exe
objdump -d -M intel --start-address=0x401000 --stop-address=0x403048 analysis/x/Crackme22.exe > analysis/dis.txt
```

- ASCII : `Name (max 13):`, `Serial:`, `Command1`, `Check`, `Text1`, `Text2`, et le nom d'une méthode publique **`EncryptPassword`** (table d'objet VB, offset fichier `0x1f50`).
- UTF-16 : `Wrong serial. Try again!!!` / `Error`, `Right serial. Good!!! Now write a keygen…` / `Congrats!!!`, `Find the correct serial for your name and make a keygen. You can't patch this file.`
- Imports MSVBVM60 parlants : `__vbaStrI2` (CStr d'un Integer), `__vbaStrCat`, `__vbaLenBstr`, `__vbaUI1I2`, `__vbaVarTstNe` (comparaison Variant).
- Wine : fenêtre 250×149 « Crackme22 » avec deux zones de texte et un bouton Check.

## Flow

VB6 natif : code utilisateur x86 classique dans `.text`, handlers stdcall avec `Me` en argument.

| Fonction (VA) | Rôle |
|---|---|
| `0x402760` | handler `Command1_Click` (`ret 4`) |
| `0x402450` | **`EncryptPassword(Byte, ByRef name, ByRef out)`** (`ret 0x10` = Me + 3 args) |
| `0x402640` | MsgBox « About » (ne sert pas au check) |

`Command1_Click` :

1. `Text1.Text` (`[vtbl+0x304]`) = name, `Text2.Text` (`[vtbl+0x300]`) = serial.
2. `ecx = 10 ; call __vbaUI1I2` → le Byte **10** est stocké en `[ebp-0xb8]` (`0x402821`).
3. Appel `[Form+0x6f8]` = `EncryptPassword(10, name, &res)` (`0x40283f`).
4. `__vbaVarTstNe(res, Text2.Text)` (`0x4028de`) ; si égal → MsgBox « Right serial… » style `0x40`, titre `Congrats!!!` ; sinon « Wrong serial… », style `0x10`, titre `Error`.

## Comment on trouve

**Ancrage** : le texte « Wrong serial » (UTF-16 en `0x402008`) est référencé par le handler `0x402760` ; juste avant la branche, l'appel indirect `call [eax+0x6f8]` (`0x40283f`) va vers un `ret 0x10` → la seule fonction de ce type est `0x402450`. Le nom `EncryptPassword` dans la table d'objet le confirme.

**Lecture de `EncryptPassword`** (`0x402450`, args : `[ebp+0xc]` = Byte K, `[ebp+0x10]` = &name, `[ebp+0x14]` = &out) :

```asm
4024a3  call __vbaUI1I2           ; bl = (Byte) i   (ecx = i, démarre à 1)
4024bd  call __vbaLenBstr         ; Len(name)
4024c3  add eax,1 ; cmp esi,eax ; je fin   ; boucle tant que i <> Len+1
4024f9  call [0x40104c]           ; Mid$(name, i, 1)
40250e  call [0x401020]           ; Asc(...)  -> si
402539  and dx,1 ; ...            ; i And 1
402547  jne 40255d                ; i impair -> branche « + »
402550  sub si,cx  (cx = K)       ; i pair   : v = c - K
402567  add ax,si                 ; i impair : v = c + K
402570  mov dx,0xa ; sub dx,cx    ; dx = 10 - K
402580  xor eax,edx               ; v ^= (10 - K)
402584  call __vbaStrI2           ; CStr(v)  (Integer)
402598  call __vbaStrCat          ; out = out & CStr(v)
4025b1  add cx,1 ; jmp 4024a3     ; i++
```

Pseudo-VB équivalent :

```vb
For i = 1 To Len(name)
    c = Asc(Mid(name, i, 1))
    If i And 1 Then v = c + K Else v = c - K
    out = out & CStr(v Xor (10 - K))
Next
```

**Piège / simplification** : avec K = 10 (valeur passée par le clic), `10 - K = 0` et le `xor` est neutre ; les opérations sont faites en Integer 16 bits (`jo` → overflow, impossible pour des ASCII). Le serial est la concaténation **décimale sans séparateur** de `Asc±10` : pas de padding, donc des valeurs à 2 ou 3 chiffres collées (ex. `91` + `126` → `91126`).

**Assemblage** `petik` :

| i | car. | Asc | ±10 | texte |
|---|---|---|---|---|
| 1 | p | 112 | +10 | 122 |
| 2 | e | 101 | −10 | 91 |
| 3 | t | 116 | +10 | 126 |
| 4 | i | 105 | −10 | 95 |
| 5 | k | 107 | +10 | 117 |

→ `122` `91` `126` `95` `117` = **`1229112695117`**.

## Vérification

`python3 tools/crackme22-solve.py --check` (Xvfb + Wine + xdotool ; Tab/Tab/espace pour remplir name, serial et cliquer Check) :

```text
name=petik -> serial=1229112695117
[OK] serial=1229112695117 fenêtres=['Congrats!!!', 'Crackme22', 'Crackme22'] -> ok
[KO] serial=12291126951171 fenêtres=['Crackme22', 'Crackme22', 'Error'] -> ok
CHECK OK
```

Cas OK : MsgBox `Congrats!!!` ; cas KO (serial + `1`) : MsgBox `Error`.

## Notes

- Aucun GDB/x64dbg : reverse 100 % statique (`objdump`) + preuve Wine.
- Le texte « You can't patch this file » est dans l'About ; le crackme est bien un keygen-me.
- Les séparateurs absents rendent le serial ambigu à la lecture mais pas à la génération (déterministe).
- `original/` n'a pas été modifié.
