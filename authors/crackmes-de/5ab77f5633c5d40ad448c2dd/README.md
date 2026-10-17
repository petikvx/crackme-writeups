# crackmes.de's orks236_crackme_2 by orcs236

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2dd`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2dd) |
| **Auteur (site)** | crackmes.de (orcs236) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows 2000/XP (PE32 GUI, AutoIt v3.2.0.0) |
| **Difficulté** | 2.0 |
| **SHA-256 (zip)** | `65cf9dd7938c44823af14c0ffcdb2c1d345e70c074839a13435296b7ce03076a` |
| **Statut** | ✅ résolu — keygen |

## TL;DR

C'est un script **AutoIt** compilé (Aut2Exe 3.2.0.0), emballé dans un stub que DIE
détecte comme **PELock 2.x**. Il y a **deux couches** : un loader qui dépose un second
exe AutoIt dans `%TEMP%`, puis le vrai crackme. `autoit-ripper` sort les deux scripts en clair.

Le serial dépend du **nom** et de la **machine** (`@UserName & @ComputerName`) :

```text
nom10  = nom tronqué à 10 caractères, ou complété avec des 'q'
num    = Stretch(@UserName & @ComputerName, "Out", 20)          → XXXXX-XXXXX-XXXXX-XXXXX
t      = Stretch(num sans tirets, "In", 10)
serial = Stretch(nom10, "In") - Stretch(nom10 & "orcs236", "In") - t[0:5] - t[5:10]
```

Exemple vérifié (interpréteur AutoIt d'origine, sous wine) :
`petik` / user `box` / machine `GROK-BOT-VM-411` → **`99616-34659-94504-90041`**

```bash
python3 tools/orcs236-crackme2-keygen.py petik <USERNAME> <COMPUTERNAME>
```

## 1. Premier regard

```text
$ diec "Orks236 Crackme #2.exe"
PE32 — Microsoft Linker 7.10 / MSVC 2003 — Protector: PELock(2.X)
$ strings … | grep AutoIt
AutoIt v3 / AutoIt v3 GUI / /AutoIt3ExecuteScript …
```

Les chaînes `AutoIt v3 GUI`, `/AutoIt3ExecuteScript`, la table des fonctions natives
(`HOTKEYSET`, `GUICTRLREGISTERLISTVIEWSORT`…) trahissent un **interpréteur AutoIt** :
la logique n'est pas dans le code x86 mais dans le script embarqué.

## 2. Extraction (2 couches)

```bash
pip install autoit-ripper
autoit-ripper "original/Orks236 Crackme #2.exe" analysis/au3        # couche 1
autoit-ripper analysis/au3/crackme.exe analysis/au3/inner           # couche 2
```

**Couche 1** ([`analysis/au3/script.au3`](analysis/au3/script.au3)) — simple loader :

```autoit
$Call = DllCall("Kernel32.dll", "int", "IsDebuggerPresent")
If $call[0] <> 1 Then
    FileInstall("crackme.exe", @TempDir & "\orks236ownsjoo.exe", 1)
    Run(@TempDir & "\orks236ownsjoo.exe")
