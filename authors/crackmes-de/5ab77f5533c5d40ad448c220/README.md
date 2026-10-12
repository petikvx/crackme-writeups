# shortcut by kkr_we_rule

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c220`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c220) · [ORIGIN](ORIGIN.yml) |
| **Auteur** | KKR / RED CReW (réimport crackmes.de, local `crackmes-de`) |
| **Publié** | 2018-03-25 (keygenme de mai 2010) |
| **Plateforme** | Windows PE32 GUI, Borland Delphi 7, composants LockBox (`TLbSHA1`) |
| **Difficulté** | 2.0 |
| **SHA-256 exe** | `c9c8cc488427c68cfaf0055c46f311178b2da982e56351e788cedfc9ce6997de` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/ShortCut.zip`, `original/ShortCut/SHoRT_CuT.exe`, `original/ShortCut/READ ME!.txt` | archive + binaire d'origine + consignes |
| `analysis/disasm.txt` | `objdump -d -M intel` (pas de packer) |
| `tools/shortcut-keygen.py` | keygen + `--check` |
| `tools/drive.c`, `tools/verify-wine.sh` | preuve live sous wine/Xvfb |
| `analysis/wine-run.txt` | sortie de la preuve live |

## Réponse

```
Nom    : petik
Serial : 5LZOX3PT535P6-7XWP36HM6P7PQ
```

```bash
python3 tools/shortcut-keygen.py petik                    # serial : 5LZOX3PT535P6-7XWP36HM6P7PQ
python3 tools/shortcut-keygen.py petik --check 5LZOX3PT535P6-7XWP36HM6P7PQ
tools/verify-wine.sh petik 5LZOX3PT535P6-7XWP36HM6P7PQ    # boîte Information « The Key Is Valid! »
```

## Premier regard

```
SHoRT_CuT.exe: PE32 executable (GUI) Intel 80386
diec : Borland Delphi 7 (Enterprise), Turbo Linker 2.25, pas de packer
```

La fiche `TForm1` (ressource DFM `TPF0`) contient deux `TEdit` (`Edit1` = nom, `Edit2` = serial, chacun dans un
`TGroupBox`), un composant `TLbSHA1` et un `TLabel` `Label2` « Validate! » qui sert de bouton : `OnClick =
Label2Click`, et `Label2MouseDown` / `Label2MouseUp` ne font que changer sa couleur. La table des méthodes
publiées donne les adresses : `Label2Click = 0x4564D8`, `Label2MouseDown = 0x4564BC`, `Label2MouseUp = 0x4564A0`.

## `Label2Click` (`0x4564D8`)

```text
nom    = Edit1.Text            ; vide -> rien
serial = Edit2.Text
p      = Pos('-', serial)      ; 0x456318, 0 -> rien
A      = serial[1 .. p-1]      ; 0x456388 (Copy)
B      = serial[p+1 .. fin]
nh     = concat(IntToHex(Ord(c), 0) pour c dans nom)          ; 0x456414
A'     = Base32Decode(A)  ; B' = Base32Decode(B)              ; 0x455D90, alphabet ABCDEFGHIJKLMNOPQRSTUVWXYZ234567
md5    = MD5(nom) en hexa majuscule                           ; 0x455088 (LockBox)
sha    = SHA1(nom) en hexa majuscule                          ; 0x4556AC + 0x455128
si F(A', nh) == H(sha) et F(B', nh) == H(md5) :
    MessageDlg('The Key Is Valid!', mtInformation, [mbOK])    ; resourcestring 0x45605C
```

### `H` (`0x456220`) : chaîne vers entier, puis `IntToHex(v, 0)`

Toute l'arithmétique est sur 32 bits. `0x456064` est une fonction `Power` en Int64 (multiplications répétées, 1 si
l'exposant vaut 0), dont seul le dword bas est gardé.

```python
ebx = edi = s14 = s18 = s1c = 0
for idx in range(len(s), 0, -1):          # on part de la fin
    ebx += s[idx-1]
    for i in range(1, idx):
        edi = pow(ebx, i) + ebx
        s14 += edi + ebx
    s18 += pow(s14, idx) ^ s14
    s1c ^= edi + ebx + s14 + s18
    ebx = s1c
return "%X" % s1c
```

Pour `petik` : `H(SHA1) = 190685AD` et `H(MD5) = F7FC78EC`.

### `F` (`0x4560FC`) : chiffrement octet par octet avec une clé tirée de `nh`

```python
eax = ecx = 0
for esi, c in enumerate(nh, 1):
    eax = ((eax + c) >> 5) + 0x32
    ecx = (esi ^ eax) << 3        # le code écrit « shl ecx, 0x43 », le CPU masque le compteur à 3
    eax = (ecx % esi) << 3        # idiv signé
k = ecx                           # petik : nh = 706574696B, k = 0x1F8
out = [ ((c ^ (k>>7) ^ (k<<3)) - k) & 0xFF  for c in A' ]
```

Dans le code, `eax = c ^ k ; ecx = k ^ eax` redonne `c`, et les deux `xor` avec `2k` s'annulent : il ne reste
que `(c ^ (k>>7) ^ (k<<3)) - k`, tronqué à l'octet par `LStrFromChar`.

## Keygen

`F` s'inverse octet par octet : `c = ((t + k) & 0xFF) ^ (((k>>7) ^ (k<<3)) & 0xFF)`. On calcule les cibles
`H(sha)` et `H(md5)`, on les déchiffre avec `k`, puis on encode chaque moitié en base32 sans `=`
(n octets donnent `ceil(8n/5)` caractères, et le décodeur rend bien `floor(5·len/8) = n` octets) :

```
serial = Base32(F⁻¹(H(SHA1hex(nom)))) + "-" + Base32(F⁻¹(H(MD5hex(nom))))
```

## Vérification live

`tools/verify-wine.sh` lance l'exe original sous wine + Xvfb. `tools/drive.c` remplit les deux `TEdit` par
`WM_SETTEXT` (le nom est celui du haut), puis poste `WM_LBUTTONDOWN` / `WM_LBUTTONUP` sur la fiche aux
coordonnées du `TLabel` (166 + 14, 104 + 6), car un `TLabel` n'a pas de fenêtre à lui. La boîte
`MessageDlg` de type information (« The Key Is Valid! », le seul `MessageDlg` du handler) n'apparaît qu'avec
le bon serial :

```
$ tools/verify-wine.sh petik 5LZOX3PT535P6-7XWP36HM6P7PQ
  fenetre : Information
    [OK]
$ tools/verify-wine.sh petik 5LZOX3PT535P6-7XWP36HM6P7PA      # dernier caractère changé : aucune boîte
$ tools/verify-wine.sh crackmes.one U2QZPFNBUGQ2G-SSIKNG5DUCKJU
  fenetre : Information
    [OK]
```

Le texte du message est dessiné par un `TLabel` de la boîte, donc `GetWindowText` ne le voit pas ; il a été lu
dans la table `RT_STRING` (identifiant 65294, `The Key Is Valid!`).
