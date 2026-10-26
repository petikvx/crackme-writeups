# crackme_5_stupid (CrackMe #5) — KLiZMA

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c37a`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c37a) — voir [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (KLiZMA) |
| **Plateforme** | Windows PE32 console (i386), MinGW, packé FSG |
| **SHA-256 zip** | `4f6f6b378658b60bbb353eef007be4aa60a944c9cd8ff0844a4a33c5d2190b06` (mot de passe `crackmes.one`) |
| **Type** | unpack + patch (pas de serial) |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/CrackMe_#5_by_KLiZMA.zip` | archive d'origine (`crackme.exe` + `readme.txt`), non modifiée |
| `tools/crackme5-stupid-solve.py` | unpack FSG (unicorn) → PE reconstruit → patch 2 octets ; `--check` lance Wine |
| `analysis/crackme5-orig.exe` | `crackme.exe` extrait du zip |
| `analysis/crackme5-unpacked.exe` | image dépackée (PE reconstruit, SHA-256 `8aa84a17…324d`) |
| `analysis/crackme5-patched.exe` | version patchée : affiche `Patched!` |

## Réponse

Le `readme.txt` du zip donne les règles : *« unpack it carefully — patch 1 byte (or 2 byte) — it changed "Not patched!" to "Patched!" »*. Il n'y a **ni nom ni serial** (donc pas de `petik` ici) : la « solution » est un patch.

Sur l'image dépackée (VA = adresse en mémoire) :

| VA | Avant | Après | Effet |
|---|---|---|---|
| `0x4012cb` | `00` | `04` | `mov dword [esp], 0x403000` → `0x403004` : `puts` reçoit `"patched!"` au lieu de `"Not patched!"` |
| `0x403004` | `70` (`p`) | `50` (`P`) | `"patched!"` → `"Patched!"` |

```bash
python3 tools/crackme5-stupid-solve.py --check   # écrit analysis/*.exe et les lance sous Wine
python3 tools/crackme5-stupid-solve.py -q        # affiche seulement le SHA-256 du patché
```

