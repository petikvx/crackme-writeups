# Ploxied's Calculator

| | |
|---|---|
| **ID** | [`69700154d735cd51e7a1aa58`](https://crackmes.one/crackme/69700154d735cd51e7a1aa58) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | Ploxied |
| **Plateforme** | Windows PE64 console (MinGW GCC 14.2, C++, strippé) |
| **SHA-256** | `64c09d08038bf45511bbeb04e41fe2fb803561047c85b060113b98b1eb3b3efd` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme.exe` | binaire d'origine (non modifié) |
| `tools/ploxied-calc-solve.py` | déchiffre les chaînes et affiche les clés ; `--check` les teste sous Wine |

## Réponse

Licence : **`VeryHardCalculator`**

Trois clés sont acceptées (« `[+] Access granted!` ») :

| Clé | Résultat affiché pour `2 + 2` |
|---|---|
| `icrackedit!` | `16` |
| `CALC-G00DJ0B-XFGAFASDA-GAWRRASSD` | `36` |
| `VeryHardCalculator` | `132` |

```bash
python3 -I tools/ploxied-calc-solve.py          # liste les clés
python3 -I tools/ploxied-calc-solve.py -q       # VeryHardCalculator
python3 -I tools/ploxied-calc-solve.py --check  # test sous xvfb-run + wine
```

Pas de login : le crackme ne demande qu'une clé (l'exemple `petik` ne s'applique pas).

## Premier regard

- `file` : PE32+ console x86-64 ; `diec` : MinGW GCC 14.2.
- `strings` ne montre que `>> Enter two number:`, `>> Enter your operation (+ - * /):` et un texte « Try 2+2 » — le leurre de la calculatrice. Les chaînes de la licence n'apparaissent pas : elles sont chiffrées dans `.data`.
- Lancé tel quel : `[CRACKME] Welcome to system.` puis `>> Enter your license key:`, puis `[-] Wrong password!`.

## Flow

1. Bannière, demande de clé (`cin`).
2. Comparaison de l'entrée à des chaînes secrètes → `Access granted` ou `Wrong password` (et sortie).
3. Si accès : mini-calculatrice (`a b op`), résultat faussé selon la clé utilisée, puis une chaîne base64 `WW91IGRvbid0IGRlc2VydmUgYSBoaW50Lg==` (= « You don't deserve a hint. »).

## Comment on trouve

**Ancrage.** `objdump -d -M intel --no-show-raw-insn original/crackme.exe`. La vraie `main` est à `0x1400c7380` (le `main` « calculatrice » en `0x140001b20` est une fonction à machine d'états appelée en fin de `main`). Un `grep` des `lea rdx,[rip+…]` vers `.rdata` mène à `>> Enter two number:` (`0x1400cf085`), mais la licence est dans `main`.

**Chaînes chiffrées.** `main` appelle `0x140001920` (anti-debug : `IsDebuggerPresent` puis `CheckRemoteDebuggerPresent`), puis déchiffre des blobs de `.data` avec une clé `r10d` :

```asm
1400c73c5  call 0x140001920        ; al = 1 si debugger détecté
1400c73ca  mov  r10d,0x10          ; clé « leurre » si debugger
1400c73d2  test al,al / jne ...
1400c73d4  mov  r10d,0x67          ; sans debugger : vraie clé
...
1400c740d  xor  r8d,r10d           ; octet ^= clé, boucle sur 0x13 octets
1400c7410  mov  [r9+rcx],r8b
```

Sous debugger, la boucle utilise en plus un `+ (i mod 3)` (multiplication par `0xaaaaaaaaaaaaaaab`) : les chaînes deviennent illisibles. **Piège** : avec la clé 0x10 on obtient du pseudo-texte avec un `w` final ; le NUL terminal chiffré vaut `0x67`, ce qui révèle la bonne clé.

Blobs `.data` (VA `0x1400cb000` ↔ offset fichier `0xc9c00`), déchiffrés `^0x67` :

| VA | Longueur | Clair |
|---|---|---|
| `0x1400cb020` | 0x21 | `CALC-G00DJ0B-XFGAFASDA-GAWRRASSD` |
| `0x1400cb050` | 0x0c | `icrackedit!` |
| `0x1400cb080` | 0x1d | `[CRACKME] Welcome to system.` |
| `0x1400cb0a0` | 0x13 | `VeryHardCalculator` |
| `0x1400cb3c0` / `0x1400cb3f0` | | bannières « calculator » / `[+] Access granted!` |
| `0x1400cb060` | 0x1c | invite, `xor dword ^ 0x69696969` → `>> Enter your license key: ` |

**Comparaisons.** Après la lecture de l'entrée, `main` la compare à `icrackedit!` (`0x1400c4160`, `esi+=3`), à `CALC-…` (`esi+=4`), et à `VeryHardCalculator` par `memcmp` (`0x14001b260`). Ces drapeaux alimentent `0x140001b20`, d'où le résultat différent de `2+2` (16 / 36 / 132) selon la clé : la calculatrice sert de leurre, seule la validité de la clé compte.

## Vérification

```text
$ printf 'VeryHardCalculator\n2\n2\n+\nn\n' | xvfb-run -a wine original/crackme.exe
[CRACKME] Welcome to system.
>> Enter your license key:
[+] Access granted!
[CRACKME] Welcome to calculator.
2 + 2 = 132
```

`--check` : les trois clés → `granted` ; `x`, `icrackedit` (sans `!`), `VeryHard`, `veryhardcalculator`, `VeryHardCalculatorXYZ`, entrée vide → `Wrong password!`.

## Notes

- Un seul caractère final en trop (ex. `VeryHardCalculator ` avec espace) est aussi accepté ; plus long (`…XYZ`) est refusé. Je n'ai pas élucidé cette tolérance (lecture de `main` incomplète sur ce point).
- Je n'ai pas cherché à savoir laquelle des trois clés est « l'officielle » : le binaire les accepte toutes.
- Analyse 100 % statique (objdump) + Wine ; pas de GDB ni de debugger live.
