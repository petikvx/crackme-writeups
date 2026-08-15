# timotei-crackme-05

Crackme **PE32 console**, MASM32, keyfile.
Auteur : timotei (crackmes.one). Analyse statique (Linux + IDA) ; l’exec se fait avec Wine ou une VM.

Dossier : `timotei-family/timotei-crackme-05/` — [série](../README.md) · [repo](../../README.md).

| Fichier | Rôle |
|---|---|
| `timotei-crackme-05.exe` | binaire d’origine |
| [`timotei-crackme-05.md`](timotei-crackme-05.md) | ce write-up |
| [`timotei-crackme-05-solve.py`](timotei-crackme-05-solve.py) | fabrique le keyfile + tente Wine (section 6) |
| [`timotei-crackme-05-idapro.asm`](timotei-crackme-05-idapro.asm) | listing IDA (section 8) |
| [`timotei-crackme-05-idapro.c`](timotei-crackme-05-idapro.c) | Hex-Rays 9.4 (section 8) |
| [`timotei-crackme-05.c`](timotei-crackme-05.c) | prédicat C à la main (section 8) |
| [`timotei-crackme-05-fasm.asm`](timotei-crackme-05-fasm.asm) | reconstruction FASM PE (section 9) |

Réponse acceptée (famille, pas un secret unique) :

| Input | Valeur | Rôle |
|---|---|---|
| fichier `timotei.crackme#5.enjoy!` | **22 octets**, `fichier[21] == sum(fichier[0..20]) & 0xFF` | keyfile, chemin relatif |
| exemple | `crackme#5 keyfile OK!` + `0x12` | payload 21 o + checksum |

Pas de prompt, pas d’`argv`. Si le fichier manque / mauvaise taille / mauvais checksum : silence, `ExitProcess(0)`.

---

## 1. Premier regard

```
file timotei-crackme-05.exe
# PE32 executable (console) Intel 80386, for MS Windows, 3 sections

diec → Linker Microsoft 5.12, Compiler MASM 6.14, tool masm32
```

2,5 Ko. Trois sections : `.text` / `.rdata` (IAT) / `.data`.

Imports :

| DLL | Fonctions | Pour quoi |
|---|---|---|
| `kernel32.dll` | `CreateFileA`, `ReadFile`, `CloseHandle`, `WriteFile`, `GetStdHandle`, `FlushConsoleInputBuffer`, `Sleep`, `ExitProcess` | I/O fichier + console |
| `msvcrt.dll` | `_kbhit`, `_getch` | « Press any key » |

Chaînes :

| VA | Texte |
|---|---|
| `0x403000` | `timotei.crackme#5.enjoy!` — nom du keyfile |
| `0x403071` | `.:keyfile:.accepted:.` |
| `0x40308C` | `Press any key to continue ...` |

Hashes : MD5 `c20a5740116f3794f3f1dcc5d96b0dc9`, SHA256 `99a18b1ac4b05ed75646fffa5c36628f251471f750db8d88f238136b43860824`.

Sous Linux, `./timotei-crackme-05.exe` ne s’exécute pas (format PE). L’analyse (IDA, `objdump -b pei-i386 -d`) suffit pour le check. Lancer : section 10 (Wine ou VirtualBox).

---

## 2. Flow global

```
start
    h = CreateFileA("timotei.crackme#5.enjoy!",
                    GENERIC_READ, 0, NULL,
                    OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL)
    si h == INVALID_HANDLE_VALUE : exit
    ReadFile(h, buffer, 0x50, &nread, NULL)     ; max 80 octets
    si échec : exit
    (byte)nread -= 0x16
    si != 0 : exit                              ; il faut EXACTEMENT 22 octets
    sum = 0
    pour i = 0 .. 20 :
        sum += buffer[i]                        ; 8 bits (dl)
    si sum != buffer[21] : exit
    buffer[6] = 'i'                             ; dead store, jamais relu
    WriteFile(stdout, ".:keyfile:.accepted:.\r\n")
    WriteFile(stdout, "Press any key to continue ...")
    attendre _kbhit / _getch
    WriteFile(stdout, "\r\n")
    CloseHandle(h)
    ExitProcess(0)
```

Convention Win32 (stdcall, args empilés à l’envers) :

