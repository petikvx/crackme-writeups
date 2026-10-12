# korbut_keyfile_3 by korbut

| | |
|---|---|
| **ID** | [`5ab77f5433c5d40ad448c1ac`](https://crackmes.one/crackme/5ab77f5433c5d40ad448c1ac) |
| **Auteur (site)** | crackmes.de (auteur original : korbut — *KEYFILE CRACKME #2*) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 GUI, MASM |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `cedb7c7e7f503a6fa0867fe4bc7621ef6f075544cb6cca6106c7b551e80e0178` |

## Résultat

Keyfile nommé **`$KF2`** dont le contenu est exactement le **nom d’ordinateur** Windows (`HKLM\...\ComputerName`).

Exemple sur cette box wine : `GROK-BOT-VM-411` → MessageBox **`GOOD CRACKER`**.

```
$ python3 tools/korbut_keyfile_3-solve.py GROK-BOT-VM-411
computer='GROK-BOT-VM-411' -> $KF2 (15 bytes)
```

Vérifié par émulation Unicorn du binaire (`int 68h` SoftICE NOP-é, Reg*/CreateFile/ReadFile/MessageBox hookés).

## Comment on trouve

1. Welcome MessageBox, anti-SoftICE `int 68h`.
2. `RegOpenKeyExA` / `RegQueryValueExA` sur `System\CurrentControlSet\Control\ComputerName\ComputerName` → buffer `0x4031a4`.
3. `CreateFileA("$KF2")` + `ReadFile` 0x14 octets → `0x403172`.
4. Comparaison octet à octet keyfile vs ComputerName jusqu’au `\0` du nom ; égalité → construit `GOOD CRACKER`, sinon `BAD CRACKER!`.
5. Affichage via `LoadLibraryA("c:\\windows\\system\\user32.dll")` + `GetProcAddress` + call.

## Solveur

[`tools/korbut_keyfile_3-solve.py`](tools/korbut_keyfile_3-solve.py)

## Status

- [x] reverse
- [x] write-up
- [x] solveur
