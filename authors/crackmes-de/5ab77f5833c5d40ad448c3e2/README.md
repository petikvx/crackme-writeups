# KeygenMe #3 (`KeygenMe #3.exe`) — starzboy

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3e2`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3e2) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | starzboy (site : crackmes.de) |
| **Plateforme** | Windows PE32 console, MinGW (C++), x86 |
| **SHA-256 (zip)** | `cbc1718a802720e9a24f18cdaa3b1c1a8bc65622e296a2f276ee7917547e8a19` |
| **ZIP password** | `crackmes.one` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/Keygenme#3.zip` | archive d'origine (non modifiée) |
| `analysis/extracted/` | zip dézippé : `KeygenMe #3.exe` + `info.txt` |
| `tools/keygenme3-solve.py` | keygen (`-q`, `--check EXE` via `xvfb-run wine`) |

## Réponse

Le binaire demande 5 saisies : **name, company, identity code, password, secret code**.

| Champ | Valeur (exemple) |
|---|---|
| User-Name | `petik` |
| Company | `petik` |
| Identity Code | `-1949721347` |
| Password | `-1949721364` |
| Secret Code | `675145339` |

```bash
python3 tools/keygenme3-solve.py --user petik --company petik --check "analysis/extracted/KeygenMe #3.exe"
```

## Premier regard

```text
$ file "KeygenMe #3.exe"
PE32 executable for MS Windows 4.00 (console), Intel i386   # diec : MinGW
```

`info.txt` : « find the valid Security code, Password and secret code for your name ». `strings` donne `Enter User-Name:`, `Enter Company:`, `Enter Identity Code:`, `Enter Password :`, `Enter your Secret Code:`, `Access Granted !`. Beaucoup de bruit libstdc++ (`St9bad_alloc`, `basic_string::…`) : sans intérêt. Le binaire est lancé avec `xvfb-run -a wine`.

## Flow

`main` @ `0x401390` (trouvé via l'appel depuis l'entry `0x4011e2`) :

1. `A = B = ID = 0`, puis `rand()` (jamais seedé) → `[ebp-0x12c]` = `r1`.
2. `gets(name)` ; nom vide → « Access Denied ». Boucle sur le nom → `A` (`[ebp-0x114]`).
3. `rand()` → `r2` ; `expected_id = r2 % r1 + A` (`[ebp-0x128]`).
4. `gets(company)` ; boucle → `B` (`[ebp-0x110]`).
5. `cin >> long` : identity code ; doit valoir `expected_id`.
6. `cin >> long` : password ; doit valoir `A`.
7. `cin >> long` : secret ; doit valoir `B·A·ID + pw + ID + A + 2`.

## Comment on trouve le prédicat

**Ancrage** : `objdump -d -M intel` sur l'exe, `_main` à `0x401390`. Les prompts sont en `.rdata` (`0x441148…`), les compare sont aux adresses ci-dessous. Les 3 `cmp`/`jne` décisifs : `0x401787`, `0x401848`, `0x4018cb`.

**Boucle name** (`0x401569`–`0x401616`), pour chaque octet signé `c` (`movsx`) :

```asm
401594  mov  [ebp-0x10c], eax        ; t = c
4015a0  add  [eax], 0x1456982        ; t += 0x1456982
4015ac  add  [eax], 0x5893632        ; t += 0x5893632
4015b8  add  eax,[ebp-0x10c]         ; \ t = 2t + 0x2365
4015be  add  eax,0x2365              ; /
4015d3  shl  edx,6 ; sub edx,ecx     ; 63*A         (réduction de force : A<<6 - A)
4015de  add  eax,eax ; lea eax,[edx+eax] ; A = 63A + 2t
4015ef  add  eax,eax ; add eax,[ebp-0x110]  ; A = 2A + B   (B vaut 0 ici)
401603  add  eax,eax ; add eax,4     ; A = 2A + 4
```

Piège : `[ebp-0x110]` (= `B`) est lu ici mais n'est encore que `0` (initialisé en `0x4013cd`), pas la company.

**rand() non seedée** : aucun `srand`, donc la séquence MSVCRT est déterministe (`seed=1`, `seed = seed*214013+2531011`, retour `(seed>>16)&0x7fff`) : `41, 18467, …`. Donc `r1 = 41`, `r2 = 18467`, `r2 % r1 = 17` et `expected_id = A + 17`. (Sous Wine, msvcrt donne la même suite : le keygen est validé en live.)

**Boucle company** (`0x401697`–`0x40170d`) : `B` est **écrasé** à chaque caractère, seul le dernier compte :

```text
B = c + 0x56982 ; B = 2B + 0x17 ; B = 2B + 0x258963 ; B += 2
```

**Contrôles finaux** :

```asm
401787  cmp eax,[ebp-0x128]   ; identity == A + rand%41
401848  cmp eax,[ebp-0x114]   ; password == A
4018a8  imul eax,[ebp-0x114]  ; B*A
4018af  imul eax,[ebp-0x124]  ; *ID
4018b6  add  eax,[ebp-0x11c]  ; + password
4018bc  add  eax,[ebp-0x124]  ; + ID
4018c2  add  eax,[ebp-0x114]  ; + A
4018c8  add  eax,2
4018cb  cmp  eax,[ebp-0x120]  ; == secret
```

Tout en 32 bits avec wrap, lu/saisi en `long` signé (`operator>>(long&)`), d'où des valeurs négatives.

**Exemple `petik`** : `A = -1949721364` (itération sur `p,e,t,i,k`), `ID = A + 17 = -1949721347`, password = `A`. Company `petik` → dernier char `k` (0x6b) → `B` ; secret = `B·A·ID + A + ID + A + 2` mod 2³² = `675145339`.

## Vérification

Analyse 100 % statique + preuve live (pas de GDB / debugger MCP utilisé).

```text
$ python3 tools/keygenme3-solve.py --check "analysis/extracted/KeygenMe #3.exe"
CHECK: OK                       # petik / petik
$ python3 tools/keygenme3-solve.py --user abc --company Z --check "analysis/extracted/KeygenMe #3.exe"
CHECK: OK                       # autre couple, 916790845 / 916790828 / 304816139
```

Cas KO : mêmes saisies `petik/petik` avec un secret `1` → `Access Denied !`.

## Notes

- Seul le **dernier** caractère de la company influence le secret.
- L'identity code dépend de `rand()` non seedée : valide tant que le runtime est MSVCRT (Windows/Wine).
- Le binaire utilise `gets` (overflow possible) : hors sujet ici.