| Constante | Valeur | Sens |
|---|---|---|
| `0x80000000` | `GENERIC_READ` | lecture seule |
| `3` | `OPEN_EXISTING` | le fichier doit déjà être là |
| `0x80` | `FILE_ATTRIBUTE_NORMAL` | |
| `-1` | `INVALID_HANDLE_VALUE` | CreateFile a échoué |
| `-11` (`0xFFFFFFF5`) | `STD_OUTPUT_HANDLE` | GetStdHandle |
| `-10` (`0xFFFFFFF6`) | `STD_INPUT_HANDLE` | flush + getch |

---

## 3. Après le `− 16h` (le check)

`objdump` (plus précis que le listing IDA sur la taille) :

```
401044  sub  BYTE PTR [NumberOfBytesRead], 16h
40104b  jne  fail
```

C’est un **`sub` octet**, pas dword. Hex-Rays a raison de parler de `LOBYTE`. Comme `ReadFile` est plafonné à `0x50`, la seule valeur dont le low byte vaut `0x16` est **22**.

Puis la boucle `loc_401056` :

```
eax = buffer          ; 0x403019
edx = 0
ecx = 0
tant que ecx != 15h:          ; 21
    dl += [eax]
    eax++
    ecx++
cmp  dl, [eax]                ; buffer[21]
jne  fail
mov  byte [eax-0Fh], 69h      ; buffer[6] = 'i'
jnz  fail                     ; flags encore ceux du cmp (déjà égal)
```

```
len(fichier) == 22
fichier[21] == (fichier[0] + … + fichier[20]) & 0xFF
```

N’importe quels 21 octets + ce checksum. Pas de mot de passe caché.

Le `mov [eax-0Fh], 69h` écrit `'i'` dans le buffer **en RAM**, jamais relu. Le `jnz` qui suit ne touche pas aux flags (`mov` imm8 → mem). Dead. Hex-Rays garde le write, jette le `jnz`.

`sub_401120` (appelé seulement pour imprimer) est un `strlen` dword-wise (`0x01010101` / `0x80808080`). Pas dans le check.

---

## 4. Exemple de keyfile

Payload 21 octets : `crackme#5 keyfile OK!`

```
sum = 0x12
fichier = 63 72 61 63 6b 6d 65 23 35 20 6b 65 79 66 69 6c 65 20 4f 4b 21 12
```

À créer **dans le même dossier** que le `.exe` (chemin relatif, pas d’argv) :

```bash
python3 timotei-crackme-05-solve.py
# écrit timotei.crackme#5.enjoy!  (22 octets)
```

`21 * 'A' + 0x00` échoue : checksum de 21 `'A'` = `0x55`, pas `0`.

---

## 5. Vérification

Sans le fichier / mauvaise taille / mauvais checksum : rien, exit 0.

Avec le keyfile à côté du `.exe`, sous Wine ou Windows :

```
.:keyfile:.accepted:.
Press any key to continue ...
```

Le solveur Python valide le prédicat tout seul (pas besoin de Wine pour *savoir* que le fichier est bon). Wine / la VM ne servent qu’à voir le message.

---

## 6. Solveur Python

Fichier : [`timotei-crackme-05-solve.py`](timotei-crackme-05-solve.py).

**Pas un lanceur magique.** Sous Linux il ne « cracke » pas en exécutant le PE : il reconstitue le check, écrit le keyfile, et *si* `wine` est installé il tente un `wine timotei-crackme-05.exe` dans ce dossier.

```bash
python3 timotei-crackme-05-solve.py
```

| Fonction | Rôle |
|---|---|
| `checksum(payload)` | `sum` 8 bits, 21 octets (`add dl, [eax]`) |
| `make_keyfile(payload)` | payload + 1 octet checksum |
| `key_ok(data)` | `len==22` et checksum |
| `write_keyfile()` | crée `timotei.crackme#5.enjoy!` ici |
| `run_wine()` | `wine` dans le cwd du keyfile, ou le mode d’emploi |

---

## 7. Récap des adresses

| VA | Quoi |
|---|---|
| `0x401000` | `start` — CreateFileA |
| `0x401044` | `sub byte [nread], 16h` |
| `0x401056` | boucle somme |
| `0x401061` | `cmp dl, [eax]` — checksum |
| `0x401065` | `mov [eax-0Fh], 69h` — dead store |
| `0x40106B` | prints succès |
| `0x401098` | fail / CloseHandle / ExitProcess |
| `0x4010AC` | `puts` (strlen + WriteFile stdout) |
| `0x4010F0` | wait key |
| `0x401120` | strlen dword |
| `0x403000` | nom du keyfile |
| `0x403019` | buffer 80 o |
| `0x40306D` | `NumberOfBytesRead` (le `sub` ne touche que l’octet bas) |

