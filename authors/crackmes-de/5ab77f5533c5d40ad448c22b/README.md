# red_crew_kgm1_by_kkr by kkr_we_rule

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c22b`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c22b) · [ORIGIN](ORIGIN.yml) |
| **Auteur** | KKR / RED CReW (réimport crackmes.de, local `crackmes-de`) |
| **Publié** | 2018-03-25 (keygenme de mars 2010) |
| **Plateforme** | Windows PE32 GUI, Delphi 2009 (Unicode, VCL), pas de packer |
| **Difficulté** | 2.0 (l'auteur annonce « 1.5 max ») |
| **SHA-256 exe** | `3e96fd5efd39deab52c5b9b59d8f6678dc6d9978962fe319eb06573cc5c0c769` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/KKR_RED_KGM_#1.zip`, `original/KKR_RED KGM #1/KeYGeNMe.exe`, `original/KKR_RED KGM #1/Readme.txt` | archive + binaire d'origine + consignes (« Keygen + tut is the only soln ») |
| `analysis/disasm.txt` | `objdump -d -M intel` de `0x474F3C..0x475561` (handler + fonctions appelées) |
| `tools/red_crew_kgm1-keygen.py` | keygen (`-q`, `--check NOM SERIAL`, `--seed`) |
| `tools/drive.c`, `tools/verify-wine.sh` | preuve live sous wine/Xvfb |
| `analysis/wine-run.txt` | sortie de la preuve live (3 OK, 3 KO) |

## Réponse

Serial de **40 caractères** : `A+B` avec `A` = 19 chiffres `1`–`9`, `+` en 20ᵉ position, `B` = 20 chiffres `1`–`9`, et

$$
H(B)^2 \bmod H(\text{nom}) \;=\; H(A) \bmod H(\text{nom})
$$

où `H` est un petit hash 64 bits « PGCD par soustractions » (voir plus bas).

```
Nom    : petik        H = 115
Serial : 7377844815588622487+47137769329314998558
         H(A) = 104, H(B) = 83, 83² = 6889 = 59·115 + 104

Nom    : crackmes     H = 109
Serial : 8711545456562594737+34716727298482355664
```

```bash
python3 tools/red_crew_kgm1-keygen.py petik
python3 tools/red_crew_kgm1-keygen.py --check petik 7377844815588622487+47137769329314998558   # OK
tools/verify-wine.sh petik 7377844815588622487+47137769329314998558   # MessageDlg mtInformation « Registration Successful! »
```

## Premier regard

```
KeYGeNMe.exe: PE32 executable for MS Windows 5.00 (GUI), Intel i386, 9 sections
diec : Linker Turbo Linker(2.25), Compiler Embarcadero Delphi(2009)[Enterprise]
```

Delphi 2009 = chaînes **UnicodeString** : `strings` (ASCII) ne voit presque rien ; `strings -el` trouve `Registration Successful!` et `Wrong Serial.`, mais ce sont des **resourcestring** (table `RT_STRING`), pas des littéraux référencés directement par le code.

## Comment on trouve le handler

1. **IDs des resourcestrings** : en parcourant `RT_STRING` (bloc *n* = IDs `(n-1)*16 .. +15`), `Registration Successful!` = **65283 (0xFF03)** et `Wrong Serial.` = **65284 (0xFF04)**.
2. Delphi range chaque resourcestring dans un `TResStringRec = {^HInstance, Identifier}` en `.data`/`.text`. On cherche le dword `0xFF04` : trouvé en `0x474F38`, donc le record est en **`0x474F34`** (et `0xFF03` → record `0x474F2C`).
3. Xrefs vers `0x474F34` (`mov eax, 0x474F34` avant `LoadResString` = `0x407228`) : `0x47536C`, `0x4753AC`, `0x475411`, `0x47547A`, `0x47551F` ; vers `0x474F2C` : `0x4754FD`. Tout tombe dans la procédure **`0x4752D8`** = `TForm1.SpeedButton1Click` (le DFM `TFORM1` donne `OnClick = SpeedButton1Click` sur le `TSpeedButton` en Left 312 / Top 239).
4. Dans le DFM : `Edit2` (GroupBox « Name ») = champ `[Self+0x384]`, `Edit3` (GroupBox « Serial ») = `[Self+0x394]` ; `FormCreate` (`0x475298`) fixe `Edit3.MaxLength = 40` (`mov edx,0x28 ; call 0x436828`).

## Flow (`0x4752D8`)

```asm
4752fb  mov eax,[ebx+0x384] ; call TControl.GetText  -> nom   [ebp-4]
47532e  je  fin                                     ; nom vide : rien
475337  mov eax,[ebx+0x394] ; call GetText           -> serial [ebp-8]
47535f  cmp word [eax+0x26],0x2b                    ; serial[20] (1-based) == '+' sinon Wrong
475394  call 0x474F7C                               ; A = serial[1..19], B = serial[21..40]
47539f  call UStrCmp(A,B) ; jne ok                  ; A == B -> Wrong (jamais vrai : 19 vs 20 car.)
4753fd  movzx ecx,word [A+i*2-2] ; add ecx,-0x31 ; sub cx,9 ; jb ok   ; chaque car. de A dans '1'..'9'
475466  (idem pour B)
4754a0  call 0x475098 (nom) -> hN ; (A) -> hA ; (B) -> hB     ; Int64 dans EDX:EAX
4754d1  call 0x475200(2, hB)          -> hB^2  (puissance par multiplications répétées, _llmul 0x406288)
4754ee  call 0x474F3C(hN, hA, hB^2)   -> al = (hB^2 mod hN == hA mod hN)   (_llmod 0x4062AC)
4754f5  cmp al,1 ; MessageDlg(0xFF03, mtInformation) sinon MessageDlg(0xFF04, mtError)
```

