# keygenning4newbies_crackme_6 by analyst (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5433c5d40ad448c1d8>
- **Plateforme** : Windows PE32 GUI, **Borland Delphi 5** (fiche site : Unspecified/other) — difficulté 1.0
- **Archive** : `original/k4n6.zip` (mot de passe `crackmes.one`) → `k4n6.exe` + `k4n6.txt`
- **Statut** : résolu (keygen), vérifié par **émulation Unicorn du vrai `Button1Click`** (le message de succès s'affiche) — la GUI n'est pas pilotée sous wine/xvfb

## Solution

Trois champs : **nAME** (≥ 4 caractères), **cOMPANY** (≥ 3) et **Serial** (entier décimal signé, lu par `StrToInt`).

```
python3 tools/k4n6-solve.py petik petik          ->  156663586
python3 tools/k4n6-solve.py --check petik petik  ->  Button1Click(...) -> 'good , this number Come from your keygen ?'
```

Avec `T` = table de 256 octets en `0x4459df`, `n` = nom, `c` = société (arithmétique 32 bits) :

```
v8  = T[n[3]] * T[c[2]]
v   = T[n[0]] * T[n[2]] * T[c[-2]] * T[c[-1]] + v8
x   = (v ^ 0x28D8) + 0x288D4A7D
x   = sar(ror(x ^ 0x9714, 2), 3) + rol(0x3039, 6) + v8 + 1
x   = not sur les 16 bits bas (not ax), puis x += 0x29A
serial = x lu comme Integer signé
```

## Comment on trouve

1. `diec` : Delphi 5 (Turbo Linker 2.25). `k4n6.txt` : « keygen that one ».
2. Delphi publie les handlers dans la table des méthodes de la classe : on cherche la chaîne Pascal `\x0cButton1Click` et on lit le pointeur juste avant → `Button1Click = 0x44435c` (`Button2Click = 0x444550` ferme la fenêtre).
3. Le DFM `TFORM1` (ressource `RCDATA`) liste `Label1..3` (« nAME: », « cOMPANY : », « Serial: »), puis `Edit1`, `Edit2`, `Edit3` : dans l'objet, ce sont les champs `+0x2d0` (nom), `+0x2d4` (société), `+0x2d8` (serial).
4. `Button1Click` (listing `analysis/button1click.asm.txt`) : `GetText` (`0x423d1c`) des trois edits, `Length` (`0x403b60`) : serial non vide, nom ≥ 4, société ≥ 3.
5. Six octets passent par la table `0x4459df` : `n[0]`, `n[2]`, `c[len-2]`, `c[len-1]`, `n[3]`, `c[2]` ; puis la suite d'opérations de `0x44444d` à `0x44449b` (formule ci-dessus).
6. Dans un bloc `try` : `StrToInt(Edit3.Text)` (`0x407b10`) est comparé à `[ebp-4]` ; égalité → `ShowMessage("good , this number Come from your keygen ?")` (`0x443f74`). Un serial non numérique lève une exception silencieuse.

## Vérification

- `tools/k4n6-solve.py --check` exécute sous **Unicorn** le vrai code du binaire :
  1. le bloc de calcul `0x4443e5..0x44449e` (y compris `Length()` de la RTL) : `[ebp-4]` = valeur du keygen pour plusieurs couples (`petik/petik`, `analyst/reversing`, `ABCD/XYZ`, `keygenning4newbies/crackmes.one`, `zzzz/~~~`) ;
  2. tout `Button1Click` (`0x44435c`, SEH Delphi compris), en ne simulant que `GetText`, `StrToInt` et `ShowMessage` : `petik / petik / 156663586` → « good , this number Come from your keygen ? », `156663587` → aucun message.
- Vérification par émulation du vrai code de vérif, pas par la GUI Delphi sous wine (fenêtre non pilotée ici).
