# crackme_2.1 — Lightning's Crackme #2.1 (lightning)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3fe`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3fe) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | lightning (via crackmes.de) |
| **Plateforme** | Windows PE32 GUI, MSVC 6, sans protection |
| **SHA-256** | `7204856331d4871a344736ccd90f004084e0c512ac9aff7fb4a86876a908e4cc` (zip) |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/lightning21.zip` | archive d'origine (`crackme 2.1.exe` + `info 2.1.txt`), intacte |
| `analysis/extract/` | contenu dézippé (mdp zip `crackmes.one`) |
| `analysis/key-petik.bin` | keyfile généré pour `petik` |
| `tools/lightning21-solve.py` | générateur de keyfile (`--name`, `-o`, `-q`, `--check`) |
| `tools/probe.c` | sonde mingw : lit le texte du contrôle 0x3e9 (preuve Wine) |

## Réponse

Un fichier **`key`** (dans le répertoire courant de l'exe), de **0x100 octets exactement**, dernier octet `0x90`.
Pour `petik` :

```text
"petik" 00 | "@!#*!" | "l7C?P" | 00 | "AAAA…" (padding) | 90
```

```bash
python3 tools/lightning21-solve.py --name petik -o key
python3 tools/lightning21-solve.py --check key          # OK
cp key <dossier de "crackme 2.1.exe"> && xvfb-run -a wine "crackme 2.1.exe"   # → "Registered"
```

## Premier regard

```bash
diec "crackme 2.1.exe"        # PE32, MS Linker 5.12, MSVC 12.20 (VC6), GUI
objdump -x "crackme 2.1.exe"  # KERNEL32 + USER32 ; entry 0x4013a1 ; .text à 0x401000
```

`info 2.1.txt` : version « révisée » du #2, keygen demandé, patch interdit. Strings utiles dans `.data` :
`0x40603c "key"`, `0x406030 "Registered"`.

## Flow

`DialogBoxParam` (ressource 0x65, DlgProc `0x401020`). Au `WM_INITDIALOG` (0x110) :

1. `CreateFileA("key", GENERIC_READ, …, OPEN_EXISTING)` (`0x40104f`) ;
2. `GetFileSize` → `ebx`, `malloc` (`0x4012ef`), `ReadFile` ;
3. `call 0x401100(buf, size)` ; si `eax != 0` → `SetDlgItemTextA(hDlg, 0x3e9, "Registered")`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel "crackme 2.1.exe" --start-address=0x401000`. Tout est dans
`0x401100` (le « check ») et la sous-routine appelée en fin de check. La routine copie le fichier
dans un buffer **dans `.text`** (section RWX) à `0x401162` :

```asm
40110b  cmp ecx,0x100 / jg fail      ; taille <= 0x100
401113  lea edx,[0x401162]           ; copie octet par octet vers 0x401162
401122  xor ebx,ebx / dec edx        ; recherche du 1er octet nul → ebx = p+1
401134  ... 2e octet nul             ; eax = q+1
40113b  dec ebx ; sub eax,ebx ; sub eax,2 ; sub eax,ebx
401143  cmp eax,ebx / jne fail       ; => (q-p-1) == 2p
```

Format : `S1 \0 S2 \0` avec `len(S2) = 2·len(S1) = 2p`. Puis `ecx = p`, `ebx = S1`,
`edx = S2` (`0x401163 + p`), et `call 0x401261`, qui doit vérifier :

```asm
401265  mov ah,[edx]          ; ah = S2[i]
401267  mov al,[edi+edx]      ; al = S2[i+p]   (edi = p)
40126a  rol ah,cl             ; cl = p - i (ecx décrémente)
40126c  ror al,cl
40126e  xor ah,al
401270  add ah,cl
401272  cmp ah,[ebx]          ; == S1[i]
```

Prédicat : `S1[i] = ((rol8(S2[i],c) ^ ror8(S2[i+p],c)) + c) & 0xFF`, `c = p − i`.
Inverse : on choisit `a = S2[i]` imprimable, puis `b = S2[i+p] = rol8(((S1[i]−c)&0xFF) ^ rol8(a,c), c)`.
Exemple `petik` (p=5) : `p`(c=5) → `a='@'`, `b='l'` … donne `S2 = "@!#*!l7C?P"`.

### Piège : la cible du `call` est un `ret`

`call 0x401261` pointe sur un octet `c3` (`ret`, fin de fonction mal alignée dans l'objdump :
`... 00 c3 | 57 8b f9 …`). La vraie routine commence en `0x401262`. Un keyfile « correct » mais
court exécute donc ce `ret` avec `eax=0` → **Unregistered**. Le buffer `0x401162…0x401261` fait
exactement **0x100 octets** et la taille max acceptée est 0x100 : le **dernier octet du fichier
écrase le `c3`**. En y mettant `0x90` (`nop`) l'exécution tombe dans la routine en `0x401262`
(code auto-modifiant : « le truc » du crackme). Même mécanique que le #2, les adresses sont
décalées de 4 (`0x401162` au lieu de `0x40115e`).

## Vérification (Wine, Xvfb)

Pas de session GDB : reverse statique + preuve Wine. Sonde mingw `tools/probe.c`
(`GetDlgItemTextA(hwnd, 0x3e9)` sur toutes les fenêtres, 5 s après lancement) :

```bash
xvfb-run -a bash -c "wine crackme.exe >/dev/null 2>&1 & sleep 5; wine probe.exe; wineserver -k"
```

| Cas | Résultat |
|---|---|
| keyfile `petik` du solveur (256 o, dernier `0x90`) | `Registered` |
| même fichier, un octet de S1 modifié | `Unregistered` |
| keyfile correct mais tronqué à 255 o (sans `0x90`) | `Unregistered` |
| pas de fichier `key` | `Unregistered` |

## Notes

- Le « nom » (S1) est libre mais sans octet nul ; la taille du fichier reste 0x100 (padding `A`),
  donc nom ≤ ~80 caractères.
- `original/` n'est pas modifié ; le keyfile est la seule « solution » (pas de patch).
