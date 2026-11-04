# derokos_crackme_2 by deroko (crackmes.de)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c402`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c402) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (deroko) |
| **Plateforme** | Windows PE32 GUI (dialogue), TASM32 / Turbo Linker 2.25 |
| **SHA-256 (zip)** | `061fe3b814a63e36143da04dbb5ee17982c5d527fed8e345db2848c7681de956` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme.zip` | archive d'origine (pw `crackmes.one`) : `crackme.EXE`, `readme.txt`, `crackme_src.rar` (jamais modifiée) |
| `tools/derokos2-solve.py` | solveur : lit les constantes du prédicat déchiffré, inverse, `--check` (Unicorn + RAR) |
| `analysis/predicate-dec.bin` / `.asm` | prédicat (VA `0x4012e8`–`0x40135b`) déchiffré par XOR `0xde` |

## Réponse

`readme.txt` : *« Find key for RAR… »* — la clé est le **mot de passe du RAR** `crackme_src.rar` (14 caractères, `XXXX-XXXX-XXXX`).

> **`TRAP-FLAG-OWNZ`**

```bash
python3 -I tools/derokos2-solve.py -q      # TRAP-FLAG-OWNZ
python3 tools/derokos2-solve.py --check    # OK emu=True rar=True  (sans -I : unicorn est installé en user-site)
```

Pas de user/login dans ce challenge (donc pas de `petik`).

## Premier regard

```text
$ file crackme.EXE   -> PE32 executable (GUI), Intel i386, 5 sections
$ diec               -> Linker Turbo Linker 2.25, Compiler TASM32
$ strings            -> "crackme by deroko", "find key and open src files with it",
                        "congrats", "You have found the right key / Enjoy in supplied sources",
                        "Wrong key, try again dude"
$ 7z l crackme_src.rar -> "Enter password" : en-têtes RAR chiffrés
```

Les en-têtes du RAR sont chiffrés : un mauvais mot de passe empêche même de **lister** l'archive, ce qui donne un oracle sans extraire (`7z l -pCLE`). Aucune chaîne de la clé n'apparaît dans `strings`.

## Flow

`DialogBoxParamA(0x7d0)` avec la DlgProc en `0x401027`. Sur `WM_COMMAND` (`0x111`), bouton OK (`id 1`) :

```asm
4011c9 push hwnd ; push 0x402008 ; push 0x100 ; GetDlgItemTextA   ; texte -> 0x402008
4011d1 cmp  eax, 0x0e          ; longueur exactement 14
4011d6 call 0x4012ca           ; prédicat (renvoie eax==0 si OK)
4011db test eax,eax / jne wrong
       -> "congrats" / "You have found the right key..."   sinon "Wrong key, try again dude"
