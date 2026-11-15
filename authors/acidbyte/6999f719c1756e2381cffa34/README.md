# AcidByte's Acid's First Crackme

| | |
|---|---|
| **ID** | [`6999f719c1756e2381cffa34`](https://crackmes.one/crackme/6999f719c1756e2381cffa34) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | AcidByte (local : `acidbyte`) |
| **Plateforme** | Windows PE64, console, MSVC 19.41 (VS2022), CRT statique |
| **SHA-256 `download.bin`** | `ea01da3799f67cddfc81e9489b444d3888b9fa37a59fb640b9410fbc270074bf` |

## Contenu du dossier

| Fichier | Rôle |
|---|---|
| `original/download.bin` | archive ZIP d'origine (mot de passe `crackmes.one`), **non modifiée** |
| `analysis/extract/license.exe` | exécutable extrait du ZIP (SHA-256 `bb0693f3…dafdc`) |
| `tools/acid-first-solve.py` | solveur (`-q`, `--check`) |

## Réponse

**Mot de passe : `secret123`** (fixe, indépendant de la machine).

```bash
python3 tools/acid-first-solve.py            # password = secret123
python3 tools/acid-first-solve.py -q
python3 tools/acid-first-solve.py --check analysis/extract/license.exe   # preuve Wine
```

Pas de login : `petik` n'est utilisé que comme **contre-exemple** (refusé).

## Premier regard

- `file`/`diec` sur `download.bin` : c'est un **ZIP**, pas un exécutable. `unzip -P crackmes.one` → `license.exe` (extrait sous `analysis/extract/`, jamais dans `original/`).
- `diec license.exe` : PE64, Microsoft Linker 14.41, MSVC C++ (VS 2022). PDB : `C:\Users\jvand\...\license.pdb`.
- `strings` : `Enter the password: `, `Access granted.`, `Access denied.`, `Could not read HWID (MachineGuid).`, `SOFTWARE\Microsoft\Cryptography`, `MachineGuid`, `SHA256`, `ObjectLength`, `HashDigestLength` (API CNG/BCrypt). Les strings `secret…` ne sont **pas** en clair.
- Run : `echo petik | xvfb-run -a wine license.exe` → `Enter the password: Access denied.`

Le texte « HWID » + SHA256 laisse craindre un mot de passe lié à la machine ; ce n'est en fait pas le cas (voir plus bas).

## Flow

`main` (`0x1400107b0`) :

1. `hwid = GetHWID()` (`0x14000fef0`) — lit `HKLM\SOFTWARE\Microsoft\Cryptography\MachineGuid` via `RegOpenKeyExA`/`RegQueryValueExA` (flag `0x20119` = KEY_READ|WOW64_64KEY). Si échec → chaîne vide.
2. Si `hwid.empty()` (`0x140016e80` : `cmp [rax+0x10],0`) → affiche `Could not read HWID…` et sort avec 1.
3. Affiche `Enter the password: `, lit la saisie (`cin >> s`).
4. `check(saisie, hwid)` (`0x140010660`) → `Access granted.` / `Access denied.`

## Comment on trouve le prédicat

**Ancrage** : `objdump -d -M intel --no-show-raw-insn license.exe`, puis recherche des `lea rdx,[rip+…]` pointant sur les strings (adresse VA = `0x1400f7000 + (offset fichier − 0xf5600)` pour `.rdata`). `Access granted` (`0x1400f8290`) / `Access denied` (`0x1400f82a8`) sont référencés en `0x140010854` / `0x14001086a`, juste après `call 0x140005164` → thunk `jmp 0x140010660` = la fonction de check.

**`0x140010660(input, hwid)`** (asm abrégé, calls via thunks `jmp`) :

```asm
call 0x140006825            ; thunk -> 0x1400105a0 : construit le "sel" -> [rsp+0x88]
call 0x1400050dd            ; thunk -> 0x140010f60 : operator+(input, hwid)   -> tmp
call 0x140001569            ; thunk -> 0x140010070 : hash(tmp)  -> h1  [rsp+0x48]
call 0x1400050dd            ; operator+(sel, hwid)
call 0x140001569            ; hash(...)                          -> h2  [rsp+0x68]
call 0x140002216            ; h1.empty() ? (échec BCrypt)
call 0x14000243c            ; h1 == h2 (thunk -> operator== de std::string)
```

- `0x140010070` : SHA-256 via BCrypt (`BCryptOpenAlgorithmProvider(L"SHA256")`, `ObjectLength`, `HashDigestLength`, …), sortie en hex.
- Le check est donc `SHA256(saisie + MachineGuid) == SHA256(sel + MachineGuid)`. Le MachineGuid se trouve des deux côtés : il s'annule, et le prédicat se réduit à **`saisie == sel`** (aux collisions SHA-256 près). Le « HWID » est un leurre.

**Décodage du sel** (`0x1400105a0`) : trois appels à `0x140010510(dst, ptr, 3, 0x5a)` qui font `dst += chr(ptr[i] ^ 0x5a)` pour 3 octets :

```asm
mov r9b,0x5a   ; clé XOR
mov r8d,3      ; longueur
lea rdx,[rip+…] ; 0x1400f82e4, 0x1400f82e8, 0x1400f82ec
call 0x140010510
...
xor eax,ecx    ; octet ^ 0x5a, puis push_back
```

Les 3 morceaux en `.rdata` (offsets fichier `0xf68e4…`) — c'est pour ça que `strings` ne montre qu'un bloc `)?9(?.khi` (morceaux consécutifs) :

| Morceau | Octets | ^ 0x5a |
|---|---|---|
| `0x1400f82e4` | `29 3f 39` `)?9` | `73 65 63` → `sec` |
| `0x1400f82e8` | `28 3f 2e` `(?.` | `72 65 74` → `ret` |
| `0x1400f82ec` | `6b 68 69` `khi` | `31 32 33` → `123` |

Assemblage : `sec` + `ret` + `123` = **`secret123`**.

**Pièges** : le fichier téléchargé est un ZIP (`.bin`) ; le MachineGuid est un faux « HWID » (aucun keygen machine nécessaire) ; opérateurs `std::string` / `hash` cachés derrière des thunks `jmp` (table d'incremental linking), à suivre un par un.

## Vérification

Preuve contre `license.exe` d'origine (Wine, sans display) :

```text
$ echo secret123 | xvfb-run -a wine analysis/extract/license.exe
Enter the password: Access granted.
$ echo petik | xvfb-run -a wine analysis/extract/license.exe
Enter the password: Access denied.
```

`tools/acid-first-solve.py --check analysis/extract/license.exe` rejoue ces deux cas (OK + KO) et sort en erreur en cas d'écart.

## Notes

- Reverse 100 % statique (`objdump`) + preuve Wine ; **pas de GDB**, pas de debugger live, pas d'IDA (`decc` absent de l'environnement).
- Le MachineGuid sous Wine est celui du préfixe Wine ; la réponse n'en dépend pas.
