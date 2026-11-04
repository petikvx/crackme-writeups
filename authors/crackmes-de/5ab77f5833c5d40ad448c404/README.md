# crackmes.de's x64_unpackme by deroko

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c404`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c404) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (deroko of ARTeam) |
| **Plateforme** | Windows PE32+ (x86-64), GUI, packer maison, 2 sections sans nom |
| **SHA-256 (zip)** | `7b291683bec61ffb9604c5ad298806960e4afbe25a96e47c08a1260dda1fe576` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/unpackme.zip` | archive d'origine (non modifiée) : `packed.exe` + `readme.txt` |
| `analysis/packed.exe`, `analysis/readme-deroko.txt` | contenu extrait du zip |
| `analysis/unpackme.unpacked.exe` | image dépackée produite par le solveur |
| `tools/unpackme-solve.py` | **unpacker** hors-ligne (LZNT1 + reconstruction PE) |

## Réponse

Le « readme » ne demande pas de serial : *« Your task is to unpack it »*. Le livrable est donc un **unpacker** :

```bash
python3 -I tools/unpackme-solve.py original/unpackme.zip -o analysis/unpackme.unpacked.exe
# imports RVA=0x8a18 OEP=0x11dc compressed=0x6307 -> 0xe000
```

(Pas d'utilisateur/serial ici, donc pas d'exemple `petik`.)

## Premier regard

```bash
unzip original/unpackme.zip -d analysis/x   # mot de passe du site : crackmes.one (pour le zip du site)
file packed.exe        # PE32+ x86-64 GUI, 2 sections
objdump -h packed.exe  # section 0 : RVA 0x1000, taille fichier 0 ; section 1 : RVA 0xf000, 0x6800 octets
objdump -x packed.exe  # EP = 0x14000f080
```

- Section 0 : `VirtualSize 0xe000` vide sur disque (réservée pour la décompression, RVA `0x1000`).
- Section 1 (RVA `0xf000`, fichier `0x400`) : **contexte** (0x80 octets) + stub + données compressées.
- Les data directories gardent les infos de l'exe d'origine (IAT `0x7000`, debug `0x7250`, pdata `0xd000`, rsrc `0xe000`), mais l'import directory est mis à `0` (la table réelle est cachée dans le contexte).
- `strings` ne donne rien d'utile (les `5ab77f…` sont des IDs de catalogue ; données compressées).

## Flow du stub (EP `0x14000f080`)

1. `lea rbp,[rip-0x87]` → `rbp` = base du contexte (`0x14000f000`).
2. Trois mini-routines lisent le PEB (`gs:0x60`) : base de **ntdll** (`LDR` → 2ᵉ module), base de **kernel32** (3ᵉ), et **ImageBase** (`PEB+0x10`).
3. Résolution d'API par **hash** (`0x14000f147`) : parcours de l'export table, hash = `rol eax,7 ; xor al,octet` sur le nom (comparé à `edx`). 5 hash de kernel32 (table `0x14000f133`) + 1 de ntdll (`0x9daf495f`) sont stockés dans `[rbp+0..0x28]`.
4. Les champs RVA du contexte (`+0x30,+0x58,+0x78,+0x40`) sont relogés en ajoutant l'ImageBase.
5. `VirtualAlloc(0, [ctx+0x50], MEM_COMMIT, PAGE_READWRITE)` puis
   `RtlDecompressBuffer(0x102, buf, [ctx+0x50], [ctx+0x78], [ctx+0x48], &out)` : format `0x102` = `COMPRESSION_FORMAT_LZNT1 | COMPRESSION_ENGINE_MAXIMUM`.
6. Copie du résultat vers `ImageBase+[ctx+0x58]` (`rep movsb`), `VirtualFree`.
7. Boucle sur les descripteurs d'import à `ImageBase+[ctx+0x30]` (stride `0x14`) : `LoadLibraryA(name)`, puis pour chaque thunk `GetProcAddress` (`btr rax,0x3d` teste/efface le bit 61 du thunk ; s'il est posé le reste est passé tel quel à `GetProcAddress`, sinon thunk = RVA d'un `IMAGE_IMPORT_BY_NAME`, +2 pour sauter le hint) et `VirtualProtect` de la page de l'IAT.
8. `jmp [rbp+0x40]` = **OEP** `ImageBase+0x11dc`.

