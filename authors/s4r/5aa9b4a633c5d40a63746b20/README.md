# s4r — prime

| | |
|---|---|
| **ID** | [`5aa9b4a633c5d40a63746b20`](https://crackmes.one/crackme/5aa9b4a633c5d40a63746b20) |
| **Auteur** | s4r |
| **Publié** | 2018-03-16 |
| **Plateforme** | Windows PE32 console (MinGW GCC 7.2.0), C/C++ |
| **Difficulté** | 2.2 |
| **SHA-256** | `ca42dbc61eab6c5b591489b8251a8e405983be7a86726165f1984cb30bb5c4f0` |
| **Solution** | `Pr1me_Numb3r5_4r3_s0_P0w3rFull` |

ZIP password : `crackmes.one`. Voir [`ORIGIN.yml`](ORIGIN.yml).

## TL;DR

Chaque caractère `c` du mot de passe devient `(0x81^c mod 0xfb) XOR key[i % 17]` avec
`key = "Th4t's a P455W0rD"`, le résultat est formaté en `%02x` puis comparé (`strcmp`) à la
constante hex `113e5c6e…4646` (30 octets). On inverse caractère par caractère (brute sur l’ASCII imprimable).

```text
please enter the password
Pr1me_Numb3r5_4r3_s0_P0w3rFull
well done
```

## Premier regard — comment on trouve

```bash
file original/prime.exe     # PE32 console i386
strings -n 5 original/prime.exe
```

Les `strings` donnent presque tout le plan :

- `Th4t's a P455W0rD` (clé XOR, **pas** le mot de passe — leurre) ;
- `113e5c6eac71358d3a4727639f55f02457565ae57662a2a2727610d84646` (60 hex → 30 octets attendus) ;
- `please enter the password`, `ascii please`, `well done` / `fail` ;
- `ntdll.dll` + `NtSetInformationThread` → anti-debug (`ThreadHideFromDebugger`).

## Reverse (objdump -d -M intel)

`main` = `0x401617` (appelé depuis le CRT en `0x4013e6`).

1. Bannière ASCII colorée (`SetConsoleTextAttribute` via `0x401550`).
2. Anti-debug : `GetProcAddress(GetModuleHandle("ntdll.dll"), "NtSetInformationThread")`
   puis `NtSetInformationThread(GetCurrentThread(), 0x11, 0, 0)` → classe `0x11` =
   `ThreadHideFromDebugger`. Si le retour ≠ 0, sortie. Inoffensif sous Wine / en analyse statique.
3. Locaux : `[ebp-0x15]=0xfb` (module, **251 premier**), `[ebp-0x16]=0x81` (base 129),
   `[ebp-0x1c]` → clé, `[ebp-0x20]` → hex cible.
4. `fgets(buf, 0x32, stdin)` ; chaque octet doit être dans `0x20..0x7e` sinon `ascii please`.
   La boucle va jusqu’à `strlen-1` → le `\n` est ignoré.
5. Pour chaque caractère : `call 0x4015cf(0x81, c, 0xfb)` :

   ```c
   int powmod(uint8 b, uint8 e, uint8 m) {   // 0x4015cf
       int r = 1;
       do { r = b * r % m; } while (--e);     // e fois
       return r;
   }
   ```

   donc `t[i] = 129^c mod 251` (« propriétés des nombres premiers » de la bannière).
6. Deuxième boucle : `t[i] ^= key[i % strlen(key)]`, puis `sprintf(hex + 2*i, "%02x", t[i])`.
7. `strcmp(hex, cible)` → `well done` sinon `fail` (`0x4015a5`).

## Inversion

Pour chaque position `i` : `want = cible[i] ^ key[i % 17]`, on cherche `c ∈ [0x20,0x7e]`
avec `129^c mod 251 == want`. 129 étant d’ordre suffisant modulo 251, la solution est unique
dans l’ASCII imprimable.

Solveur : [`tools/s4r-prime-solve.py`](tools/s4r-prime-solve.py)

```bash
python3 tools/s4r-prime-solve.py
# Pr1me_Numb3r5_4r3_s0_P0w3rFull
```

## Vérification (binaire live, Wine)

```bash
(echo Pr1me_Numb3r5_4r3_s0_P0w3rFull; echo) | xvfb-run -a wine original/prime.exe
# … please enter the password
# well done
(echo petik; echo) | xvfb-run -a wine original/prime.exe
# fail
```

Pas de nom d’utilisateur ici : mot de passe unique (l’exemple `petik` échoue, comme attendu).

## Status

- [x] reverse
- [x] write-up
- [x] solveur
