# deo's DEOBF ME

| | |
|---|---|
| **ID** | [`6af9c31f2c7537120cbe8b07`](https://crackmes.one/crackme/6af9c31f2c7537120cbe8b07) |
| **Auteur** | deo |
| **Plateforme** | Windows PE64 (MSVC 14.41), console |
| **SHA-256** | `d0638eda36d4ff8a7d266037936d7328265644561c128195d219c922ab33b6ef` |

Voir [`ORIGIN.yml`](ORIGIN.yml). Description du site : « teste l'analyse statique, pas de check d'entrée ; trouver les blobs chiffrés, inutile de les déchiffrer, les citer dans le write-up ».

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP (mdp `crackmes.one`) → `deob.bin` = ZIP → `deob/deob.exe` + 7 `.txt` leurres |
| `analysis/extracted/deob/` | extraction (`unzip -P crackmes.one`, puis `unzip`) |
| `analysis/stub-decrypted.bin` | blob déchiffré par le solveur |
| `tools/deo-deobf-solve.py` | localise + déchiffre le blob, `--check`, `-q` |

## Réponse

**Il n'y a pas de serial** : le programme affiche seulement `DEOBF ME` puis quitte. Le « flag » = les blobs chiffrés :

| Blob | Où | Détail |
|---|---|---|
| #1 chiffré | section `.a1jpc7M`, RVA `0xa1c080`, offset fichier `0xa17c80`, taille `0x828` (0x20a dwords), sha256 `8740bc33…43a9e` | déchiffré : loader (résolution d'imports par hash) + table de 43 entrées + noms de DLL |
| padding | `0xa184a8`–`0xa18600` (0x158 octets non nuls) | remplissage aléatoire de fin de fichier (non analysé) |

```bash
python3 tools/deo-deobf-solve.py --check
```

## Premier regard

- `file` absent ; `diec` : ZIP → extraire deux fois (zip dans zip). Les `.txt` (`883292747r4678…` répété, 1290 octets, tous identiques) sont des leurres.
- `deob.exe` : PE64, 10,5 Mo, `diec` MSVC. Sections : `.text` 0xc4ac, `.rdata`, `.data`, `.pdata`, `.rsrc`, **`.reloc` 0xa041fc (10 Mo, flags CODE)**, et **`.a1jpc7M`** (nom aléatoire) 0x8a8 qui contient l'entry point (`0x140a1c000`).
- `.rdata` : une seule chaîne utile, `DEOBF ME`. Aucune lecture de fichier/stdin (`WINEDEBUG=+file`).
- Wine : `xvfb-run -a wine deob.exe` → `DEOBF ME`, rc 0.

## Comment on trouve

1. **Entry point** `0x140a1c000` (`objdump -d --start-address`) : anti-debug (`PEB.BeingDebugged` → `int3`), saut dans une instruction (`je` +2 sur `xor eax,eax`, octets `8d 35 5f 00 00 00` à `0x140a1c01b` = `lea esi,[rip+0x5f]`), puis boucle :
   ```asm
   mov ecx,0x20a ; mov r8d,0x1fef3488 ; mov r9d,0x6595a395
   L: xor [rsi],r8d ; add r8d,r9d ; add rsi,4 ; dec ecx ; jne L
   jmp 0x140a1c080
   ```
   `rsi` = `0x140a1c021+0x5f` = `0x140a1c080` (début des données après la boucle) : 0x20a dwords = 0x828 octets, clé initiale `0x1fef3488` incrémentée de `0x6595a395` à chaque dword. Piège : le désassemblage linéaire décode `call 0xcde9f72f` au lieu du `lea` ; partir de 0x7f donne du bruit, 0x80 donne du code valide (cohérent avec le `lea`).
2. **Déchiffrement** (le solveur) : le résultat commence par `53 55 56 57 41 54…` (prologue push) → bon signe. Contenu : parcours de `PEB.Ldr` + hash ror13 (kernel32 `0x8fecd63f`, `LoadLibraryA`-like `0xec0e4e8e`), résolution de 43 imports du packer (table de 20 octets : `slot RVA, hash DLL, hash fonction, ordinal/…`), noms de DLL (`KERNEL32.dll`, `VCRUNTIME140.dll`, `api-ms-win-crt-*`, `ntdll.dll`), zérotage de la table, puis `ret` vers **OEP = ImageBase + (0x5a9ce56b ^ 0x5a9c2f17) = 0x14000ca7c**.
3. **`.text`** : `0x14000ca7c` → `call 0x14000ccd0` → CRT (`jmp 0x140018000...`). Les fonctions sont des trampolines `jmp` vers `.reloc`+0x1000…, soit ~10 Mo de code **muté** (paires `not/not`, `neg/neg`, `push/pop`, `add/sub` de constantes, `bswap/bswap`, `ror/rol`, préfixes `ds/ss`). C'est l'obfuscation « DEOBF ME » ; la vraie logique n'est qu'un affichage de `DEOBF ME`.
4. **Recherche d'autres blobs** : entropie par fenêtres de 1 Ko sur `.text/.rdata/.data/.reloc` : aucune fenêtre > 7,3 bits. Seuls hauts d'entropie : le blob #1 (7,91) et le padding de fin. Le bloc réel de relocations (`0xe000`, size `0x2c`) est le début de `.reloc`.

## Vérification

- Solveur : `python3 tools/deo-deobf-solve.py --check` → `CHECK OK` (préfixe `SU…`, `KERNEL32.dll` présent, OEP `0xca7c`).
- Binaire d'origine : `xvfb-run -a wine deob.exe` → `DEOBF ME`, rc 0 (preuve que le seul comportement est l'affichage ; le stub décrypté mène bien à l'OEP).
- KO / limites : il n'existe aucun cas d'entrée invalide (pas d'entrée). Je n'ai pas désobfusqué les 10 Mo de code muté, ni identifié d'autre blob chiffré que le stub : si l'auteur en attend d'autres, ils m'ont échappé.

## Notes

- Pas de GDB ni x64dbg utilisés (statique + Wine). IDA non utilisé (objdump suffisait).
- Aucun fichier de `original/` modifié ; extraction sous `analysis/`.
