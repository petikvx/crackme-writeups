# keygenning4newbies_crackme_1 by analyst (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c1da>
- **Plateforme** : Windows PE32 GUI, **Borland C++** — difficulté 1.0
- **Archive** : `original/k4n.zip` → `k4n.EXE` + `readme.txt`
- **Statut** : résolu (keygen), vérifié par **émulation Unicorn** du bloc `0x4010FA..0x40117C` (SetWindowText « Congratulations… »)

## Solution

```
python3 tools/k4n-solve.py petik          ->  11794
python3 tools/k4n-solve.py --check petik  ->  Congratulations! …
```

Nom : **4 ≤ len < 50**. Serial = hex majuscule (`%lX`) de :

```
sum  = Σ ( (signed)name[i] XOR (i+1) )   pour i = 0 .. len-1
last = name[len-1] XOR len
serial_int = last * 6 + (sum << 7)
```

## Comment on trouve

1. `diec` : Borland C++ / Turbo Linker 2.25. `readme.txt` : goal = keygen + tuto.
2. Handler Check `0x401000` : `GetDlgItem`/`GetWindowText` contrôles `0x66` (name) et `0x68` (serial).
3. `strlen(name)` : doit être `> 3` et `< 0x32` sinon message « Name must contain more than 4 chars… ».
4. Boucle `0x40110c` : `movsx` + `xor` avec l’index **déjà incrémenté** + accumulateur `ebx` ; puis `imul eax,6` / `shl ebx,7` / `add`.
5. `sprintf(buf, "%lX", valeur)` (`0x404ec4`) puis comparaison au serial saisi ; succès → SetWindowText « Congratulations! IF this number comes *FROM YOUR* keygen… ».

## Vérification

- `tools/k4n-solve.py --check` émule le vrai code sous Unicorn (hooks `sprintf`, strcmp, `SetWindowTextA`) : `petik` / `11794` → Congratulations ; mauvais serial → « NOT Valid ».
