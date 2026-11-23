# DonCris — Santa's Secret Gift Vault

| | |
|---|---|
| **ID** | [`6954bb346d227ff9fc540009`](https://crackmes.one/crackme/6954bb346d227ff9fc540009) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | DonCris |
| **Plateforme** | Windows PE64 console, C++ MinGW (debug, non strippé) |
| **SHA-256** | `779f79e6a28544b2aad5b7b1a84a3ad84594d82c4eed97d63996a90c1dc61f85` |

| Fichier | Rôle |
|---|---|
| `original/ChristmasCrackme_CPP.exe` | binaire d'origine |
| `tools/christmas-solve.py` | solveur (`-q`, `--check EXE` via `xvfb-run wine`) |

## Réponse

**Code : `HoHoHo_Merry_Xmas!`** → `FLAG{S4nt4_L0v3s_C++}`

```bash
python3 -I tools/christmas-solve.py -q
python3 -I tools/christmas-solve.py --check original/ChristmasCrackme_CPP.exe
```

(Pas de nom d'utilisateur : le code est fixe, pas de variante `petik`.)

## Premier regard

`file` : PE32+ console x86-64 ; `diec` : MinGW GCC, debug. `strings` montre la bannière, le prompt
`Enter the secret Naughty-or-Nice code…`, `[!] WRONG! … COAL FOR YOU!` et, en clair, le message de succès avec
`FLAG{S4nt4_L0v3s_C++}` — mais ce message est affiché seulement si le code est bon (pas de vérification à faire sur la chaîne seule).

## Flow

`main` (`0x140001450`) : affiche la bannière + `print_tree`, `getline(cin)`, puis :

1. longueur != `0x12` (18) → message d'échec ;
2. pour chaque `i` : `input[i] ^ 0x1f == TARGET[i]` sinon flag `ok=0` et sortie de boucle ;
3. `ok` → message + flag, sinon « COAL FOR YOU ».

## Comment on trouve

Ancrage : `objdump -d -M intel original/*.exe --no-show-raw-insn | awk '/<main>:/,/ret/'` (symboles conservés, dont `_ZL6TARGET`).

```asm
140001510: cmp  rax,0x12              ; length() == 18
14000155c: movzx eax,BYTE PTR [rax]   ; input[i]
14000155f: xor  eax,0x1f              ; ^ 0x1f
140001565: lea  rdx,[rip+...]         ; TARGET = 0x140076000 (.rdata)
140001576: cmp  BYTE PTR [rbp-0x11],al
```

Dump de la table : `objdump -s --start-address=0x140076000 --stop-address=0x140076012 original/*.exe`

```
57 70 57 70 57 70 40 52 7a 6d 6d 66 40 47 72 7e 6c 3e
```

Chaque octet XOR `0x1f` : `57→H`, `70→o`, `57→H`, `70→o`, `57→H`, `70→o`, `40→_`, `52→M`, `7a→e`, `6d→r`, `6d→r`, `66→y`, `40→_`, `47→X`, `72→m`, `7e→a`, `6c→s`, `3e→!` = `HoHoHo_Merry_Xmas!`.

Piège : `TARGET` est suivi d'autres chaînes dans `.rdata` (`\n`, bannière) ; la longueur 0x12 borne la table, il ne faut pas lire jusqu'au `\0`.

## Vérification

Binaire d'origine sous Wine (`xvfb-run -a wine`) :

- `HoHoHo_Merry_Xmas!` → `[*] HO HO HO! MERRY CHRISTMAS! You found the key!` + `FLAG{S4nt4_L0v3s_C++}` (`--check` OK) ;
- `wrongwrongwrongwro` (18 car.) → `[!] WRONG! You are on the Naughty List. COAL FOR YOU!`.

## Notes

Reverse 100 % statique + preuve Wine ; pas de session GDB/x64dbg. Aucun anti-debug.
