# SoftwareBreaker's License Checker

| | |
|---|---|
| **ID** | [`6a4545a639dd6183d62b9e95`](https://crackmes.one/crackme/6a4545a639dd6183d62b9e95) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | SoftwareBreaker (`softwarebreaker`) |
| **Plateforme** | Linux ELF64 PIE, C++ (GCC), lit `./license.key` |
| **SHA-256** (`original/download.bin`) | `a9b6b116fd353903a918682163beb1c72f58818ed908cd70adf04992294e5478` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP chiffré (mdp `crackmes.one`) contenant l'ELF `license_checker` (non modifié) |
| `tools/softwarebreaker-solve.py` | génère `license.key` ; `--check BIN` lance le binaire |

## Réponse

Fichier `license.key` de 40 octets :

```
53 6f 66 74 77 61 72 65 42 72 65 61 6b 65 72 00 ... (NUL jusqu'à 32)
4b 49 52 41   30   00 00 00
"SoftwareBreaker"  "KIRA" chk  libres
```

```bash
python3 -I tools/softwarebreaker-solve.py -o license.key     # génère
python3 -I tools/softwarebreaker-solve.py --check <chemin>/license_checker
```

Sortie : `[+] Registered to: SoftwareBreaker` / `[+] Access Granted! Welcome.`

**Utilisateur d'exemple `petik`** : impossible, le nom est comparé à la chaîne en dur `SoftwareBreaker`. `--name petik` produit un fichier au checksum cohérent (`sum` recalculé) mais le binaire répond `Invalid key signature or unauthorized user!` (testé).

## Premier regard

- `download.bin` n'est pas un ELF : `PK\x03\x04`, flag chiffré. `7z x -pcrackmes.one download.bin` → `license_checker` (ELF64 PIE, libstdc++).
- `strings` : `license.key`, `[-] license.key not found!`, `[-] Invalid license file format!`, `P@s$w0r(|12345`, `SoftwareBreaker`, `Access Granted`.
- Pas de saisie : le programme lit le fichier `license.key` du répertoire courant.

## Comment on trouve

Ancrage : `objdump -d -M intel license_checker`, fonction `main` à `0x2299` (l'entry `0x21b0` y passe via `__libc_start_main`).

1. `0x22c4` ouvre `license.key` (`ifstream`), sinon « not found ».
2. `0x231d` : `read(buf, 0x28)` → buffer à `rbp-0x260`, **40 octets**.
3. `0x233c` : `cmp [rbp-0x240], 0x4152494b` → octets 32..35 = `"KIRA"` (u32 LE), sinon « Invalid license file format! ».
4. Checksum (`0x2381`–`0x23f7`), pseudo-C :

```c
key = "P@s$w0r(|12345";            // 14 octets (rodata 0x3052)
uint8_t sum = 0;
for (i = 0; buf[i] && i <= 31; i++)
    sum += key[i % 14] ^ buf[i];   // i%14 : imul 0x92492493 (division magique)
```

   La boucle s'arrête au premier NUL ou à 32 octets : le « nom » est `buf[0..31]`.
5. `0x240b` : `sum == buf[0x24]` (octet à `rbp-0x23c`) **et** `sum != 0`.
6. `0x2453`/`0x2472` : un `std::string` est construit depuis `buf` (donc jusqu'au NUL) et comparé à `"SoftwareBreaker"` (rodata `0x3061`). Si égal → `Access Granted`.

Assemblage : nom = `SoftwareBreaker` (15 car.) ; `sum = Σ key[i%14] ^ name[i]` sur 15 octets (le NUL de fin n'est pas compté) `= 0x30`. Octet 36 = `0x30`, octets 37..39 libres (non lus). Piège : le contrôle de nom rend le keygen « par utilisateur » impossible, seul le checksum est calculable.

## Vérification

```text
$ python3 -I tools/softwarebreaker-solve.py --check license_checker
[+] Registered to: SoftwareBreaker
[+] Access Granted! Welcome.                       (rc 0)
$ python3 -I tools/softwarebreaker-solve.py --name petik --check license_checker
[-] Invalid key signature or unauthorized user!    (rc 1)
$ : > license.key ; ./license_checker               # fichier vide
[-] Invalid license file format!
```

Analyse 100 % statique + exécution native ; pas de GDB.

## Notes

- Le ZIP double emballage (site + `download.bin` lui-même chiffré) déroute `file`/`objdump`.
- Aucun patch : le binaire d'origine n'est pas modifié.
