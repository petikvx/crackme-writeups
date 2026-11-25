# White_Canary's TooManyChecks

| | |
|---|---|
| **ID** | [`69761202511e37b6d1f8ed43`](https://crackmes.one/crackme/69761202511e37b6d1f8ed43) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | White_Canary |
| **Plateforme** | Windows PE64 console (C++, MSVC) |
| **SHA-256** | `1b13efc7605c0b046594011a371175bc0eb8838ad3cfd35953b5390a4a5ddf2b` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/TooManyChecks.exe` | binaire d'origine (non modifié) |
| `tools/toomanychecks-solve.py` | solveur (`-q`, `--check` via Wine) |

## Réponse

**Flag : `Flag(ByP@$$_a_B0$$)`** (pas de user/login dans ce crackme).

```bash
python3 -I tools/toomanychecks-solve.py          # flag = Flag(ByP@$$_a_B0$$)
python3 -I tools/toomanychecks-solve.py --check  # lance le binaire sous xvfb-run + wine → OK
```

## Premier regard

- `file` : PE32+ console x86-64, 6 sections, pas packé.
- `strings` : bannière *« Welcome, reverser. This binary does not want to be understood. »*, *« Enter the flag. This is the easy part: »*, puis plein de messages anti-analyse (*Debugger behavior detected*, *Hardware Breakpoint*, *Virtual Machine or Sandbox*, noms d'outils `ida.exe`, `x64dbg.exe`, `wireshark.exe`…, clés registre VMware/VBox, `NtQueryInformationProcess`, *.text section looks funny*, SHA256).
- Chaînes leurre : `ADD rcx, 1`, `MOV rsp, 2`, `POP rip`, `call exit`, `password` / *« It's a flag not a password! »*…
- Messages finaux : `[-] Congrat you won` / `[!] Wrong flag`.

## Flow

`main` = `0x1400014b0` (appelé depuis le CRT en `0x14000b677`) :

1. construit un objet (`0x1400033f0`) : map de chaînes anti-debug (`0x140003fa0`), tableau de 18 `std::string` (`0x1400038c0`) ;
2. affiche la bannière puis *Enter the flag* ;
3. lit la ligne dans la string globale `0x140039338` (`0x140002b80`, `getline`/`cin`) ;
4. `0x140008090` : **assemble le flag attendu** dans `obj+0x2d8`, en intercalant entre chaque morceau les checks anti-debug (`0x140007720` détecte un `0xCC` / breakpoint logiciel, `0x140007560` appelle `NtQueryInformationProcess`/PEB, `0x140001480` = `RaiseException`-style `0xdeadbeef`, etc.) ;
5. `0x1400077d0` : `0x140001a20(obj+0x2d8, 0x140039338)` → comparaison de `std::string` ; égal → *Congrat you won*, sinon *Wrong flag*.

## Comment on trouve

- **Ancrage** : `objdump -d -M intel original/TooManyChecks.exe` (pas d'IDA headless disponible ici), puis recherche des `lea rdx,[rip+…]` vers les messages. *Wrong flag* (`0x140026bb0`) est référencé en `0x140007857`, dans la fonction `0x1400077d0` : c'est la comparaison finale entre `obj+0x2d8` (attendu) et la saisie.
- Donc le flag n'est pas stocké en clair : il est **construit** par `0x140008090`. Cette fonction fait 6 boucles `for (i < n) obj.out.push_back(str[i])` (`0x140004ad0` = `operator[]`, `0x140004ca0` = `push_back`) sur des `std::string` du tableau `obj+0x98` (pas de `0x20`, donc `idx = (offset-0x98)/0x20`) :

| Boucle | offset | idx | n | 
|---|---|---|---|
| 1 | `+0x118` | 4  | 1 |
| 2 | `+0x238` | 13 | 1 |
| 3 | `+0xb8`  | 1  | 2 |
| 4 | `+0x158` | 6  | 8 |
| 5 | `+0x198` | 8  | 2 |
| 6 | `+0x1d8` | 10 | 5 |

- Le tableau est rempli par `0x1400038c0` (18 `lea rdx` consécutifs, ctor `0x140003010`) depuis `.rdata` `0x140026cf0…` :
  `[0]"ADD rcx, 1" [1]"ag" [2]"MOV rsp, 2" [3]"NOP" [4]"Fdez" [5]"MOV rsp, byte ptr[rbp]" [6]"(ByP@$$_" [7]"XOR rax, rax" [8]"a_)" [9]"LEA rsp, [rip]" [10]"B0$$)" [11]"POP rip" [12]"MOV rax, 1" [13]"l&ée" …`
  Les entrées paires/impaires alternent **leurres en pseudo-asm** et **fragments** du flag.
- **Assemblage** : `Fdez[:1]="F"` + `l&ée[:1]="l"` + `ag[:2]="ag"` + `(ByP@$$_[:8]` + `a_)[:2]="a_"` + `B0$$)[:5]` = **`Flag(ByP@$$_a_B0$$)`**.
- **Pièges** : les 18 checks anti-debug/VM/hash `.text` n'influencent pas le flag (ce sont des `exit` si détection) ; ne pas patcher le binaire (le check d'intégrité `.text` le détecte). Le flag se lit donc 100 % statiquement.

## Vérification

```text
$ echo 'Flag(ByP@$$_a_B0$$)' | xvfb-run -a wine original/TooManyChecks.exe
[-] Welcome, reverser. This binary does not want to be understood.
Enter the flag. This is the easy part: [-] Congrat you won

$ echo nope | xvfb-run -a wine original/TooManyChecks.exe
Enter the flag. This is the easy part: [!] Wrong flag
```

Pas de GDB / x64dbg ici : reverse statique + preuve sous Wine.

## Notes

- Le crackme est un « easy flag » noyé dans des checks d'environnement ; sous Wine/Xvfb aucun d'eux ne se déclenche.
- Le flag contient `$` : le quoter en shell (`'…'`).
