# orcs236_crackme by orcs236

- **Page** : [crackmes.one](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2de)
- **Auteur (site)** : crackmes.de — auteur réel : orcs236 (.:OrCs236:.)
- **Plateforme** : Windows, PE32 x86, AutoIt v3.1 compressé UPX 1.25
- **Difficulté** : 2.0
- **Consigne** (`OrCs236 Crackme.txt`) : *« Keygen it — No patching allowed »*

## Solution

```
Nom    : petik
Serial : 9AE46FBD6B8492333F2B3BF5B7A8F33DA30E35FF2E46622BC3E8620
```

Keygen : [`tools/orcs236-crackme-keygen.py`](tools/orcs236-crackme-keygen.py)

## 1. Identification

`diec` sur `OrCs236's CrackMe.exe` : MSVC 6, **UPX 1.25**. Après `upx -d`, les chaînes
`AutoIt v3`, `AutoIt v3 GUI`, `AUTOITSETOPTION` et le marqueur de sous-type **`EA04`** montrent un
exécutable compilé avec Aut2Exe d'une version 3.1 (2005). Le script est dans l'overlay
(offset `0x2c200` du fichier original), chiffré, sans l'en-tête `AU3!EA05/EA06` attendu par
`autoit-ripper`, qui échoue (« Couldn't find the EA05 location chunk »).

## 2. Deux couches

Une trace `WINEDEBUG=+relay` sous wine montre ce que fait le programme :

```
CharUpperA("FileInstall")
CreateFileA("C:\users\box\AppData\Local\Temp\~npqthue.tmp", GENERIC_WRITE, ...)
CreateProcessA(..., "C:\users\box\AppData\Local\Temp\~npqthue.tmp", ...)
ExitProcess(0)
```

Le premier exe n'est qu'un **loader** : il dépose un second exécutable AutoIt (UPX lui aussi,
189 545 octets, copié dans [`analysis/inner.exe`](analysis/inner.exe)) dans `%TEMP%`, le lance et
quitte. C'est ce second processus qui affiche la fenêtre « OrCs236's CrackMe ».

## 3. Récupération du script

Les versions 3.1 d'AutoIt ne tokenisent pas encore le script : une fois déchiffré, chaque ligne
est gardée en mémoire sous forme de texte. Il suffit donc de laisser tourner le processus
`~xxxxxxx.tmp` sous wine, de lire sa mémoire via `/proc/<pid>/mem` et d'extraire les chaînes
ASCII (résultat brut : [`analysis/memory-strings.txt`](analysis/memory-strings.txt) ; l'ordre des
lignes n'est pas conservé car chaque ligne est une allocation séparée).

Les lignes utiles :

```autoit
GUICreate("OrCs236's CrackMe", 392, 130, ...)
$INPUT_7  = GUICtrlCreateInput("Name",   20, 20, 350, 20)    ; seul champ Nom visible
$INPUT_11 = GUICtrlCreateInput("Serial", 20, 50, 350, 20)    ; seul champ Serial visible
$INPUT_1  = GUICtrlCreateInput("Name", 30, 30, 1, 1, 0x08000000)   ; leurres 1x1 désactivés
...
$DLL2 = DllCall($DLL, "int", "IsDebuggerPresent")
If $DLL2[0] <> 0 Then _SelfDestruct()

SetOthers(1, GUICtrlRead($INPUT_7))     ; recopie le nom dans tous les champs « Name » cachés
SetOthers(2, GUICtrlRead($INPUT_11))    ; recopie le serial dans tous les champs « Serial » cachés
$HELLO   = GUICtrlRead($INPUT_1)        ; = nom
$NAMECHK = GUICtrlRead($INPUT_10)       ; = serial
Iliad($CHECK, $GUI_EVENT_CLOSE, $NAMECHK, $HELLO)

Func Iliad($1, $3, $2, $5)              ; $2 = serial saisi, $5 = nom
    If StringLen($5) = 1 Then $5 = $5 & $5
    $SERIAL = _StringEncrypt(1, _StringToHex ($5), $5, 3)
    $ELLO = StringLen($SERIAL)
    $SERIAL = StringTrimRight($SERIAL, 5)
    $SERIAL = StringTrimLeft($SERIAL, $ELLO - 60)
    If $2 = $SERIAL Then
        MsgBox(0, "WOOT YOU OWN!", "YOU GOT IT!")
    Else
        MsgBox(0, "NOPE!", "WRONG!")
    EndIf
EndFunc
```

Le script contient aussi des fonctions leurres (`SerialCHK` avec `If $NAMECHK = $HELLO`, un
second `_StringEncrypt(1, _StringToHex($HELLO), $HELLO)`), une protection `IsDebuggerPresent` →
`_SelfDestruct()` et une dizaine de champs/boutons cachés de 1×1 pixel.

## 4. Algorithme

1. Si le nom fait 1 caractère, il est doublé.
2. `_StringToHex(nom)` : chaque caractère en hexadécimal majuscule sur 2 chiffres
   (`petik` → `706574696B`).
3. `_StringEncrypt(1, hex, nom, 3)` de `String.au3` : niveau 3 ⇒ **4 passes**, chacune faisant
   - un XOR caractère ^ mot de passe ^ 255,
   - puis un pseudo-RC4 avec le nom comme clé (KSA normal, mais la boucle de génération
     n'échange pas `box[i]`/`box[j]`), sortie en hexadécimal majuscule.

   La taille double à chaque passe : 2n → 4n → … → **32n** caractères.
4. On garde les caractères `[len-60, len-5[` : le serial fait toujours **55 caractères**.

Cette implémentation de `_StringEncrypt` est la même que celle d'[orks236_crackme_2](../5ab77f5633c5d40ad448c2dd/)
du même auteur, dont le keygen avait été vérifié avec l'interpréteur AutoIt d'origine ; les lignes
extraites ici (XOR, KSA, PRGA, `Hex(..., 2)`) sont identiques.

```
$ ./tools/orcs236-crackme-keygen.py petik
9AE46FBD6B8492333F2B3BF5B7A8F33DA30E35FF2E46622BC3E8620
```
