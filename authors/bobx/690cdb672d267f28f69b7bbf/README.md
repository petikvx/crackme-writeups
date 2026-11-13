# Bobx's Very hard antidebug +10 antisystem

| | |
|---|---|
| **ID** | [`690cdb672d267f28f69b7bbf`](https://crackmes.one/crackme/690cdb672d267f28f69b7bbf) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | Bobx |
| **Plateforme** | Windows PE64 console (MinGW), `crackme.exe` dans un ZIP (`original/download.bin`, mot de passe `crackmes.one`) |
| **SHA-256 (zip)** | `5ab0eafe76b44174bb6bce85c9ef9bf18535f043d944ca7c224559427e12ae4f` |

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (non modifié) contenant `crackme.exe` |
| `tools/bobx-solve.py` | solveur (`-q`, `--check` = preuve Wine) |

## Réponse

Pas de user : mot de passe fixe.

**`CR4CK_TH15_M3G4_H4RD_2024!`**

```bash
python3 -I tools/bobx-solve.py --check
```

Le binaire affiche `Flag: FLAG{U_CR4CK3D_TH3_ULT1M4TE_CH4LL3NG3}`.

## Premier regard

- Le « .bin » est un ZIP : `unzip -P crackmes.one original/download.bin -d /tmp/x` → `crackme.exe`. (Extraire hors de `original/`.)
- `diec` : PE64, MinGW. Symboles non strippés (`objdump -t`) : `AntiDebugCheck`, `CheckTiming`, `CheckVM`, `CheckRAM`, `GetPassword`, `ValidatePassword`, `WatchdogThread`, `main`…
- `strings` : noms de débuggers (x64dbg, windbg, ollydbg, ghidra…), `vmmouse.sys`/`vmhgfs.sys`, mais aussi des fragments `CR4CK_TH`, `15_M3G4_`, `H4RD_202` (immediates collés aux opcodes `mov`) — premier indice.
- Easter egg `about` / variable `BOBX=1` : sans intérêt pour la solution.

## Flow

`main` (0x1400022de) : lance `WatchdogThread` (rappelle `AntiDebugCheck` toutes les 100 ms, `ExitProcess(0xdead)` si détecté), bannière, 5× `AntiDebugCheck`, `fgets`, trim (espaces/tab en fin), puis `AntiDebugCheck` à nouveau et `ValidatePassword(input)` (0x1400021c4).

## Comment on trouve

1. `objdump -d -M intel --no-show-raw-insn crackme.exe` puis lecture de `ValidatePassword` : appelle `GetPassword(buf)` puis compare `input` à `buf` octet par octet (longueurs égales exigées, boucle jusqu'à `max(len)`). Donc tout se joue dans `GetPassword` (0x140001dc1).
2. `GetPassword` est un **leurre en trois temps** :
   - assemble 25 octets depuis 5 blocs de 5 octets sur la pile (`0x8176a083`+`a3`, `0x757773b4`+`bc`…) déchiffrés par XOR `0xf0`, + `'!'` ;
   - mélange avec `GetCurrentProcessId() ^ GetTickCount()` (octet bas), rotations 1..3 bits selon `i%3`, XOR `0x5a` — résultat **non déterministe** (dépend du PID et du temps) ;
   - **mais** à la fin (0x140002159), le tampon local `[rbp-0xc0]` est réécrit avec des constantes, puis `strncpy(out, [rbp-0xc0], 0x40)` : c'est cette chaîne qui est renvoyée, tout le résultat précédent est jeté.
3. Les constantes finales :
   ```asm
   movabs rax,0x48545f4b43345243 ; [rbp-0xc0]  "CR4CK_TH"  (LE)
   movabs rax,0x5f3447334d5f3531 ; [rbp-0xb8]  "15_M3G4_"
   movabs rax,0x3230325f44523448 ; [rbp-0xb0]  "H4RD_202"
   mov DWORD PTR [rbp-0xa9],0x213432 ; octets 32 34 21 00 = "24!\0"
   ```
4. **Piège de chevauchement** : le dword est écrit en `-0xa9`, soit offset `0xc0-0xa9 = 0x17 = 23`, donc il écrase le dernier `'2'` de `H4RD_202` (le même `'2'`) et ajoute `4`, `!`, NUL → `...H4RD_202` + `4!` = `H4RD_2024!`. Mot de passe final (26 car.) : `CR4CK_TH15_M3G4_H4RD_2024!`. Lire naïvement le 3e qwort donnerait `...H4RD_202` (24 car.) — faux.

Aucune des 15 vérifications anti-debug/anti-VM n'a besoin d'être contournée : on n'attache aucun débugger, la réponse se lit en statique et se prouve sous Wine (qui passe les checks).

## Vérification

```text
$ printf 'CR4CK_TH15_M3G4_H4RD_2024!\n\n' | xvfb-run -a wine crackme.exe
[*] Security checks passed.
    [SUCCESS] Access Granted!
    Flag: FLAG{U_CR4CK3D_TH3_ULT1M4TE_CH4LL3NG3}

$ printf 'wrong\n\n' | xvfb-run -a wine crackme.exe
[!] Invalid password. Access denied.
```

## Notes

- GDB / x64dbg / IDA non utilisés (reverse 100 % statique `objdump` + preuve Wine).
- Les anti-debug (PEB, NtQueryInformationProcess, timing, int3, DRx, parent process, VM/RAM/CPU) ne sont jamais déclenchés par la méthode statique.
- Le calcul PID/tick de `GetPassword` est un faux-semblant : un keygen « dynamique » n'est pas nécessaire.
