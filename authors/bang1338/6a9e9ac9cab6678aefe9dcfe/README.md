# bang1338's Oops! All sarr

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a9e9ac9cab6678aefe9dcfe) · id `6a9e9ac9cab6678aefe9dcfe`

Crackme **Windows** PE64 GUI, C/C++ + obfuscation lourde.  
Auteur site : **bang1338**. Difficulty **Hard** (readme auteur).

Dossier : `authors/bang1338/6a9e9ac9cab6678aefe9dcfe/` · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/sar.exe`](original/sar.exe) | PE32+ GUI x86-64 (challenge) |
| [`original/Oops_All_sarr_-_bang1338.zip`](original/Oops_All_sarr_-_bang1338.zip) | archive site |
| [`analysis/readme-author.md`](analysis/readme-author.md) | consignes auteur |
| [`analysis/NOTES.md`](analysis/NOTES.md) | notes techniques brutes |
| [`analysis/encrypted_50eb0.bin`](analysis/encrypted_50eb0.bin) | blob RVA `0x50EB0` (on-disk) |
| [`analysis/decryptor.asm`](analysis/decryptor.asm) | dump objdump autour du decrypt |

## Status

**En cours** — reverse partiel, **pas** de flag / code valide encore.

- [x] scaffold + extract
- [x] premier regard (Wine + x64dbg)
- [~] prédicat / decrypt runtime
- [ ] solveur
- [ ] write-up final + index « solved »

## Réponse

*À compléter.* Usage annoncé :

```text
sar.exe <code>
```

Exemple de titres de fenêtre observés (dépend du `<code>` / argc) :

| Situation | Titre fenêtre (classe `OopsAllSARsClass`) |
|---|---|
| sans arg / mauvais code (vu) | `Welcome to India, bhai!` |
| autre run Wine (mauvais code) | `sarr what are you saying?` |
| bon code | *inconnu — probablement le flag* |

---

## 1. Premier regard

```text
sar.exe : PE32+ executable (GUI) x86-64, stripped
sha256  12f7dbb5be9386b23767d4d31fb924187b820c2297ac46d3239c3492836896cd
```

- Imports **statiques** minimales : `KERNEL32` (`LoadLibraryA`, `GetProcAddress`, `GetModuleHandleA`, `MultiByteToWideChar`) — le reste est résolu dynamiquement.
- `.text` ~360 KiB avec **~60 000** `sar` → thème du crackme (*Oops! All sarr*).
- Presque **aucune** string utile on-disk (strings construites / zone déchiffrée au runtime).
- Règles auteur : pas de patch, pas de loader, pas d’émulation Unicorn ; debug / keygen OK (keygen « useless »).

---

## 2. Flow (observé)

1. Résolution API via `GetProcAddress` (kernel32 / user32 / gdi32 / shell32…).
2. `CommandLineToArgvW` → argv ; conversion ANSI du `<code>` (`WideCharToMultiByte`).
3. **`VirtualProtect(base+0x50EB0, 0x7110, PAGE_EXECUTE_READWRITE)`** puis boucle de déchiffrement in-place, puis `FlushInstructionCache`, puis `VirtualProtect` → RX.
4. GUI : `RegisterClassExW` / `CreateWindowExW` / message loop ; dessin via `DrawTextW` + primitives GDI.

Sous **Wine**, sans display correct la boucle message peut rester bloquée ; avec X/relay on voit bien la création de fenêtre.

Sous **x64dbg** : masquer `PEB.BeingDebugged` (sinon risque de chemin opaque / hang). Relancer avec une vraie cmdline, ex. :

```text
InitDebug "C:\Users\petik\Desktop\sar.exe", "TESTCODE"
```

(`LoadBinary` MCP n’avait pas toujours propagé les arguments — vérifier `GetPEB` → `CommandLine`.)

---

## 3. Decryptor (statique, partiel)

Adresse préférée (ImageBase `0x140000000`) : région **`0x140050EB0` … +`0x7110`**.

Après `VirtualProtect` OK (approx.) :

- `rsi` = début de la région, `rdi` = fin, `r15 = rdi - rsi`
- seed : `eax = 0x73617272` (`"sarr"` little-endian)
- boucle `rcx = 0 .. r15-1` (noyau utile, hors opaque SAR) :

```text
edx = eax
eax = (eax << 5) ^ edx          ; 32-bit
eax ^= 0x9D
[buf + rcx] ^= al
rcx++
```

La reconstruction **seule** de ce keystream sur le blob on-disk **ne produit pas** encore du x86 lisible → il manque probablement un mix avec le `<code>`, ou une étape opaque mal simplifiée.  
**Prochaine étape** : dump live `base+0x50EB0` **après** le `FlushInstructionCache` (BP `sar+0x59380` / XOR `sar+0x58E5D`) sous x64dbg, puis disasm + strings du blob déchiffré.

Dump on-disk : [`analysis/encrypted_50eb0.bin`](analysis/encrypted_50eb0.bin).  
Listing decryptor : [`analysis/decryptor.asm`](analysis/decryptor.asm).

---

## 4. APIs résolues par le crackme (thread principal)

`GetCommandLineW`, `CommandLineToArgvW`, `WideCharToMultiByte`, `VirtualProtect`, `FlushInstructionCache`, `GetCurrentProcess`, `RegisterClassExW`, `CreateWindowExW`, `ShowWindow`, `UpdateWindow`, `GetMessageW` / `TranslateMessage` / `DispatchMessageW`, `BeginPaint` / `EndPaint`, `GetClientRect`, `DrawTextW`, `FillRect`, `DefWindowProcW`, `PostQuitMessage`, GDI (`CreateSolidBrush`, `CreatePen`, `Ellipse`, `MoveToEx`, `LineTo`, `SetBkMode`, `SetTextColor`, …), `ExitProcess`.

---

## 5. Session x64dbg (2026-09-07)

- ImageBase live typique : `0x7FF76BD40000` (ASLR).
- Atteint la zone resolve API (`RVA 0x2C1FF`) après patch PEB.
- `CreateWindowExW` vu avec classe `OopsAllSARsClass` et titre `Welcome to India, bhai!` (sans / mauvais code).
- MCP HTTP a coupé en cours de session — à reprendre : F9 jusqu’au BP decrypt / Flush, puis dump mémoire.

---

## 6. Pistes pour la suite

1. Dump `sar+0x50EB0` post-decrypt sous x64dbg (MCP stable).
2. Confirmer le keystream (rôle exact du `<code>` dans `eax` / longueur).
3. Identifier le prédicat qui choisit le titre / le texte `DrawTextW` → flag.
4. Solveur + preuve Wine/x64dbg + `status: solved` + index.
