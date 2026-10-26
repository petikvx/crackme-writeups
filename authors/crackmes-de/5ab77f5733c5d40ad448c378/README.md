# UnpackMe #1 (unpackme_1) by KLiZMA

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c378`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c378) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | KLiZMA (via crackmes.de) |
| **Plateforme** | Windows PE32 GUI (Delphi, packé **UPX 1.93 modifié** + wrapper « UPX lock » maison) |
| **ZIP** | `original/UnpackMe#1_by_KLiZMA.zip` (password site `crackmes.one`) → `unpackme.exe` + `readme.txt` |
| **SHA-256 zip** | `2f60752ce3759dac63e441822b9e0128ce3bd24fa2e51eae61d36464bdc86039` |
| **SHA-256 unpackme.exe** | `222adfc5dffeea1f79656ab800c761dd284ce6473d9a7965d2be808cf4914cba` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/UnpackMe#1_by_KLiZMA.zip` | binaire d'origine (non modifié) |
| `analysis/extracted/` | `unpackme.exe` + `readme.txt` extraits du zip |
| `analysis/unpackme.unpacked.exe` | PE dépacké seul (`--no-patch`), affiche toujours `UNREGISTERED` |
| `analysis/unpackme.registered.exe` | PE dépacké **et** patché → `REGISTERED` |
| `analysis/screenshot-*.png` | captures Wine/Xvfb (original, dépacké, patché) |
| `tools/unpackme1-solve.py` | dépackeur + patcheur reproductible (unicorn) |

## Réponse

Le `readme.txt` fixe les règles : (1) dépacker, (2) changer « UNREGISTERED » en « REGISTERED », (3) écrire un tuto. Pas de serial : la solution est un **patch** du binaire dépacké.

```bash
python3 tools/unpackme1-solve.py --check        # → analysis/unpackme.registered.exe
python3 tools/unpackme1-solve.py --check --no-patch -o analysis/unpackme.unpacked.exe   # dépack seul
xvfb-run -a wine analysis/unpackme.registered.exe
```

Le caption du `Label2` est une simple chaîne du DFM de `TForm1` (pas de code qui le calcule) :
`"                     UNREGISTERED"` (préfixe longueur Delphi `0x20`) → on remplace les 12 octets `UNREGISTERED` par `  REGISTERED` (même longueur, donc aucun length-byte à toucher).

## Premier regard

```text
$ file unpackme.exe   → PE32 executable (GUI) Intel 80386, 4 sections
$ diec unpackme.exe   → Linker Turbo Linker 2.25 · Compiler Borland Delphi
                        Tool UPX lock (1.0-1.2) · Packer UPX(1.93)[NRV, brute, modified]
$ objdump -h
 0 .KLiZMA  VA 0x401000 vsize 0x4b000 raw 0          (« UPX0 » : destination)
 1 .KLiZMA  VA 0x44c000 vsize 0x31000 raw 0x400      (« UPX1 » : données NRV + stub UPX)
 2 .rsrc    VA 0x47d000 0x1000                        (dir. ressources + noms d'imports du stub)
 3 .KLiZMA  VA 0x47e000 raw 0x32400 size 0x354       (wrapper anti-debug, EP = 0x47e000)
```

`strings` ne donne presque rien d'utile (tout est compressé) ; seule la table d'imports du stub (`LoadLibraryA`, `GetProcAddress`, `ExitProcess`…) est lisible, dans la `.rsrc`.

## Flow

1. EP `0x47e000` : `pusha / call $+5 / pop ebp / sub ebp,0x401248` (delta-offset), puis `call 0x47e33e` qui déchiffre le reste du wrapper.
2. Wrapper déchiffré : résolution de `kernel32` par scan de la pile (`0x47e238`), `GetProcAddress` à la main (`0x47e254/0x47e26a`), puis anti-debug :
   - `IsDebuggerPresent` ;
   - deux `GetTickCount` (delta ≠ 0 → `ExitProcess`) ;
   - `int3` sous SEH (`bp = 'KHCB'`, `ax = 4`) : si un debugger avale l'exception → sortie ;
   - `CreateFileA("\\\\.\\EngineDevice0")` (détection driver) ;
   - 2ᵉ `int3` avec handler qui fixe `Eip` / `Esp`.
3. **« Stolen bytes »** : le wrapper `VirtualProtect` puis recopie 30 + 30 + 5 octets dans le stub UPX (`0x47cc80`, `0x47ccb2`, `0x47cdf7`) : le stub UPX stocké dans le fichier est donc *cassé* (zéros) tant que le wrapper n'a pas tourné.
4. Efface le wrapper (`rep stosb`), `popa`, `push 0x47cc80 / ret` → stub UPX modifié → décompression NRV2B vers `0x401000` → filtre E8/E9 → reconstruction des imports → `jmp OEP` (`0x463c80`).

## Comment on trouve

### 1. Déchiffrer le wrapper

`objdump -D -b binary -m i386 -M intel --adjust-vma=0x47e000` sur les `0x354` octets de la dernière section (`file offset 0x32400`). Le code ressemble à du bruit jusqu'à la routine finale (en clair) :

```asm
47e33e: mov dl,0x62
47e340: lea esi,[ebp+0x401256]     ; ebp=0x47e006-0x401248 → esi = 0x47e014
47e346: mov edi,esi
47e348: mov ecx,0x312
47e34d: lods al,[esi] ; xor al,dl ; stos [edi],al ; loop 47e34d
```

