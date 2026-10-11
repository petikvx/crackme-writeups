# korbut_keyfile_1 by korbut

| | |
|---|---|
| **ID** | [`5ab77f5433c5d40ad448c1ab`](https://crackmes.one/crackme/5ab77f5433c5d40ad448c1ab) |
| **Auteur (site)** | crackmes.de (auteur original : korbut / skor) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 (procédure style WndProc, MASM) |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `70a17e693fec600baf1c5c834631a1349bcc7e101e25aa8342932c8db93e7674` |

## Résultat

Keyfile **`skor.reg`** (nom reconstruit octet par octet dans le binaire) contenant exactement 16 octets :

```
[ R I F 2 k 2 ] 
```

```
$ python3 tools/korbut_keyfile_1-solve.py
wrote skor.reg (16 bytes): b'[ R I F 2 k 2 ] '
```

Vérifié par émulation Unicorn du vrai code (`0x401000`, `int 68h` SoftICE NOP-é, APIs Win32 hookées) : MessageBox **`Congratulations !!!`**. Wine natif page-fault sur `int 68h` (anti-SoftICE) car l’EP est une procédure `ret 4`, pas un EXE autonome complet.

## Comment on trouve

1. Zip `keyf1_skor.zip` → `$_crckme#1.exe` (+ `Patched.exe` qui NOP déjà `int 68h`).
2. Anti-debug : `int 68h` SoftICE + `FindWindowA("NuMega SoftICE Symbol Loader" / "TMainForm")`.
3. Nom du fichier bâti en `0x4030a4` par une chaîne d’`add`/`sub` sur `BL` à partir de `'s'` → **`skor.reg`**.
4. `CreateFileA` + `ReadFile` 0x14 octets ; `lstrlenA` doit renvoyer **16**.
5. Quatre `sub dword [edi], imm32` qui doivent laisser ZF :
   - `0x2052205b` `[ R `
   - `0x20462049` `I F `
   - `0x206b2032` `2 k `
   - `0x205d2032` `2 ] `
6. Succès → `Congratulations !!!` / `Send me your tutorial !!!`.

## Solveur

[`tools/korbut_keyfile_1-solve.py`](tools/korbut_keyfile_1-solve.py) · exemple [`tools/skor.reg`](tools/skor.reg)

## Status

- [x] reverse
- [x] write-up
- [x] solveur
