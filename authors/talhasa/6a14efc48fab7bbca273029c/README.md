# talhasa's Simple VM Crackme

| | |
|---|---|
| **ID** | [`6a14efc48fab7bbca273029c`](https://crackmes.one/crackme/6a14efc48fab7bbca273029c) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | talhasa |
| **Plateforme** | Windows PE64 console (MSVC, C++), mini-VM |
| **SHA-256** | `24f6ba3a86f58d9cac75e287838d19d44224551851f1fac8d3a78d97de82921a` |

| Fichier | Rôle |
|---|---|
| `original/vm.exe` | binaire d'origine (intact) |
| `tools/talhasa-solve.py` | solveur (`-q`, `--check`) |

## Réponse

Pas de login : la clé est fixe.

| Clé |
|---|
| **`c0rRect!`** |

```bash
python3 -I tools/talhasa-solve.py -q                          # c0rRect!
python3 -I tools/talhasa-solve.py --check original/vm.exe     # preuve sous Wine
```

## Premier regard

```bash
file original/vm.exe      # PE32+ console x86-64
strings -n 6 original/vm.exe
```

Strings utiles : `Please enter the key: `, `Key is correct! Good job!`, `Wrong key! Try again.`, et une chaîne curieuse `r!cCtre0` (8 octets en `.rdata`, VA `0x1400033d8`) qui n'est **pas** la clé en clair. Le PDB (`SimpleVMCrackme.pdb`) confirme le nom « Simple VM ».

## Flow

`main` (`0x140001460`) affiche le prompt, lit la clé dans un `std::string` (`cin >>`), puis construit un petit **bytecode de 16 octets** dans lequel il copie la clé saisie, et le passe à l'interpréteur (`0x140001290`).

## Comment on trouve

**Ancrage** : `objdump -d -M intel original/vm.exe`, puis recherche des `lea rip+…` vers `0x1400033d8` (`r!cCtre0`), `0x1400033e8` (« correct ») et `0x140003408` (« Wrong »). Ils sont tous dans le même handler (`0x1400013c7`), d'où l'interpréteur.

**Interpréteur** (`0x140001290`) : boucle `fetch` sur `[ip]`, `cmp eax,5 / ja` puis `jmp` par table (RVA `0x1444`) → 6 opcodes :

| Op | Handler | Sémantique |
|---|---|---|
| 0 | `0x1400012f3` | `print reg[a]` (cout) |
| 1 | `0x140001326` | `reg[a] = copie de la chaîne NUL-terminée suivante` (taille `len+3`) |
| 2 | `0x140001372` | `reg[a] ^= imm8` sur chaque octet jusqu'au NUL (2 → taille 3) |
| 3 | `0x1400013ad` | libère `reg[a]` (`operator delete`) |
| 4 | `0x1400013c7` | `reg[b] = (strcmp(reg[a], "r!cCtre0") == 0) ? "Key is correct…" : "Wrong key…"` |
| 5 | `0x14000140e` | halt |

**Bytecode** : reconstitué depuis les `mov` immédiats de `main` (`0x1400014d5…0x140001542`) :

```
01 05 00        ; reg5 = clé saisie (chaîne vide à l'écriture, copiée à la volée → NUL)
02 05 11        ; reg5 ^= 0x11 sur chaque octet
04 05 00        ; reg0 = cmp(reg5, "r!cCtre0") ? "correct" : "wrong"
00 00           ; print reg0
03 05  03 00    ; free reg5, free reg0
05              ; halt
```

**Décodage** : la VM exige `saisie ^ 0x11 == "r!cCtre0"`, donc `saisie = "r!cCtre0" ^ 0x11` octet par octet :

| `r` | `!` | `c` | `C` | `t` | `r` | `e` | `0` |
|---|---|---|---|---|---|---|---|
| `c` | `0` | `r` | `R` | `e` | `c` | `t` | `!` |

→ **`c0rRect!`** (leet « correct! »).

**Pièges** : `strings` ne montre que la cible XORée, pas la clé ; le bytecode est écrit par immédiats `mov` (`0x04110502` = `02 05 11 04`) répartis sur plusieurs stores qui se chevauchent, il faut recoller les octets (word `0x501`, qword, dword `0x30503`, byte `0x05`).

Statique uniquement (objdump), pas de GDB ni de MCP debugger.

## Vérification

Sous Wine (`xvfb-run -a wine original/vm.exe`, clé sur stdin) :

| Entrée | Sortie |
|---|---|
| `c0rRect!` | `Key is correct! Good job!` |
| `petik` | `Wrong key! Try again.` |

`tools/talhasa-solve.py --check original/vm.exe` → `check : OK`.

## Notes

- Ce n'est pas un simple `strcmp` : la chaîne `r!cCtre0` est le résultat chiffré, la clé réelle est son XOR `0x11`.
- Pas de login, `petik` n'est utilisé qu'en cas KO.
