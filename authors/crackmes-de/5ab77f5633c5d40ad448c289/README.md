# keygenme_1 by cobrasniper555

- Origine : [ORIGIN.yml](ORIGIN.yml) · [crackmes.one `…c289`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c289)
- Auteur : cobrasniper555 (mirror crackmes.de) · Plateforme : Windows PE32, C++ MinGW (Dev-C++ 4.9.9.2), GUI Win32 — **pas de packer**
- Difficulté annoncée : 1.0 (readme : « first keygenme », règles : *no patching*, *find your serial and the algorithm*, *make a keygen*)

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Keygenme.zip` | archive crackmes.one (mot de passe `crackmes.one`) |
| `original/Keygenme.exe` | binaire d’origine (23 927 octets) |
| `original/Readme.txt` | règles de l’auteur |
| `original/Source.zip` | sources C++ chiffrées (AES) — mot de passe **donné par le crackme une fois résolu** : `43` |
| `original/source/main.cpp` | source extraite de `Source.zip` (après résolution) |
| `original/source/createSerial.inc` | fonction `createSerial` extraite de `main.cpp` (pour la vérif croisée) |
| `analysis/createSerial.txt` | désassemblage `createSerial(char*, char*)` (0x401290..0x4013ab) |
| `analysis/WindowProcedure-WM_COMMAND.txt` | désassemblage du handler du bouton *Activate* |
| `tools/keygenme1-cobra-solve.py` | keygen (`NOM…`, `--check NOM SERIAL`) |
| `tools/ref-createSerial.c` | compile la `createSerial` de l’auteur (mingw `-static`) pour comparer avec le keygen Python |
| `tools/verify-live.c` | driver Win32 : remplit les Edit 100/101, envoie `WM_COMMAND 102`, lit la MessageBox |

## Réponse

**Keygen** — serial = `<1re lettre du nom>-<A en hex>-<B en hex>` :

| Nom | Serial |
|---|---|
| `petik` | **`p-8729D38D-6C55AB7C`** |
| `crackmes` | `c-870ACACD-D64BF4AA` |
| `cobrasniper555` | `c-86DC65E5-4A802A5A` |

```
$ python3 tools/keygenme1-cobra-solve.py petik
petik -> p-8729D38D-6C55AB7C
$ python3 tools/keygenme1-cobra-solve.py --check petik p-8729D38D-6C55AB7C
OK
```

Le nom doit faire 5 à 30 caractères ; il est **mis en minuscules** par le contrôle Edit (`ES_LOWERCASE`), le keygen fait donc `lower()` d’abord.

> ⚠️ Bug de l’auteur : le binaire ne compare que le **premier caractère** du serial (`keyBuf[0] == serialBuf[0]`). N’importe quel serial commençant par la 1re lettre du nom (`p`, `p-0`…) affiche « Congrats! ». Le keygen produit quand même le serial complet voulu par l’auteur (c’est l’objectif « make a keygen »).

## Premier regard

```
$ file Keygenme.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386 (stripped to external PDB), 6 sections
$ diec Keygenme.exe
PE32  Compiler: MinGW
$ strings -n 5 Keygenme.exe
I'm sorry, but you're name length has to be between 5 and 30 characters in length
%lX   %1X   %C-%s-%s
YOU DID IT! Now make a keygen!
The key to the source code .zip is %s
Crap, keep going! I sense you are close >:D
```

Le format final `%C-%s-%s` donne déjà la forme du serial. Comme pour `crackme_2` du même auteur, les **symboles C++ sont conservés** : `objdump -d -M intel` montre `createSerial(char*, char*)` (`__Z12createSerialPcS_`) et `WindowProcedure`.

## Interface (WM_CREATE)

Pas de ressource dialogue : `WindowProcedure` crée à la main 4 contrôles dans la fenêtre `WindowsApp` « Keygenme » :

| ID | Classe | Style | Rôle |
|---|---|---|---|
| 100 (0x64) | EDIT | `0x50000010` = `WS_CHILD\|WS_VISIBLE\|ES_LOWERCASE` | nom |
| 101 (0x65) | EDIT | `0x50000000` | serial |
| 102 (0x66) | BUTTON « Activate » | `BS_DEFPUSHBUTTON` | vérifier |
| 103 (0x67) | BUTTON « Exit » | | `PostQuitMessage` |

## Handler `WM_COMMAND` 102

```asm
401790: GetDlgItemTextA(hwnd, 100, name, 0x1e)    ; [ebp-0x38]
4017a5: createSerial(name, keyBuf)                 ; keyBuf = [ebp-0x68]
4017ca: GetDlgItemTextA(hwnd, 101, input, 0x28)   ; [ebp-0x98]
4017d2: movzx eax, BYTE PTR [ebp-0x68]
4017d6: cmp   al,  BYTE PTR [ebp-0x98]            ; ← 1 seul octet comparé !
4017dc: jne   Failure
        wsprintfA(msg, "...source code .zip is %s", "43")  ; "43" copié depuis 0x404074
        MessageBoxA(hwnd, msg, "Congrats!", MB_ICONINFORMATION)
