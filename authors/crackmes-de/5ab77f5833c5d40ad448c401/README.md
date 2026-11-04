# derokos_crackme_1 by deroko (crackmes.de)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c401`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c401) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (deroko) |
| **Plateforme** | Windows PE32 GUI, TASM32 / Turbo Linker, **sans table d'imports** |
| **SHA-256 (zip)** | `119f51d149ceac98cbe49a0c9a944a1070fe539137a0d8e8dd738fab20021355` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme.zip` | archive d'origine (pw `crackmes.one`) : `crackme.EXE`, `readme.txt`, `crackme_src.rar` |
| `tools/derokos-solve.py` | solveur : recalcule la clé depuis `crackme.EXE` et la teste sur le RAR |
| `analysis/stage1-stack.bin` / `.asm` | code exécuté « sur la pile » après le loader (dwords remis à l'endroit) |

## Réponse

Objectif (`readme.txt`) : *« Find correct key for RAR file and sources »* — la clé est le **mot de passe du RAR** `crackme_src.rar`.

> **`BrAiN_BuStEr_bY_dErOkO`**

```bash
python3 -I tools/derokos-solve.py          # RAR key : BrAiN_BuStEr_bY_dErOkO
python3 -I tools/derokos-solve.py --check  # OK (ouvre le RAR, "WRONGKEY" refusé)
```

Pas de user/login dans ce challenge (donc pas de `petik`).

## Premier regard

```text
$ diec crackme.EXE   -> PE32, Turbo Linker 2.25, TASM32
$ objdump -x         -> 3 sections CODE(0x800) DATA(0x200) .reloc, imports = 0, EP = 0x401000
$ strings            -> "derokos_zip_file" (DATA, 0x402000) -- leurre
$ file crackme_src.rar -> RAR, flags: EncryptedBlockHeader
```

Le RAR a ses **en-têtes chiffrés** : sans bon mot de passe on ne peut même pas lister les fichiers (`7z l` → *Cannot open encrypted archive*). C'est ce qui permet de valider une clé sans extraire. `derokos_zip_file`, `deroko`, `derokos` sont refusés.

Lancé sous Wine (`xvfb-run -a wine crackme.EXE`) il n'affiche qu'une MessageBox : la clé n'est **jamais** affichée, il faut la reconstruire.

## Flow

1. **Loader** (0x401000) : `mov esi,0x40101c ; mov ecx,0x1dc ; lodsd/push ; loop` — pousse 0x1dc dwords sur la pile (donc **dans l'ordre inverse**), `mov fs:[4],esp` puis `jmp esp` : le vrai code s'exécute sur la pile.
2. Le stage 1 (1904 octets) trouve kernel32 en remontant la chaîne SEH (`fs:[0]` → `0xffffffff`, balayage « MZ » vers le bas), résout les API par hash (`rol 7 / xor`), teste `PEB.BeingDebugged` (`fs:[30h]+2`), construit ses chaînes sur la pile (`"user32"`, `"It is not nice to trrace someones work"`, `"Did you find right key? Crackme"`).
3. Il se mappe lui-même (`GetModuleFileNameA`, `CreateFileA`, `CreateFileMappingA`, `MapViewOfFile`), parcourt les section headers jusqu'à celle qui contient l'EP, et copie **0x50 octets situés à `PointerToRawData + SizeOfRawData`** (= offset fichier `0xe00`, dans le « trou » entre CODE et DATA).
4. Un **décodeur polymorphe** (variantes de 0x20 octets choisies via `rdtsc`, copiées dans le slide de `nop` à 0x300) déchiffre ces 0x50 octets.
5. Les sauts conditionnels sont des **`int3` + octets de données** gérés par un handler SEH (0x342) : type 1/2 = saut si ZF=1/0, 3/4 = si CF=1/0, 5 = jmp ; déplacement dword relatif — anti-trace façon virus.

## Comment on trouve la clé

**Ancrage** : le loader est lisible tel quel (`objdump -d -M intel --start-address=0x401000`). Le blob poussé sur la pile est illisible car stocké à l'envers ; on le remet dans l'ordre :

```python
dw = struct.unpack('<%dI' % 0x1dc, d[0x600+0x1c : 0x600+0x1c+4*0x1dc])   # file off = 0x600 + (0x40101c-0x401000)
open('stage1.bin','wb').write(b''.join(struct.pack('<I',x) for x in reversed(dw)))
objdump -D -b binary -m i386 -M intel stage1.bin     # -> analysis/stage1-stack.asm
```

**Lecture du stage 1** (extraits) :

```asm
0x125  mov  ebx,eax ; add ebx,[ebx+3Ch]      ; PE header du fichier mappé
0x131  mov  esi,[ebx+28h]                    ; AddressOfEntryPoint
0x134  movzx ecx,word [ebx+6]                ; NumberOfSections
0x138  mov  edi,[eax+0Ch] ; cmp esi,edi ...  ; section dont VA/VA+size contient l'EP
0x153  mov  esi,[ebp+...mapbase]
0x159  add  esi,[eax+14h]                    ; + PointerToRawData
0x15c  add  esi,[eax+10h]                    ; + SizeOfRawData  -> 0xe00
0x174  mov  ecx,50h ; rep movsb              ; copie 0x50 octets
0x18d  call 2AFh                             ; choisit/copie un décodeur en 0x300
```

Les variantes du décodeur (visibles en 0x2d2 / 0x2e8) font, pour `ecx` décroissant :

```asm
sub byte [esi+ecx],0AAh
rol byte [esi+ecx],4
xor byte [esi+ecx],0DEh
```

**Décodage** : appliquer `b = rol8((b - 0xaa) & 0xff, 4) ^ 0xde` aux octets en `0xe00` :

```text
73 74 a3 25 b3 c2 73 64 82 54 63 74 c2 75 22 c2 55 63 74 c3 05 c3 ...
  -> "BrAiN_BuStEr_bY_dErOkO\0\0\0\0\0sdakjdskaljsdkajsdkjasjdaksjdkasurmn..." 