---

## 8. Dumps IDA Pro (asm + Hex-Rays)

| Fichier | Origine |
|---|---|
| [`timotei-crackme-05-idapro.asm`](timotei-crackme-05-idapro.asm) | listing IDA |
| [`timotei-crackme-05-idapro.c`](timotei-crackme-05-idapro.c) | Hex-Rays 9.4 |
| [`timotei-crackme-05.c`](timotei-crackme-05.c) | C à la main, juste le prédicat |

Hashes IDA = `diec` : MD5 `C20A5740116F3794F3F1DCC5D96B0DC9`, SHA256 `99A18B1A…0824`.

### Ce que Hex-Rays a bien reconstruit

```c
CreateFileA(FileName, 0x80000000, 0, nullptr, 3u, 0x80u, nullptr);
ReadFile(..., 0x50u, ...);
LOBYTE(NumberOfBytesRead) = NumberOfBytesRead - 22;
if ((_BYTE)NumberOfBytesRead == 0) {
    for (i = 0; i != 21; ++i) v2 += *v1++;
    if (v2 == *v1) {
        *(v1 - 15) = 105;
        // prints
    }
}
```

`FileName`, `OPEN_EXISTING`, taille 22, somme des 21, `v1-15 = 'i'` : tout y est.

### Pièges

1. **« Compiler : Visual C++ »** — faux. DIE : **MASM32 6.14** + link 5.12. Hex-Rays voit une IAT Win32 et devine MSVC.

2. **`sub NumberOfBytesRead, 16h` dans le .asm** — le label est un `db` (4 octets de zéros). L’encodage réel est `80 2D … 16` = **`sub byte`**. Hex-Rays `LOBYTE` est le bon. Un `sub dword` changerait les 3 octets hauts (ici à 0, même effet).

3. **Le `jnz` après `mov [eax-0Fh], 69h`** a disparu du C (flags inchangés, déjà ZF=1). Correct.

4. **`sub_401120` / `16843009`**. `16843009 = 0x01010101` : strlen, pas un 2ᵉ hash. Ignorable pour le keyfile.

5. **`char aKeyfileAccepte[22]`** avec le `0` final dans la taille — le `write` utilise strlen, donc 21 caractères affichés.

### C à la main

```c
if ((n & 0xFF) != 0x16) return 0;
sum = 0;
for (i = 0; i < 21; i++) sum += buf[i];
return sum == buf[21];
```

---

## 9. Source reconstruit (FASM)

Pas le `.asm` auteur. DIE pointe vers **MASM32**. On fournit une reconstruction **FASM** `format PE console` (un fichier → un `.exe`, pas de `link.exe`).

| Fichier | Assembleur | Binaire | Résultat |
|---|---|---|---|
| [`timotei-crackme-05-fasm.asm`](timotei-crackme-05-fasm.asm) | FASM 1.73.32 | `timotei-crackme-05-fasm.bin` (2048 o) | même prédicat, autre IAT / layout |

```bash
fasm.x64 timotei-crackme-05-fasm.asm timotei-crackme-05-fasm.bin
# puis, keyfile déjà écrit par le solveur :
wine timotei-crackme-05-fasm.bin
```

`puts` est un `strlen` naïf, pas le truc `0x01010101`. Le `mov [buf+6], 'i'` mort n’est pas reproduit (aucun effet).

---

## 10. Lancer le `.exe` depuis Linux

Le check est déjà prouvé en Python. Cette section sert **uniquement** à voir `.:keyfile:.accepted:.` s’afficher.

Deux options : **Wine** (léger, dans le terminal) ou **VirtualBox** (vrai Windows, que tu as déjà).

Dans les deux cas le keyfile doit être **dans le répertoire courant au moment du lancement**. `CreateFileA("timotei.crackme#5.enjoy!")` n’a pas de chemin : c’est le cwd, pas le dossier du `.exe` si tu lances avec un chemin absolu depuis ailleurs.

```bash
cd timotei-family/timotei-crackme-05
python3 timotei-crackme-05-solve.py    # écrit le keyfile ici
ls -l timotei.crackme#5.enjoy!         # 22 octets
```

### 10.1 Wine — c’est quoi

