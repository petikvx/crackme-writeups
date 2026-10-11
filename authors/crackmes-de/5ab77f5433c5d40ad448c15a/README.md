# nts_crackme1 — cyclops (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5433c5d40ad448c15a
- Plateforme : Windows PE32 GUI (MASM32), minuscule
- Difficulté : 1.0 — type **patch** (consigne : « Single Byte Patch »)

## Solution

Aucun serial : on patch un seul octet.

| | |
|---|---|
| VA | `0x40100d` |
| File offset | `0x40d` |
| Avant | `75` (`jne`) |
| Après | `74` (`je`) |

Patcher : `python3 tools/crackmes-de-nts_crackme1-patch.py crackme1.exe crackme1-patched.exe`

Au lancement : MessageBox **Registered!!!** (au lieu de UnRegistered).

## Comment on trouve

1. **Chaînes.** `Registered!!!`, `UnRegistered`, titre `Project PolyPhemous - NTS - Crackme1`.
2. **Code (`0x401000`).** `cmp DWORD PTR [0x403040], 1` puis `jne` vers le MessageBox « UnRegistered ». La voie « Registered!!! » est le fall-through. La dword en `.data` vaut `0`, donc on tombe toujours sur UnRegistered.
3. **Patch 1 octet.** Inverser le saut (`jne` → `je`, opcode `75` → `74`) : avec le flag à 0, on ne saute plus et on affiche Registered. (Alternative 2 octets : `90 90` pour NOP le `jne`.)

## Vérification

`tools/crackmes-de-nts_crackme1-emu.py` exécute l'entry sous Unicorn en simulant `MessageBoxA`. Original → `UnRegistered` (`analysis/emu-original.txt`) ; après patch → `Registered!!!` (`analysis/emu-patched.txt`).
