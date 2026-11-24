# Lacks's Ultimate Boss Level

| | |
|---|---|
| **ID** | [`6a5158ee71ee08cad748dcc9`](https://crackmes.one/crackme/6a5158ee71ee08cad748dcc9) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | Lacks |
| **Plateforme** | Windows PE64 console (MSVC, C++) |
| **SHA-256** | `a8e91f09af2344981a93ffa1c57c674197e543ee6217da851c9c73093b22366c` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/UltimateBoss.exe` | binaire d'origine (non modifié) |
| `tools/ultimateboss-solve.py` | keygen + `--check` (Wine) |

## Réponse

| Username | Part 1 | Part 2 |
|---|---|---|
| `petik` | `16771` | `21295` |

```bash
python3 tools/ultimateboss-solve.py --user petik --check
```

## Premier regard

- `file` : PE32+ console x86-64, MSVC (PDB `crackmetest.pdb`).
- Aucun message lisible dans `strings` : tous les textes sont stockés **XORés avec `0x4f`**, construits sur la pile par des initialiseurs statiques (`0x140001000…0x140001560`) puis décodés octet par octet à l'usage (`xor r9b,0x4f`, ex. `0x140001870`).
- Imports anti-debug : `IsDebuggerPresent`, `CheckRemoteDebuggerPresent`, `GetThreadContext` (DR0–DR3), `GetTickCount64`, test d'un `0xCC` en début de la fonction de check.

## Flow

`main` (`0x140002080`) : affiche la bannière, lit le username (`std::string`), puis Part 1 et Part 2 (entiers 32 bits via `cin >>`, sinon « invalid »). Avant l'appel au check, il enchaîne les anti-debug : `IsDebuggerPresent`, `CheckRemoteDebuggerPresent`, registres de debug, octet `0xCC` à `0x140001d50`, et une mesure de temps (`GetTickCount64` avant/après, seuil `0x1f4` = 500 ms). Puis `call 0x140001d50` (check). Succès → « Access Granted » + un « Message » (déchiffré).

## Comment on trouve le prédicat

Ancrage : `objdump -d -M intel original/UltimateBoss.exe`, fonction `0x140001d50` (appelée depuis `main` en `0x140002753`), `(rcx = &name, edx = part1, r8d = part2)`. Pas d'IDA disponible sur cette machine → lecture asm.

C'est une mini machine à états (flattening) : `r10d` = état, `table[r10]` (octets `01 00 02 03 04 06…` en `0x140001ec0`) donne l'index dans la jump table `0x140001ea4`. Seuls les chemins utiles :

```asm
; état 0 → handler 0x1dab : somme des octets signés du nom
movsx ecx,BYTE PTR [rax]  ; add r9d,ecx    ; (version SSE + boucle scalaire)
imul  eax,r9d,0x1f        ; sum * 31
cmp   edi,eax             ; edi = part1 (edx d'entrée)
cmovne r10d,r15d(0x63)    ; sinon état d'échec

; état 3 → handler 0x1e83
; ebp = (part1 ^ 0x1337) + 0x7b calculé en prologue
cmp   esi,ebp             ; esi = part2 (r8d)
; égal → état 4 → 0x1e94 : mov bl,1 ; return
```

D'où :

- `part1 = (Σ name[i]) * 31`
- `part2 = (part1 ^ 0x1337) + 0x7b`

Exemple `petik` : 112+101+116+105+107 = 541 ; 541·31 = **16771** (`0x4183`) ; `0x4183 ^ 0x1337 = 0x52b4 = 21172` ; `+ 123` = **21295**.

Pièges : le flattening cache un test trivial ; les anti-debug ne gênent pas sous Wine sans debugger ; les chaînes XOR 0x4f (`0x6f→' '`, `0x45→'\n'`) rendent `strings` inutile.

## Vérification

```text
$ python3 tools/ultimateboss-solve.py --user petik --check
Username: petik / Part 1 : 16771 / Part 2 : 21295
check: OK (Access Granted)

$ python3 tools/ultimateboss-solve.py --user admin -q --check   # 16151 11419
check: OK (Access Granted)

# KO : Part 2 + 1
$ printf 'petik\n16771\n21296\n' | xvfb-run -a wine original/UltimateBoss.exe
... Enter Part 2: invalid
```

## Notes

- Debug live/GDB/x64dbg non utilisés : reverse 100 % statique + preuve Wine (`xvfb-run`).
- Le « Message » affiché après succès est déchiffré par une routine à part (`0x140003080`) et sort en octets non imprimables sous Wine ; il n'est pas nécessaire à la solution.
