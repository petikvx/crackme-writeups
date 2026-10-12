# sams_keygenme by samfisher9000 (crackmes.de)

`crackme3.exe` de samfisher9000 (2005) : « just keygen it, it closes when you get the correct serial, and as usual no patching ».

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c202>
- **Plateforme** : Windows **PE32** GUI, **Visual Basic 6 natif** (6.00.8041) — difficulté 2.0
- **Archive** : `original/crackme3.zip` → `crackme3.exe` + `info.txt`
- **SHA-256 zip** : `be9b366fc32fad1f199c4ead2c517369e7267283bf1f0e7659c6bb37e56b3902`
- **Statut** : résolu (keygen), vérifié **sous wine** : le crackme se ferme sur le bon serial

## Solution

Nom de 5 à 15 caractères.

```
P = 0
pour chaque car. c du nom :
    v = Asc(c) - 11
    si v > 90  : v = v + 22          # (+12 -6 +16)
    si v < 90  : v = v + 43          # (+46 -10 +7)
    si v > 150 : v = v - 35          # (-23 +4 -16)
    P = (P = 0) ? v : P * Int(v / 50)
si P < 20000 : P = CLng(P / 10 * P)
Q = CLng(Int(5 * v) * P / 15)        # v = valeur du DERNIER caractère
A = Mid(P,1,3) & "-" & Mid(P,2,3) & "-" & Mid(P,3,3)     # 3 fenêtres glissantes de 3 chiffres
B = idem avec Q
serial = A & "-" & Len(A) & "-" & B & "-" & Len(B)
```

```
python3 tools/sams-keygenme-solve.py petik
968-682-826-11-380-808-084-11
```

| Name | Serial |
|---|---|
| `petik` | `968-682-826-11-380-808-084-11` |

Exemple `petik` : `v` = 123, 90, 127, 116, 118 → `P` = 123, 123, 246, 492, 984 → `984²/10` = 96825,6 → `P = 96826` ;
`Q = 590 × 96826 / 15` = 3808489 → `380-808-084`.

## Comment on trouve

1. `diec` : VB6 natif. Chaînes : `cmdcheck` (*Check*), `txtname`, `txtserial`, `Form1` (sans titre).
   Pas de message d’erreur : sur un bon serial, le programme ouvre une 2ᵉ fiche puis `End`.
2. `tools/vb-iat-objdump.py original/crackme3.exe` (`objdump` + noms d’imports MSVBVM60 sur les `call [IAT]`).
   Le handler *Check* remet à zéro les membres de la fiche (`[esi+0x3c]`, `[esi+0x40]`, `[esi+0x48]`, `[esi+0x4c]`)
   puis teste `5 <= Len(txtname) <= 15` (`0x402086`).
3. Boucle nom `0x4020dd..0x4024bb` : `Mid` (`ord632`) + `Asc` (`ord516`) − `0x0B`, trois `__vbaVarTstGt/Lt`
   avec 90 / 90 / 150 et leurs `__vbaVarAdd/Sub` ; puis `P = P * Int(v/50)` (`__vbaVarDiv`, `__vbaVarInt`, `__vbaVarMul`),
   ou `P = v` si `P` vaut 0.
   Ordre des opérandes Variant : l’opérande **poussé en premier** est celui de gauche (`Sub(dst, 6, t)` = `t - 6`).
4. `0x4024c0` : si `P < 0x4E20`, `P = FpI4(P / 10.0 * P)` (la constante double `10.0` est à `0x401100`).
   `0x402529` : `Q = I4(Int(5*v) * P / 15)`.
5. Deux boucles `j = 1..3` (`0x4025c4`, `0x402716`) : `Mid(CStr(Q ou P), j, 3)` séparés par `"-"`.
6. `0x402861..0x40292b` : concaténation finale (`__vbaStrCat`, `__vbaStrI4(Len(...))`) puis
   `__vbaStrCmp(txtserial, attendu)`.

### Debug winedbg (contrôle du prédicat)

La lecture statique des opérations Variant est confirmée en live avec `winedbg` piloté par une FIFO :

```
mkfifo /tmp/wd.fifo; sleep 3600 > /tmp/wd.fifo &          # garde la FIFO ouverte
DISPLAY=:86 winedbg original/crackme3.exe < /tmp/wd.fifo > /tmp/wd.out &
echo 'break *0x40292b' > /tmp/wd.fifo; echo cont > /tmp/wd.fifo
# xdotool : nom petik, serial AAAA, Check → arrêt sur __vbaStrCmp
echo 'x /4x $esp' > /tmp/wd.fifo           # 2 BSTR : attendu, saisi
echo 'x /2x 0x00355260' > /tmp/wd.fifo     # longueur BSTR (octets) = 0x3a → 29 caractères
echo 'x /40w 0x00355264' > /tmp/wd.fifo    # UTF-16 : "968-682-826-11-380-808-084-11"
```

Les adresses de tas varient d’une session à l’autre ; c’est `x /4x $esp` au breakpoint qui donne les deux pointeurs.

## Vérification

```
tools/verify-wine.sh petik   968-682-826-11-380-808-084-11   # processus terminé (serial accepté)
tools/verify-wine.sh petik   968-682-826-11-380-808-084-12   # toujours ouvert (refusé)
tools/verify-wine.sh grokbot 532-323-231-11-225-253-534-11   # accepté (2ᵉ nom)
```

Binaire original (non patché) sous wine/Xvfb le 2026-10-12. Le premier lancement de wine après une pause
peut être lent : si la fenêtre n’est pas prête, le clic est perdu et le test sort « refusé » ; relancer.
