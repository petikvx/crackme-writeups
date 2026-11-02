# crackmes.de's crackme2_by_neo_theone — CrackMe#2 by nEo_TheOne

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3ca`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3ca) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (nEo_TheOne) |
| **Plateforme** | Windows PE32 GUI, Visual Basic 6 **native code** (`MSVBVM60.DLL`), non packé |
| **SHA-256 (zip)** | `102072375c59240d2b3adf0154f66d255f8c8d1885be2297df3323ada2181a63` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme2.zip` | archive d'origine (mot de passe `crackmes.one`) : `CrackMe#2 by nEo_TheOne.exe` + `CrackMe#2.txt` (le zip n'est pas modifié ; l'exe a été extrait hors dépôt, dans `/tmp`) |
| `tools/crackmes-de-crackme2-neo-solve.py` | keygen / `--check` |
| `analysis/screenshot-ok.png` | `petik` / `541541` → « You have done it » |
| `analysis/screenshot-ko.png` | `petik` / `4475.545454545455` → « Sorry,wrong serial » |

## Réponse

Type **Name/Serial**. Serial = (somme des codes ASCII du nom) × **1001**.

| Nom | Serial |
|---|---|
| `petik` | **`541541`** |

```bash
python3 tools/crackmes-de-crackme2-neo-solve.py              # petik -> 541541
python3 tools/crackmes-de-crackme2-neo-solve.py --name petik -q
python3 tools/crackmes-de-crackme2-neo-solve.py --name petik --check 541541   # OK
```

## Premier regard

```bash
unzip -P crackmes.one original/crackme2.zip -d /tmp/cm2
diec "/tmp/cm2/CrackMe#2 by nEo_TheOne.exe"   # PE32, Microsoft Linker 6.0, Visual Basic 6.00 [Native]
strings -n 5 /tmp/cm2/*.exe
```

Le `.txt` annonce : Name/Serial, VB, non packé, patch interdit. Les strings ASCII utiles
(`You have done it`, `Sorry,wrong serial`, `Enter a name and a serial`) sont en `.text`
`0x4024f0`, `0x402528`, `0x402554` ; ce sont des BSTR **UTF-16** (`strings -el` / script Python pour les voir).
L'UI : champs Name (Text1) / Serial (Text2), boutons Check / About / Clear / Exit.

## Flow

Handler du bouton **Check** (VB native, pas de P-code) à `0x4036d9`-`0x403b52` :

