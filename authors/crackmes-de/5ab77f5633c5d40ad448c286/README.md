# hypercrackme3 by thehyper

- Origine : [ORIGIN.yml](ORIGIN.yml) · [crackmes.one `…c286`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c286)
- Auteur : thehyper (mirror crackmes.de) · Plateforme : Windows PE32, Borland C++ (Turbo Linker 5.0), packé **ASPack 2.12**
- Difficulté annoncée : 1.0 (readme : « LEVEL: 1-2 », *Aim: Code a keygen*, *donts: patching*)

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/hypercrackme3.zip` | archive crackmes.one (mot de passe `crackmes.one`) |
| `original/HyperCrackMe3.exe` | binaire d’origine (ASPack) |
| `original/readme.1st` | consignes de l’auteur |
| `analysis/wine-memdump.c` | lance le crackme sous Wine et dumpe l’image 0x400000..0x415000 une fois ASPack décompressé |
| `analysis/HyperCrackMe3.memdump.bin` | dump mémoire (base 0x400000) |
| `analysis/check-routine.txt` | désassemblage du handler « Check it!!!!! » (0x401233..) et de `sub_401150` |
| `analysis/wine-driver.c` | driver Win32 : remplit les Edit, clique, lit la MessageBox |
| `tools/hypercrackme3-solve.py` | keygen (`-q`, `--check NOM SERIAL`) |

## Réponse

**Serial = code ASCII décimal (2 chiffres) de chaque caractère du nom, en majuscule.**

| Nom | Serial |
|---|---|
| `petik` | **`8069847375`** (P=80 E=69 T=84 I=73 K=75) |
| `crackmes` | `6782656775776983` |
| `TheHyper` | `8472697289806982` |

```
$ python3 tools/hypercrackme3-solve.py petik
name=petik  serial=8069847375
```

Contraintes du nom : ≥ 5 caractères ; aucune lettre répétée plus de `len/2 − 1` fois ; caractères dont le code en majuscule est < 100 (lettres, chiffres, ponctuation courante).

## Premier regard

```
$ diec HyperCrackMe3.exe
PE32  Linker: Turbo Linker(5.0)  Compiler: Borland C++(Builder)  Packer: ASPack(2.12-2.42)
$ objdump -p HyperCrackMe3.exe | grep AddressOfEntry
AddressOfEntryPoint 00012001          ; dans la section .aspack
```

Les sections sont compressées : `strings` sur le fichier ne montre rien d’utile. Plutôt que de réécrire un unpacker, on laisse ASPack faire le travail : `analysis/wine-memdump.c` lance le binaire sous `xvfb-run wine`, attend la fenêtre, puis `ReadProcessMemory` de toute l’image. Dans le dump :

```
Name should contain atleast five letters   @0x409258  (xref 0x40129f)
Invalid name                               @0x409289  (xref 0x4012c6)
Congrats!!! Send solution to crackmes.de   @0x40929e  (xref 0x4014ee)
```

La fenêtre (`EnumChildWindows`) : dialogue `#32770` « Register HyperCrackMe3!!!!! », bouton `Check it!!!!!` (ID 1), Edit **101 = Name**, Edit **102 = Serial**.

## Flow (DlgProc, WM_COMMAND ID 1)

```asm
401257: GetDlgItemTextA(hDlg, 101, name,   0x18)   ; [ebp-0x2c]
401267: GetDlgItemTextA(hDlg, 102, serial, 0x32)   ; [ebp-0x60]
401291: cmp strlen(name), 5 / jge   -> sinon « Name should contain atleast five letters »
4012b4: call sub_401150(name)        -> 0 => « Invalid name »
4012d7: ...transformation du serial... -> out [ebp-0xb0]
4014da: call 0x40271c(name, out)     ; comparaison insensible à la casse (stricmp RTL)
4014e4: jne fin                      ; 0 => « Congrats!!! »
```

## Comment on trouve le prédicat

### 1. `sub_401150` — validité du nom

```asm
40115d: mov esi, 409128h / rep movs 26 dwords -> cnt[26] (tous à 0)
401171: pour chaque c du nom, si c ∈ [a-z] ou [A-Z] :
401199:   push c / call 403ed8 (toupper) / inc cnt[c-'A']   ; [ebp+eax*4-0x16c] = cnt[eax-0x41]
4011b0: pour chaque lettre :  (strlen(name) >> 1) - 1  >= cnt[l]  (jae, non signé), sinon return 0
```

→ chaque lettre apparaît au plus `len/2 − 1` fois (`PEPEK` : P×2 > 1 → « Invalid name »).

### 2. Serial → chaîne de chiffres (0x4012D7–0x4013A6)

Pour chaque caractère `c` du serial :

- lettre `A-Z`, `a-z`, ou `:`…`@` (0x3A–0x40) → ajoute **deux** chiffres `(c/10)%10` puis `c%10` (division `idiv 10` deux fois ; centaine perdue) ;
- chiffre `0-9` → ajouté tel quel ;
- autre → ignoré.

Puis `d[i] = digit - '0'` (0x4013C5).

### 3. Deux matrices 5×5 et recombinaison (0x4013E2–0x4014C7)

Les chiffres d’indice pair vont, en ordre ligne par ligne, dans une matrice `A` (`[ebp-0x1dc]`, initialisée à 0 depuis 0x409190), ceux d’indice impair dans `B` (`[ebp-0x240]`, depuis 0x4091f4). Puis :

```asm
401465: mov ecx, A[r][c] / add ecx,ecx / lea ecx,[ecx+ecx*4]   ; A*10
401477: add ecx, B[r][c]                                       ; + B
401484: mov A[r][c], ecx
4014ad: out[k] = (byte) A[k]   pour k < len(d)/2
```

Autrement dit `out[k] = chr(10·d[2k] + d[2k+1])` : **le serial est lu par paires de chiffres décimaux**, chaque paire donnant un code ASCII 0..99.

### 4. Comparaison

`0x40271c(name, out)` = 0 attendu. Le test live `petik` / `8069847375` passe → comparaison **insensible à la casse**. D’où le keygen : `serial = ''.join('%02d' % ord(c.upper()) for c in name)`. Les minuscules (codes ≥ 97… et surtout ≥ 100 pour `d`–`z`) ne sont pas produisibles directement, mais leurs majuscules le sont.

Curiosité : comme une lettre du serial est elle-même dépliée en ses deux chiffres, **`serial = NOM en majuscules`** marche aussi (`PETIK` → `80 69 84 73 75` → `PETIK`).

## Vérification (Wine)

`analysis/wine-driver.c` (mingw) : `SetDlgItemTextA(101/102)`, `BN_CLICKED` sur le bouton 1, lecture de la MessageBox du process.

```
name='petik'    serial='8069847375'        -> 'Congrats!!! Send solution to crackmes.de'
name='PETIK'    serial='PETIK'             -> 'Congrats!!! ...'
name='crackmes' serial='6782656775776983'  -> 'Congrats!!! ...'
name='TheHyper' serial='8472697289806982'  -> 'Congrats!!! ...'
name='PETIK'    serial='8069847376'        -> pas de MessageBox (KO silencieux)
name='PEPEK'    serial='8069806975'        -> 'Invalid name'
name='pet'      serial='806984'            -> 'Name should contain atleast five letters'
```

## Notes

- Les matrices 5×5 et leurs tables d’init (toutes à zéro) ne servent qu’à brouiller : seule la moitié « utile » de `A` est lue.
- Un mauvais serial ne produit **aucun** message.
- Pas de patch (consigne de l’auteur) : solution 100 % keygen.
