# crackmes.de's keygenme_conflux1 by conflux

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c28b`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c28b) |
| **Auteur (site)** | crackmes.de (conflux) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 console, MinGW C++ (symboles + DWARF non strippés) |
| **Difficulté** | 1.0 |
| **SHA-256 (ZIP)** | `e280331dd5cde1d37db8ad030db1859f0444a8468381d288d7dacdbb1ec013d1` |
| **SHA-256 (conflux1.1.exe)** | `ffa90d1c949623ea55af6cd9a0113ffdfb20485ac0e7fdf54d1c9dcb3aab08f5` |

## Origine

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c28b
- Download : https://crackmes.one/download/crackme/5ab77f5633c5d40ad448c28b
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## TL;DR

```text
abcdef-goodx<c>     avec c = 'a' + rand() % 26 après srand(time(NULL))
```

La dernière lettre change **chaque seconde** : 26 serials possibles (`abcdef-goodxa` … `abcdef-goodxz`), le bon est celui de la seconde où le programme démarre. Solveur : [`tools/conflux1-solve.py`](tools/conflux1-solve.py) (réimplémente `rand()` de msvcrt).

## Premier regard

```text
$ file original/conflux1.1.exe
PE32 executable (console) Intel 80386, 16 sections     # sections /29, /80… = DWARF
$ diec original/conflux1.1.exe
PE32  Compiler: MinGW
$ strings -n 6 original/conflux1.1.exe | grep -i good
-goodx
Good job!
$ nm -C original/conflux1.1.exe | grep ' main'
00401334 T main
```

Binaire de ~940 Ko (libstdc++ statique) mais **non strippé** : `main` est directement nommé.

## Reverse de `main` (`0x401334`)

Extrait ([`analysis/main-0x401334.asm`](analysis/main-0x401334.asm)) :

```asm
40139e  mov  DWORD PTR [esp],0x0
4013a5  call _time
4013ad  call _srand                 ; srand(time(NULL))
4013b2  call _rand
4013b7  mov  ecx,0x1a
4013bd  idiv ecx                    ; rand() % 26
4013c1  add  eax,0x61               ; + 'a'
4013c4  mov  BYTE PTR [ebp-0x19],al ; c
4013ca  mov  DWORD PTR [esp],0x46e040   ; "abcdef"
4013da  call std::string::operator=     ; a = "abcdef"
4013ea  ...  cout << "Hello, insert your Serial in the Form of XXXXXX-XXXXXX!"
401404  call operator>>(cin, input)
401413  mov  DWORD PTR [esp+0x8],0x46e080   ; "-goodx"
401425  call operator+(a, "-goodx")
401445  call operator+(tmp, c)
40145e  call operator==(input, tmp2)
40148c  je   4014a2                      ; sinon rien
40148e  ...  cout << "Good job!\n"
```

Chaînes (`.rdata`, [`analysis/rdata-0x46e040.txt`](analysis/rdata-0x46e040.txt)) : `0x46e040 = "abcdef"`, `0x46e080 = "-goodx"`.

Équivalent C++ :

```cpp
srand(time(NULL));
char c = 'a' + rand() % 26;
std::string a = "abcdef", input;
std::cout << "Hello, insert your Serial in the Form of XXXXXX-XXXXXX!";
std::cin >> input;
if (input == a + "-goodx" + c) std::cout << "Good job!\n";
```

Le format annoncé `XXXXXX-XXXXXX` (6-6) est bien respecté : `abcdef` - `goodx` + 1 lettre.

### La lettre « aléatoire »

MinGW appelle `rand()` de **msvcrt.dll** (LCG) :

```text
state = seed
rand(): state = state * 214013 + 2531011 ; return (state >> 16) & 0x7FFF
```

Premier `rand()` après `srand(t)` → `c = 'a' + (((t*214013 + 2531011) >> 16) & 0x7FFF) % 26`. Comme `t` est en secondes, la lettre est prévisible : il suffit de la calculer au moment où le programme affiche son prompt.

```bash
python3 tools/conflux1-solve.py               # serial pour la seconde courante
python3 tools/conflux1-solve.py --time 1791939600   # → abcdef-goodxq
python3 tools/conflux1-solve.py --all         # les 26 candidats
```

## Vérification live (wine)

[`tools/verify-wine.sh`](tools/verify-wine.sh) lance `conflux1.1.exe` avec une FIFO en stdin, attend le prompt (donc `srand(time)` déjà exécuté), calcule la lettre pour la seconde courante et l'envoie. Si la seconde a basculé entre le `time()` du programme et le calcul (course rare), il relance :

```text
$ tools/verify-wine.sh
essai 1 : abcdef-goodxt → Good job!
$ tools/verify-wine.sh
essai 1 : abcdef-goodxg →            # seconde basculée
essai 2 : abcdef-goodxj → Good job!
$ echo abcdef-goodx | wine original/conflux1.1.exe    # sans la lettre
Hello, insert your Serial in the Form of XXXXXX-XXXXXX!
```

Note : en saisie manuelle, taper n'importe laquelle des 26 variantes donne ~1 chance sur 26 ; le patch trivial serait de NOP le `je 4014a2` en `0x40148c`.

## Contenu

```text
original/   conflux1.1.zip (archive crackmes.one), conflux1.1.exe
analysis/   main-0x401334.asm, rdata-0x46e040.txt
tools/      conflux1-solve.py, verify-wine.sh
```

## Status

- [x] reverse
- [x] write-up
- [x] solveur (vérifié wine)
