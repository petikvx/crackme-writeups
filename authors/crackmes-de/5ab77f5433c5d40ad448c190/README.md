# firox_crackme_1 by firox (crackmes.de / firox)

- **Page** : [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c190) — publié le 2018-03-25, difficulté 1.0
- **Plateforme** : Windows PE32 GUI, Visual Basic 6 (code natif)

## Solution

**Serial : `DFT1-9CKS-BWD0-2VRF`** (en dur, indépendant de l'utilisateur).

Vérifié en live sous wine (Xvfb privé + xdotool) : MessageBox « Congradulations! You did it! … » ; un serial faux donne « Incorrect serial please try again. ».

## Comment on trouve

1. `diec` : VB6 natif, pas de packer. Le chemin du projet (`…\#1 - hardcoded\FiroxCrackME1.vbp`) annonce déjà la couleur.
2. Les chaînes VB sont en UTF-16 : `strings -el` sort `DFT1-9CKS-BWD0-2VRF` juste avant les messages de succès / échec.
3. Confirmation dans le code : la chaîne est à `0x402ccc`, seule référence en `0x40667c` :

```asm
call [vtable+0xA0]          ; Text1.Text -> [ebp-18h]
push dword [ebp-18h]        ; saisie
push 0x402ccc               ; "DFT1-9CKS-BWD0-2VRF"
call __vbaStrCmp            ; 0 si égal
neg esi / sbb esi,esi / inc esi / neg esi   ; booléen VB (égal -> -1)
cmp si, di / je echec
```

## Reproduire

```bash
python3 tools/crackmes-de-firox_crackme_1-solve.py FiroxCrackME1.exe
bash tools/crackmes-de-firox_crackme_1-verify-wine.sh DFT1-9CKS-BWD0-2VRF   # WINEDEBUG=+msgbox
```