```

## `createSerial(name, buf)` (0x401290)

```asm
4012a4: len = strlen(name)
4012a7: s = 0x87654321
4012af: if (len <= 4 || len > 30) { MessageBox "...between 5 and 30..." ; return }
; boucle i = 0 .. len-1
4012fe: c  = movsx name[i]
401307: t  = ((c<<5) + c) * 2          ; c*66
401316: t *= (c ^ 5)                   ; imul
401328: s -= t
401346: wsprintfA(fp, "%lX", s)        ; A
40134e: s *= (movsx name[0] * 0x28a) ^ 0xc   ; 0x28a = 650 = 65*10
40137a: wsprintfA(sp, "%1X", s)        ; B (largeur min. 1 = %X)
4013a5: wsprintfA(buf, "%C-%s-%s", name[0], fp, sp)
```

Tout est en arithmétique 32 bits signée (`imul`, `long`), on masque donc à `0xFFFFFFFF` en Python. `%C` dans `wsprintfA` = caractère « large » (WCHAR) converti en ANSI : pour un nom ASCII c’est simplement `name[0]`.

### Exemple `petik`

- `s = 0x87654321 − Σ c·66·(c^5)` sur `p,e,t,i,k` → **`A = 0x8729D38D`**
- facteur : `('p'=0x70) · 650 = 72800 = 0x11C60`, `^ 0xC` → `0x11C6C`
- `B = A · 0x11C6C mod 2³²` → **`0x6C55AB7C`**
- serial : **`p-8729D38D-6C55AB7C`**

## Vérification

### 1. Live sous Wine (binaire d’origine, non patché)

```
$ i686-w64-mingw32-gcc -O1 -o verify-live.exe tools/verify-live.c
$ xvfb-run -a wine verify-live.exe original/Keygenme.exe petik p-8729D38D-6C55AB7C
name='petik' (edit='petik') serial='p-8729D38D-6C55AB7C' -> msgbox 'Congrats!': 'YOU DID IT! Now make a keygen!
The key to the source code .zip is 43'
$ xvfb-run -a wine verify-live.exe original/Keygenme.exe crackmes c-870ACACD-D64BF4AA
... -> msgbox 'Congrats!' ...
$ xvfb-run -a wine verify-live.exe original/Keygenme.exe petik q-8729D38D-6C55AB7C
... -> msgbox 'Failure!': 'Crap, keep going! I sense you are close >:D'
```

### 2. Serial complet : comparaison avec le code de l’auteur

Le binaire ne testant que le 1er octet, la partie `A-B` est vérifiée contre la source officielle : le mot de passe `43` affiché par le crackme ouvre `Source.zip` (`7z x -p43 Source.zip`), on compile la `createSerial` d’origine et on compare :

```
$ i686-w64-mingw32-g++ -O0 -static -o ref.exe tools/ref-createSerial.c
$ wine ref.exe petik crackmes cobrasniper555 grokbot
petik -> p-8729D38D-6C55AB7C
crackmes -> c-870ACACD-D64BF4AA
cobrasniper555 -> c-86DC65E5-4A802A5A
grokbot -> g-87128439-B0C963BA
$ python3 tools/keygenme1-cobra-solve.py petik crackmes cobrasniper555 grokbot
petik -> p-8729D38D-6C55AB7C
crackmes -> c-870ACACD-D64BF4AA
cobrasniper555 -> c-86DC65E5-4A802A5A
grokbot -> g-87128439-B0C963BA
```

Identique (la source confirme `st = cc*66; st *= cc^5; serial -= st;` puis `serial *= ((name[0]*65)*10)^12;`).

## Status

- [x] reverse (statique, `objdump`, symboles C++ conservés)
- [x] write-up
- [x] keygen + vérification live Wine + vérif croisée avec la source de l’auteur