```

## Comment on trouve la clé

**Ancrage** : `objdump -d -M intel --start-address=0x401000 --stop-address=0x401a00 crackme.EXE`. La fonction `0x4012ca` :

```asm
4012ca xor edx,edx
4012cc push 0x40138b           ; handler SEH
4012d1 push fs:[edx] ; mov fs:[edx],esp
4012d7 xor eax,eax ; or eax,0x100 ; push eax ; popf   ; TF=1 -> trap flag (single-step)
4012e0 jmp 0x4012e8            ; suite = "bytes poubelle" illisibles
```

Le code à partir de `0x4012e8` est du bruit en désassemblage statique : il est **chiffré**. Le handler `0x40138b` (appelé pour chaque `EXCEPTION_SINGLE_STEP = 0x80000004`) :

1. localise l'image (`ebx+0xb8` = Eip, recherche de la signature) ;
2. **re-chiffre** l'instruction précédente (`xor byte [..], cl` avec `cl = [ebp+0x142]`) ;
3. copie 16 octets à l'Eip, les XOR avec la clé, appelle un **désassembleur de longueur** (`0x4014e8`, table + `cmp cl,0xf6/0xf7`…) ;
4. **déchiffre** `len` octets in situ (`xor [edi+eax], dl`) et remet TF — donc une seule instruction en clair à la fois (anti-dump / anti-trace).

La clé XOR `[ebp+0x142]` = `[0x4014e7]` = `0xde` (ebp = `0x4013a5` après `call $+5 ; pop ebp`, + `0x142`). Comme chaque octet est XORé indépendamment, on peut tout déchiffrer **statiquement** (`.text` raw `0x600`) :

```python
d = open('crackme.EXE','rb').read()
s = 0x4012e8-0x401000+0x600
open('dec.bin','wb').write(bytes(x^0xde for x in d[s:s+0x74]))
# objdump -D -b binary -m i386 -M intel --adjust-vma=0x4012e8 dec.bin  -> analysis/predicate-dec.asm
```

Piège : l'offset fichier est `0x600` (pas `0x400`), sinon on déchiffre des zéros (`0xde`).

**Prédicat en clair** (extraits commentés) :

```asm
4012e8 mov esi,0x402008           ; saisie
4012ed mov eax,1                  ; résultat = KO par défaut
4012f2 cmp byte [esi+4],'-'  ; jne ko
4012f8 cmp byte [esi+9],'-'  ; jne ko        ; format XXXX-XXXX-XXXX
...  (boucles loop 0x40 xor dl/rol edx,7 : edx n'est jamais testé = leurre)
40130a mov ebx,[esi]   ; rol ebx,16 ; not ebx ; cmp ebx,0xadabafbe
401326 mov ebx,[esi+5] ; xor ebx,0x6c666f72 ; not ebx ; cmp ebx,0xd4d8dccb
401346 mov ebx,[esi+0xa] ; rol ebx,16 ; cmp ebx,0x574f5a4e
401354 xor ebx,ebx / xor edx,edx / xor ecx,ecx / xor eax,eax   ; OK => eax=0
```

**Inversion** (chaque bloc de 4 caractères = un dword LE) :

| Bloc | Test | Inverse | Octets LE |
|---|---|---|---|
| `[0..3]` | `not(rol16(x)) == 0xadabafbe` | `x = ror16(~0xadabafbe) = 0x50415254` | `54 52 41 50` = **TRAP** |
| `[5..8]` | `not(x ^ 0x6c666f72) == 0xd4d8dccb` | `x = ~0xd4d8dccb ^ 0x6c666f72 = 0x47414c46` | `46 4c 41 47` = **FLAG** |
| `[10..13]` | `rol16(x) == 0x574f5a4e` | `x = ror16(0x574f5a4e) = 0x5a4e574f` | `4f 57 4e 5a` = **OWNZ** |

Assemblage : `TRAP` + `-` + `FLAG` + `-` + `OWNZ` = `TRAP-FLAG-OWNZ` (14 car., les `-` en 4 et 9). Le nom est un clin d'œil à la technique : *TRAP flag*.

## Vérification

- **Émulation du code d'origine** (Unicorn) : le prédicat déchiffré (octets du `crackme.EXE` ⊕ `0xde`) est exécuté de `0x4012e8` à `0x40135c` avec la saisie en `0x402008` : `TRAP-FLAG-OWNZ` → `eax == 0` (OK) ; `WRONG-FLAG-XXXX`, `trap-flag-ownz` → `eax == 1` (KO).
- **RAR** : `7z l -pTRAP-FLAG-OWNZ crackme_src.rar` liste `crackme_src/crackme.asm`, `runtime.c`, `crackme.res`… ; `-pWRONG-FLAG-XXXX` → *Cannot open encrypted archive. Wrong password?*. (Contenu non extractible ici : `7z` répond *Unsupported Method* sur la méthode de compression, `unar` ne gère pas les en-têtes chiffrés — la liste des noms suffit comme preuve.)

```text
$ python3 tools/derokos2-solve.py --check
OK emu=True rar=True TRAP-FLAG-OWNZ
```

## Notes

- **Wine ne valide pas le test en live** : `xvfb-run -a wine crackme.EXE`, GUI OK et `GetDlgItemTextA` renvoie bien `0xe` (14), puis Wine meurt (`err:virtual:virtual_setup_exception stack overflow`) dès que le TF déclenche le premier `EXCEPTION_SINGLE_STEP` : le mécanisme de trap-flag n'est pas géré correctement. Une clé de longueur ≠ 14 (chemin sans TF) affiche normalement « Wrong key ». D'où la preuve par émulation + oracle RAR plutôt que par Wine.
- Pas de GDB ni de debugger MCP actif sur cette cible (analyse statique + Unicorn).
- Les boucles `xor dl,[esi]` / `rol edx,7` ne participent pas au verdict (leurres).
