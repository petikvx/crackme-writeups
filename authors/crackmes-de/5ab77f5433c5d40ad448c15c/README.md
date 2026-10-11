# nts_crackme7 by cyclops (crackmes.de)

| | |
|---|---|
| Page | [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c15c) |
| Plateforme | Windows 32 bits, GUI MFC (MSVC 6.0) |
| Difficulté | 1.0 |
| Objectif | keygen (pas de self-keygen) |

## Solution

```
serial = A + "-" + B
A = "%08X" % CRC32(name)
B = "%08X" % CRC32(A)
```

Exemple : `petik` → `0EAFB851-0DE144F8` (`tools/crackmes-de-nts-crackme7-solve.py petik`).

## Comment on trouve

1. `diec` : MSVC 6 + MFC 4.2, pas de packer. `strings` montre `%[^-]-%s`, `%08X`,
   `Software\Cyclops\Crackme7`, `Name`, `Serial`, `Restart the Software…` et `U are Registered!!!`.
   Les imports `RegCreateKeyExA` / `RegSetValueExA` / `RegQueryValueExA` disent déjà tout :
   le bouton écrit Name/Serial dans `HKCU\Software\Cyclops\Crackme7`, et la vérif a lieu **au démarrage**.
2. Au démarrage (~0x401500) : `RegOpenKeyExA(HKCU, "Software\Cyclops\Crackme7")`, lecture de
   `Name` et `Serial`, puis `call 0x401260(name, serial)` ; si 1 → texte « Regged!!! ».
3. `0x401260` :
   - `sscanf(serial, "%[^-]-%s", A, B)` : coupe sur le premier `-` ;
   - A et B doivent être non vides (comparés à un buffer global vide `0x4035c0`) ;
   - `sprintf(t, "%08X", f(A))` doit valoir `B` ;
   - `sprintf(t, "%08X", f(name))` doit valoir `A`.
4. `f` = `0x4011d0` : `0x401220` construit une table avec le polynôme `0xEDB88320`, puis
   `0x4011f0` fait `crc = ~0 ; crc = T[(crc^c)&0xff] ^ (crc>>8) ; return ~crc` → **CRC32 standard** (zlib).
   Hex en **majuscules** sur 8 chiffres.

## Vérification

GUI qui ne lit le registre qu'au redémarrage : plutôt que de piloter la fenêtre, on exécute
**le vrai code de la routine `0x401260`** (et l'init de table CRC) du binaire sous Unicorn,
`sscanf`/`sprintf` étant émulés en Python (`analysis/emulate_check.py`) :

```
$ python3 analysis/emulate_check.py Crackme7.exe petik 0EAFB851-0DE144F8
check() = 1 => Registered
$ python3 analysis/emulate_check.py Crackme7.exe petik 0EAFB851-0DE144F9
check() = 0 => refusé
$ python3 analysis/emulate_check.py Crackme7.exe Cyclops CE787CD8-FF1A45F5
check() = 1 => Registered
```

Pour l'essayer en vrai : `wine reg add 'HKCU\Software\Cyclops\Crackme7' /v Name /d petik` +
`/v Serial /d 0EAFB851-0DE144F8`, puis lancer `Crackme7.exe`.
