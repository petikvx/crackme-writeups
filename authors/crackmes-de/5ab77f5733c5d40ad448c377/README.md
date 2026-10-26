# CrackMe#2 (crackme2_math) by KLiZMA

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c377`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c377) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | KLiZMA (via crackmes.de) |
| **Plateforme** | Windows PE32 console (MinGW/gcc, packé **FSG**) |
| **ZIP** | `original/CrackMe#2_by_KLiZMA.zip` (password site `crackmes.one`) contenant `crackme.exe` + `rulz.txt` |
| **SHA-256 zip** | `66e855098ec608e5c4bfe05855d71dae8b978386376c6809ec82155ee340a7b2` |
| **SHA-256 crackme.exe** | `3bd0f50e0336826ba0550edb95f540e717b2709fcea50c5480f12c8694964716` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `tools/klizma-crackme2-solve.py` | keygen (`-q`, `--check <exe>` via `xvfb-run wine`) |
| `tools/fsg-unpack-unicorn.py` | unpacker FSG par émulation unicorn (dump mémoire à l'OEP) |
| `analysis/unpacked-0x400000.dis` | désassemblage du dump unpacké (`objdump -D -b binary --adjust-vma=0x400000`) |
| `analysis/iat-names.json` | noms des imports résolus par le stub FSG |

## Réponse

Le crackme demande un **ID entier** (libre) puis 3 serials qui en dérivent. `rulz.txt` : « unpack it, find 3 serials, make keygen, no patching ».

| ID | serial 1 | serial 2 | serial 3 |
|---|---|---|---|
| `12345` | `348849` | `189903` | `50099` |
| `0` | `330333` | `186817` | `47013` |

```bash
python3 tools/klizma-crackme2-solve.py 12345            # affichage
python3 tools/klizma-crackme2-solve.py -q 12345         # "348849 189903 50099"
python3 tools/klizma-crackme2-solve.py 12345 --check /chemin/vers/crackme.exe
```

(Pas de username : l'« exemple petik » ne s'applique pas, l'entrée est un entier.)

## Premier regard

```bash
unzip -P crackmes.one original/*.zip -d /tmp/k2o
file crackme.exe        # PE32 console i386, 2 sections sans nom
strings -n 4 crackme.exe
```

Quasiment aucune chaîne lisible, un seul import visible (`KERNEL32: LoadLibraryA`, `GetProcAddress`), `FSG!` en tête de fichier, `AddressOfEntryPoint = 0x154` (dans le header PE) : c'est **FSG** (« Fast Small Good »). Sous Wine il tourne et affiche `Enter ID (must be integer)`.

## Unpack FSG (comment on arrive au code)

Le stub de décompression est dans l'en-tête (EP `0x400154`) et lit les données packées en section 2 (`0x407000`, taille raw `0x891`) ; il rebâtit ensuite l'IAT à coups de `LoadLibraryA`/`GetProcAddress` (table des imports à `0x407868`) puis saute à l'OEP dans la section 1 (`0x401000`, vide sur disque).

`tools/fsg-unpack-unicorn.py` :

1. mappe l'image (header à `0x400000`, section packée à `0x407000`) dans unicorn ;
2. fournit deux fausses API (`0x70000000` = LoadLibraryA, `0x70000004` = GetProcAddress) qui loggent le nom demandé et renvoient une valeur distincte ;
3. s'arrête dès que `EIP` entre dans `0x401000-0x407000` : **OEP = `0x401220`** ;
4. dump de `0x400000-0x407000`.

Le log des API révèle le runtime : `AddAtomA/FindAtomA/GetAtomNameA` (support exceptions libgcc/MinGW) et `msvcrt` : `printf`, `scanf`, `exit`, `_getch`… Compilateur : MinGW gcc (`-LIBGCCW32-EH-2-SJLJ-GTHR-MINGW32`). Piège : mon premier stub lisait le mauvais argument de pile pour `GetProcAddress` (nom en `esp+8`, pas `esp+4`).

## Flow et prédicat

`main` @ `0x401290` (le `0x401220` est le CRT `__mingw_CRTStartup`). Chaînes : banner `0x403000`, prompts `0x40301c`/`0x403040`, `%d` à `0x40303c`, `Very good! Now write tutorial and make keygen!` à `0x40306c`. Variables : `id=[ebp-4]`, `s1=[ebp-0x14]`, `s2=[ebp-0x18]`, `s3=[ebp-0x1c]`. Chaque comparaison ratée → `exit(0)` (appel `0x401950`).

```asm
; scanf("%d",&id) ; scanf("%d",&in1)
401304  mov edx,[ebp-4]          ; id
401307  mov eax,edx
401309  sar eax,31 ; shr eax,31  ; correction signe : division C tronquée vers 0
40130f  lea eax,[edx+eax]
401314  sar edx,1               ; a = id/2
401318  add eax,eax ; add eax,edx ; 3*a
40131c  add eax,0x50a5d         ; s1 = 3*(id/2) + 0x50a5d
401327  cmp eax,[ebp-0x14]      ; == 1er serial ?

; 2e serial
40135f  mov eax,0x55555556 ; imul [s1]  ; edx = s1/3 (réduction de force, - signe)
401373  lea edx,[eax+0x40564]   ; s1/3 + 0x40564
401384  sar eax,1               ; /2 (avec correction de signe)  -> s2
40138c  cmp eax,[ebp-0x18]

; 3e serial
4013be  mov eax,[s1] ; add eax,[id] ; add ecx,[s2]   ; t = s1+id+s2
4013c9  mov eax,0x2e8ba2e9 ; imul ecx ; sar edx,1 ; - signe(t)   ; t/11
4013e1  cmp eax,[ebp-0x1c]
```

Décodage des constantes : `0x55555556` = magic de la division par 3 ; `0x2e8ba2e9` + `sar 1` = division par 11 ; toutes les divisions sont **signées tronquées** (le solveur implémente `tdiv`, donc IDs négatifs OK).

Formules :

```
s1 = 3*(id/2) + 0x50a5d
s2 = (s1/3 + 0x40564) / 2
s3 = (s1 + id + s2) / 11
```

Exemple `id=12345` : `12345/2=6172` → `s1=18516+330333=348849` ; `348849/3=116283`, `+263524=379807`, `/2=189903` ; `348849+12345+189903=551097`, `/11=50099`.

## Vérification

Preuve live sur le binaire d'origine (extrait du zip, packé FSG), Wine sans display :

```bash
python3 tools/klizma-crackme2-solve.py 12345 --check /tmp/k2o/crackme.exe
# ID=12345 serial1=348849 serial2=189903 serial3=50099
# Very good! Now write tutorial and make keygen! => OK
```

Autres IDs testés OK : `-7` (330324/186816/47012), `0`, `100000` (480333/211817/72013).
KO : `12345` avec `1 2 3` → le programme sort après le 1er serial sans afficher « Very good ».

## Notes

- GDB non utilisé (unpack par émulation + statique, preuve Wine) ; pas de session x64dbg.
- Les divisions par réduction de force sont le seul piège : ne pas coder `//` Python (floor) pour les négatifs.
- `original/` non modifié ; le binaire unpacké n'est pas versionné (dump reproductible via l'outil).