## Comment on trouve les paramètres

- **Ancrage** : `objdump -d -M intel --start-address=0x14000f080 packed.exe` ; le code est lisible (stub non chiffré). Le début du fichier section 1 (`xxd -s 0x400 -l 0x80`) montre le contexte :

```text
+0x30 = 0x00008a18   import directory (RVA)
+0x40 = 0x000011dc   OEP (RVA)
+0x48 = 0x00006307   taille des données compressées
+0x50 = 0x0000e000   taille décompressée
+0x58 = 0x00001000   RVA de destination
+0x78 = 0x0000f301   RVA des données compressées (fichier 0x701)
```

- **Décodage** : le mapping offset→usage se déduit des instructions : `[rbp+0x18]` est appelé avec `r8=0x1000, r9=4` → `VirtualAlloc` ; `[rbp+0x20]` avec `r8=0x4000` (MEM_DECOMMIT) → `VirtualFree` ; `[rbp+0x28]` avec `rcx=0x102` → `RtlDecompressBuffer` ; `[rbp+0x10]` avec `r8=4` → `VirtualProtect` ; `[rbp+0]`/`[rbp+8]` → `LoadLibraryA`/`GetProcAddress`.
- **Pièges** : le premier module de la `InLoadOrder` est l'exe, d'où les chaînes `Ldr+0x30 → [..]` ; `Ldr+0x10` lit la DllBase. Le LZNT1 se réimplémente en ~25 lignes (chunks de 4 Kio, flags 8 symboles, découpe offset/longueur dépendant de la position dans le chunk : `lb = 12 − bits(pos−1)+4`), pas besoin de ntdll.
- **Assemblage** : le solveur lit le contexte, décompresse `0x6307` octets → `0xe000` (vérifié : taille exacte), place le résultat en RVA `0x1000`, remet EP = `0x11dc`, import dir = `0x8a18`, recrée 5 sections (`.text 0x1000`, `.rdata 0x7000`, `.data 0xa000`, `.pdata 0xd000`, `.rsrc 0xe000` — frontières déduites des data directories et du contenu), et aligne fichier = RVA pour simplifier.
- La table d'imports décompressée est cohérente (`KERNEL32.dll`, `USER32.dll`) : preuve que la décompression est correcte.

## Vérification

```bash
# dépacké : la fenêtre du crackme s'affiche
xvfb-run -a -s "-screen 0 1024x768x24" bash -c 'wine analysis/unpackme.unpacked.exe & sleep 12; xwininfo -root -tree | grep -v "has no name"'
#   "dbg check": ("unpackme.unpacked.exe") 139x63 …
```

- OK : l'exe dépacké tourne sous Wine et affiche une fenêtre « **dbg check** » (petit test anti-debug fait par le programme embarqué).
- Contrôle : analyse des imports (`KERNEL32.dll`, `USER32.dll`) et OEP `0x11dc` dans la section `.text` reconstruite, code en `.text` désassemblable.
- KO / edge : le `packed.exe` d'origine lancé directement sous Wine se termine sur un **« Program Error »** (winedbg) : le stub dépend de la disposition du PEB/Ldr Windows réelle (`Ldr+0x30` pour kernel32), différente sous Wine. Ce n'est donc pas une preuve utilisable côté packé ; la preuve est faite sur l'image dépackée.
- Pas de GDB ni de debugger MCP utilisés (analyse statique + Wine).

## Notes

- `FileAlignment` mis à `0x1000` dans la sortie (raw == RVA) ; la sortie est utilisable pour l'analyse statique et l'exécution mais n'est pas byte-identique à l'exe pré-packing (noms de sections, tailles virtuelles reconstruits).
- L'IAT est lue depuis le contexte ; sur disque, l'image dépackée garde les thunks tels quels (le loader Windows les résout normalement puisque l'import directory est restauré).
- Le hash de ntdll `0x9daf495f` correspond (par usage) à `RtlDecompressBuffer`.