(Dépendances : `unicorn`, `xvfb-run` + `wine` pour `--check`. `original/` n'est jamais modifié.)

## Premier regard

```text
$ file crackme.exe
PE32 executable for MS Windows 4.00 (console), Intel i386, 2 sections
$ diec crackme.exe
Protector: AHTeam EP Protector(0.3)
$ xvfb-run -a wine crackme.exe
Not patched!
```

- Deux sections nommées `SVKP` (0x6000 virtuelles vides + 0x7e4 d'octets bruités) : ce sont des **leurres** (nom de section SVKP, détection DIE « AHTeam EP Protector »). `strings` ne montre rien d'utile hormis `FSG!`, `Not pa`/`che8d!D-` (la chaîne apparaît **fragmentée** dans le blob compressé) et `KERNEL32.dll`.
- Le programme n'attend aucune saisie : il affiche toujours `Not patched!` et quitte.
- `AddressOfEntryPoint = 0x40776d` : dans la 2ᵉ section.

## Flow

1. `0x40776d` : champ de `nop` puis `mov eax, 0x400154 ; jmp eax`.
2. `0x400154` se trouve **dans l'en-tête PE** (offset fichier 0x154, juste après la table de sections) : c'est le stub **FSG 1.x** (décompresseur aPLib-like : `call [ebx]` = getbit, `[ebx+4]` = getgamma, etc., table de pointeurs en `0x407734`).
3. Les données compressées sont dans `0x407000+`, décompressées vers `0x401000`…`0x405xxx`.
4. `0x4001c2` : boucle de résolution d'imports FSG (`LoadLibraryA` = `[ebx+0x10]`, `GetProcAddress` = `[ebx+0x14]`), puis `jmp [ebx+0xc]` = **OEP `0x401220`**.
5. Le code dépacké est un `crt0` MinGW classique : `main` à `0x401290` imprime `Not patched!` avec `puts` et sort.

## Comment on trouve

### Ancrage

```bash
unzip -P crackmes.one original/CrackMe_#5_by_KLiZMA.zip -d /tmp/cm5
objdump -d -M intel --start-address=0x40776d /tmp/cm5/crackme.exe | head   # nop... mov eax,0x400154 ; jmp eax
```

Le `jmp eax` envoie en `0x400154` — dans les 0x200 premiers octets (en-têtes), signature d'un stub FSG ; le désassemblage de l'offset fichier `0x154` donne la boucle caractéristique :

```asm
400154  xchg [0x407730], esp   ; sauve/charge pointeurs (ebx=0x407734 : table de callbacks)
40015a  popal                  ; esi=src compressé, edi=dest, ebx=table
400160  call [ebx]             ; getbit  (add dl,dl / jne / mov dl,[esi] ; inc esi ; adc dl,dl)
400162  jae 40015d             ; bit 0 = littéral : movsb
...                            ; sinon longueur/offset (getgamma [ebx+4]) + rep movsb
4001c2  ... call [ebx+0x10]    ; LoadLibraryA   puis  call [ebx+0x14] GetProcAddress
4001d1  jmp [ebx+0xc]          ; OEP
```

Table `0x407734` (lue après décompression) : `[ebx]=0x4001e8` getbit, `+4=0x4001dc` getgamma, `+8=0x4001de`, **`+0xc=0x401220` OEP**, `+0x10=0x40774e` (`LoadLibraryA`), `+0x14=0x40775c` (`GetProcAddress`).

### Unpack par émulation (unicorn)

Pas besoin de debugger : on mappe les 0x200 octets d'en-têtes à `0x400000` et la 2ᵉ section à `0x407000`, on pose `esp`, et on émule `0x40776d` → `0x4001c6` (fin de la décompression, avant l'appel `LoadLibraryA`). `fsg_unpack()` dans le solveur fait exactement cela (~quelques dizaines de milliers d'instructions). On récupère alors l'image `0x400000-0x408000` en clair : on y voit `Not patched!` en `0x403000`, les noms d'API en `0x405132+` (`AddAtomA`, `ExitProcess`, `FindAtomA`, `GetAtomNameA`, `SetUnhandledExceptionFilter`, `_getch`, `__getmainargs`, `printf`, `puts`/`fflush`…, `msvcrt.dll`, `KERNEL32.dll`).

Reconstruction du PE (`rebuild_pe()`), car FSG résout les imports lui-même sans table PE standard :

- table FSG à `0x405000` : 3 paires `(adresse IAT, VA du nom de DLL)` → `0x4050c4`/`KERNEL32.dll`, `0x4050e0`/`msvcrt.dll`, `0x4050ec`/`msvcrt.dll` ;
- chaque entrée IAT vaut `VA_du_nom − 1` (FSG fait `inc eax` avant `GetProcAddress`), terminée par `0x7fffffff` ou `0xffffffff` ;
- on convertit en RVA de `IMAGE_IMPORT_BY_NAME` (`v − 0x400000 − 1`, le hint de 2 octets précède le nom), on remplace les terminateurs par `0` et on écrit 3 `IMAGE_IMPORT_DESCRIPTOR` en `0x405300` ;
- une seule section RWX `0x1000-0x7000`, `EntryPoint = 0x1220`, la section `SVKP` leurre (`0x7000+`) est purgée.

**Piège rencontré** : première version → Wine plantait (`c0000005` dans le loader, `esi=0x4050d8`) car la valeur `0x7fffffff` du terminateur FSG était laissée telle quelle dans la table de thunks ; le loader la prenait pour un import. Il faut la remettre à 0.

### Lecture de `main` (0x401290)

```asm
401290  push ebp / mov ebp,esp / sub esp,0x18 / and esp,-16
...                                   ; __alloca(…) puis 0x4013c0 (init DW2/atom, w32-shared-ptr)
4012ba  mov dword [ebp-4], 1          ; variables locales inutiles (deux fois)
4012c1  mov dword [ebp-4], 1
4012c8  mov dword [esp], 0x403000     ; c7 04 24 00 30 40 00  -> arg de puts
4012cf  call 0x401820                 ; jmp [0x405124] = puts
4012d4  call 0x4017a0                 ; jmp [0x4050e0] = _getch (attente touche)
4012d9  mov eax,0
```

Aucun test conditionnel : le message est inconditionnel, et `.data`/`.rdata` `0x403000` = `"Not patched!\0"`. D'où la consigne « patcher 1 ou 2 octets ».

### Calcul du patch

`"Not patched!"` à `0x403000` : les 4 premiers octets sont `Not ` ; `0x403004` pointe donc sur `"patched!"`.

1. Imm32 de `mov [esp], 0x403000` à VA `0x4012c8+3 = 0x4012cb` : octet de poids faible `00` → `04` ⇒ `"patched!"` (**1 octet**).
2. Pour obtenir exactement `Patched!` : `p` → `P` (`0x70` → `0x50`) à `0x403004` (**2ᵉ octet**) — d'où le « 1 byte (or 2 byte) » de l'auteur (la variante 1 octet donne `patched!` en minuscule).

Offsets fichier dans notre PE reconstruit (en-têtes 0x400, section à RVA 0x1000) : `0x400 + (VA − 0x401000)` = `0x6cb` et `0x2404` (`cmp -l` les affiche en 1-based décimal : `1740` et `9221`, valeurs en octal).

## Vérification

```text
$ python3 tools/crackme5-stupid-solve.py --check
patched -> .../analysis/crackme5-patched.exe (2 octets : imm32 0x403000->0x403004 @0x4012cb, 'p'->'P' @0x403004)
crackme5-orig.exe => 'Not patched!'        # binaire d'origine packé
crackme5-unpacked.exe => 'Not patched!'    # image dépackée seule : même comportement (unpack correct)
crackme5-patched.exe => 'Patched!'         # OK

$ cmp -l analysis/crackme5-unpacked.exe analysis/crackme5-patched.exe
 1740   0   4      # 0x4012cb : 00 -> 04   (octal)
 9221 160 120      # 0x403004 : 'p' -> 'P' (octal)
```

Le cas « KO » est l'original / l'unpacké non patché (`Not patched!`). Les captures d'écran ne sont pas fournies : la preuve est la sortie console sous `xvfb-run -a wine`.

## Notes

- Ni GDB, ni x64dbg, ni IDA n'ont été utilisés : analyse statique (`objdump`, `capstone`) + émulation `unicorn` + Wine.
- Le nom de section `SVKP` et la détection « AHTeam EP Protector » sont trompeurs : le vrai packer est **FSG** (stub dans les en-têtes).
- Le patch doit être appliqué sur l'image dépackée : patcher l'original packé n'est pas possible sur 1-2 octets (données compressées ; la chaîne est fragmentée dans le blob).
- `original/` n'est pas modifié : tout est produit sous `analysis/`.