```

**Couche 2** ([`analysis/au3/inner/script.au3`](analysis/au3/inner/script.au3)) — le
crackme, précédé d'un commentaire moqueur « *If you made it this far congradulations,
you're almost done!* ».

## 3. Anti-debug / anti-lancement direct

- Lancé **sans argument**, il écrit `%TEMP%\keyfile05241991.dat` puis se relance avec
  `@ComputerName` en argument. Une branche `If $String = $Auth` (`1241234213` vs
  `"132AB12H"`) est un **leurre** : jamais vraie.
- Avec l'argument : `Detect(1)` tue `OllyDbg.exe`, `Shadow.exe`, `Lbr68.exe`, `hancho.exe`,
  toute fenêtre active dont le titre contient `CPU`, teste `IsDebuggerPresent`, et via
  **WMI** vérifie que le **processus parent** est `explorer.exe` (sinon il le tue et sort).
- À la fermeture, un `key.bat` en boucle supprime l'exe déposé.

Rien de tout ça n'influence le calcul du serial : on contourne tout en lisant le script.

## 4. Vérification du serial

```autoit
$name = GUICtrlRead($Input_1) ; $serial = GuiCtrlRead($Input_2)   ; champ en MAJUSCULES
; nom ramené à 10 caractères (padding 'q' / troncature)
$number = OrderRegister($name, $name & "orcs236")             ; → RegGetCode(0, …)
$check  = RegisterGenerate($name, $name & "orcs236", $number) ; → RegGetCode(1, …)
If $serial = $check Then MsgBox(0, "Cracked!", "Congradulation you cracked it!")
```

`RegGetCode` :

- **mode 0** : `Stretch(@UserName & @ComputerName, 0, 20)` découpé en 4 blocs de 5 —
  le nom n'intervient pas, c'est un identifiant machine.
- **mode 1** : `Stretch(nom,1) & "-" & Stretch(nom&"orcs236",1) & "-" & t[1..5] & "-" & t[6..10]`
  avec `t = Stretch(numéro sans tirets, 1, 10)`.

### `Stretch($Macro, $Mode, $Size = 5)`

1. `_StringEncrypt(1, $Macro, $Mode, 1)` avec la clé `"In"` (mode 1) ou `"Out"` (mode 0).
   C'est l'UDF `_StringEncrypt` d'AutoIt **niveau 1 → 2 passes**, chaque passe :
   - XOR de chaque caractère avec `clé[i mod len] ^ 255` ;
   - un **pseudo-RC4** : KSA standard, mais la boucle de génération **n'échange jamais**
     `S[i]`/`S[j]` (keystream = `S[(S[i]+S[j]) mod 256]` sur une table figée) ;
   - sortie en **hex majuscules** (la longueur est donc ×2 à chaque passe, ×4 au total).
2. Réduction : tant que la longueur ≠ `$Size`, chaque chiffre est remplacé par
   `(a[i] + a[i+1]) mod 10` (la chaîne raccourcit de 1 à chaque tour). Les lettres `A`–`F`
   valent **0** dans l'arithmétique implicite AutoIt (`"A" + "7" = 7`).

La branche « longueur < Size » (`× 2` jusqu'à la bonne taille) n'est jamais atteinte :
après 2 passes hex, même un seul caractère donne 4 chiffres… et les entrées font ≥ 10 car.

## 5. Keygen

[`tools/orcs236-crackme2-keygen.py`](tools/orcs236-crackme2-keygen.py) réimplémente
`_StringEncrypt` (avec son RC4 sans swap), `Stretch` et `RegGetCode`.

```bash
$ python3 tools/orcs236-crackme2-keygen.py petik box GROK-BOT-VM-411
99616-34659-94504-90041
```

### Vérification avec l'interpréteur d'origine

L'exe de la couche 2 est un stub AutoIt 3.2 qui accepte toujours
`/AutoIt3ExecuteScript` : on lui fait exécuter
[`analysis/verify/check.au3`](analysis/verify/check.au3) (les fonctions
`OrderRegister`/`RegisterGenerate`/`Stretch`/`RegGetCode`/`_StringEncrypt` copiées telles
quelles + le padding du nom), sans GUI ni anti-debug :

```bash
cd analysis/verify && wine ../au3/crackme.exe /AutoIt3ExecuteScript check.au3 && cat out.txt
box|GROK-BOT-VM-411|85585-74228-33812-64273|99616-34659-94504-90041
```

Le numéro machine (`85585-74228-33812-64273`) et le serial sont identiques à ceux du keygen.

Pour la vraie machine cible : remplacer `box` / `GROK-BOT-VM-411` par `%USERNAME%` /
`%COMPUTERNAME%` de Windows (casse comprise, AutoIt les renvoie tels quels).

## Contenu

```text
original/   # zip d'origine + exe extrait
analysis/au3/          # script couche 1 + crackme.exe (couche 2)
analysis/au3/inner/    # script couche 2 (le vrai crackme)
analysis/verify/       # script de vérification exécuté par l'interpréteur d'origine
tools/                 # keygen Python
```
