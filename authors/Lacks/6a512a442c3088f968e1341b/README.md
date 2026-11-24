# Lacks's Level 3

| | |
|---|---|
| **ID** | [`6a512a442c3088f968e1341b`](https://crackmes.one/crackme/6a512a442c3088f968e1341b) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | Lacks |
| **Plateforme** | Windows PE64 console (MSVC, C++ iostream) |
| **SHA-256** | `1073f2f51d00337ae08a9e05cfa213576cc84fa9a60dd84302431fc1de0c9dbe` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/level3.exe` | binaire d'origine (non modifié) |
| `tools/level3-solve.py` | keygen + `--check` (Wine) |

## Réponse

Serial = `((Σ octets signés du username) × 0x539) XOR 0x5A5A` (32 bits).

| Username | Serial |
|---|---|
| `petik` | **`742191`** |

```bash
python3 -I tools/level3-solve.py --user petik          # user=petik serial=742191
python3 -I tools/level3-solve.py --user petik --check  # lance le .exe sous xvfb-run/wine
```

## Premier regard

`file` : PE32+ console x86-64. Strings : bannière `CRACKME LEVEL 3`, `Enter Username:`, `Enter Serial Key (numbers only):`, `[+] Access Granted!`, `[-] Access Denied. Key is invalid for this username.`, `[-] Invalid input. Serial must be a number.`.

## Flow

`cin >> std::string user`, puis `cin >> int serial`. Si l'extraction du nombre échoue → « Invalid input ». Sinon, si le user est vide → Denied ; sinon calcul et comparaison.

## Comment on trouve

Ancrage : `objdump -d -M intel original/level3.exe`, recherche des `lea rdx,[rip+…]` vers les chaînes de `.rdata` (0x140003450 « Enter Serial Key », 0x1400034a8 « Access Granted »). Le `main` est vers `0x1400012a0`.

1. `0x140001345` : `cin >> [rsp+0x20]` (int32 serial) ; `test al,al` sur l'état du flux → `0x140001375` « Invalid input ».
2. `0x1400013a0–0x14000144b` : boucle de somme sur les octets du `std::string` (vectorisée SSE2 : `movd` / `punpcklbw` / `punpcklwd` / `psrad 0x18` = **extension de signe** des octets, `paddd`, puis reste scalaire `movsx ecx,[rax]; add edx,ecx`). `edx = Σ (signed char)`.
3. Le prédicat :
```asm
imul eax, edx, 0x539      ; sum * 1337
xor  eax, 0x5a5a
cmp  [rsp+0x20], eax      ; serial saisi
je   granted
```
4. Exemple `petik` : 112+101+116+105+107 = 541 ; 541×0x539 = 541×1337 = 723317 (0xB1635) ; `^ 0x5A5A` = **742191**.

Piège : la version SSE2 donne un faux aspect « compliqué » ; c'est une simple somme signée (caractères > 0x7f soustraits). `cin >> string` s'arrête à l'espace, donc username sans espace.

## Vérification

- OK : `echo -e "petik\n742191\n" | xvfb-run -a wine original/level3.exe` → `[+] Access Granted! You are a master keygenerator.` (via `--check`).
- KO : serial `1234` → `[-] Access Denied. Key is invalid for this username.`

## Notes

Analyse 100 % statique (objdump) + Wine ; pas de GDB ni de debug live.
