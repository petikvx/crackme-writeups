# cyclone by double_zer0

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c22e`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c22e) · [ORIGIN](ORIGIN.yml) |
| **Auteur** | Amit Malik / DouBle_Zer0 (réimport crackmes.de, local `crackmes-de`) |
| **Publié** | 2018-03-25 (binaire de janvier 2011) |
| **Plateforme** | Windows PE32 **console**, assembleur (2,5 Ko, 3 sections, pas de packer) |
| **Difficulté** | 2.0 |
| **SHA-256 exe** | `1b7e06c4a671a48b31751620456ae4d535d20c38ed8f5e13860c72f52449b389` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/cyclone.zip`, `original/crackme.exe`, `original/ReadMe.txt` | archive + binaire d'origine + consignes (« Remove anti-reversing technique », « find hardcoded pass or patch application ») |
| `analysis/disasm.txt` | `objdump -d -M intel` de `.text` (tout le programme, 0xD0 octets) |
| `tools/cyclone-solve.py` | solveur (`-q`, `--check N`) |
| `tools/listmsg.c`, `tools/verify-wine.sh` | preuve live sous wine/Xvfb (mot de passe sur stdin, lecture de la MessageBox) |
| `analysis/wine-run.txt` | sortie de la preuve live (1 OK, 1 KO) |

## Réponse

Mot de passe : **`43678`** (lu par `scanf("%d")`, il n'y a pas de nom d'utilisateur).

```bash
python3 tools/cyclone-solve.py        # rol(0x554F0000, 17) = 0xAA9E = 43678
python3 tools/cyclone-solve.py --check 43678   # Congratulation!!
tools/verify-wine.sh 43678            # preuve live : MessageBox « Message: / Congratulation!! »
```

## Premier regard

```text
$ file original/crackme.exe
PE32 executable for MS Windows 4.00 (console), Intel i386, 3 sections
$ strings -n 4 original/crackme.exe
Coded By DouBle_Zer0 / Debugger status: / Debugger found! / Message: / Congratulation!!
Error! / Oops Wrong Password!! / Plz Enter your password:  / %d
MessageBoxA (user32) · CloseHandle, ExitProcess (kernel32) · printf, scanf (msvcrt)
```

Le format `%d` annonce tout de suite un mot de passe **numérique**. L'import `CloseHandle` sans aucun `CreateFile`/`OpenProcess` est suspect : c'est l'anti-debug.

`objdump -p` montre un répertoire **TLS** (`Entry 9 0000308c … Thread Storage Directory`). Dans `.data`, à `0x40308C`, on lit les champs du `IMAGE_TLS_DIRECTORY32` (`0x4030A4`, `0x4030A8`, index `0x4030AC`, callbacks `0x4030B0`) et le tableau de callbacks à `0x4030B0` contient **`0x401070`**. Le point d'entrée « officiel » est `0x401000`, mais c'est le callback TLS qui s'exécute en premier.

## Flow

```text
chargement → TLS callback 0x401070 (avant l'EP)
   ├─ flag 0x4030C0 déjà à 1 ? → ExitProcess
   ├─ flag = 1, SEH → handler 0x4010A2
   ├─ CloseHandle(0x3039)          ; handle bidon
   │     sous débogueur : exception EXCEPTION_INVALID_HANDLE → handler → MessageBox « Debugger status: / Debugger found! » → ExitProcess
   │     sans débogueur : renvoie FALSE, pas d'exception
   └─ jmp 0x401000 (main, exécuté depuis le callback)
main 0x401000 : printf(bannière) ; printf("Plz Enter your password: ") ; scanf("%d", &v@0x4030BC)
   ror(v, 0x11) == 0x554F0000 ? MessageBox « Message: / Congratulation!! » : MessageBox « Error! / Oops Wrong Password!! »
   ExitProcess(0)
```

## Comment on trouve le mot de passe

