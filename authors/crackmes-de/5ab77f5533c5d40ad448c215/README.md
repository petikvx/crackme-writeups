# assassination by bswap (crackmes.de)

« Assassination » de Bswap (nouvel an 2004). Goal : *make a key generator and tell the name of the packer (PEiD or
stud_PE won’t help you)*. Niveau annoncé 2/10. Les sources sont fournies dans un zip chiffré dont le mot de passe est
le serial du nom `Assassination`.

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c215> · [`ORIGIN.yml`](ORIGIN.yml)
- **Auteur** : crackmes.de (mirror) / bswap
- **Plateforme** : Windows **PE32** GUI (MASM, packé) — difficulté 2.0
- **Archive** : `original/assassination.zip` → `Assassination.exe`, `Info.txt`, `Assassination_SOURCE.zip`
- **SHA-256 zip** : `4543dac354261d27ddfc7c51ff0b6883151fae47bf3201e346b649a2ae657b0e`
- **Statut** : résolu (keygen), vérifié **sous wine/Xvfb** sur le binaire original (« -- REGISTERED! -- »), et le serial
  de `Assassination` ouvre bien `Assassination_SOURCE.zip`

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Assassination.exe` | binaire d’origine (non patché, packé) |
| `original/Assassination_SOURCE.zip` | source ASM de l’auteur (mot de passe = serial de `Assassination`) |
| `tools/unpack-unicorn.py` | dépack par émulation Unicorn (même méthode que [keygenme_0.51](../5ab77f5533c5d40ad448c211/)) |
| `analysis/Assassination-unfsg.bin` | image mémoire dépackée (base `0x400000`, OEP `0x401000`) |
| `tools/assassination-solve.py` | keygen + `--check` (émule le **vrai** code de vérif de l’image dépackée) |
| `tools/dlgdrive.c` | petit outil Win32 (mingw) : remplit Name/Serial, coche la case « Check! », relit le résultat |
| `tools/verify-wine.sh` | preuve live : wine + Xvfb + `dlgdrive.exe` |
| `analysis/registered-petik.png` / `analysis/ko-petik-tixmp.png` | captures OK / KO |

## Réponse

| Name | Serial |
|---|---|
| `petik` | **`tixmo`** |
| `Assassination` | **`Ewwewwmrexmsr`** (= mot de passe du zip des sources) |

Keygen : `s' = le32(dword(name[0:4]) + 4) || name[4:]`, puis `serial[0] = s'[0]` et `serial[i] = s'[i] + 4` pour i ≥ 1
(même longueur que le nom, 4 à 20 caractères).

```
$ python3 tools/assassination-solve.py petik
Name   = petik
Serial = tixmo
emu    : REGISTERED
$ tools/verify-wine.sh petik tixmo
name initial (GetUserName) : box
champ name   : petik
champ serial : -- REGISTERED! --
$ 7z t -pEwwewwmrexmsr original/Assassination_SOURCE.zip   → Everything is Ok
```

Le source de l’auteur le résume d’ailleurs : « the serial has to be 4 digest higher than the serial ».

**Le packer** : stub à deux sections (la 1re vide, `SizeOfRawData = 0`), import limité à `LoadLibraryA` /
`GetProcAddress`, EP `jmp` en fin de section 2 : même famille que les FSG des autres bswap. `diec` ne l’identifie
pas (« Unknown ») et ni l’Info.txt ni le source ne donnent le nom ; on ne l’affirme donc pas ici.

## Premier regard

```
$ file original/Assassination.exe   → PE32 executable (GUI) Intel 80386, 2 sections
$ diec original/Assassination.exe   → PE32, Unknown
EP 0x417c2c : jmp 0x417b1e ; IAT du stub : LoadLibraryA (0x417c0b), GetProcAddress (0x417c0f)
```

## Comment on trouve

1. **Dépack** : `tools/unpack-unicorn.py` émule le stub depuis l’EP, simule `LoadLibraryA` / `GetProcAddress`
   (adresses factices `0x7f00xxxx`, noms journalisés : `GetUserNameA`, `CreateThread`, `SendDlgItemMessageA`…) et
   s’arrête au premier saut en section 1 : **OEP `0x401000`**.

2. **Interface** (`WM_INITDIALOG`, `0x401036`) : Name = `0xc8` pré-rempli par `GetUserNameA`, Serial = `0xc9`,
   `EM_LIMITTEXT` 20. Pas de bouton : un **thread** (`CreateThread` → `0x4012d1`) tourne en boucle sur
   `BM_GETCHECK` de la case `0x12c` (« Check! »), et vérifie dès qu’elle est cochée (longueurs ≥ 3).

3. **Vérification** (`0x4013b2`) :

   ```asm
   4013ce WM_GETTEXT Name   → 0x4030a0 (len → [0x403018])
   4013e7 WM_GETTEXT Serial → 0x4030bf
   40140d repe cmpsw (3 mots) serial vs "Bswap\0"  → message « Please continue / the good work! » (clin d’œil)
   40143f for i = len(name)-1 .. 1 : serial[i] -= 4          ; serial[0] intact
   40146a H(name[0:4], name[4:8], name[8:12])   → 0x4030a0   ; 0x401513, 30 tours déroulés
   401483 H'(ser[0:4], ser[4:8], ser[8:12])    → 0x4030bf   ; 0x401a86, loop 0x1e
   401498 for i = len(name) .. 1 : name[i] == serial[i] sinon « You cached the BONE :-( »
   4014b2 len(name) > 3 → SetText(Serial, "-- REGISTERED! --")
   ```

4. **Les deux hashs sont le même** : un tour = `eax=2·edx ^ ebx ^ a0 ; ecx=… ; ebx=(eax & 0xffffff)·ecx + a0 ;
   ebx ^= -eax ; …`, répété 30 fois. `H'` est écrit en boucle et masque avec `bswap / and 0xffffff00 / bswap`
   (= `and 0x00ffffff`), mais surtout il remplace partout le 1er argument par **`ser[0:4] − 4`**. Donc
   `H'(s) = H(s)` dès que `dword(s[0:4]) − 4 = dword(name[0:4])` et `s[4:12] = name[4:12]` ; au-delà de 12 octets les
   buffers sont comparés bruts, donc `s[12:] = name[12:]`. Avec le `−4` octet par octet de l’étape 3, on obtient le
   keygen ci-dessus.

5. **Contrôle** : plutôt que de faire confiance à cette équivalence, `--check` émule `0x4013fb..0x4014cf` (les deux
   hashs et les comparaisons réelles) sur l’image dépackée ; `petik` / `tixmo` → REGISTERED, `petik` / `tixmp` → BONE.

## Vérification live (wine)

`tools/dlgdrive.c` met nom et serial (`WM_SETTEXT`), coche `0x12c` par `BM_SETCHECK` (le thread du crackme fait le
reste) et relit le champ Serial. Binaire original packé, non modifié. `petik` / `tixmo` → « -- REGISTERED! -- »,
`petik` / `tixmp` → « You cached the BONE :-( ».
