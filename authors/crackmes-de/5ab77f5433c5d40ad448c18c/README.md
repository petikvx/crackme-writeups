# upxed by blueowl (crackmes.de / BlueOwl)

- **Page** : [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c18c) — publié le 2018-03-25, difficulté 2.0
- **Plateforme** : Windows PE32, FASM 1.60, packé UPX 1.24 « bidouillé »
- **Mission** : retrouver le mot de passe de mission (qui ouvre aussi `finish.zip`)

## Solution

**Mot de passe : `DREAMING_ABOUT_PACKING`** — vérifié : `7z t -pDREAMING_ABOUT_PACKING finish.zip` → `Everything is Ok`.

## Comment on trouve

1. `diec` : FASM + UPX 1.24. Le readme annonce anti-depacking (`upx -d`), anti-dump et anti-debug.
2. Sous wine (`WINEDEBUG=+relay`), le seul `MessageBoxA` affiche « Example of playing with UPX. » et il est appelé depuis la **pile** (`ret=0050ff18`) : le code final est copié puis exécuté sur la pile, et la section d'origine est effacée (anti-dump). Un dump mémoire pendant la MessageBox ne montre donc plus le mot de passe.
3. On émule alors le stub UPX avec **Unicorn** (`tools/crackmes-de-upxed-emu.py`) : mapping des sections PE, stubs pour `LoadLibraryA` / `GetProcAddress`, arrêt à l'OEP `0x401000`.
4. Anti-debug dans le stub (à `0x4050a6`) : `push 18h / pop eax / mov eax, fs:[eax] / mov eax,[eax+30h] / cmp byte [eax+2],1` = test `PEB.BeingDebugged`. Dans l'émulateur on remplace `mov eax, fs:[eax]` par un faux TEB/PEB à zéro. Si le flag vaut 1 → MessageBox « Debugged! ».
5. Le stub recopie 0x3f dwords de `0x4010e4` vers `0x401000` puis saute à l'OEP. Le code d'origine commence par :

```asm
mov  eax, 0x401040
sub  dword [eax],      0xBEBAADBC
sub  dword [eax+4],    0xB8B1B6B3
sub  dword [eax+8],    0xB0BDBEA1
sub  dword [eax+0Ch],  0xAFA0ABAB
sub  dword [eax+10h],  0xB6B4BCBF
sub  dword [eax+14h],  0xFFFFB8B2
; puis pousse 0x15 dwords sur la pile et jmp esp (code sur la pile,
; qui efface 0x401000.. avec rep movsd / rep stosd avant la MessageBox)
```

La zone `0x401040` étant à zéro, chaque dword vaut `-imm mod 2^32` → `DREAMING_ABOUT_PACKING` : c'est le mot de passe « affiché » (écrit en mémoire) juste avant le code du message, puis effacé.

## Protections rencontrées

- **Anti-depacking** : en-tête UPX modifié, `upx -d` donne un fichier piégé (`upx-d.asm` dans `finish.zip`).
- **Anti-dump** : code final exécuté sur la pile, section d'origine écrasée/zérotée → MessageBox « Dumped! » si on dumpe et relance.
- **Anti-debug** : `PEB.BeingDebugged` → « Debugged! ».

## Reproduire

```bash
python3 tools/crackmes-de-upxed-solve.py      # DREAMING_ABOUT_PACKING
python3 tools/crackmes-de-upxed-emu.py        # émulation Unicorn jusqu'à l'OEP + MessageBox
```
