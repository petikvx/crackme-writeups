# CrackNotMe's ASMe (ASM CrackMe)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/69ff482c8fab7bbca273011e) · id `69ff482c8fab7bbca273011e`

Crackme **PE32 GUI** Win32, écrit en **FASM** (~4 KiB).  
Auteur site : **CrackNotMe** · « ASMe | ASM CrackMe ».

Dossier : `authors/cracknotme/69ff482c8fab7bbca273011e/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/CrackMe.exe`](original/CrackMe.exe) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`tools/asme-solve.py`](tools/asme-solve.py) | hash / check / exemples de serials |

## Réponse

| Input | Valeur |
|---|---|
| Serial (exemples) | **`pXi8`** · **`5PDx`** (tout input de hash `0x350721c5`) |

```bash
python3 tools/asme-solve.py -q
# pXi8

python3 tools/asme-solve.py --check pXi8
# OK
```

Message succès : **Correct Key!** (titre *CrackMe*).

> Sous debugger visible le stub peut encore renvoyer 0 (*Wrong Key!*) à cause de `PEB.BeingDebugged` / `NtGlobalFlag` — tester **sans** debugger ou patcher le stub.

---

## 1. Premier regard

```text
file original/CrackMe.exe
# PE32 executable (GUI) Intel 80386
# diec : FASM 1.73 (PELock = faux positif fréquent sur ce style)
```

- Pas d’IAT classique : résolution d’API par **PEB walk** + hash (ROR 13).
- Strings UI chiffrées (XOR dword / clé).
- Anti-debug : `int3`+SEH, `div 0`, TLS callback, RDTSC, stub PEB.
- Description auteur : *« compares your input with a hardcoded string »* — en pratique le « string » est remplacé par une **cible de hash** + stub chiffré.

Hashes :  
MD5 `da730b281f8afbe19f6bd32f9db3ffa3` · SHA-256 `16aec18469633987b2d8c035a92ac14cfe4a5cfc9ca3237a6b7f56dfa56536df`.

---

## 2. Flow GUI

```text
RegisterClassEx / CreateWindowEx  (classe "PWNClass", titre "CrackMe by PWN")
WndProc @ 0x40164b
  WM_COMMAND, id 0x3ea (bouton) :
    GetWindowTextA(edit 0x3e9) → buffer 0x40204c
    si vide → exit
    push 0x4016b5 ; int3
      SEH (EXCEPTION_BREAKPOINT) → EIP = 0x401864  (vérif)
    retour 0x4016b5 :
      eax == 0     → MessageBox "Wrong Key!"
      eax != 0     → MessageBox "Correct Key!"  (texte XOR avec eax)
```

---

## 3. Magic FNV (TLS)

`.data` initialise `[0x402000] = 0xdfadbb2d`.

**TLS callback** `~0x40151b` (DLL_PROCESS_ATTACH) :

```asm
mov  eax, [0x402000]      ; 0xdfadbb2d
xor  eax, 0xdeadbabe
mov  [0x402000], eax      ; → 0x01000193  (prime FNV-1a)
```

Si anti-debug TLS échoue → `[0x402000] = 0x13371337` (hash faux).  
Si `NtQueryInformationProcess(ProcessDebugPort)` voit un debug port → `0x5a8e4c19`.

Le hash du serial utilise donc **`0x01000193`** sur un run propre.

---

## 4. Hash du serial

Après `int3`, routine `~0x401864` :

1. Checksum du `.text` (`0x401000`, longueur `0x9a5`) : `add` + `ror 7`.
2. `ebx = 0x811c9dc5` (après XOR avec constante / checksum qui s’annulent ici).
3. Pour **`0x4c4b40` rounds** (boucle lente — d’où la note « feels slow ») :
   ```c
   for (round = 0; round < 0x4c4b40; round++)
       for (each byte b of input)
           ebx = (ebx ^ b) * 0x01000193;   // 32-bit
   ```
4. `VirtualProtect` sur le stub `0x4019a5` (0x24 octets).
5. Déchiffrement rolling XOR/`rol 5`, puis **`call` stub**.
6. Ré-chiffrement ; `eax` = valeur de retour du stub.

**Cible** : `ebx == 0x350721c5` pour que le stub se déchiffre correctement.

```text
pXi8  →  0x350721c5
5PDx  →  0x350721c5
```

(Plusieurs préimages possibles ; le solveur liste des exemples.)

---

## 5. Stub déchiffré (`key = 0x350721c5`)

```asm
mov  eax, fs:[0x30]          ; PEB
cmp  byte [eax+2], 0         ; BeingDebugged
jne  fail
mov  eax, [eax+0x68]         ; NtGlobalFlag
and  eax, 0x70
test eax, eax
jne  fail
mov  eax, 0x6f4c8d22         ; succès
ret
fail:
xor  eax, eax
ret
```

- `0x6f4c8d22` = clé XOR des strings **Correct Key!** / **CrackMe**.
- Debugger avec PEB « sale » → `eax = 0` → *Wrong Key!* même avec le bon serial.

---

## 6. Vérification

```bash
cd authors/cracknotme/69ff482c8fab7bbca273011e
python3 tools/asme-solve.py
python3 tools/asme-solve.py --check pXi8
python3 tools/asme-solve.py --check 5PDx
python3 tools/asme-solve.py --pe original/CrackMe.exe
```

Live : lancer `CrackMe.exe` **hors debugger**, saisir `pXi8` ou `5PDx` → **Correct Key!**.

---

## 7. Notes

- « Hardcoded string » côté marketing : la contrainte réelle est un **hash 32-bit** + stub.
- `diec` / PELock : faux positif ; c’est du FASM + obfuscation maison.
- La boucle `0x4c4b40` est volontaire (CPU / anti-bruteforce naïf) ; un solveur hash en C/Python suffit.
- Opcode API hashing : ROR 13 + add (modules `kernel32` / `ntdll`, puis `LoadLibraryA("user32.dll")`, etc.).
