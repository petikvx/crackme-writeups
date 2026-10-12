# pushpushme by synfo (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1de>
- **Plateforme** : Windows PE32 GUI, **ASM** tiny — difficulté 1.0
- **Archive** : `original/PushPushMe.zip` → `PushPushMe.exe` + `PushPushMe about.txt`
- **Statut** : résolu (**patchme**), vérifié (Unicorn → `MessageBoxA(0, "Well d0ne!", NULL, 0)`)

## Solution

```
python3 tools/pushpushme-solve.py
python3 tools/pushpushme-solve.py --check
# → analysis/PushPushMe.patched.exe
```

Objectif (readme) : faire afficher **`Well d0ne!`** (déjà dans `.data` @ `0x40300B`) par `MessageBoxA`.

Le PE pousse 6 immediates puis `jmp esp` : le code s’exécute **sur la pile**. L’original enchaîne `ret` vers **ExitProcess** sans appeler MessageBox. Patch (copie seule) : réordonner les pushes pour

`MessageBoxA(0, "Well d0ne!", NULL, 0)` puis retour sur ExitProcess.

| File off | Avant | Après |
|---|---|---|
| `0x205` | `push 0x40103A68` | `push 0x40103468` |
| `0x20A` | `push 0x401034` | `push 0x40103A` |
| `0x214` | `push 0x6A004030` | `push 0x40300B68` |
| `0x219` | `push 0x0068006A` | `push 0x006A006A` |

## Comment on trouve

1. About : *modify this CrackMe* pour MessageBox « Well d0ne! ».
2. `.text` 0x40 octets : 6× `push imm32` + `jmp esp` ; IAT MessageBoxA / ExitProcess.
3. Désassemblage de la pile → `ret` tombe sur ExitProcess ; strings `PushPushMe` / `Well d0ne!` @ `0x403000` / `0x40300B`.

## Vérification

- `tools/pushpushme-solve.py --check` : Unicorn depuis `0x401000`, hook MessageBoxA → texte **`Well d0ne!`**.
- `original/` non modifié.
