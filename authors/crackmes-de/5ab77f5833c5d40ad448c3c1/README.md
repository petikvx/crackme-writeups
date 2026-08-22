# crackmes.de's dll_disaster (issogoo)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3c1) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | iSSoGoo (miroir crackmes.de) |
| **Plateforme** | Windows PE32 GUI + `magic.dll` |
| **Type** | DLL injection « leftovers » (pas un vrai keygen offline) |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/dll_disaster_issogoo.zip` | archive |
| `original/dll_disaster.exe` | PE |
| `original/magic.dll` | anti-debug PEB (XOR layers) |
| `original/Readme.txt` | règles |
| `tools/inject_here.dll` | DLL de solution |
| `tools/inject_here.c` | source |
| `tools/dll-disaster-solve.py` | helper `tick → serial` |

## Réponse

| Étape | Détail |
|---|---|
| Injection | placer **`inject_here.dll`** à côté de l’exe |
| Serial | **`%08X` de `(GetTickCount() + 0xCAFFEE)`** (8 hex majuscules) |

Exemple (tick fictif) :

```bash
python3 tools/dll-disaster-solve.py -q --tick 0
# 00CAFFEE
cp tools/inject_here.dll original/
# wine original/dll_disaster.exe  → Check → MessageBox OK: XXXXXXXX → coller le serial
```

## Flow

1. Dialog ; bouton Check (`BN=0xFA1`).
2. `GetTickCount` → `[0x403282]`.
3. **`LoadLibraryA("inject_here.dll")` + `FreeLibrary`** — seul endroit autorisé pour « injecter ».
4. `[0x403282] += 0xCAFFEE` (si `magic.dll` a vu un debugger, l’immédiat devient `0xDEADBEEF` via patch self-modifiant `@0x401302`).
5. Lecture serial (len == 8), `itoa` hex majuscule du DWORD dans `0x40304A` (`"????????"`), `memcmp`.

## magic.dll

DllMain (attach) : 3 couches XOR (`0xCA` / `0xFF` / `0xEE`) puis check `PEB.BeingDebugged` + `NtGlobalFlag`. Si debug → `mov [0x401302], 0xDEADBEEF` (détourne l’add). Hors debugger : no-op utile pour la soluce.

## Prédicat

```text
serial == sprintf("%08X", tick_saved + 0xCAFFEE)
```

Le tick est pris **avant** le `LoadLibrary` : la DLL peut le lire à `0x403282` (lecture seule, conforme aux règles — pas de `WriteProcessMemory` externe).

## Vérification

```bash
python3 tools/dll-disaster-solve.py --check --tick 0x12345678
# OK 12FF5666
```

Live : MessageBox *Success! / Congratulation…* après avoir collé le serial affiché par `inject_here.dll`.

## Notes

- Interdit : patch exe/dll fournis, loader, `WriteProcessMemory`.
- Autorisé : ton propre `inject_here.dll` (l’auteur annonce ~20–30 lignes ASM).
- Ce n’est **pas** un serial fixe : il dépend du tick à l’instant du Check.
