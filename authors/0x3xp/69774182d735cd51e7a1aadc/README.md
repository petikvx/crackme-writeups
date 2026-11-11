# 0x3xp's Project Obscura

| | |
|---|---|
| **ID** | [`69774182d735cd51e7a1aadc`](https://crackmes.one/crackme/69774182d735cd51e7a1aadc) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | 0x3xp (bannière : « Piyusha Akash ») |
| **Plateforme** | Windows PE64 console, MinGW-w64 GCC 15.2 |
| **SHA-256** (`original/download.bin`) | `655b5464d3538e25e76bf3bd75090284be82bee0b1add73274148a8c2bb24f79` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | en réalité un **ZIP** (mot de passe `crackmes.one`) contenant `ProjectObscura.exe` |
| `analysis/extracted/ProjectObscura.exe` | l'exe extrait (non modifié) |
| `tools/obscura-solve.py` | solveur + vérification par émulation Unicorn |

## Réponse

**Code secret : `0xP670PPGT56DEA`** (pas de login, donc pas d'exemple `petik`).

```bash
python3 tools/obscura-solve.py -q        # 0xP670PPGT56DEA
python3 tools/obscura-solve.py --check   # émule main() avec ce code
```

Le MessageBox de succès affiche le flag : `CTF{R3v3rs3_EnG_1s_4M1ndG4m3s}`.

## Premier regard

- `download.bin` : `unzip -P crackmes.one` → `ProjectObscura.exe` (PE32+, console, symboles COFF non strippés : `main`, `_BANNER`, `_0xF33F`, `_0xF33F0E`).
- `strings` : bannière ASCII « OPERATION OBSCURA », `:: Enter the secret code: `, deux formats `%c%c…` (15 et 28 `%c`), `Congratulations you found the Flag!`.
- **Leurres** : plusieurs fragments lisibles (`Cr4ck_m3_c0d3r`, `P6704xGT5632DEA`, `0xP67455…`, `Fy0uCan…`) sont construits dans `main` mais **jamais utilisés** pour la comparaison.

## Flow

`main` (`0x140001450`) : construit des buffers sur la pile → `sprintf(buf, "%c"*15, …)` → affiche la bannière → `fgets(input, 20)` → retire le `\n` → `strcmp(input, buf)`.
Égal → `_0xF33F0E` (`0x14000187e`, MessageBoxA « Congratulations… » avec le flag), sinon `_0xF33F` (`0x140001847`, MessageBoxW « Oh. Wrong code… ») et on reboucle.

## Comment on trouve

Ancrage : `objdump -d -M intel --no-show-raw-insn ProjectObscura.exe --start-address=0x140001450 --stop-address=0x140001c30` (les symboles `main`, etc. sont présents). Pas de GDB ni Wine disponibles sur la machine : analyse statique + émulation.

1. Le secret attendu est le buffer `rbp+0xa0`, rempli par `sprintf` (`0x140001711`) puis comparé à l'entrée par `strcmp` (`0x140001814`).
2. Les 15 octets sources sont posés un par un (`mov BYTE PTR [rbp+0x1cf],0x30` … `[rbp+0x1c1],0x41`) :

   | offset | 1cf | 1ce | 1cd | 1cc | 1cb | 1ca | 1c9 | 1c8 | 1c7 | 1c6 | 1c5 | 1c4 | 1c3 | 1c2 | 1c1 |
   |---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
   | octet | `0` | `0` | `5` | `x` | `P` | `6` | `P` | `P` | `D` | `6` | `G` | `E` | `7` | `T` | `A` |

   Lus à l'endroit ça donne du bruit : le piège est l'**ordre des arguments**.
3. Convention Win64 : `sprintf(rcx=buf, rdx=fmt, r8, r9, [rsp+0x20], [rsp+0x28]…)`. Ordre des `movsx` chargés vers les arguments :
   `r8=1cf, r9=1cc, [rsp+0x20]=1c9, 0x28=1c6, 0x30=1c3, 0x38=1ce, 0x40=1cb, 0x48=1c8, 0x50=1c5, 0x58=1c2, 0x60=1cd, 0x68=1ca, 0x70=1c7, 0x78=1c4, 0x80=1c1`.
4. Assemblage : `0 x P 6 7 0 P P G T 5 6 D E A` → **`0xP670PPGT56DEA`** (15 car. ; `fgets` lit au plus 19, donc pas de troncature).
5. Même mécanisme pour le flag dans `_0xF33F0E` : 28 octets en pile, `sprintf("%c"*28)` en ordre mélangé, affiché par `MessageBoxA`.

Piège : ne pas se fier aux autres littéraux de `main` (`0xP67455…`, `P6704xGT5632DEA`) — ce sont des décoys, jamais passés à `strcmp`.

## Vérification

Pas de Wine disponible dans cet environnement : la preuve est une **émulation Unicorn de `main`** (`--check`) : le code PE est chargé tel quel, seuls les appels CRT/API (`sprintf` avec `%c`, `fgets`, `strlen`, `strcmp`, MessageBox, `puts`…) sont interceptés. Le `strcmp` lit donc le buffer réellement construit par le code du binaire (pas mon tableau).

```text
$ python3 tools/obscura-solve.py --check
attendu par strcmp: b'0xP670PPGT56DEA' | fourni: 0xP670PPGT56DEA | résultat: WIN | MessageBox: b'CTF{R3v3rs3_EnG_1s_4M1ndG4m3s}'
$ python3 tools/obscura-solve.py --check --pw 0xP67455       # KO
attendu par strcmp: b'0xP670PPGT56DEA' | fourni: 0xP67455 | résultat: WRONG | MessageBox: None
```

Limite honnête : pas d'exécution réelle sous Wine/Windows ici. NB : lancer le script avec `python3` simple (pas `-I`) pour que `unicorn` (installé en user-site) soit trouvé.

## Notes

- Aucun anti-debug ni packing ; la difficulté est uniquement l'ordre mélangé des arguments de `sprintf` et les leurres.
- `original/` non modifié ; l'extraction du ZIP est sous `analysis/extracted/`.
