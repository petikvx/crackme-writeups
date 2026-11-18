# Lacks's Level 2

| | |
|---|---|
| **ID** | [`6a5129c471ee08cad748dcae`](https://crackmes.one/crackme/6a5129c471ee08cad748dcae) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | Lacks |
| **Plateforme** | Windows PE64 console, MSVC C++ (LTCG) |
| **SHA-256** (`original/download.bin`) | `debd6a4876c1933f7135a132cef16fb14660d8e25be18a98302ad3c885483a7a` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | archive ZIP d'origine (mot de passe `crackmes.one`), **non modifiée** |
| `analysis/zip/level2.exe` | `level2.exe` extrait de l'archive (SHA-256 `bb7354b6…7aaa`) |
| `analysis/level2.asm` | `objdump -d -M intel` du PE |
| `tools/level2-solve.py` | solveur / `--check` via Wine |

## Réponse

**Secret Key : `reverse`** (pas de username : l'exemple `petik` ne s'applique pas, la clé est unique).

```bash
python3 -I tools/level2-solve.py -q                          # reverse
python3 -I tools/level2-solve.py --check analysis/zip/level2.exe   # xvfb-run wine → OK
```

## Premier regard

- `original/download.bin` est en fait un **ZIP** (`PK`) : `unzip -P crackmes.one original/download.bin -d analysis/zip`.
- `diec` : PE64, MSVC 19.51 / VS 2026, CRT dynamique. Pas de packer.
- Strings (`.rdata`) : bannière `CRACKME LEVEL 2`, `Enter Secret Key:`, `[+] Access Granted!`, `[-] Access Denied.`. Aucune chaîne du secret en clair.

## Flow

`main` @ `0x140001300` : affiche la bannière, `cin >> std::string` (`0x140001790`), compare à un `vector<char>` global (`0x140005218`..`0x140005220`), puis affiche granted/denied, `Press Enter to exit` et attend.

## Comment on trouve

1. Ancrage : l'xref de `Enter Secret Key` (`0x140003428`) mène à `0x140001371`, juste avant la boucle de comparaison.
2. Boucle @ `0x1400013b5`–`0x1400013e1` :
   ```asm
   cmp  rdx,rax                 ; longueur saisie == longueur du vecteur global ?
   ...
   movzx ecx,BYTE PTR [rcx+rax] ; saisie[i]
   xor  cl,0x5a                 ; ^ 0x5a
   cmp  cl,BYTE PTR [r8+rax]    ; == global[i] ?
   ```
   Donc `saisie[i] ^ 0x5a == global[i]`, soit `saisie[i] = global[i] ^ 0x5a`.
3. Le vecteur global (`0x140005218`) est vide dans le fichier (`.data` à zéro) : il est rempli par un **static initializer** @ `0x140001000` (appelé via la table CRT, puis `atexit` du destructeur). Il construit 7 octets à partir d'immédiats :
   ```asm
   mov DWORD PTR [rsp+0x30],0x3f2c3f28   ; 28 3f 2c 3f (LE)
   mov WORD  PTR [rsp+0x34],0x2928       ; 28 29
   mov BYTE  PTR [rsp+0x36],0x3f         ; 3f
   ```
   → `28 3f 2c 3f 28 29 3f`.
4. XOR 0x5a : `28→r`, `3f→e`, `2c→v`, `3f→e`, `28→r`, `29→s`, `3f→e` = **`reverse`**.

Piège : chercher le tableau dans `.data` statique ne donne rien (zéros) ; il faut lire l'initializer. L'immédiat dword est little-endian (`28 3f 2c 3f`, pas `3f 2c 3f 28`).

## Vérification

Wine (`xvfb-run -a wine analysis/zip/level2.exe`, entrée sur stdin) :

| Entrée | Résultat |
|---|---|
| `reverse` | `[+] Access Granted! You solved it.` (via `--check`) |
| `wrong` | `[-] Access Denied. Try again.` |
| `Reverse` | `[-] Access Denied. Try again.` (sensible à la casse) |

Reverse 100 % statique (objdump) : pas de session GDB/x64dbg.
