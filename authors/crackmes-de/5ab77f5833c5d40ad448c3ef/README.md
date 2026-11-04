# crackmes.de's antidbg_crackme1 (Crackme#1.exe) by scriptkiddy

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3ef`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3ef) |
| **Auteur (site)** | crackmes.de (scriptkiddy) |
| **Plateforme** | Windows PE32 console, MSVC 6 (Linker 5.12), non packé |
| **SHA-256 zip** | `a0c3bf5a93f7fcfa8b94522678d205cf4bce486220afa51d9962fa1f0b064e30` |
| **SHA-256 exe** | `1937c1c855a9bb32ee7b205c6dac92a169e6f67cdc34764238c345de83a5fb16` |

Voir [`ORIGIN.yml`](ORIGIN.yml). Mot de passe du ZIP : `crackmes.one`.

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Crackme#1.zip` | archive d'origine (`Crackme#1.exe` + `README.txt`), intacte |
| `tools/antidbg-crackme1-solve.py` | keygen + preuve live Wine (`--check`) |

## Réponse

Le binaire demande un *username* de **10 caractères dans `'1'..'5'`**, puis un serial de 10 caractères :

> **serial[i] = chr(ord(username[i]) + 1)**

| username | serial |
|---|---|
| `1111111111` | `2222222222` |
| `1234512345` | `2345623456` |
| `3221332213` (dérivé de **`petik`**) | `4332443324` |

