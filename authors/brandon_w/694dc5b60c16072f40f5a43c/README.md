# brandon_w's simple windows crackme

| | |
|---|---|
| **ID** | [`694dc5b60c16072f40f5a43c`](https://crackmes.one/crackme/694dc5b60c16072f40f5a43c) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | brandon_w |
| **Plateforme** | Windows PE64 console, MSVC (x64 Release) |
| **SHA-256 (`original/download.bin`)** | `8315015eabd68f964a7616f5f53a153df604040a11eeb8702a9f7d42641def2b` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | archive d'origine (ZIP → `simple-crackme.zip` → `simple-crackme.exe`, mot de passe ZIP `crackmes.one`) — non modifiée |
| `analysis/extract/` | exe extrait (SHA-256 `81172c10…928b`) |
| `tools/simple-crackme-solve.py` | solveur (`-q`, `--check EXE` via Wine) |
| `tools/simple-crackme-emu.py` | preuve unicorn : exécute le vrai code de transformation de l'exe |

## Réponse

**Mot de passe : `RCQQUMPF`**

```bash
python3 tools/simple-crackme-solve.py -q      # RCQQUMPF
python3 tools/simple-crackme-emu.py analysis/extract/simple-crackme.exe
```

Le crackme ne demande pas de login (donc pas d'exemple `petik` pertinent ; `petik` sert seulement de cas KO dans les tests).

## Premier regard

L'archive est un ZIP chiffré contenant un second ZIP chiffré (même mot de passe) :

```bash
unzip -P crackmes.one original/download.bin -d analysis/extract
unzip -P crackmes.one analysis/extract/simple-crackme.zip -d analysis/extract
```

`strings` : `What is the password?`, `password`, `Correct!`, `Incorrect password, please try again`, `pause`, imports `fgets`/`strcspn`/`system`/`strcmp`. Piège : la chaîne `password` est la **valeur de référence** du `strcmp`, pas la réponse — l'entrée est transformée avant comparaison.

## Flow

`main` (VA `0x140001000`) : `puts("What is the password?")` → `fgets(buf,0x80,stdin)` → `strcspn(buf,"\r\n")` (le `\r\n` est en `.rdata 0x1400032c8`) pour couper la fin de ligne → test `BeingDebugged` → boucle de transformation → `strcmp(buf, "password")` → `puts("Correct!"/"Incorrect…")` → `system("pause")`.

## Comment on trouve

Ancrage : `objdump -d -M intel analysis/extract/simple-crackme.exe` (entrée `0x140001670`, `main` à `0x140001000` ; pas de symbole, on part des xrefs aux chaînes `.rdata`).

1. **Anti-debug** :
   ```asm
   mov  rbx, gs:0x60          ; PEB
   ...
   cmp  BYTE PTR [rbx+2], 0   ; PEB.BeingDebugged
   ja   0x1400010fe           ; débuggé → saute tout (pas de check, sortie silencieuse)
   ```
2. **Transformation** (0x1400010a0–0x1400010b7), pour chaque octet de l'entrée :
   ```asm
   mov ecx,eax / and ecx,3 / shl ecx,3   ; cl = (i&3)*8, i = 0..3
   mov edx,0xdeadbeef / shr edx,cl       ; octet i de 0xdeadbeef : ef, be, ad, de
   xor r8b,dl                            ; c ^= octet
   cmp eax,4 / jb ...                    ; 4 tours
   ```
   Les 4 tours XORent donc chaque caractère avec `0xef ^ 0xbe ^ 0xad ^ 0xde`. Calcul : `0xde^0xad = 0x73`, `0xbe^0xef = 0x51`, `0x73^0x51 =` **`0x22`**. La boucle se réduit à `c ^= 0x22` (écrit en place dans le buffer).
3. **Comparaison** : `call 0x14000208f` (strcmp CRT) avec `rdx = 0x1400032d0` = `"password"`. `eax==0` → `Correct!`.
4. **Inversion** : XOR étant involutif, entrée = `"password" ^ 0x22` octet par octet :

   | p | a | s | s | w | o | r | d |
   |---|---|---|---|---|---|---|---|
   | 70→52 `R` | 61→43 `C` | 73→51 `Q` | 73→51 `Q` | 77→55 `U` | 6f→4d `M` | 72→50 `P` | 64→46 `F` |

   → **`RCQQUMPF`** (tout est ASCII imprimable, aucun octet problématique).

## Debug GDB

Non utilisé : reverse statique (objdump) + émulation unicorn. Remarque : sous débogueur, le test `BeingDebugged` fait sauter le check (aucun message) — il faudrait mettre `PEB+2` à 0 ou patcher le saut.

## Vérification

- **Unicorn** (preuve exécutée sur le code réel de l'exe — Wine n'est pas installé sur cette machine, donc pas de run natif Windows/Wine) : on mappe le PE, on exécute de `0x140001081` à `0x1400010d4` (boucle XOR) puis on compare `rcx`/`rdx` comme le `strcmp` :
  ```
  'RCQQUMPF': Correct!
  'password': Incorrect
  'petik':    Incorrect
  ```
- `--check EXE` du solveur lance `xvfb-run -a wine EXE` avec le mot de passe puis `petik` (KO) ; non exécuté ici faute de Wine.

## Notes

- Le `\r\n` de `strcspn` fait que le mot de passe passe aussi si l'entrée est saisie avec CRLF ; tout octet après un `\r` ou `\n` est ignoré.
- Ce n'est pas `password` : taper la chaîne en clair échoue (XOR 0x22 appliqué avant `strcmp`).
