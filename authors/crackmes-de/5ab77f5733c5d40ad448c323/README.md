# crackmes.de's crackme20 by attilhaz

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c323`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c323) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (AttilhaZ, 2004) |
| **Plateforme** | Windows PE32 GUI, Visual Basic 6 **natif** (MSVBVM60) |
| **SHA-256 (zip)** | `5549c3a750c4fb816b2d42499ac889272fe9a45f50e2a2126857db5f7ff9b2a6` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme20.zip` | archive d'origine (mot de passe `crackmes.one`) : `Crackme20.exe` + `Readme.txt` |
| `analysis/x/` | zip extrait (copie de travail, `original/` intact) |
| `analysis/dis.txt` | `objdump -d -M intel` de l'exe (recon) |
| `tools/crackme20-solve.py` | keygen + `--check` (preuve live Xvfb/Wine/xdotool, cas OK et KO) |

## Réponse

Le `Readme.txt` demande : serial pour un nom, patch, keygen, autokeygen. Ici : **keygen name → serial**.

| Name | Serial |
|---|---|
| `petik` | **`cegi^`** |

```bash
python3 tools/crackme20-solve.py                 # name=petik serial=cegi^
python3 tools/crackme20-solve.py --name Foo -q   # serial seul
python3 tools/crackme20-solve.py --check         # Xvfb + Wine : OK -> « Congrats!!! », KO -> « Error »
```

## Premier regard

```bash
unzip -P crackmes.one original/crackme20.zip -d analysis/x
diec analysis/x/Crackme20.exe     # PE32, MS Linker 6.0, Visual Basic 6.00.8041 [Native]
strings -n 5 analysis/x/Crackme20.exe
python3 -c "import re,sys;[print(hex(m.start()),m.group().decode('utf-16')) for m in re.finditer(rb'(?:[\x20-\x7e]\x00){3,}',open('analysis/x/Crackme20.exe','rb').read())]"
```

