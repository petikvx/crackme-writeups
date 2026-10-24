# crackmes.de's xcrackme by am0k

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c331`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c331) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | am0k (miroir crackmes.de) |
| **Plateforme** | Windows PE32 GUI (x86), packé **FSG 1.0**, 1317 octets |
| **SHA-256 (zip)** | `37ad8e2eb07ec93062efa962c41e930cd125f8081ef485be1d684bcea595e40f` |
| **Type** | keyfile : le crackme lit `xCrackMe.key` dans le répertoire courant |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/xCrackMe.zip` | archive d'origine (mot de passe `crackmes.one`), contient `xCrackMe.exe` |
| `analysis/x/xCrackMe.exe` | exe extrait du zip (non modifié) |
| `analysis/unpacked.bin` | dump mémoire 0x13141000..0x13144000 après dépack FSG |
| `analysis/xCrackMe.key.petik` | fichier de licence valide pour `petik` |
| `tools/unpack-fsg.py` | dépacker FSG (unicorn, imports simulés) |
| `tools/xcrackme-solve.py` | keygen : génère `xCrackMe.key` |

## Réponse

Le crackme n'a pas de champ de saisie : il faut un fichier **`xCrackMe.key`** (164 octets) à côté de l'exe.

```bash
python3 tools/xcrackme-solve.py --name petik -o <dossier de l'exe> --check
```

| Nom | n = hash(nom) | Serial (127 symboles `0-9A-F`) |
|---|---|---|
| `petik` | 22 | `9F9DEB23E5D95FCECC0B03612268294D3306053FB7F46DA15DF186B142723B4895EE90651AF88BB6AFDCDC24D4E9EE33C0FA53A0076D1F9D726B093DC7334EA` |

Structure du fichier (tout est XOR-chiffré avec la clé 0x3f sauf le dword) :

| Offset | Contenu |
|---|---|
| `0x00..0x1f` | nom (chiffré, terminé par un octet nul brut) |
| `0x20..0x23` | dword LE = `n` = hash(nom), **en clair** |
| `0x24..0xa3` | serial 127 symboles (chiffré) + padding nul |

## Premier regard

```text
$ file xCrackMe.exe   -> PE32 executable (GUI) Intel i386, 2 sections
$ strings             -> "FSG!" dans l'en-tête, "Bad jo", "xCra ckMe v1.o0!", "KERN0L32.8dl" (chaînes hachées)
```

L'en-tête DOS/PE est écrasé (signature `FSG!` à l'offset 0x14, EP = 0x154, `SizeOfCode = 0`) : c'est du **FSG 1.0** (décompresseur aPLib). Le désassemblage direct est du bruit.

## Comment on trouve

### 1. Dépacker FSG (unicorn)

Le stub (VA `0x13140154`) fait `xchg [0x131432e8], esp ; popa` puis décompresse (bit-reader `call [ebx]`, copies `rep movs`) vers `0x13141000`. Fin de décompression à `0x131401c1` : boucle d'imports, `call [ebx+0x10]` = `LoadLibraryA`, `call [ebx+0x14]` = `GetProcAddress`, et `jmp [ebx+0xc]` (`0x131401d1`) = saut vers l'OEP.

`tools/unpack-fsg.py` émule le stub avec unicorn, court-circuite les deux appels d'import (en les journalisant) et s'arrête sur le `jmp [ebx+0xc]` :

```text
$ python3 tools/unpack-fsg.py analysis/x/xCrackMe.exe analysis/unpacked.bin
OEP = 0x131411a0
imports : kernel32 lstrcpyA lstrcmpA · user32 MessageBoxA · msvcrt fopen fclose fread
```

Les imports (`fopen`/`fread`, `lstrcmpA`) disent déjà « keyfile ». Désassemblage : `objdump -D -b binary -m i386 -M intel --adjust-vma=0x13141000 analysis/unpacked.bin`.

### 2. Flow de l'OEP `0x131411a0`

