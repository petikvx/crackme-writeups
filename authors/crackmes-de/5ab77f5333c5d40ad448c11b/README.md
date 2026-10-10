# feo_crackme_12 — shoulck (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c11b
- Plateforme : Windows PE32 GUI (MSVC 6, Win32 API), difficulté 1.5
- Statut : **résolu** (preuve statique : handlers désassemblés + ressource DIALOG ; GUI multi-instance non piloté)

## Résultat

```
Nombre : petikpetik
Datos  : "Crackme 12 "      (11 caractères, avec l'espace final)
Serial : kitepkitep         (= Nombre à l'envers)
```

Cliquer **Guardar registro**, **laisser la fenêtre ouverte**, puis lancer une **deuxième instance** du crackme :
dès l'ouverture elle affiche « Buen cracker, Felicidades » (titre « Increible ») puis se ferme.

```
python3 tools/feo12-solve.py petikpetik
```

## Comment on trouve

### 1. Repères

Pas de chaîne utile en ASCII hors CRT ; les imports parlent : `CreateFileMappingA`, `OpenFileMappingA`,
`MapViewOfFile`, `GetWindowTextA`, `GetDlgItemTextA`. La ressource DIALOG donne les ID (par position y) :
`0x68` = Nombre, `0x64` = Datos, `0x3ea` = Serial, bouton `0x65` = Guardar registro.

### 2. Guardar registro (`0x4011a6`, `analysis/dlg-handlers.asm`)

```
GetDlgItemText(0x64 /*Datos*/, buf, 0x14) ; vide -> rien
h = CreateFileMappingA(INVALID_HANDLE_VALUE, 0, PAGE_READWRITE, 0, 0x1000, Datos)
if GetLastError() == 0xb7 -> "¿Cuantas veces kieres guardar los datos?"
p = MapViewOfFile(h, ...)
GetDlgItemText(0x3ea /*Serial*/, 0x4057e8, 200) ; strlen >= 9 sinon ExitProcess
GetDlgItemText(0x68  /*Nombre*/, 0x405720, 200) ; strlen >= 4 sinon ExitProcess
memcpy(p, 0x405720, 400)       ; 400 octets : Nombre (0x405720) ET Serial (0x405720+0xc8 = 0x4057e8)
_strrev(p)                     ; 0x401430 : inverse Nombre dans la vue
UnmapViewOfFile(p) ; EnableWindow(bouton, FALSE)   ; le handle reste ouvert
```

Le mapping est **nommé par le champ Datos** et survit tant que la 1re instance tourne.

### 3. WM_INITDIALOG (`0x401000`)

```
GetWindowTextA(hDlg, title, 12)          ; -> "Crackme 12 " (11 car.)
h = OpenFileMappingA(FILE_MAP_WRITE|READ, 0, title)
p = MapViewOfFile(h, ...)
memcpy(0x405720, p, 400)                 ; récupère reverse(Nombre) ET Serial
if strcmp(0x405720, 0x4057e8) == 0 -> MessageBox("Buen cracker, Felicidades", "Increible") ; ExitProcess
```

Donc il faut : `Datos == "Crackme 12 "` (sinon l'instance suivante n'ouvre pas le bon mapping) et
`Serial == reverse(Nombre)`, avec `len(Serial) >= 9` (donc Nombre aussi). Le contrôle se fait à l'**ouverture** d'une
nouvelle instance, d'où le « guardar » (enregistrer) puis relancer.

## Vérification

Statique : la séquence demande deux instances GUI et une saisie manuelle, non pilotées dans ce passage autonome.
Les ID des champs viennent de la ressource DIALOG, les tailles et comparaisons du désassemblage.
