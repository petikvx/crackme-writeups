# bang1338's Oops! All sarr

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a9e9ac9cab6678aefe9dcfe) · id `6a9e9ac9cab6678aefe9dcfe`

Crackme **Windows PE64 GUI**, C/C++ + obfuscation massive (`sar` / prédicats opaques).  
Auteur : [bang1338](https://crackmes.one/user/bang1338) · difficulté site **4.0** (readme auteur : Hard).

Dossier : `authors/bang1338/6a9e9ac9cab6678aefe9dcfe/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/sar.exe`](original/sar.exe) | binaire d’origine |
| [`analysis/readme-author.md`](analysis/readme-author.md) | consignes auteur |
| [`analysis/encrypted_50eb0.bin`](analysis/encrypted_50eb0.bin) | blob RVA `0x50EB0` (on-disk) |
| [`analysis/decrypted_50eb0.bin`](analysis/decrypted_50eb0.bin) | même région après keystream |
| [`analysis/decryptor.asm`](analysis/decryptor.asm) | objdump autour du decrypt |
| [`analysis/wine-verify-spoiler.log`](analysis/wine-verify-spoiler.log) | preuve Wine `+relay` |
| [`tools/oops-sarr-solve.py`](tools/oops-sarr-solve.py) | code / flag / decrypt / `--check` |

## Réponse

```text
sar.exe <code>
```

| | |
|---|---|
| **Code** | `sarr_pls_obfuscate_saarrr_123` |
| **Flag** (DrawText) | `FLAG{sarr_this_thing_is_2_insane_}` |
| Titre fenêtre OK | `SAAAR DO NOT REDEEM WHY DID YOU REDEEM IT` |

```bash
python3 tools/oops-sarr-solve.py -q
# sarr_pls_obfuscate_saarrr_123
python3 tools/oops-sarr-solve.py --flag
xvfb-run -a wine original/sar.exe 'sarr_pls_obfuscate_saarrr_123'
# preuve relay : python3 tools/oops-sarr-solve.py --check
```

Titres observés (classe `OopsAllSARsClass`) :

| Situation | Titre |
|---|---|
| pas d’argument | `Welcome to India, bhai!` |
| mauvais code | `sarr what are you saying?` |
| **bon code** | `SAAAR DO NOT REDEEM WHY DID YOU REDEEM IT` + flag à l’écran |

---

## 1. Premier regard

```text
sar.exe : PE32+ executable (GUI) x86-64, stripped
sha256  12f7dbb5be9386b23767d4d31fb924187b820c2297ac46d3239c3492836896cd
```

- Imports statiques minimales (`LoadLibraryA` / `GetProcAddress` / …) ; le reste est résolu dynamiquement.
- `.text` plein de `sar` → thème *Oops! All sarr*.
- Règles auteur : debug OK, **pas** de patch / loader / Unicorn ; keygen « useless » (code fixe).

---

## 2. Flow

1. Resolve API (kernel32 / user32 / gdi32 / shell32…).
2. `GetCommandLineW` → `CommandLineToArgvW` → ANSI du `<code>`.
3. `VirtualProtect(base+0x50EB0, 0x7110, RWX)` → **decrypt in-place** → `FlushInstructionCache` → RX.
4. GUI : `RegisterClassExW` / `CreateWindowExW` / message loop ; texte via `DrawTextW`.

Le prédicat (bon / mauvais code) vit **dans** la région déchiffrée (toujours aussi obfuscée). Le keystream de decrypt **ne dépend pas** du `<code>`.

---

## 3. Decryptor (corrigé)

Seed : `eax = 0x73617272` (`"sarr"` LE). Boucle utile (hors opaque) :

```text
edx = eax
edx = SAR32(edx, 3)          ; ← manquait dans les NOTES initiales
eax = (eax << 5) ^ edx
eax ^= 0x9D
[buf + rcx] ^= al
```

Avec ce `SAR`, le blob on-disk devient du x86-64 cohérent (prologue `push r15…`, épilogue `pop…`).

```bash
python3 tools/oops-sarr-solve.py --decrypt
# → analysis/decrypted_50eb0.bin
```

---

## 4. Vérification (Wine)

Sous Xvfb, `WINEDEBUG=+relay` :

```text
CreateWindowExW(..., L"OopsAllSARsClass",
                L"SAAAR DO NOT REDEEM WHY DID YOU REDEEM IT", ...)
MultiByteToWideChar(..., "FLAG{sarr_this_thing_is_2_insane_}", ...)
DrawTextW(..., L"FLAG{sarr_this_thing_is_2_insane_}", ...)
```

Log : [`analysis/wine-verify-spoiler.log`](analysis/wine-verify-spoiler.log).

Contraste : `WRONG` → titre `sarr what are you saying?` ; sans argv → `Welcome to India, bhai!`.

---

## 5. Notes

- Les spoilers publics crackmes.one donnaient déjà le code / le flag ; confirmés ici en live Wine (pas seulement cités).
- Anti-debug / opaque `sar` : sous Wine masquer PEB n’a pas été nécessaire pour atteindre la GUI sur cette machine.
- Pas de keygen : le code est une constante ; le solveur se contente de l’émettre + de rejouer le decrypt.
