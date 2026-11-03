# UTW Crackme v2 (rootsec / otromasf) — crackmes.de mirror

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3e5`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3e5) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (crackme signé *otromasf / UTW & CSec*) |
| **Plateforme** | Windows PE32 GUI, **VB6 natif**, packé **FSG 2.0** |
| **SHA-256 (zip)** | `c7dbfd0bd065c6e85812b08a9d2cbdaa6cd2c989b412b773f27047fe01e5eb9b` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/UTW_Crackme_v2.zip` | archive d'origine (`Crackme.exe` + `READ ME.txt`) — non modifiée |
| `tools/utw-crackme-solve.py` | solveur (`-q`, `--check <zip>` = preuve Wine) |
| `tools/fsg-unpack-unicorn.py` | unpack FSG par émulation unicorn (dump + IAT reconstruite) |
| `tools/wine-drive.sh` | pilote Wine + Xvfb + xdotool (saisie + clic + capture) |
| `analysis/crackme-unpacked-dump.bin` | image mémoire 0x400000–0x409000 après le stub FSG |
| `analysis/iat.json` | IAT reconstruite (adresse → API MSVBVM60) |
| `analysis/screenshot-ok.png`, `screenshot-ko.png` | preuve live |

## Réponse

Le crackme n'est **pas** un name→serial : le User et la Key sont **fixes** (le `READ ME` dit « Find User & Key »). L'exemple `petik` ne s'applique donc pas (il est refusé, voir Vérification).

| Champ | Valeur |
|---|---|
| **User** | `UTW` |
| **Key** | `U85T84W87` |

```bash
python3 tools/utw-crackme-solve.py            # User: UTW / Key : U85T84W87
python3 tools/utw-crackme-solve.py --check original/UTW_Crackme_v2.zip   # preuve Wine/xvfb
```

## Premier regard

```
$ unzip original/UTW_Crackme_v2.zip -d /tmp/utw     # mot de passe zip du site : crackmes.one (ici non requis)
$ file /tmp/utw/Crackme.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386, 2 sections
$ diec /tmp/utw/Crackme.exe
Packer: FSG(2.0)
```

- 2 sections seulement, entry point `0x400154` **dans les en-têtes** : c'est le stub FSG.
- Imports visibles : `LoadLibraryA` / `GetProcAddress` uniquement (le reste est reconstruit par le stub).
- `strings` n'apprend rien d'utile (le packer a tout compressé) ; le `.rsrc` (non packé) donne juste « UTW Crackme 2.0 by otromasf ».

## Flow

Fenêtre « UTW Crackme by otromasf » : deux `TextBox` (défauts `User` et `Key`), boutons **Check It!** et **Exit**. Si les deux champs sont bons → `MsgBox "Congratulations!!!!!"`. Sinon : rien (aucun message d'erreur). Le crackme tue aussi `OLLYDBG.EXE` / `idag.exe` via WMI (`winmgmts:` / `Win32_Process` / `Terminate`), sans effet pour la preuve Wine ni pour l'analyse statique.

## Comment on trouve

### 1. Unpack FSG sans debugger (unicorn)

Le stub FSG commence en `0x400154` (`xchg esp,[0x408b98]; popa; …` = décompresseur LZ). Il se termine par une boucle d'imports qui appelle `LoadLibraryA` (`[ebx+0x10]`) / `GetProcAddress` (`[ebx+0x14]`) puis `jmp [ebx+0xc]` = OEP.

`tools/fsg-unpack-unicorn.py` : map du PE à `0x400000`, entry `0x400154`, et deux « API » factices en `0x70000000` / `0x70000100` (IAT initiale `0x408bac`) qui renvoient des pointeurs bidon mémorisant le nom demandé. On stoppe dès qu'un `eip` tombe dans la section de code décompressée (`0x401000-0x407000`) :

```
GPA __vbaStrCopy … GPA __vbaFreeStr
OEP 0x4012b0
```

L'OEP `0x4012b0` est le `push 0x401d94 ; call ThunRTMain` classique d'un EXE VB (`0x401d94` = `VB5!` header). La liste de `GPA` donne tout l'import MSVBVM60 : on stocke l'IAT reconstruite dans `analysis/iat.json` pour annoter le désassemblage (`__vbaVarCat`, `__vbaVarTstEq`, `__vbaStrVarMove`, …). Les imports ordinaux (`ord608`, `ord595`…) sont résolus par les numéros d'export de MSVBVM60 (`ord608` ≈ `rtcVarFromChr`-like : `(var, code)` → Variant string d'un caractère ; `ord595` = `rtcMsgBox`).

### 2. Code natif, pas du p-code

`VB5!` → `ObjectTable` → méthodes. Le code est de l'**x86 natif** (prologue `push ebp; mov ebp,esp; …` de `0x402a10`). Le handler de `Command1_Click` est à **`0x402a10`**, l'anti-debug WMI à `0x4030a0`.

