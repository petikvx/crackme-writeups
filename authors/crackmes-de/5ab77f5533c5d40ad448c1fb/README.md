# keygenme_drpepur_2 by drpepur (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1fb>
- **Plateforme** : Windows **PE32** GUI, **MASM32** (DialogBox) — difficulté 1.0
- **Archive** : `original/DrPepUr_#2.zip` → `DrPepUr #2.exe` + `New Text Document.txt` (règles : *No Patching / Write A Keygen*)
- **SHA-256 zip** : `cca39055d5c44355bf61435f813bb2c3db2f7fc68164244ffb9cc71055138ba7`
- **Statut** : résolu (keygen), vérifié sous **wine + gdb** (MessageBox « Serial Number Is Valid.....Now Write A KeyGen »)

## Solution

Serial = `A-B-C`, dépend du **nom** (≥ 5 caractères) **et du nom de l’ordinateur** (`GetComputerNameA`).

```
python3 tools/drpepur-2-solve.py petik                       # nom PC lu via wine (%COMPUTERNAME%)
# computer=GROK-BOT-VM-411 name=petik
vtAgIIxM-8A8E9386-4873003B

python3 tools/drpepur-2-solve.py --computer WORKSTATION petik
vtAgIIxM-39203D25-516A1922
```

| Partie | Contrainte |
|---|---|
| `A` | `CRC32(A) == 0x8EF0AEF9` (constante en `0x4034f2`) — n’importe quel préimage marche ; le solveur forge `vtAgIIxM` |
| `B` | `"%X"` du dword (4 premiers octets) de `ComputerName ^ kpc`, `kpc = Σ((c ^ 0x4C) − 5) mod 256` |
| `C` | `"%X"` de `dword(Name ^ kn) ^ 0x12345678`, `kn = Σ((c ^ kpc) + 0x2B) mod 256` |

## Comment on trouve

Binaire minuscule (0x4cc octets de code), pas de packer : `objdump -d -M intel` suffit.

1. **WM_INITDIALOG** (`0x401038`) : `GetComputerNameA` → `0x403630`.
   Boucle `0x40107f` : `bl += (c ^ 0x4C) − 5` sur tous les caractères → `kpc` stocké en `0x4037a0`.
   Puis chaque caractère du nom PC est XORé par `kpc`, et `wsprintfA(0x40373c, "%X", *(DWORD*)0x403630)`
   → chaîne attendue n°1. Le champ nom est pré-rempli avec `DrPepUr`.
2. **Bouton Register** (`0x3eb`, `0x4010f1`) : nom (`0x3e9`, > 4 car.) dans `0x403504`, serial (`0x3ea`) dans `0x403568`.
   Boucle `0x40114d` : `bl += (c ^ kpc) + 0x2B` → `kn` ; XOR du nom par `kn` ;
   `wsprintfA(0x4036d8, "%X", *(DWORD*)0x403504 ^ 0x12345678)` → chaîne attendue n°2.
3. Serial : tous les `-` deviennent `\0` (`0x4011a3`) → trois sous-chaînes.
4. `0x4013a4` est un **CRC32** standard (table en `0x403000` = `00000000 77073096 …`, init/final `^ 0xFFFFFFFF`) :
   `CRC32(A)` doit valoir le dword en `0x4034f2` = **`0x8EF0AEF9`**. Pas de chaîne « évidente » derrière ;
   on **forge** : 4 caractères aléatoires + 4 octets calculés en remontant la table CRC (bit de poids fort
   unique par entrée), on recommence jusqu’à ce que les 4 octets soient alphanumériques (~300 essais).
5. Sous-chaîne 2 (`0x4011f8`) et 3 (`0x40126e`) : copiées par `RtlMoveMemory` dans `0x4035cc` puis comparées
   (longueur + caractère par caractère) aux chaînes n°1 et n°2. Un compteur en `0x4034f8` doit finir à `3`.

### Le piège `dec edx`

```
40120c  push edx            ; ptr sous-chaîne
40120d  call lstrlenA
401212  dec  edx            ; edx APRÈS l’appel !
401213  push eax / push edx / push 0x4035cc
40121a  call RtlMoveMemory
```

L’auteur réutilise `edx` après `lstrlenA` : sur **Windows XP**, `lstrlenA` fait `lea edx,[eax+1]` puis
`sub eax,edx` → en sortie `edx = ptr+1`, d’où le `dec edx` pour retomber sur `ptr`. Sous **wine**, `lstrlenA`
est du C et `edx` est n’importe quoi → la copie part d’une adresse poubelle et **aucun serial ne passe**
(constaté : `0x4035cc = "?\377\377\377\377P…"`).

## Debug GDB (wine)

Attacher gdb au process wine (`gdb -p $(pgrep -f 'DrPepUr #2.exe')`), image chargée à `0x400000` :

```
break *0x4011d8          # après CRC32 : $eax vs *(unsigned*)0x4034f2
x/s 0x40373c             # chaîne PC  -> "8A8E9386" (GROK-BOT-VM-411)
x/s 0x4036d8             # chaîne nom -> "4873003B" (petik)
x/bx 0x4037a0            # kpc = 0xc1
```

`tools/xp-lstrlen.gdb` reproduit l’effet de bord XP : breakpoints sur les deux `dec edx`
(`0x401212`, `0x4012ab`) qui posent `edx = ptr+1`, puis affiche le compteur final.

## Vérification

```
tools/verify-wine.sh petik vtAgIIxM-8A8E9386-4873003B
# MSGBOX_OnInit L"Serial Number Is Valid.....Now Write A KeyGen"
# [chk] compteur 0x4034f8 = 3 (3 = OK)

tools/verify-wine.sh petik vtAgIIxM-8A8E9386-4873003B --no-gdb
# MSGBOX_OnInit L"The Serial Number Is Not Correct :-p "   (bug edx sous wine, attendu)
```

Le binaire original (non patché) tourne sous wine/Xvfb, xdotool tape nom + serial et clique *Register* ;
gdb ne modifie que le registre `edx` au retour de `lstrlenA` pour reproduire le comportement de XP.