`0x474F7C` copie caractère par caractère (`UStrFromWChar` + `UStrCat`) les indices 1..19 puis 21..40 : avec un serial plus court, les caractères lus après la fin sont `#0`, qui échouent le test de chiffre → le serial doit faire exactement 40 caractères. Le chiffre `0` est **refusé** (`c - '1' < 9`).

`0x4062AC` est le `_llmod` de la RTL : division 64 bits non signée sur les valeurs absolues, puis le reste prend **le signe du dividende** (modulo C tronqué).

## Le hash `H` (`0x475098`)

Pseudo-code (Int64 partout, débordements en complément à 2) :

```python
h = s = acc = 0
for i in range(len(str)):            # ebx = 0 .. len-1
    c = mot 16 bits en [str + 2*i - 2]   # i=0 : mot HAUT du champ longueur (=0) ; puis str[0..len-2]
    h  = h + c
    t  = (h * i) ^ h
    u  = (t * i) ^ t
    s  = (u + s) ^ (h + t)
    acc += gcd_sub(h, s)             # 0x475018
    h  = acc
return acc
```

`gcd_sub(a, b)` (`0x475018`) : si `b == 0` renvoie `a` ; sinon `tant que a != 0 : si b > a (signé) b -= a sinon a -= b`, renvoie `b` — l'algorithme d'Euclide par soustractions, donc `gcd(a, b)` pour des valeurs positives.

Deux conséquences :

- **off-by-one** : l'indice part de 0 (`[eax+ebx*2-2]`), donc le premier mot lu est le haut du champ longueur de l'UnicodeString et **le dernier caractère n'est jamais lu**. `petik` et `petiq` ont le même hash ; changer le dernier chiffre de `A` ou de `B` ne change rien (vu sous wine, cf. Vérification) ;
- comme `acc` ne fait qu'ajouter des PGCD (≤ `h`), les hash restent **minuscules** : `H("petik") = 115`, `H("crackmes") = 109`, et des chaînes de 19–20 chiffres donnent des valeurs de l'ordre de 70–110.

Attention au binaire : Euclide **par soustractions** peut boucler très longtemps si les opérandes sont déséquilibrés (ou s'ils sont négatifs, le test signé fait grossir `a` jusqu'au débordement). Le keygen compte les soustractions et rejette les candidats qui dépasseraient 10⁷ (pour `petik` : 113 soustractions pour le nom, ~10 000 pour `A` et `B`, instantané).

## Keygen

`hN` est petit, donc il suffit de tirer `A` (19 chiffres) et `B` (20 chiffres) au hasard jusqu'à ce que `H(B)² mod hN == H(A) mod hN` : en moyenne ~`hN` essais, quelques millisecondes. Le tirage est déterministe (`--seed`, défaut 1) pour que le serial d'exemple soit reproductible.

Un nom d'**un seul caractère** donne `H(nom) == 0` (seul le mot haut de la longueur est lu) : division par zéro dans `_llmod`, pas de serial possible. Il faut donc au moins 2 caractères.

## Vérification

Binaire d'origine sous `xvfb-run`/wine, piloté par `tools/drive.c` (texte des deux `TEdit` par `WM_SETTEXT`, clic `WM_LBUTTONDOWN/UP` en (350, 250) sur la fiche, puisque le `TSpeedButton` n'est pas une fenêtre). `MessageDlg` affiche « Information » pour `mtInformation` (succès, `dl = 2`) et « Error » pour `mtError` (`Wrong Serial.`, `dl = 1`) :

| Nom | Serial | Résultat wine |
|---|---|---|
| `petik` | `7377844815588622487+47137769329314998558` | **Information** (Registration Successful!) |
| `petik` | `…98559` (dernier car. de B changé) | Information — dernier car. jamais lu |
| `petik` | `…22488+…` (dernier car. de A changé) | Information — idem |
| `petik` | `8377844815588622487+…` (1er car. de A changé, H(A) = 98) | **Error** |
| `petiq` | serial de `petik` | Information — `H(petiq) == H(petik)` |
| `petik` | `…2487-4713…` (`-` au lieu de `+`) | **Error** |

Sortie brute : [`analysis/wine-run.txt`](analysis/wine-run.txt).

## Notes

- Ce n'est **pas** un vrai calcul numérique sur `A` et `B` : ce sont des chaînes de chiffres passées au même hash que le nom ; le format « chiffres 1–9 » n'est qu'un filtre.
- `A != B` est testé mais toujours vrai (longueurs 19 et 20).
- Reverse 100 % statique (`objdump` + parsing DFM / `RT_STRING` en Python), pas de GDB ni de debugger.