```bash
objdump -D -b binary -m i386 -M intel --adjust-vma=0x400000 \
        --start-address=0x402ac0 --stop-address=0x402f70 analysis/crackme-unpacked-dump.bin
```

### 3. Lecture du handler (`0x402a10`)

```asm
; lecture des deux TextBox (vtable de la form : +0x308 / +0x304 puis Text = vtable+0xa0)
402ac4  call [edx+0x308]  ; Text1 (User)   -> Variant [ebp-0x34]   (via __vbaVarMove)
402b24  call [eax+0x304]  ; Text2 (Key)    -> Variant [ebp-0x24]
```

Puis la **construction des valeurs attendues**, caractère par caractère :

```asm
402b87  mov esi,[ord608]
402b8a  push 0x55 ; lea ecx,[ebp-0x4c] ; push ecx ; call esi   ; var4c = "U"
402b92  push 0x54 ; … [ebp-0x5c] ; call esi                     ; var5c = "T"
402b9a  push 0x57 ; … [ebp-0x7c] ; call esi                     ; var7c = "W"
402bba  call __vbaVarCat … call __vbaVarCat                     ; concat des 3
402bcb  __vbaStrVarMove → __vbaStrMove → __vbaStrCopy [ebx+0x38]   ; chaîne attendue "User" (membre de la form)
```

Même schéma pour la key, avec 9 caractères poussés dans l'ordre `0x55 0x38 0x35 0x54 0x38 0x34 0x57 0x38 0x37` puis 8 `__vbaVarCat` et copie dans `[ebx+0x34]` :

```
0x55 'U'  0x38 '8'  0x35 '5'  0x54 'T'  0x38 '8'  0x34 '4'  0x57 'W'  0x38 '8'  0x37 '7'
→ "U85T84W87"
```

Les codes sont des immediates `push 0x55` etc. : pas de `strings` possible (ce ne sont pas des littéraux), il faut lire les `push imm8` consécutifs. Les valeurs ASCII donnent `UTW` (le nom du groupe) et `U85T84W87` (même idée : U-8-5-T-8-4-W-8-7, `UTW` entrelacé de `857`, `848`, `87`).

Enfin la comparaison :

```asm
402d9b  Text1 (ebp-0x34)  __vbaVarTstEq  vs  [ebp-0x1b0]=[ebx+0x38]  -> sinon saute en 0x402ec9 (rien)
402dc4  Text2 (ebp-0x24)  __vbaVarTstEq  vs  [ebx+0x34]
402de8  __vbaNew2 … ; appel vtable +0x64 avec "UTW Crackme" (titre)  ; puis
402e79  var = L"Congratulations!!!!!"  ; ord595 (MsgBox)
```

Les deux `je 0x402ec9` sautent par-dessus la MsgBox : User **et** Key doivent être égaux (comparaison Variant-string : sensible à la casse en pratique, `Option Compare Binary` par défaut).

### 4. Piège : ordre de la concaténation

À la lecture brute de `__vbaVarCat(res, a, b)` poussé en cdecl (droite→gauche), j'ai d'abord compris l'ordre **inversé** (`WTU` / `78W48T58U`). Le test live l'a réfuté ; c'est la preuve Wine qui tranche : `UTW` / `U85T84W87` (ordre des `push`) déclenche la MsgBox, les variantes inversées/mixtes non. D'où l'importance de **tester** les 4 combinaisons plutôt que de conclure sur la lecture statique d'un `VarCat` imbriqué.

## Prédicat consolidé

```
OK  <=>  Text1.Text == "UTW"  &&  Text2.Text == "U85T84W87"
```

## Debug / outils

Aucun GDB / x64dbg / IDA MCP utilisé : unpack par **émulation unicorn** + `objdump` + Wine/xdotool pour la preuve.

## Vérification

Preuve live sous Wine (Xvfb + xdotool, `tools/wine-drive.sh`), binaire d'origine (extrait du zip, toujours packé FSG) :

```
$ python3 tools/utw-crackme-solve.py --check original/UTW_Crackme_v2.zip
'UTW' 'U85T84W87' -> MessageBox Congratulations
'petik' 'abc' -> rien
```

| Cas | Capture |
|---|---|
| OK `UTW` / `U85T84W87` → MsgBox « Congratulations!!!!! » | [`analysis/screenshot-ok.png`](analysis/screenshot-ok.png) |
| KO `petik` / `abc` → aucune MsgBox | [`analysis/screenshot-ko.png`](analysis/screenshot-ko.png) |

Essais complémentaires (même script) : `UTW`+`78W48T58U`, `WTU`+`U85T84W87`, `WTU`+`78W48T58U` → pas de MsgBox.

## Notes

- Pas de name→serial : User/Key constants (l'exemple `petik` n'est pas utilisable ici).
- La seule difficulté est l'unpack FSG (résolu sans debugger) ; ensuite le check est un `==` sur des chaînes reconstruites.
- `READ ME.txt` : « No patching allowed – Find User & Key » — aucun patch fait ; `original/` intact (zip).
