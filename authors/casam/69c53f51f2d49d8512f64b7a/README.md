# casam's Keygen Crackme

| | |
|---|---|
| **ID** | [`69c53f51f2d49d8512f64b7a`](https://crackmes.one/crackme/69c53f51f2d49d8512f64b7a) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | casam |
| **Plateforme** | Windows PE32 (i386), console, MSVC 2022, stripped |
| **SHA-256** | `081685df00d1ada4760c94dc35605d17c66f30a0395ea7b92fca7aefa8372510` |

| Fichier | Rôle |
|---|---|
| `original/CrackMe.exe` | binaire d'origine (non modifié) |
| `tools/casam-keygen-solve.py` | keygen (`--guid`, `-q`, `--check`) |

## Réponse

Il n'y a **pas de login** (donc `petik` n'intervient pas) : le code attendu est **dérivé du `MachineGuid` de la machine**
(`HKLM\SOFTWARE\Microsoft\Cryptography\MachineGuid`). Il est donc propre à chaque machine.

| MachineGuid | Code |
|---|---|
| `d2971356-9611-4a15-a76b-23131d1d92a5` (prefix Wine de test) | `agahhedbghddefdfxgxdhibebefeifhf` |

```bash
python3 tools/casam-keygen-solve.py            # lit le MachineGuid (Windows ou ~/.wine)
python3 tools/casam-keygen-solve.py --guid <guid> -q
python3 tools/casam-keygen-solve.py --check    # lance l'original sous Wine
```

## Premier regard

- `file` : PE32 console i386 ; `diec` : MSVC 2022 (17.9), pas de packer.
- `strings` : `Enter Your Verification Code: `, `Error! Invalid Code!`, `SOFTWARE\Microsoft\Cryptography`, `MachineGuid`. Le message de succès (`Good Job Bro!`) n'apparaît pas en clair (ajouté à l'exécution).
- Imports : `RegOpenKeyExA`, `RegQueryValueExA`, `RegCloseKey` (ADVAPI32).

## Flow

1. La fonction `0x402c60` ouvre `HKLM\SOFTWARE\Microsoft\Cryptography` (d'abord avec `0x20119` = `KEY_READ|KEY_WOW64_64KEY`, repli `0x20019`) et lit `MachineGuid` (`RegQueryValueExA`, `0x402d15`).
2. La fonction `0x403310` transforme le GUID en une chaîne attendue, stockée dans la `std::string` globale `0x428000`.
3. `main` (≈ `0x403e71`–`0x403f7d`) affiche l'invite, lit une ligne, la compare (longueur `0x428010` puis mémoire) à `0x428000` : égal → succès, sinon `Error! Invalid Code!` (`0x403f5a`).

## Comment on trouve

**Ancrage** : `objdump -d -M intel original/CrackMe.exe` ; les xrefs vers `0x41e394` (invite) et `0x41e3c4` (erreur) mènent au `cmp` ligne à ligne en `0x403ec5`–`0x403f31`. L'attendu est en `0x428000`. (Pas d'IDA/GDB utilisables ici ; `winedbg --gdb` bloque sous xvfb.)

**Lire la valeur attendue sans debugger** : sur une *copie* sous `/tmp` (jamais `original/`), on patche l'instruction d'erreur en `0x403f5a` : `68 c4 e3 41 00` (`push "Error!…"`) → `51 90 90 90 90` (`push ecx`). À ce point `ecx` pointe sur le buffer de la chaîne attendue (`cmova ecx,[0x428000]` en `0x403ed1`), donc le crackme affiche lui-même le bon code quand on entre une valeur fausse. Cela donne `agahhedbghddefdfxgxdhibebefeifhf`.

**Décoder la transformation** (la copie patchée sert d'oracle, en modifiant `MachineGuid` dans le prefix Wine via `wine reg add … /reg:64`) :

| GUID testé | Sortie | Lecture |
|---|---|---|
| `00000000-…-000000000000` | `x` | 0 → `x` |
| `…000000000001` | `x` | 1×4//10 = 0 |
| `…000000000012` | `d` | 12×4//10 = 4 → `d` |
| `10000000-0000-…` | `d` + 30×`x` | 4·10³¹ // 10 |
| `12345678-0000-…` | `dichbgab` + 23×`x` | 49382712 = 12345678×4 |
| `55555555-5555-…` | 32×`b` | 5…5 ×4//10 = 2…2 |

Règle : on retire les `-` du GUID, chaque lettre `a..f` devient son rang (`c - 0x60` → `1..6`, via `0x40ab30` isalpha puis `0x40ae54` tolower et `to_string` en `0x4017b0`), le tout est lu comme un grand entier décimal (arithmétique multi-précision sur chaînes, pas limitée à 64 bits : le chemin `0x403500` ne sert que si ça tient en 64 bits), multiplié par 4 puis divisé par 10, et la sortie est recodée chiffre par chiffre : `0 → 'x'` (`0x403632 cmp al,0x30`), `1..9 → chr(d+0x30)` = `a..i` (`add al,0x30`, `0x40363a`).

Exemple pas à pas : `d2971356-9611-4a15-a76b-23131d1d92a5` → sans tirets et lettres→rang : `42971356961141151762231314149215` → ×4 = `171885427844564607048925256596860` → //10 = `17188542784456460704892525659686` → recodage `0→x`, `1-9→a-i` → `agahhedbghddefdfxgxdhibebefeifhf`. Le script reproduit exactement cette chaîne.

**Pièges** : `strings` ne montre pas le message de succès ; le code dépend de la machine (un code trouvé ailleurs ne marchera pas) ; l'alphabet de sortie `a-i` + `x` fait croire à un hash alors que c'est un simple ×0,4 en décimal.

## Vérification

```bash
$ python3 tools/casam-keygen-solve.py --check
MachineGuid : d2971356-9611-4a15-a76b-23131d1d92a5
Code        : agahhedbghddefdfxgxdhibebefeifhf
CHECK: OK | Enter Your Verification Code: Good Job Bro!
$ echo aaaa | xvfb-run -a wine original/CrackMe.exe
Enter Your Verification Code: Error! Invalid Code!
```

Le modèle a aussi été comparé à l'oracle (binaire patché en copie) sur 5 GUID de plus (`3f8a9c21-…`, `ffffffff-…`, `abcdef01-…`, etc.) : sortie identique à `keygen()`.

## Notes

- Aucun patch de `original/` ; la copie patchée n'a servi qu'à lire l'attendu.
- Le `MachineGuid` du prefix Wine a été modifié pendant les tests puis remis à `d2971356-9611-4a15-a76b-23131d1d92a5`.