```text
decrypt(0x13141024, 0x31)        ; alphabet  -> "0123456789ABCDEF"
decrypt(0x13141038, 0x3f)        ; nom du fichier -> "xCrackMe.key"
f = fopen("xCrackMe.key", "r")   ; mode TEXTE
fread(B2, 0xa4, 1, f)
decrypt(B2, 0x3f)                ; nom
decrypt(B2+0x24, 0x3f)           ; serial
lstrcpyA(B1, B2)                 ; B1 = nom
n = hash(B1)                     ; 0x131410c0
gen(B1, n, B1+0x24)              ; 0x13141110 : serial attendu (127 symboles)
if lstrcmpA(B1+0x24, B2+0x24)==0 && *(u32*)(B1+0x20) == *(u32*)(B2+0x20): "Good job!"
```

### 3. Routine de déchiffrement `0x13141080(buf, key)`

Pour chaque octet `i` jusqu'au premier octet **brut** nul :
`buf[i] ^= ((key*(i+1) - i) mod 32)` (reste C signé, `and 0x8000001f` + fix-up). Le XOR est symétrique, donc le même code chiffre. Appliqué à `"!0#2%4'6)8PCRETG"` (clé 0x31) → `0123456789ABCDEF` ; à `"g^ixt~^t!fnp"` (clé 0x3f) → `xCrackMe.key`.

### 4. Hash du nom `0x131410c0`

```asm
mov edx,6 ; eax=0
L: edi = edx mod 32 ; edi ^= (char)c ; eax += edi ; edx += 5   ; par caractère
eax = (eax mod 32) + 1                                        ; 1..32
```
`petik` → n = 22.

### 5. Génération du serial `0x13141110`

Astuce du compilateur : `eax = 1 - edi` puis `eax += edi` à chaque tour donne `i+1` (edi est le pointeur de sortie). Pour `i = 0..126`, `c = nom[k]` (k cyclique) :

```text
t1  = ((i+1)*c - k) mod 255        ; idiv ebp=255 (reste signé)
t2  = (c*n) mod 255
out[i] = ALPHA[(t1 ^ t2) & 0xf]
```
puis `out[127] = 0`. Exemple `petik` (n=22) : i=0, c='p'=112 → t1=112, t2=2464 mod 255=169 ; 112^169=0xD9 → &0xf=9 → `'9'` ; puis `'F'`, `'9'`, … → `9F9DEB23…`.

### 6. Le piège (2e comparaison)

Première version du solveur : serial correct (le trace Wine montrait `lstrcmpA("9F9D…","9F9D…")==0`) mais **« Bad job! »** quand même. Après le `lstrcmpA`, `0x13141279` compare `[esp+0x24]` et `[esp+0xc8]`. Avec la profondeur de pile de ce moment (`esp = E-4`, `E` = base de `B1`), cela vaut `*(u32*)(B1+0x20)` — là où `0x13141255` a stocké **n** — contre `*(u32*)(B2+0x20)`, c.-à-d. les octets bruts `0x20..0x23` du fichier (le déchiffrement du nom s'est arrêté au premier octet nul, ces octets ne sont donc jamais déchiffrés). D'où le dword `n` en clair à l'offset `0x20`.

### 7. Autre piège : `fopen(…, "r")` en mode texte

Le msvcrt en mode texte tronque à `0x1a` (Ctrl-Z) et écrase `0d 0a`. Le solveur refuse un nom dont le fichier contiendrait ces octets (ni `n` ni les XOR ne doivent produire `0x1a` ou CRLF, et aucun octet brut nul dans le nom/serial). Ex. un nom avec `n = 26` est inutilisable.

## Vérification (Wine, exe d'origine)

`xvfb-run -a wine xCrackMe.exe` avec `WINEDEBUG=+relay` (la MessageBox n'a pas de texte accessible via xdotool) :

```text
fichier généré par le solveur (petik)  -> MessageBoxA(..., "Good job!", "xCrackMe v1.0", 0x40)
octet du serial modifié (offset 0x30)  -> "Bad job!" (0x10)
dword n modifié (offset 0x20 : 22→7)   -> "Bad job!"
fichier absent                         -> "Bad job!"
```

Aucune session GDB / x64dbg n'a été utilisée (statique + émulation unicorn + trace Wine).

## Notes

- Le nom doit faire 1..27 caractères (le dword `n` est à l'offset 0x20 ; au-delà il écraserait/serait écrasé).
- Le « serial » dépend uniquement du nom ; le fichier n'a pas de checksum.
- Le zip contient directement l'exe (pas de dossier `source/`).