→ XOR `0x62` sur `0x312` octets à partir de `0x47e014` (piège : démarrer à `0x47e056` — l'offset du premier octet « lisible » — donne un listing faux, `ebp` vaut `0x47e006-0x401248`, pas 0). Après XOR on lit enfin les noms d'API (`LoadLibraryA`, `VirtualProtect`, `IsDebuggerPresent`, `GetTickCount`…), les `int3`, la chaîne `\\.\EngineDevice0`, et en fin de blob :

```text
47e2d4: 80 cc 47 00            ; dword 0x47cc80 = adresse du stub UPX à réparer
47e2d8: 60 be 00 c0 44 00 8d be 00 50 fb ff ...   ; 30 octets : pusha / mov esi,0x44c000 / lea edi,[esi-0x4b000] / push edi / or ebp,-1 / jmp ...
47e2f6: 30 octets (2ᵉ morceau, copié à 0x47cc80+[0x47e319]=0x47ccb2)
47e314: e9 84 6e fe ff         ; 5 octets copiés à [0x47e31d]=0x47cdf7 : jmp 0x463c80 (OEP)
```

Ces trois blocs sont exactement ce qu'on retrouve dans les `rep movsb` de `0x47e182…0x47e1c9`.

### 2. Dépacker sans exécuter (unicorn)

Plutôt que de passer l'anti-debug, on **émule seulement le stub UPX** : on mappe `UPX1` à `0x44c000` et la `.rsrc` à `0x47d000`, on applique les 3 patchs, et on lance `emu_start(0x47cc80, 0x47cdae)`. Le stub UPX standard est reconnaissable (`add ebx,ebx / jnz / mov ebx,[esi] / sub esi,-4 / adc ebx,ebx`, `cmp ebp,0xfffffb00`, `xor eax,-1 / je` pour la fin) :

```asm
47cd7a: pop esi             ; esi = 0x401000 (edi poussé au début)
47cd7d: mov ecx,0x2b6a      ; nombre d'octets filtrés
47cd82: ... sub al,0xe8 ; cmp al,1 ; ja ; cmp byte [edi],0x19 ... ; sub eax,edi ; add eax,esi   ; défiltre call/jmp
47cdae: lea edi,[esi+0x79000]   ; ← ici on s'arrête : début de la reconstruction des imports
```

À `0x47cdae`, `0x401000…0x47d000` contient l'image Delphi complète (on y retrouve `TObject`, `TForm1`, `UnregisterClassA`…).

### 3. Reconstruire les imports

Le stub boucle sur une table à `0x47a000` : par DLL, `[u32 off_nom][u32 off_IAT]` puis une liste `[0x01][nom\0]…` terminée par `0`, puis la DLL suivante (0 = fin). Avec `esi=0x401000` :
`nom_va = off_nom + 0x401000 + 0x7cddc` (c'est la `.rsrc`, où sont les noms de DLL) et `IAT_va = off_IAT + 0x401000`. Le solveur la convertit en `IMAGE_IMPORT_DESCRIPTOR` standard dans une section `.idata` (13 entrées/DLL, 368 imports) et remplit les IAT. Piège : l'octet `0x01` devant chaque nom est un marqueur « par nom » (pas un hint) — sans le sauter, les noms deviennent `\x01Sleep` et pefile/Windows refusent l'import.

Le PE reconstruit : `.text` (0x401000–0x47d000), `.rsrc` d'origine, `.idata`, `EntryPoint = 0x63c80` (OEP `0x463c80`), TLS conservé.

### 4. Trouver « UNREGISTERED »

```bash
strings -n 6 analysis/unpackme.unpacked.exe | grep -i registered   # rien dans l'original
python3 -c "…find(b'UNREGISTERED')"                               # 1 seule occurrence : 0x479140
```

Dans l'image dépackée la chaîne se trouve dans la ressource `RCDATA` `TForm1` (`TPF0` @ `0x477270`) :
`TLabel Label2 … Caption = '                     UNREGISTERED'`, `Font.Color = clWindow`. Aucun code ne la réécrit → un patch d'octets dans le DFM suffit : `UNREGISTERED` → `␣␣REGISTERED` (même longueur).

## Vérification

Wine sous Xvfb (`xvfb-run` / `Xvfb -fbdir` + conversion XWD → PNG) :

| Binaire | Caption | Capture |
|---|---|---|
| `original/…/unpackme.exe` (packé) | `UNREGISTERED` | [screenshot-original.png](analysis/screenshot-original.png) |
| `analysis/unpackme.unpacked.exe` | `UNREGISTERED` (le dépack est fonctionnel : même fenêtre que l'original) | [screenshot-unpacked-unregistered.png](analysis/screenshot-unpacked-unregistered.png) |
| `analysis/unpackme.registered.exe` | **`REGISTERED`** | [screenshot-registered.png](analysis/screenshot-registered.png) |

`python3 tools/unpackme1-solve.py --check` : `check OK : 13 DLL, 368 imports` (pefile relit le PE produit, EP = `0x463c80`, plus aucune occurrence de `UNREGISTERED`).

## Notes

- Pas de session GDB / x64dbg : reverse 100 % statique + émulation unicorn du stub UPX, preuve finale sous Wine.
- Le crackme n'a ni serial ni keygen : la « solution » est le dépackage (règle 1) et le patch du caption (règle 2). Le binaire sous `original/` n'est jamais modifié ; les PE générés sont sous `analysis/`.
- Le wrapper anti-debug (`IsDebuggerPresent`, `GetTickCount`, `int3`+SEH, `\\.\EngineDevice0`) n'est jamais exécuté par notre méthode ; sous Wine, sans debugger, il laisse passer.
- Dépendance du solveur : `unicorn` (+ `pefile` pour `--check`).
