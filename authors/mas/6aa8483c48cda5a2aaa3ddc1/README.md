# MAS's zW0rM

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aa8483c48cda5a2aaa3ddc1) · id `6aa8483c48cda5a2aaa3ddc1`

Crackme **PE64 console** (MinGW C++), jeu type snake « ZWorm ».  
Auteur : [MAS](https://crackmes.one/user/MAS) · difficulté site **3.0**.

Dossier : `authors/mas/6aa8483c48cda5a2aaa3ddc1/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/Zworm_game.exe`](original/Zworm_game.exe) | binaire |
| [`analysis/Zworm_game.exe.i64.c`](analysis/Zworm_game.exe.i64.c) | Hex-Rays (`decc`) |
| [`tools/zworm-solve.py`](tools/zworm-solve.py) | flag / `--check` prédicat |

## Réponse

| | |
|---|---|
| **Flag** | `Z+{SOm3_T1Mes_Y0u_N33dToEn_joyTheGameT0Crack_it}` |
| Affichage | `MessageBoxA(..., flag, "Pro", ...)` quand le score atteint **5** |

```bash
python3 tools/zworm-solve.py -q
python3 tools/zworm-solve.py --check
```

## 1. Premier regard

```text
Zworm_game.exe: PE32+ console x86-64, ~1.1 MiB, stripped
sha256  975ea2949fb15747394c0bc88fd214d3054aa3cb46bfeff59e5ed18d1f7fe2e2
```

Strings utiles :

- `You Should Run This Game in a Debugger !`
- `You Should not Run This Game in a Debugger !`
- `You Should Reset The Score First !`
- `Score:` / `GAME OVER!`

```bash
bash -ic 'decc original/Zworm_game.exe'
```

## 2. Flow / anti-debug

Deux contrôles **contradictoires** en apparence :

1. `IsDebuggerPresent() != 0` → MessageBox « should **not** run in a debugger » + `exit`.
2. `PEB.BeingDebugged != 1` (et `NtGlobalFlag != 0x70`, si `byte_1400E4000 != 0`) → « should **run** in a debugger ».

En pratique : patcher le PEB / court-circuiter les deux branches (voir commentaires publics), puis **jouer** jusqu’à `score == 5` (WASD).  
`sub_1400043A0((20 * score) ^ 0x4D2)` reconstruit la chaîne ; si elle commence par `Z`, appel à `sub_1400026E0`.

## 3. Prédicat flag

`sub_1400026E0` (après le check `IsDebuggerPresent`) :

```c
// sum des octets == 4354
// acc = 1; pour chaque octet c: acc = (acc * c) % 1234  → dernier acc == 854
MessageBoxA(NULL, flag, "Pro", MB_ICONINFORMATION);
```

Vérification offline :

```text
sum(ord) = 4354
fold     = 854
```

## 4. Vérification

```bash
python3 tools/zworm-solve.py --check
# Z+{SOm3_T1Mes_Y0u_N33dToEn_joyTheGameT0Crack_it}
# checksum OK / OK
```

Preuve dynamique typique : x64dbg, PEB patché, score forcé ou joué jusqu’à 5 → MessageBox `Pro`.

## 5. Notes

- Ce n’est **pas** un keygen name→serial : le « win » est le flag affiché en jeu.
- Labels site (TEA, etc.) : le chemin utile observé ici est concat / obfuscation C++ + checksum, pas un TEA évident dans le prédicat MessageBox.
