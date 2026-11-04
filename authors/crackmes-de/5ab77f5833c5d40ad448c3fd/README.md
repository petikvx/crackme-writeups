# crackme_2 — Lightning's Crackme #2 (lightning)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3fd`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3fd) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | lightning (via crackmes.de) |
| **Plateforme** | Windows PE32 GUI, MSVC 6, sans protection |
| **SHA-256** | `49c779c0c1d46c39fa15731768c3bed65c0ac05a309e5bb4b81e5dd72293f5a2` (zip) |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/lightning2.zip` | archive d'origine (`crackme.exe` + `info.txt`), intacte |
| `analysis/x/` | contenu dézippé (crackme.exe, info.txt) |
| `analysis/key-petik.bin` | keyfile généré pour `petik` |
| `tools/lightning2-solve.py` | générateur de keyfile (`--name`, `-o`, `-q`, `--check`) |
| `tools/probe.c` | sonde mingw : lit le texte du contrôle 0x3e9 de la fenêtre (preuve Wine) |

## Réponse

Il faut un **fichier `key`** dans le répertoire courant, de **0x100 octets exactement**.
Pour `petik` :

```text
"petik" 00 | "@!#*!" | "l7C?P" | 00 | "AAAA…" (padding) | 90
```

```bash
python3 tools/lightning2-solve.py --name petik -o key   # écrit le keyfile
python3 tools/lightning2-solve.py --check key           # OK
cd <dossier de crackme.exe> && cp key . && xvfb-run -a wine crackme.exe   # → "Registered"
```

## Premier regard

```bash
diec crackme.exe     # PE32, MS Linker 5.12, MSVC 12.20 (VC6), GUI
objdump -x crackme.exe | grep -E "DLL Name|Entry"   # KERNEL32 + USER32
objdump -h crackme.exe   # .text : flags 0xe0000020 → RWX !
```

`info.txt` : « keyfile », « Registered » quand valide, patch interdit. Strings utiles dans
`.data` : `0x40603c "key"`, `0x406030 "Registered"`.

## Flow

Dialogue (DialogBoxParam sur la ressource 0x65, proc en `0x401020`). Au `WM_INITDIALOG` (0x110) :

1. `CreateFileA("key", GENERIC_READ, 0, 0, OPEN_EXISTING…)` (`0x401055`) ;
2. `GetFileSize` → `ebx`, `malloc(ebx)` (`0x4012eb`) ;
3. `ReadFile(h, buf, size, &n, 0)` ;
4. `call 0x401100(buf, size)` ; si `eax != 0` → `SetDlgItemTextA(hDlg, 0x3e9, "Registered")`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel crackme.exe`, routine `0x401100` (l'unique « check »). Elle
copie le fichier dans un buffer **situé dans `.text`** à `0x40115e` (d'où la section RWX) :

```asm
401105  mov ecx,[esp+0xc]        ; taille
40110b  cmp ecx,0x100 / jg fail  ; taille <= 0x100
401113  lea edx,[0x40115e]       ; copie octet par octet : buf = 0x40115e
...
401128  ; ebx = 1 + index du 1er octet nul  (p = longueur de la chaîne 1)
401132  ; eax = 1 + index du 2e octet nul (q), cherché à partir de p+1
40113c  sub eax,ebx ; sub eax,2 ; sub eax,ebx   ; eax = (q-p-1) - p
401143  cmp eax,ebx / jne fail                  ; => len(chaîne 2) = 2p
```

Donc le fichier = `S1 \0 S2 \0` avec `len(S2) = 2·len(S1) = 2p`. Puis
`ecx = p`, `ebx = S1`, `edx = S2`, `call 0x40125d` (la vraie vérification) :

```asm
40125e  push edi / mov edi,ecx        ; edi = p (constant)
401261  mov ah,[edx]                  ; ah = S2[i]
401263  mov al,[edi+edx]              ; al = S2[i+p]
401266  rol ah,cl                     ; cl = p - i (ecx décrémente)
401268  ror al,cl
40126a  xor ah,al
40126c  add ah,cl
40126e  cmp ah,[ebx]                  ; == S1[i]
```

Prédicat : `S1[i] = ((rol8(S2[i],c) ^ ror8(S2[i+p],c)) + c) & 0xFF`, `c = p − i`.
Pour une moitié `a = S2[i]` choisie librement (imprimable), l'autre vaut
`b = rol8(((S1[i]−c)&0xFF) ^ rol8(a,c), c)` (inverse de `ror`). Exemple `petik` (p=5) :
`p`(c=5) → `a='@'`, `b='l'`… ce qui donne `S2 = "@!#*!l7C?P"`.

### Piège : la cible du `call` est un `ret`

`objdump` montre `call 0x40125d`, mais en `0x40125d` il y a l'octet `c3` (`ret`, fin de la
fonction précédente mal alignée : `00 c3 | 57 …`). La vraie routine commence en `0x40125e`.
Un keyfile « correct » mais court fait donc simplement `ret` avec `eax=0` → **Unregistered**
(constaté sous Wine avec un premier solveur naïf). Le buffer fait `0x40115e…0x40125d`
= **0x100 octets**, et la taille max autorisée est justement 0x100 : le dernier octet du
fichier **écrase le `c3`**. En y mettant `0x90` (`nop`), l'exécution tombe dans la routine
en `0x40125e`. D'où : fichier de taille exacte 0x100, dernier octet `0x90` (code
auto-modifiant, c'est « le truc » du crackme).

## Vérification (Wine, Xvfb)

Pas d'outil de screenshot ; sonde mingw `tools/probe.c` (`GetDlgItemTextA(hwnd,0x3e9)` sur
toutes les fenêtres, 4 s après lancement) :

```bash
xvfb-run -a bash -c "wine crackme.exe >/dev/null 2>&1 & sleep 4; wine probe.exe; wineserver -k"
```

| Cas | Résultat |
|---|---|
| keyfile `petik` du solveur (256 o, dernier `0x90`) | `Registered` |
| même fichier, un octet de S1/S2 modifié | `Unregistered` |
| keyfile correct mais court (sans `0x90` final) | `Unregistered` |
| pas de fichier `key` | `Unregistered` |

Pas de session GDB : reverse statique + preuve Wine.

## Notes

- Le « nom » (S1) est libre mais sans octet nul ; avec `petik` p=5 suffit (taille du
  fichier toujours 0x100, padding `A`).
- Le crackme demandait un keygen : `tools/lightning2-solve.py` génère le fichier pour
  n'importe quel nom (≤ ~80 caractères pour tenir dans 0x100 octets).