```

Le début est une C-string : `BrAiN_BuStEr_bY_dErOkO` (clin d'œil à *Brain Buster*). La suite (`sdakjdskalj…`, `DeR0k0…`) est du **bruit/leurre** : essayée comme mot de passe → RAR refusé. Les zones `0x1000`, `0x1e00`, `0x2000` sont des copies (le crackme contient des « mutations » de lui-même, comme un virus) ; `0x1e00` redonne la même chaîne.

**Pièges** : pas d'imports (donc `strings` ne montre rien d'utile) ; code sur la pile et dwords inversés ; `int3` qui sont des branchements, pas des breakpoints (un debugger/tracer les subit : message *« It is not nice to trrace someones work »*) ; `derokos_zip_file` est un faux indice.

## Vérification

```text
$ 7z l -pBrAiN_BuStEr_bY_dErOkO original-extrait/crackme_src.rar
 ... crackme_src/crackme.asm  15793 ... crackme_src/pkrng.inc ... 12 files, 2 folders
$ 7z l -pWRONGKEY crackme_src.rar
 ERROR: Cannot open encrypted archive. Wrong password?
$ python3 -I tools/derokos-solve.py --check   -> OK
```

Limites assumées : le crackme ne vérifie rien lui-même (pas de saisie), la « vérification contre le binaire » est donc : (1) la clé est dérivée par le solveur du `crackme.EXE` d'origine en reproduisant sa routine, (2) elle déchiffre bien l'en-tête du RAR fourni. `7z` ne gère pas la méthode de compression de ce vieux RAR (*Unsupported Method*) : le contenu des sources n'a pas été extrait, seule la liste (en-têtes chiffrés) valide la clé. Wine : exécution sans crash, MessageBox seule. Pas de session GDB/x64dbg (reverse statique du stage 1, pas de walkthrough inventé).

## Notes

- Ce n'est **pas** `derokos_zip_file`, ni les chaînes longues du blob.
- Le readme de l'auteur demande d'envoyer la clé par mail : sans objet ici.
