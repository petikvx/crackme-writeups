# CrackMe #3 / crackme_3_interval — KLiZMA

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c37d`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c37d) — voir [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (KLiZMA) |
| **Plateforme** | Windows PE32 console (i386), MinGW, packé FSG |
| **SHA-256 zip** | `6ee80c442677d9064a7fa121e4b7b11d633fa91dbfac176f31647e198e2d2cbf` (mot de passe `crackmes.one`) |
| **Type** | 3 entiers (`scanf("%ld")`) : ID, Serial, Authorization Code. Pas de nom → pas de `petik` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/CrackMe#3_by_KLiZMA.zip` | archive d'origine (`crackme.exe` + `readme.txt`), non modifiée |
| `tools/crackme3-interval-solve.py` | keygen / validateur ; `--check` lance l'exe d'origine sous Wine (cas OK + KO) |
| `tools/crackme3-unpack.py` | dépack FSG par émulation unicorn → `analysis/crackme3-fsg-image.bin` |
| `analysis/crackme3-orig.exe` | `crackme.exe` extrait du zip |
| `analysis/rulz.txt` | consignes de l'auteur (« unpack it, find ID/Serial combo + Authorization Code, keygen, tutorial ») |
| `analysis/crackme3-fsg-image.bin` | image `0x400000..0x408000` après décompression FSG |
| `analysis/crackme3-unpacked-0x401000.asm` | `objdump -D` du début du code dépacké |

## Réponse

| ID | Serial | Authorization Code |
|---|---|---|
| `99999` | `900` | `99999` |

Règles : ID ∈ [10000, 99999] ; Serial ∈ [100, 999] ; `ID*Serial/(ID+Serial)` (division entière) ∈ [850, 900] ; Code ∈ [10000, 99999] et `ID−Serial−100 ≤ Code ≤ ID+Serial−100`.

```bash
python3 tools/crackme3-interval-solve.py                 # 99999 900 99999
python3 tools/crackme3-interval-solve.py -q              # valeurs seules
python3 tools/crackme3-interval-solve.py --id 50000 --serial 870   # autre combinaison (validée localement)
python3 tools/crackme3-interval-solve.py --check         # exécute l'exe d'origine sous Wine (OK + KO)
```

## Premier regard

```text
$ file crackme.exe
PE32 executable for MS Windows 4.00 (console), Intel i386 (stripped to external PDB), 2 sections
$ diec crackme.exe
Protector: AHTeam EP Protector(0.3)      # faux positif, c'est du FSG (signature "FSG!" à l'offset 0x14)
```

L'en-tête MZ/PE est « chevauché » (`MZKLiZMA`, PE à l'offset `0x0c`) et le stub de décompression FSG vit dans l'en-tête (`0x154`). `strings` ne montre rien d'utile : tout est compressé. `readme.txt` / les règles disent : unpack, trouver la combinaison, keygen.

## Flow

1. Bannière, puis `Enter ID:` → `scanf("%ld")`.
2. `Enter Serial:` → `scanf("%ld")`.
3. Contrôle de plage ID, plage Serial, puis contrôle de la combinaison ID/Serial.
4. `Enter Authorization Code:` → `scanf("%ld")`, contrôle de plage puis d'intervalle.
5. `Accepted! Now write tutorial and make keygen!`