`petik` tel quel est **impossible** : le binaire impose 10 caractères et le charset `1`–`5`. Le solveur propose `--from-petik` (`ord(c) % 5 + 1` pour chaque lettre, répété jusqu'à 10 chiffres : `p→3 e→2 t→2 i→1 k→3`).

```bash
python3 tools/antidbg-crackme1-solve.py --from-petik       # 3221332213 -> 4332443324
python3 tools/antidbg-crackme1-solve.py 1234512345 -q      # 2345623456
python3 tools/antidbg-crackme1-solve.py --from-petik --check
```

## Premier regard

```bash
unzip -P crackmes.one original/Crackme#1.zip -d /tmp/ad1     # hors du dépôt
file /tmp/ad1/Crackme#1.exe     # PE32 console, Intel i386, 3 sections
diec  /tmp/ad1/Crackme#1.exe    # MSVC 12.00 / Linker 5.12, pas de packer
```

Le `README.txt` de l'auteur demande un keygen **et** un tutoriel montrant comment contourner ses protections anti-debug.

`strings` donne :

- UI : `Enter username: `, `Enter serial: `, `Correct. Now make a keygen.`, `Wrong. %s` ;
- anti-debug : `OLLYDBG`, `WinDbgFrameClass`, et une longue chaîne `%s%s%s%s…` en `.data` (`0x407030`) ;
- imports parlants : `OutputDebugStringA`, `FindWindowA`, `CreateProcessA`, `GetCommandLineA`, `WaitForDebugEvent`, `ContinueDebugEvent`, `CreateThread`, `GetUserNameA`.

## Flow

Dans l'ordre d'apparition dans `.text` :

| VA | Rôle |
|---|---|
| `0x401000` | `OutputDebugStringA("%s%s%s…")` (format géant) |
| `0x401010` | auto-lancement en débogueur : `CreateProcessA(NULL, GetCommandLineA(), …, DEBUG_PROCESS)` puis `WaitForDebugEvent` / `ContinueDebugEvent(…, 0x10002)` |
| `0x4010a9` | thread : boucle `FindWindowA("OLLYDBG")` / `FindWindowA("WinDbgFrameClass")` → `ExitProcess(0)` si trouvée |
| `0x401108` | saisie username/serial et vérification (le vrai prédicat) |
| `0x401390` | lit `GetUserNameA`, XOR `0x02` de chaque octet ; je ne l'ai pas vu participer au prédicat |
| `0x401690` / `0x401720` | `strcmp` / `strlen` du CRT, inlinés par le linker |

## Comment on trouve le prédicat

**Ancrage** : le code est atteignable par `objdump -d -M intel` (`objdump` râle sur `invalid NumberOfRvaAndSizes` mais désassemble quand même). On cherche les xrefs vers les chaînes `0x4070b4` (« Enter username »), `0x4070c8` (« Enter serial »), `0x4070d8` (« Correct »), `0x4070f4` (« Wrong. %s »). Elles sont toutes référencées dans la fonction `0x401108`.

**Piège 1 — octets poubelle anti-désassemblage.** Au début de `0x401108` (et de `0x4012d8`, `0x401390`) :

```asm
401111: fld   tbyte ptr ds:0x40111a   ; charge 10 octets poubelle
401118: jmp   0x401124                ; saute par-dessus
40111a: .. 10 octets de junk ..       ; objdump les désassemble en (bad)
401124: call  0x401000                ; vraie suite, au milieu d'une « instruction » 3d xx xx xx xx
```

Un désassembleur linéaire désynchronise un instant. Ici il se resynchronise tout seul, mais les cibles de `jmp` sont fausses visuellement. Relancer `objdump --start-address=0x401124` donne la bonne vue.

**Lecture de la vérification** (`0x401108`, extraits commentés) :

```asm
; saisie : username -> [ebp-0xc], serial -> [ebp-0x30]  (via 0x40179b)
4011a1: call 0x401720            ; strlen(username)
4011ac: cmp  [ebp-0x18], 0xa    ; != 10 -> "Wrong"
4011bb: call 0x401720            ; strlen(serial)
4011c6: cmp  [ebp-0x18], 0xa    ; != 10 -> "Wrong"

; boucle 1 : chaque char de username doit être dans '1'(0x31)..'5'(0x35)
4011f1: cmp  eax, 0x31 / jl  -> Wrong
4011fe: cmp  edx, 0x35 / jg  -> Wrong

; boucle 2 : buf[i] = username[i] + 1         (buf = [ebp-0x24])
401235: add  eax, 1
40123b: mov  [ebp+ecx-0x24], al

; comparaison
401249: call 0x401690            ; strcmp(buf, serial)
401253: jne  0x401264            ; != 0 -> "Wrong. %s" (affiche le serial attendu !)
401255: push 0x4070d8 -> "Correct. Now make a keygen."
```

Quelques remarques :

- `[ebp-0x18]` reçoit ensuite `+= 0xd` à chaque tour de la boucle 1 : c'est un compteur mort sans effet sur le résultat (leurre de plus).
- Tous les chemins d'échec convergent vers `0x401264` qui fait `printf("Wrong. %s", buf)` : **le message d'échec affiche le serial attendu** (ex. `1111111111` + mauvais serial → `Wrong. 2222222222`, voir tableau de vérification). Serial fishing, que l'auteur interdit pour le tutoriel, mais le keygen reste de toute façon trivial.
- Aucun secret côté fichier : pas de table, pas de dépendance à `GetUserNameA`.

**Assemblage de la réponse**, exemple `petik` → `3221332213` :

```
p=0x70=112, 112%5=2, +1 -> '3'     (username forcé, car 'p' n'est pas dans '1'..'5')
e=0x65=101, 101%5=1, +1 -> '2'
t=0x74=116, 116%5=1, +1 -> '2'
i=0x69=105, 105%5=0, +1 -> '1'
k=0x6b=107, 107%5=2, +1 -> '3'
username = 32213 32213            serial = chr(c+1) -> 43324 43324
```

## Les protections anti-debug

Le README de l'auteur demande de les contourner. Honnêtement : **je n'ai pas eu à les contourner**, la solution vient d'une lecture 100 % statique + exécution sous Wine sans débogueur ; je n'ai donc pas rédigé de tutoriel d'attaque dynamique ni ouvert x64dbg / x32dbg / GDB (aucune session debug attachée, donc pas de section « Debug GDB »). Voici ce que le code fait et pourquoi ça ne gêne pas une analyse statique :

| Technique | Où | Effet / parade |
|---|---|---|
| `OutputDebugStringA` avec ~100 `%s` | `0x401000` | format-string historique qui plantait OllyDbg 1.10 ; inoffensif hors Olly. Parade : NOP de l'appel / mettre à jour le débogueur. |
| Auto-débogage `CreateProcessA(DEBUG_PROCESS)` | `0x401010` | un processus ne peut avoir qu'un débogueur : le programme occupe le port ; un débogueur externe ne peut plus s'attacher. Parade : NOP de l'appel ou lancer le fils. |
| Scan de fenêtres `OLLYDBG` / `WinDbgFrameClass` | thread `0x4010a9` | `ExitProcess` si une fenêtre existe. Parade : renommer la classe, ou NOP du `je` / du thread. |
| Octets poubelle (`fld tbyte` + `jmp`) | `0x401111`, `0x4012fe`, `0x4013b9` | casse les désassembleurs linéaires. Parade : désassembler à partir de la cible du `jmp`. |

L'exécution de ces protections n'a pas été vérifiée par un débogueur dans ce write-up ; je les décris d'après le code désassemblé.

## Vérification

Console Wine (pty nécessaire : le programme lit la console, un simple pipe de stdin n'affiche rien) :

```bash
python3 tools/antidbg-crackme1-solve.py --from-petik --check
# OK : True | Enter serial:Correct. Now make a keygen.
# KO : True | Enter serial:Wrong. 4332443324
```

(`--check` extrait l'exe du ZIP dans un répertoire temporaire, `original/` n'est jamais modifié.) Cas supplémentaires testés à la main avec le même pilote pty :

| username | serial | résultat |
|---|---|---|
| `1111111111` | `2222222222` | `Correct. Now make a keygen.` |
| `1234512345` | `2345623456` | `Correct. Now make a keygen.` |
| `1111111111` | `2222222223` | `Wrong. 2222222222` (affiche le serial attendu) |
| `petikpetik` | `2222222222` | `Wrong.` (charset `1`–`5` refusé) |

## Notes

- Piège de test : `echo … | wine` ou `xvfb-run wine < fichier` ne montre **rien** (aucun affichage, code retour 0) ; il faut un pseudo-terminal, d'où le pilote `pty` du solveur.
- Le crackme est surtout un exercice d'anti-debug ; l'algorithme (`+1` sur chaque caractère) est volontairement trivial.
