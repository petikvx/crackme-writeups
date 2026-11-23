# DonCris's New Year's Resolution Vault 2026

| | |
|---|---|
| **ID** | [`695549ef6199fe19c0574632`](https://crackmes.one/crackme/695549ef6199fe19c0574632) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | DonCris (`doncris`) |
| **Plateforme** | Windows PE64 console, C++ MinGW-w64 GCC 14.2 |
| **SHA-256** | `fce0da7edb0f59535580974402b2b983dd36cd9c474cb13080e188c7c638bd36` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme.exe` | binaire d'origine |
| `tools/doncris-vault-solve.py` | keygen (`-q`, `--check <exe>` via `xvfb-run wine`) |

## Réponse

Le « Unlock Code » est un entier 64 bits non signé calculé à partir de la résolution saisie.

| Résolution | Unlock code |
|---|---|
| `petik` | `2521194965070` |

```bash
python3 tools/doncris-vault-solve.py petik            # code
python3 tools/doncris-vault-solve.py petik -q         # code seul
python3 tools/doncris-vault-solve.py petik --check original/crackme.exe
```

## Premier regard

- `file` : PE32+ console x86-64 ; `diec` : MinGW GCC 14.2 (C++, libstdc++).
- `strings` : bannière, `Enter your New Year's Resolution:`, `You must have a resolution!`, `Enter the Unlock Code…`, `[SUCCESS]` / `[FAILED]`.

## Flow

1. Bannière, `IsDebuggerPresent()` stocké.
2. `getline(cin)` → résolution (vide = erreur).
3. `cin >> unsigned long long` → code (échec de parsing = erreur).
4. `calculate_checksum(résolution)` ; si débogueur : `^ 0xdeadbeef` ; comparaison avec le code.

## Comment on trouve

Ancrage : `objdump -d -M intel original/crackme.exe` ; les chaînes `.rdata` (`0x1400cd0xx`) sont référencées depuis `main` (`0x140001847`). Les symboles C++ sont conservés (non strippé), donc `calculate_checksum` (`0x14000176a`) saute aux yeux.

```asm
mov  QWORD PTR [rbp-0x8],0x7e9      ; h = 0x7e9
; boucle i = 0..len-1
movzx eax,BYTE PTR [rax]            ; c = s[i]
imul rax,rdx                        ; c * (i+1)   (rdx = i+1)
add  [rbp-0x8],rax                  ; h += c*(i+1)
rol  QWORD PTR [rbp-0x8],0x3        ; h = rol64(h,3)
xor  QWORD PTR [rbp-0x8],0x20262026 ; h ^= 0x20262026
```

Dans `main` :

```asm
call calculate_checksum
cmp  BYTE PTR [rbp-0x9],0           ; IsDebuggerPresent ?
je   skip
mov  eax,0xdeadbeef
xor  [rbp-0x8],rax                  ; piège anti-debug : le code attendu change
skip: cmp [rbp-0x8],[rbp-0x38]      ; code saisi (u64 décimal)
```

Piège : une fonction `decode` (XOR `0xf` par octet) existe mais n'est jamais appelée sur la saisie (leurre). L'anti-debug n'est pas un blocage : il fausse silencieusement le code attendu, donc il faut calculer hors débogueur.

Exemple `petik` : `h=0x7e9`, puis pour chaque lettre `p,e,t,i,k` (poids 1..5) : `h=rol3(h+c*(i+1))^0x20262026` → `2521194965070`.

## Vérification

```text
$ python3 tools/doncris-vault-solve.py petik --check original/crackme.exe
resolution='petik' unlock code=2521194965070
check: OK                # [SUCCESS] affiché sous Wine
$ printf 'petik\n123\n\n' | xvfb-run -a wine original/crackme.exe
[FAILED] The vault remains locked. Try again next year.   # cas KO
```

## Notes

- Analyse 100 % statique + Wine ; ni GDB ni debugger MCP utilisés.
- Arithmétique modulo 2^64 ; le code est saisi en décimal.
