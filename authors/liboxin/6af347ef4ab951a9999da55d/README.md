# liboxin's my ollvm test

| | |
|---|---|
| **ID** | [`6af347ef4ab951a9999da55d`](https://crackmes.one/crackme/6af347ef4ab951a9999da55d) |
| **Auteur (site)** | liboxin |
| **Auteur (local)** | liboxin |
| **SHA-256** | `8c0a578f701027aa75c1c3cdf4b31e2020ec0da7dca16cfe2da55047ae56e273` |

## Origine

- Page : https://crackmes.one/crackme/6af347ef4ab951a9999da55d
- Download : https://crackmes.one/download/crackme/6af347ef4ab951a9999da55d
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Réponse

| | |
|---|---|
| **Mot de passe** | **`123456`** |
| Commande | `python3 tools/ollvm-test-solve.py` (`-q` : sortie brute, `--check` : preuve sous Wine) |

Le mot de passe est **fixe** : il ne dépend pas de l'entrée. Pas de username ici, donc pas d'exemple `petik` côté solution ; `petik` sert seulement de saisie KO (voir Vérification).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mot de passe `crackmes.one`), contient `test.obf.exe` |
| `analysis/x/test.obf.exe` | exe extrait (SHA-256 `2ad2bdda…a2aa`), travail uniquement ici |
| `analysis/emu-main-recon.py` | émulation Unicorn de `main` (recon, version brute) |
| `tools/ollvm-test-solve.py` | solveur : émule `main`, lit l'argument du `strcmp` ; `--check` via Wine |

## Premier regard

```bash
mkdir -p analysis/x && unzip -P crackmes.one original/download.bin -d analysis/x
diec analysis/x/test.obf.exe     # PE64, MSVC 19.44, CRT statique
printf 'petik\n' | xvfb-run -a wine analysis/x/test.obf.exe
```

- `download.bin` est en fait un **ZIP** (le script de scaffold ne l'a pas extrait).
- `strings` ne montre **aucun** message du programme : les chaînes sont chiffrées dans `.data` et déchiffrées à la demande.
- Sortie Wine : `=== Password Verification Program ===`, puis 3 tentatives (`attempt n/3`), `Incorrect password! Attempts remaining: …`, et `[FAIL] Attempts exhausted, account locked.`

## Flow

`entry 0x140012fa0` → `__scrt_common_main_seh` (`0x140012e24`) → `call 0x140001000` = **`main`**.
Dans `.pdata`, `main` couvre `0x140001000–0x14000fb98` (≈ 62 Ko) : c'est le nom du jeu, OLLVM.

Obfuscations vues dans `main` :
- **Control-flow flattening** : variable d'état globale `0x140035210` incrémentée et mélangée (`imul 0x9e3779b1`, `shr 13`…) avant chaque `jmp` vers un bloc ;
- **MBA** : `a|b` / `a&b` à la place de `+`, `-`, `^` (`or al,0xa3 ; and cl,0xa3 ; sub al,cl` ≡ `xor`) ;
- **Chaînes chiffrées** dans `.data` (`0x140035000…`), déchiffrées par `0x14000fba0(index)`.

Le `objdump -d` linéaire se désynchronise dans `main` (octets de données/jump tables au milieu du code) : lecture statique peu rentable.

## Comment on trouve le mot de passe

Plutôt que de dé-flatter 62 Ko, on **exécute `main` dans Unicorn** et on regarde les appels de fonctions (adresses issues de `.pdata`) :

1. Charger les sections PE à leur VMA (`0x140001000` `.text`, `0x14002a000` `.rdata`, `0x140035000` `.data`, `.pdata`…), pile factice, `emu_start(0x140001000)`.
2. Hook `UC_HOOK_CODE` : à chaque entrée d'une fonction `.pdata` hors `main`, afficher `ret`, `rcx`, `rdx`, `r8`. Résultat, dans l'ordre :

| Appel | Identification | Preuve |
|---|---|---|
| `0x14000fba0(idx)` | déchiffre la chaîne n° `idx` en place dans `.data` | après l'appel, `.data` contient `=== Password Verification Program ===\n` |
| `0x140012710(fmt, …)` | `printf` | `rcx` = `Enter password (attempt %d/%d): ` |
| `0x140016188(buf, 0x14, stdin)` | `fgets`, buffer de **20** octets | |
| `0x1400163c0(buf, "\n")` | `strcspn` (retire le `\n`) | `rcx` = `petik\n` → retour 5 |
| `0x140029210(saisie, attendu)` | **`strcmp`** (code MSVCRT : `sub rdx,rcx ; cmp al,[rdx+rcx]`, retour 0/±1) | |

3. Au moment du `strcmp`, `rdx` pointe un buffer de pile contenant **`123456`** — le même quelle que soit la saisie (`petik`, `zzzzzzzz`).

Le test de l'OLLVM n'est donc qu'un habillage : `strcmp(saisie, "123456")` avec 3 essais.

Pièges :
- `rcx=0` au premier appel de `0x14000fba0` n'est pas un pointeur mais **l'index** de la chaîne ;
- les hooks doivent simuler `printf`/`fgets`/`strcspn` (retour au `ret` sur la pile) sinon l'émulation part dans le CRT non mappé ;
- le contenu en clair n'existe jamais sur disque : le grep sur le binaire ne trouve ni message ni mot de passe.

## Vérification

```text
$ python3 tools/ollvm-test-solve.py --check
mot de passe : 123456
Wine : OK

$ printf '123456\n' | xvfb-run -a wine analysis/x/test.obf.exe
=== Password Verification Program ===
Enter password (attempt 1/3): 
[OK] Verification successful, welcome to the system!

$ printf 'petik\npetik\npetik\n' | xvfb-run -a wine analysis/x/test.obf.exe     # KO
Enter password (attempt 1/3): Incorrect password! Attempts remaining: 2
...
[FAIL] Attempts exhausted, account locked.
```

## Notes

- Reverse **sans GDB** (émulation Unicorn + Wine), pas de section GDB.
- Ce n'est pas une VM ni un calcul sur l'entrée : le mot de passe est une constante, reconstruite au runtime (stack string) pour cacher la valeur à `strings`.
- Aucun patch du binaire ; `original/` intact.