**Piège** : aucun contrôle ne fait `exit` — chaque échec affiche juste un message (`Not correct ID!`, …) et le flot continue. Seule la présence de `Accepted!` (et l'absence de tout message `Not …`) prouve que les trois entrées sont valides.

## Comment on trouve

### Ancrage : dépack FSG

- `objdump -D` sur `crackme.exe` ne donne que du bruit : `.code` (raw `0x200`, 0x9da octets) est du code FSG ; l'EP PE `0x407979` ne contient qu'un `mov eax,0x400154 ; jmp eax` (octets `b8 54 01 40 00 ... ff e0` en file offset `0xb79`), qui renvoie dans le stub logé dans l'en-tête.
- `tools/crackme3-unpack.py` mappe l'en-tête en `0x400000` et la section en `0x407000`, puis émule depuis `0x400154` avec unicorn. Le décompresseur écrit le code en `0x401000..` et les données en `0x403000`, puis passe à la résolution d'imports (`call [ebx+0x10]` = `LoadLibraryA`/`GetProcAddress`, qu'unicorn ne sait pas exécuter → `UC_ERR_FETCH_UNMAPPED`). C'est sans conséquence : le script dumpe l'image à ce moment-là, la décompression est terminée. L'IAT (`0x4050xx`) reste non résolue mais les noms d'imports (`printf`, `scanf`, `_getch`…) sont lisibles en `0x405100+`.
- `analysis/crackme3-unpacked-0x401000.asm` = `objdump -D -b binary -m i386 -M intel --adjust-vma=0x400000` de l'image. (Même technique que pour [crackme1_lucky](../5ab77f5733c5d40ad448c37c/).)

### `main` @ `0x401290`

Les chaînes sont en `0x403000` : `Enter ID: ` (`0x403168`), `Enter Serial: ` (`0x403179`), format `%ld` (`0x403175`), messages d'erreur `0x403189`, `0x40319a`, `0x4031b0`, `0x4031f0`, `0x403214`, succès `0x403234`. `0x401a00` = thunk `scanf`, `0x401a10` = thunk `printf`.

```asm
; scanf("%ld",&id) -> [ebp-4] ; scanf("%ld",&ser) -> [ebp-8]
4013a0: cmp [ebp-4],0x270f   ; id > 9999 ...
4013a7: jle bad
4013a9: cmp [ebp-4],0x1869f  ; ... et id <= 99999
4013b0: jg  bad              ;  => 10000..99999
4013c0: cmp [ebp-8],0x63     ; ser > 99
4013c6: cmp [ebp-8],0x3e7    ; ser <= 999   => 100..999
4013dd: mov eax,[ebp-4] ; mov edx,eax ; imul edx,[ebp-8]   ; edx = id*ser
4013e6: mov eax,[ebp-8] ; mov ecx,[ebp-4] ; add ecx,eax    ; ecx = id+ser
4013f1: mov eax,edx ; cdq ; idiv [ebp-0x1c]                ; eax = id*ser / (id+ser)
400:    cmp [ebp-0xc],0x351 ; jle bad     ; > 849
409:    cmp [ebp-0xc],0x384 ; jg  bad     ; <= 900
```

Puis lecture du code (`[ebp-0x10]`), plage `0x270f < code <= 0x1869f`, et l'intervalle :

```asm
40145f: eax = ser + id - 0x64   -> [ebp-0x14]   ; borne haute  hi = id+ser-100
40146b: eax = id - ser - 0x64   -> [ebp-0x18]   ; borne basse  lo = id-ser-100
40147c: cmp code,lo ; jl bad
401484: cmp code,hi ; jg bad                    ; lo <= code <= hi  => "Interval"
```

### Assemblage de la réponse

- `id*ser/(id+ser)` est la moyenne harmonique/2 : pour un grand ID, elle tend vers `ser`. Il faut donc `ser` ≈ 850..900 pour ID grand. Avec `id=99999`, `ser=900` : `99999*900 = 89999100`, `/100899 = 891` ∈ [850,900] ✔ (pour `id=99999`, la borne basse 850 est atteinte dès `ser=858`).
- Intervalle du code : `lo = 99999−900−100 = 98999`, `hi = 99999+900−100 = 100799`. Avec la plage `≤ 99999`, le code valide est `98999..99999` ; le keygen renvoie `99999`.
- Comme ID et Serial sont libres dans leurs plages, n'importe quelle paire satisfaisant la contrainte de combinaison convient (le solveur accepte `--id` / `--serial`).

## Vérification

```text
$ python3 tools/crackme3-interval-solve.py --check
ID                   99999
Serial               900
Authorization Code   99999
--- OK ---
 ...
Enter ID:
Enter Serial:
Enter Authorization Code:
Accepted! Now write tutorial and make keygen!
--- KO (code+5000) ---
 ...
Not correct Authorization Code!
Not valid Authorization Code!
```

Exécuté sur le `crackme.exe` extrait du zip d'origine (`xvfb-run -a wine`, stdin = les 3 valeurs). Cas KO : code + 5000 (hors plage 5 chiffres et hors intervalle) → pas de `Accepted!`.

## Notes

- Pas de GDB / x64dbg : reverse statique + émulation unicorn pour le dépack, preuve par Wine.
- Pas de patch dans `original/` ; l'image dépackée est dans `analysis/`.
- Les règles « no all-accept patching / no self-keygenning » : on fournit un keygen externe, rien n'est patché.