**Ancrage** : `objdump -d -M intel original/crackme.exe` (le `.text` entier tient en 57 lignes, cf. `analysis/disasm.txt`) et `objdump -s -j .data` pour les chaînes.

### 1. L'anti-reversing (TLS + `CloseHandle`)

```asm
401070  cmp  byte [0x4030C0], 1     ; déjà passé ? (le callback est appelé aussi au DETACH)
401077  je   0x4010B5               ;   → ExitProcess(0)
401079  mov  byte [0x4030C0], 1
401080  push 0x4010A2               ; installe un SEH : handler = 0x4010A2
401085  push dword fs:[0]
40108C  mov  fs:[0], esp
401093  push 0x3039                 ; handle invalide (12345)
401098  call CloseHandle            ; débogueur présent → STATUS_INVALID_HANDLE levée
40109D  jmp  0x401000               ; pas d'exception → on saute dans main
4010A2  push 0x30 ; "Debugger status:" ; "Debugger found!" ; MessageBoxA ; ExitProcess
```

`CloseHandle` sur un handle invalide ne lève `EXCEPTION_INVALID_HANDLE` (0xC0000008) **que** si un débogueur est attaché ; sinon l'appel échoue silencieusement. Le handler SEH ne voit donc l'exception que sous débogueur. Pour « enlever » la protection (tâche 1 du ReadMe), il suffit de remplacer le `call` en `0x401098` par des NOP, de mettre le flag `0x4030C0` à 1 avant le lancement, ou de vider le tableau de callbacks TLS. Pour trouver le mot de passe, une lecture statique suffit : ce n'est pas nécessaire.

### 2. La comparaison

```asm
40101C  push 0x4030BC               ; &v
401021  push 0x403089               ; "%d"
401026  call scanf
40102F  mov  eax, [0x4030BC]        ; eax = v
401034  ror  eax, 0x11              ; rotation à droite de 17 bits
401037  mov  ebx, 0x554F0000
40103C  cmp  eax, ebx
40103E  jne  0x401055               ; → "Oops Wrong Password!!"
401040  …   "Message:" / "Congratulation!!"
```

### 3. Inversion

Une rotation est bijective : `ror(v, 17) = 0x554F0000` équivaut à `v = rol(0x554F0000, 17)`.

```text
0x554F0000 = 0101 0101 0100 1111 0000 0000 0000 0000
rol 17     = 0000 0000 0000 0000 1010 1010 1001 1110 = 0x0000AA9E = 43678
```

Le mot de passe « codé en dur » est donc l'entier **43678**. Comme `%d` est lu en `int32` signé, `+43678` ou `043678` passent aussi (même valeur), mais pas `0xAA9E` (lu comme `0`).

## Vérification

`tools/verify-wine.sh` copie le binaire d'origine dans un dossier temporaire, lance `echo <mdp> | wine crackme.exe` sous Xvfb, puis `tools/listmsg.c` (compilé avec `i686-w64-mingw32-gcc`) énumère les boîtes de dialogue visibles et affiche leur titre et leur texte (`analysis/wine-run.txt`) :

```text
$ tools/verify-wine.sh 43678
  fenetre : Message:
    [OK]
    [Congratulation!!]

$ tools/verify-wine.sh 12345
  fenetre : Error!
    [OK]
    [Oops Wrong Password!!]
```

Sous wine sans débogueur, `CloseHandle(0x3039)` ne lève rien et le callback TLS enchaîne bien sur `main`.

## Notes

- Le prompt `Plz Enter your password:` n'apparaît pas dans la capture : `printf` est bufferisé quand stdout est un tube, et `ExitProcess` ne vide pas le buffer de msvcrt.
- `main` est exécuté **depuis le callback TLS** (`jmp 0x401000`), puis `ExitProcess` termine le processus avant le vrai point d'entrée. Le flag `0x4030C0` empêche une seconde exécution si le callback est rappelé.
- Ce n'est pas un keygen : il n'y a qu'une seule valeur valide (modulo l'écriture décimale).