- UTF-16 : `Wrong serial. Try again!!!` (titre `Error`), `Right serial. Good!!! Now write a keygen for this crackme!!!` (titre `Congrats!!!`), `You can't patch this file.` (menu ? → `Rulez`).
- ASCII : contrôles `Text1`/`Text2`/`Command1`, labels `Name:` / `Serial:`, et surtout le nom de méthode **`EncryptPassword`** (visible dans les métadonnées VB, juste avant des noms d'arguments `Number`, `DecryptedPassword`).

## Flow

Fenêtre unique : `Name` (Text1), `Serial` (Text2), bouton `Check` (Command1). Le clic exécute `Command1_Click` (VA `0x402780`) :

1. lit `Text1.Text` (getter via `[objet+0x304]`, puis `[vtbl+0xa0]` = `Text`) ;
2. appelle la méthode de form `EncryptPassword(name, key, out)` (`call [eax+0x6f8]` @`0x40285f`) ;
3. lit `Text2.Text` (`[objet+0x300]`) et compare au résultat via `__vbaVarTstNe` (`0x4028fe`) ;
4. `cmp si,bx / je` @`0x40291e` : égal → MsgBox `Congrats!!!` (style `0x40`), sinon MsgBox `Error` (style `0x10`).

## Comment on trouve

1. **Ancrage** : `objdump -d -M intel analysis/x/Crackme20.exe > analysis/dis.txt` (offset fichier = VA − 0x400000, `.text` à `0x1000`). On part des BSTR `Wrong serial…` (`0x401ff8`) et `Right serial…` (`0x402044`) : leurs deux seules références sont dans `Command1_Click` (`0x402943` / `0x4029c6`), juste après un test sur le résultat d'une comparaison de variants.
2. **Quel est le prédicat ?** Dans `Command1_Click`, l'argument passé à la méthode `[eax+0x6f8]` est le texte de Text1 ; le byte passé est le résultat de `call [0x40105c]` avec `ecx = 0x0a` (conversion de la constante 10 en Byte) → **clé = 10**. La fonction appelée est la seule du module à avoir le profil `ret 0x10` (3 args + Me) : `EncryptPassword` @`0x402430`.
3. **Lecture de `EncryptPassword`** (compteur `i` en Byte dans `bl`, démarre à 1 via le même helper `0x40105c` avec `ecx=1`) :

```asm
4024a3: add eax,1 ; cmp esi,eax ; je 4025dc     ; boucle tant que i != Len(name)+1
4024d9: call [0x401048]  (rtcMidCharVar)          ; Mid(name, i, 1)
4024ee: call [0x40101c]  (rtcAnsiValueBstr)       ; Asc(...) -> si
402519: and dx,1 ; jne 40253d                     ; i impair ?
40252c: sub si,cx  (pair)  / 402547: add ax,si (impair)   ; Asc -/+ key
402550: mov dx,0xa ; sub dx,cx ; xor eax,edx      ; Xor (10 - key)  (= Xor 0)
40255f: cmp ax,0x65 ; jge ; add ax,0x21           ; si c < 'e' : +0x21
402571: cmp ax,0x5b ; sete cl ; neg ecx ; or ecx,0x7f ; test cx,cx ; je ...
402582: add ax,0xa                                ; toujours exécuté (cf. piège)
40258c: cmp ax,0x7a ; jle ; sub ax,0x21           ; si c > 'z' : -0x21
4025a4: call [0x40107c] (rtcChr / __vbaStrI2) ; 4025b8: call [0x401024] (__vbaStrCat)   ; out &= Chr(c)
```

4. **Réécriture** : pour `i = 1..Len(name)`, `c = Asc(name[i]) ± 10` (**+** si `i` impair, **−** si pair), `Xor 0`, `c += 0x21` si `c < 0x65`, `c += 0x0a`, `c -= 0x21` si `c > 0x7a`. La sortie est la concaténation des `Chr(c)`.
5. **Exemple `petik`** : `p`=0x70 (i=1, +10)=0x7a → ≥0x65 → +0xa = 0x84 > 0x7a → −0x21 = **0x63 `c`** ; `e`=0x65 (i=2, −10)=0x5b → <0x65 → +0x21 = 0x7c → +0xa = 0x86 → −0x21 = **0x65 `e`** ; `t`=0x74 (+10)=0x7e → +0xa=0x88 → −0x21 = **0x67 `g`** ; `i`=0x69 (−10)=0x5f → +0x21=0x80 → +0xa=0x8a → −0x21 = **0x69 `i`** ; `k`=0x6b (+10)=0x75 → +0xa=0x7f → −0x21 = **0x5e `^`**. Serial = `cegi^`.
6. **Pièges** : (a) le test `cmp ax,0x5b / sete / neg / or 0x7f` ressemble à un `If x = &H5B` mais vaut `-1` ou `0x7f`, **jamais 0** → le `+0xa` est inconditionnel ; (b) `cmp ax,0x65 / jge` est signé 16 bits, ce qui ne pose pas de souci pour de l'ASCII ; (c) le Xor `10 − key` n'a d'effet que si `key ≠ 10` (ici nul) ; (d) le Readme annonce « You can't patch this file » : aucune garde anti-patch trouvée, mais la voie attendue est le keygen.

## Vérification

```text
$ python3 tools/crackme20-solve.py --check
name=petik serial=cegi^
[OK] serial=cegi^ fenêtres=['Congrats!!!', 'Crackme20', 'Crackme20'] -> ok
[KO] serial=^igecx fenêtres=['Crackme20', 'Crackme20', 'Error'] -> ok
CHECK OK
```

Le solveur lance l'exe d'origine (copie temporaire) sous Xvfb + Wine, saisit nom puis serial avec `xdotool` (Name ≈ (327,290), Serial ≈ (327,330), Check ≈ (467,362) dans l'écran 800×600) et lit les titres des fenêtres visibles. Test supplémentaire avec un nom plus long/mixte : `Zz~AttilhaZ` → `nzqbgt\l[an` → `Congrats!!!`.

## Notes

- Pas de GDB ni de debugger : analyse statique + preuve live Wine.
- Aucune table cachée ni anti-debug ; le serial dépend uniquement du nom (pas de HWID).
- Le `1×1` « Crackme20 » dans la liste de fenêtres est la fenêtre cachée du runtime VB.
