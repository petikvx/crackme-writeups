# crackmes.de's wtf_serial_protected_round_1 by skjobax

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2db`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2db) |
| **Auteur (site)** | crackmes.de (auteur original : **skjobax**) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 GUI (PureBasic 4.x, hôte VBScript via MSScriptControl) |
| **Difficulté** | 2.0 |
| **SHA-256 (EXE)** | `a369ba05a441eba7506e1c7b9e3a35a0cc1a6e94d2b7dc310e4a757a3a62302d` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Solution

Keygen. Pour un nom de longueur `n` (1 à 12) :

```
serial = CStr(20*n) & CStr((10 mod n) + 40) & Chr(20*n)
```

Exemple : **`petik`** → **`10040d`** (n = 5 : `100` & `40` & `Chr(100)` = `d`).

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/WTFserialProtected#1.zip` | archive interne du ZIP crackmes.one |
| `original/WTFserialProtected#1.exe` | binaire (14 366 octets) |
| `original/READ.ME` | consigne : « Write a keygen » |
| `analysis/script.vbs` | VBScript décompressé (887 octets) |
| `analysis/verify-crypt.vbs` | la fonction `crypt` extraite, exécutée sous `wine cscript` |
| `tools/skjobax-wtf1-solve.py` | extraction (émulation unicorn) + keygen |

## Reconnaissance

- `diec` : **PureBasic (4.X-6.X)**, PE32 GUI, 5 sections (`.code .text .data .rsrc .flat`).
- Le READ.ME prévient : « *This CrackME is compressed!* ».
- Les chaînes trahissent l'architecture : `VBScript`, `CoCreateInstance`, `SysAllocString`, `GetModuleFileNameA` / `CreateFileA` / `ReadFile`. Le programme relit son propre fichier, en extrait un script, et le confie au contrôle **MSScriptControl** avec le langage `VBScript`.
- Aucun texte de dialogue en clair : le script est donc stocké compressé.

## Le payload compressé

La dernière section `.flat` se termine à 0x3600 ; tout ce qui suit est un **overlay** qui commence par :

```
4a 43 77 03 00 00 03 37 b8 e1 …
"JC"  taille=0x377 (887)  checksum
```

C'est l'en-tête **JCALG1** (compresseur de Jeremy Collake, très utilisé par PureBasic via `UnpackMemory`). Dans `.text` on trouve les deux routines de la lib :

- `0x402E20` : `JCALG1_GetUncompressedSizeOfCompressedBlock` (`cmp word [eax], 'JC'` → renvoie `[eax+2]`) ;
- `0x402E40` : `JCALG1_Decompress_Small(src, dst)` en stdcall (`cmp word [esi], 'JC'`, puis `add esi, 0xA` pour sauter l'en-tête).

Plutôt que de réimplémenter JCALG1, on **émule 0x402E40 avec unicorn** : image mappée à 0x400000, overlay à 0x100000, buffer de sortie à 0x200000, adresse de retour bidon sur la pile. La routine est autonome (aucun appel d'API) et renvoie 887, la taille attendue.

```
$ python3 tools/skjobax-wtf1-solve.py --extract original/WTFserialProtected#1.exe
'If you can read this, you have decompressed at all my CrackMe, ZOMFG!!!
…
```

## Le VBScript

```vb
Private Function crypt( nm )
        cod = ""
        i = 65
        key = Len(nm) * 20
        key = key & (((key * 9) + 10) Mod Len(nm) + 20) + 20
        Do While i = 90
                cod = cod & Chr(i * 2 - i)
                i = i + i
        Loop
        crypt = cod & key & Chr(Len(nm) * 20)
End Function
…
user = InputBox("Enter username!!", "WKP #1")
pass = InputBox("Enter serial!!", "WKP #1")
If pass = crypt( user ) Then
   MsgBox "Congratulations!!!" …
```

Lecture attentive, avec les priorités d'opérateurs VBScript (`* / \ Mod` avant `+ -`, et `&` en tout dernier) :

1. **La boucle est morte** : `i = 65` et la condition est `i = 90`, donc `cod` reste vide. Les « `Chr(i*2-i)` » ne sont qu'un leurre.
2. `key = 20*n` (numérique).
3. `((key*9)+10) Mod n` = `(180n + 10) mod n` = **`10 mod n`** (180n est multiple de n).
4. `… + 20) + 20` : l'addition passe avant `&`, donc on concatène la *chaîne* `20n` avec le *nombre* `(10 mod n) + 40`.
5. On ajoute `Chr(20n)`.

Contraintes : `n = 0` donne une division par zéro dans `Mod`, et `n ≥ 13` donne `Chr(260+)`, qui provoque une erreur hors DBCS. Les noms valides font donc **1 à 12 caractères**. Pour `n ≥ 7`, le dernier caractère est non ASCII (cp1252 : `Chr(140)` = `Œ`, etc.), et pour `n = 1` c'est le caractère de contrôle `Chr(20)`.

| n | exemple | serial |
|---|---|---|
| 3 | `abc` | `6041<` |
| 5 | `petik` | `10040d` |
| 6 | `abcdef` | `12044x` |

## Vérification

La fonction `crypt` extraite telle quelle (`analysis/verify-crypt.vbs`), exécutée par le moteur VBScript de wine (`wine cscript //nologo`), donne exactement les mêmes valeurs que le keygen Python : `10040d`, `6041<`, `12044x`.

## Status

- [x] reverse
- [x] write-up
- [x] solveur