Wine n’est **pas** une machine virtuelle. C’est une couche qui implémente les API Windows (`CreateFileA`, `WriteFile`, …) au-dessus de Linux. Pour un PE32 console qui ne parle qu’à `kernel32` / `msvcrt`, ça suffit en général. Pas besoin d’installer Windows.

Premier lancement : Wine crée un « préfixe » `~/.wine` (faux `C:\`). Ça peut prendre une minute, une fenêtre `winecfg` peut s’ouvrir — on peut la fermer.

### 10.2 Installer Wine (Debian / Ubuntu)

Le binaire est **32 bits**. Sans `wine32`, tu auras souvent `Bad EXE format` / `version 'Windows-x86'`.

```bash
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install wine32 wine64
wine --version
```

Si `apt` râle sur `wine32` : le paquet s’appelle parfois `wine` tout court, ou `wine32:i386`. `winecfg` une fois pour initialiser le préfixe.

### 10.3 Lancer

```bash
cd /chemin/vers/timotei-family/timotei-crackme-05
wine timotei-crackme-05.exe
```

Attendu :

```
.:keyfile:.accepted:.
Press any key to continue ...
```

Une touche, puis retour au shell.

Si le « Press any key » avale mal le clavier :

```bash
wineconsole --backend=curses timotei-crackme-05.exe
```

Le solveur, si `wine` est dans le PATH, fait déjà ce lancement (il envoie un `\n` pour passer le getch ; parfois Wine attend quand même → timeout, le message est souvent déjà dans stdout).

### 10.4 Pannes fréquentes Wine

| Symptôme | Cause | Quoi faire |
|---|---|---|
| `cannot execute binary file` / `Exec format error` | tu as lancé `./timotei-crackme-05.exe` **sans** wine | préfixer `wine` |
| `Bad EXE format` / missing `wine32` | PE32 sans couche 32 bits | `apt install wine32` + i386 |
| silence, pas de `accepted` | cwd sans keyfile, ou keyfile mauvais | `cd` dans ce dossier, relancer le solveur, `ls -l` → 22 o |
| `CreateFile` échoue | tu es dans un autre répertoire | `wine /abs/path/timotei-crackme-05.exe` cherche le keyfile dans **ton cwd**, pas à côté du `.exe` |
| fenêtre qui clignote | GUI prefix | rester en terminal ; `wineconsole` si besoin |

Vérifier le cwd que Wine voit :

```bash
wine cmd /c cd
wine cmd /c dir
```

Tu dois y voir `timotei-crackme-05.exe` **et** `timotei.crackme#5.enjoy!`.

### 10.5 VirtualBox (si tu préfères un vrai Windows)

Wine n’est pas obligatoire. Une VM Windows que tu as déjà marche pareil.

1. **Guest Additions** installées (dossier partagé plus simple).
2. Dossier partagé : pointe vers `…/timotei-family/timotei-crackme-05` (ou copie les deux fichiers dans la VM).
3. Dans la VM : `python3 timotei-crackme-05-solve.py` si Python est là, **ou** copie le keyfile déjà généré sous Linux (22 octets).
4. `cmd.exe` :

```
cd /d Z:\timotei-crackme-05
dir
timotei-crackme-05.exe
```

(`Z:` = lettre typique du share ; à adapter.)

Même règle : `dir` doit lister le `.exe` **et** `timotei.crackme#5.enjoy!` dans **ce** répertoire.

L’AV Windows peut gueuler sur un crackme (faux positif fréquent). Exclure le dossier, ne pas le « nettoyer ».

Pour les GUI plus tard (#09–#12) : même schéma, Wine ou la VM ; l’analyse reste sous Linux dans IDA.

---

## 11. Data — layout `.data`

VA `0x403000`.

| Label | VA | Contenu |
|---|---|---|
| `FileName` | `0x403000` | `timotei.crackme#5.enjoy!\0` |
| `buffer` | `0x403019` | 80 zéros (ReadFile) |
| `hFile` | `0x403069` | HANDLE |
| `NumberOfBytesRead` | `0x40306D` | DWORD ; seul l’octet bas est soustrait |
| `aKeyfileAccepte` | `0x403071` | `.:keyfile:.accepted:.\0` |
| `asc_403087` | `0x403087` | `\r\n\0` |
| `aPressAnyKeyToC` | `0x40308C` | `Press any key to continue ...\0` |
| `asc_4030AA` | `0x4030AA` | `\r\n\0` |
