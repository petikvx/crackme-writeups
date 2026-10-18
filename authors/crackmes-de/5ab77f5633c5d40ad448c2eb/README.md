# anonimoser_crackme_iv — AnonimoSer (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2eb
- Plateforme : Windows, x86, Delphi 5 empaqueté UPX 1.21 — difficulté 2.0
- Type : **patchme / keyfile intégré** (aucun champ de saisie)
- Solution : faire en sorte que **le dernier octet du fichier .exe soit `U` (0x55)** → « REGISTRADO » + « LO LOGRASTE! »

## 1. Reconnaissance

L'archive contient `AnonimoSer Crackme IV.exe` (le crackme) et `web.exe` (lien vers le site de l'auteur, sans intérêt).
`diec` : Borland Delphi, Turbo Linker 2.25, UPX 1.21. `upx -d` décompresse sans difficulté.

La fiche Delphi `TFORM1` (ressource RCDATA, `TPF0`) ne contient **aucun TEdit** : seulement une image,
deux labels (`Label1` rouge, `Label2` = « CrackME IV ») et un bouton `Salir`. Tout se joue dans
l'événement `OnCreate = revisa`. La table des méthodes publiées donne `revisa` à `0x457A00`.

## 2. Chaînes chiffrées

Toutes les chaînes passent par `0x4578EC`, qui **inverse la chaîne puis retire 1 à chaque caractère** :

| Chiffrée | En clair |
|---|---|
| `PEBSUTJHFS!PO` | `NO REGISTRADO` |
| `PEBSUTJHFS` | `REGISTRADO` |
| `V` | `U` |
| `;d!ubnspG!mmfiTTPETNuqnpsq!"pebudfufe!FDJ.ugpT` | `Soft-ICE detectado! promptMSDOSShell Format c:` |

Les autres (« A DONDE CREES QUE VAS? », « HEY!, QUE HACES LEYENDO ESTO? »…) sont des messages
adressés au cracker, rangés dans une variable globale jamais affichée.

## 3. La routine `revisa`

```
call 0x457990            ; anti-débogage SoftICE (chaînes de détection chiffrées) → message puis Halt
h := FileOpen(Application.ExeName, fmShareDenyNone)   ; 0x407C44, mode 0x40
FileSeek(h, -1, 2)       ; 0x407D00 : ecx=2 (depuis la fin), edx=-1
FileRead(h, b, 1)        ; 0x407CA8 → [ebp-1]
FileClose(h)
if Chr(b) <> Decode('V') {= 'U'} then
    Label1.Caption := Label1.Caption + 'NO REGISTRADO'
else
    Label1.Caption := Label1.Caption + 'REGISTRADO'
    ShowMessage('LO LOGRASTE! Mandame un email a anonimoser@hotmail.com'#13#10
                'con una explicacion de como lo hiciste, y un puntaje del crackme.')
```

Le programme lit donc **le dernier octet de son propre exécutable**. Dans le fichier d'origine il vaut `0x00`.

## 4. Solution

Il suffit d'ajouter l'octet `U` à la fin du fichier. Les octets après la dernière section (overlay) sont
ignorés par le chargeur PE et par le stub UPX : le programme démarre normalement, sans patcher de code.

```
python3 tools/crackmes-de-anonimoser_crackme_iv-solve.py "AnonimoSer Crackme IV.exe" registrado.exe
# ou simplement :  printf U >> "AnonimoSer Crackme IV.exe"
```

(Remplacer le dernier `0x00` par `U` fonctionne aussi, puisque c'est du bourrage.)
Il n'y a pas de nom d'utilisateur : la « clé » est la même pour tous, `petik` compris.

## 5. Vérification

Sous wine + Xvfb (`tools/wine-xdotool-check.sh`) :

- original → `analysis/ko-original.png` : « NO REGISTRADO » ;
- copie avec `U` ajouté → `analysis/ok-registrado.png` : boîte « LO LOGRASTE! Mandame un email… ».