1. `Text1.Text` → `[obj+0x34]` (nom, via `__vbaObjSet` + vtable `+0xa0` = get Text) ;
2. `Text2.Text` → Variant `[obj+0x3c]` (serial, **Variant string**) ;
3. `Len(nom) > 0` sinon « Enter a name and a serial » ;
4. boucle `i = 1..Len(nom)` : `somme += Asc(Mid(nom, i, 1))` (`Integer` 16 bits, `jo` → overflow) ;
5. `somme = somme * 7` (`imul ax,ax,7`, `jo` → overflow) ;
6. deux `__vbaVarDiv` successifs sur le Variant serial avec les constantes **11** puis **13** ;
7. `__vbaVarTstEq(serial_variant, somme)` → vrai : « You have done it », faux : « Sorry,wrong serial ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel c2.exe`, puis on cherche les `push` des adresses des chaînes UTF-16 :
`grep -E "push +0x4024f0|0x402528|0x402554"` → `0x403a05` (succès), `0x403a7b` (échec), `0x403b08` (champs vides).
Les thunks `jmp [IAT]` de `0x4011b8`-`0x401236` sont résolus avec `objdump -p` (table d'imports `MSVBVM60`) :
`0x4011d0`=`__vbaVarDiv`, `0x4011ca`=`__vbaVarTstEq`, `0x4011dc`=`rtcMidCharVar`, `0x4011e8`=`rtcAnsiValueBstr`, `0x4011ee`=`__vbaLenBstr`…

**Somme du nom** (boucle `0x40389c`) :

```asm
403891: cmp  WORD PTR [eax+0x4c],0      ; Len(nom) > 0 ?
4038a6: cmp  ax,WORD PTR [ecx+0x4c]     ; i <= Len ?        (i = [obj+0x38], init 1)
4038e2: call 0x4011dc                   ; Mid(nom, i, 1)
4038f5: call 0x4011e8                   ; Asc(...)
403901: add  cx,ax                      ; somme [obj+0x3a] += Asc   (jo -> overflow)
...
40394f: imul ax,ax,0x7                  ; somme *= 7
40395c: mov  WORD PTR [ecx+0x3a],ax
```

**Divisions** :

```asm
403960: mov DWORD PTR [ebp-0x64],0xb    ; Variant {VT_I2, 11}
403967: mov DWORD PTR [ebp-0x6c],0x2
40397d: call __vbaVarDiv                ; -> serial / 11
...
40398f: mov DWORD PTR [ebp-0x64],0xd    ; Variant {VT_I2, 13}
4039ac: call __vbaVarDiv                ; -> (serial/11) / 13
4039c1: mov ax,[somme]  ... mov [ebp-0x6c],0x8002   ; Variant I2 byref = somme*7
4039db: call __vbaVarTstEq              ; (serial/11/13) == somme*7 ?
4039e5: je   0x403a5d                   ; différent -> "Sorry,wrong serial"
```

**Piège (ordre des opérandes)** : à la lecture des `push` j'avais d'abord compris `11 / serial` puis `13 / (11/serial)`
(donc `serial = T*11/13`, p. ex. `3204.3846…` pour `petik`) — ce serial est **refusé** en live
(`analysis/screenshot-ko.png` utilise l'autre mauvaise piste `T*13/11`). L'essai live a montré que le Variant serial
est bien le **dividende** : `serial / 11 / 13 == somme*7`, d'où `serial = somme × 7 × 11 × 13 = somme × 1001`.
Comme la comparaison se fait en Double (le serial string est converti en nombre), seul le produit exact passe.
Les valeurs décimales proches échouent, et le serial entier est toujours exact.

**Exemple `petik`** : `p=112 e=101 t=116 i=105 k=107` → Σ = 541 ; ×7 = 3787 ; ×11×13 (=143) = **541541**
(`541541 / 11 = 49231`, `/ 13 = 3787` ✓).

**Contrainte** : `Σ×7` doit tenir dans un `Integer` VB (≤ 32767, soit Σ ≤ 4681, ≈ 40 caractères) sinon
« Run-time error 6 Overflow » ; le solveur le signale.

## Vérification

Preuve live : Wine sous Xvfb, saisie pilotée par `xdotool`, capture `ffmpeg x11grab`
(`xvfb-run -a -s "-screen 0 1024x768x24" …` ; clic dans Name, Serial puis Check).

| Nom | Serial | Résultat |
|---|---|---|
| `petik` | `541541` | **You have done it** (`analysis/screenshot-ok.png`) |
| `Bob` | `275275` (solveur : (66+111+98)×1001) | **You have done it** |
| `petik` | `4475.545454545455` | Sorry,wrong serial (`analysis/screenshot-ko.png`) |
| `petik` | `3204.3846153846152`, `3204.38`, `26.4825…` | Sorry,wrong serial |

## Notes

- Pas de GDB / x64dbg / IDA : reverse statique `objdump` + preuve Wine. Pas de section « Debug GDB » (pas de session).
- Méthode demandée par l'auteur (« explain the method ») : ci-dessus. Le serial dépend uniquement de la somme des
  octets du nom (commutatif : `petik` et `ktipe` donnent le même serial).
- Le champ Serial est un Variant string : un serial non numérique provoque un `Type mismatch` (erreur 13) visible lors d'un essai mal formé.
- `original/` n'a pas été modifié.
