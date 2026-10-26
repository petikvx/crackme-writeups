# crackmes.de's KeygenME #1 by l0calh0st

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c35f`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c35f) |
| **Auteur (site)** | crackmes.de (l0calh0st) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | MS-DOS, EXE MZ 16 bits, Borland C++ 1991 (TLINK 5.0), console |
| **SHA-256 (zip)** | `bda7f4401bc240bb9f5e02290f75073cbb4e23f78cbe8d956c1b39d06fad065f` |

Origine : [`ORIGIN.yml`](ORIGIN.yml) · ZIP password : `crackmes.one` (le zip contient `KEYGENME.EXE` + `Readme!.txt`).

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/KeygenME#1.zip` | archive d'origine, non modifiée |
| `analysis/x/KeygenME#1/` | contenu dézippé (`KEYGENME.EXE`, `Readme!.txt`) |
| `analysis/keygenme-main.ndisasm.txt` | extrait ndisasm : `main`, `sqrt`, `__ftol` |
| `tools/keygenme1-solve.py` | keygen + `--check` |
| `tools/dosrun.py` | mini-émulateur DOS 16 bits (unicorn) pour la preuve live |

## Réponse

**`serial = (long)( r + sqrt(r) )` avec `r = (u32)(long)pow(Σ caractères du nom, 3.0)`** ; nom de 4 à 20 caractères.

| Username | Serial |
|---|---|
| `petik` | `158353004` |

```bash
python3 tools/keygenme1-solve.py --user petik          # name='petik' serial=158353004
python3 tools/keygenme1-solve.py -q --user petik       # 158353004
python3 tools/keygenme1-solve.py --user petik --check  # exécute KEYGENME.EXE (émulé) : OK + KO
```

## Premier regard

```bash
unzip -P crackmes.one original/KeygenME#1.zip -d analysis/x
file analysis/x/KeygenME#1/KEYGENME.EXE   # MS-DOS executable, MZ
diec analysis/x/KeygenME#1/KEYGENME.EXE   # Borland TLINK 5.0 / Borland C/C++ (1991)
strings -n 5 analysis/x/KeygenME#1/KEYGENME.EXE
```

Le `Readme!.txt` dit « Written in C++ ». Les messages **n'apparaissent pas** dans `strings` : ils sont chiffrés par un XOR à un octet, différent pour chaque message (`0x7b`, `0x4b`, `0x1f`, `0x49`, `0x21`, `0xc7`…), et décodés caractère par caractère à chaque affichage. Ce que `strings` montre sont les messages chiffrés (`GaucajIA`, `Xm,,ke?kp…`).

Pas de DOSBox sur la machine, et Wine refuse (`winevdm … you need to install DOSBox`). La preuve live est donc faite avec **unicorn** (voir plus bas).

## Flow

1. Bannière (XOR) puis `Enter your name :` → `cin >> name` dans `char name[0x28]` (`[bp-0x3c]`).
2. Si `strlen(name) > 0x14` ou `< 4` → `Name is too short/long...Try again`, sortie.
3. `Enter your serial :` → `cin >> long serial` (`[bp-0xa]`).
4. Serial attendu calculé avec le coprocesseur, comparé sur 32 bits ; `Well done dude!!!` ou `Better luck next time...`.

## Comment on trouve

- **Ancrage** : EXE MZ, en-tête 0x200 octets, `CS:IP = 0:0`. Je désassemble le code brut avec
  `ndisasm -b16 -o0 -e 512 KEYGENME.EXE`. Le code utilisateur (`KEYGENME.CPP`, nom présent dans la table de symboles) est au début du segment de code : `main` @ **0x2e0** (offsets relatifs au début du code, +0x200 dans le fichier).
  Le segment de données est à `0x7b0:0` (premier `mov dx,0x7b0`, soit offset fichier `0x7d00`). `0x868` = `cout`, `0x840` = `cin`.
- **Messages chiffrés** : chaque message est affiché par une boucle de ce type (@0x333, 0x37a, 0x561…) :

  ```asm
  mov al,[di+0xc2]    ; octet chiffré
  xor al,0x1f         ; clé propre au message
  push ax / push 0x868 / call 0x4549    ; cout << char
  ```
  En décodant : `Enter your name : ` (xor 0x1f), `Name is too short/long...Try again` (xor 0x49), `Enter your serial : ` (0x21), `Well done dude!!!` (+0xc7, ajout), `Better luck next time...` (xor 0x7b @ds:0x120).
- **Contrôle du nom** (@0x3a3) :

  ```asm
  call 0x3468 (strlen) ; cmp ax,0x14 ; ja  bad      ; > 20
  call strlen          ; cmp ax,4    ; jnc ok       ; < 4 → bad
  ```
- **Somme des caractères** (@0x491), sur un `long` (`[bp-6]`/`[bp-4]`, initialisé à 0 ; il existe une première boucle @0x418 qui somme dans `[bp-2]` non initialisé, mais ce résultat n'est jamais utilisé — leurre) :

  ```asm
  mov al,[bx] ; cbw ; cwd ; add [bp-6],ax ; adc [bp-4],dx
  ```
- **Calcul flottant** (@0x4b3…0x541). Piège principal : le désassembleur ne comprend pas les `CD 34`…`CD 3D`. Ce sont les **fixups de l'émulateur FPU de Borland** : `CD 34..3B` ≙ `ESC D8..DF`, `CD 3D` ≙ `FWAIT` (le runtime les réécrit en vrais opcodes x87 quand un 8087 est présent). Une fois recodés :

  ```text
  fld  dword [0x19e]          ; CD35 06 9E01   → constante 3.0 (octets 00 00 40 40)
  fstp qword [bp-0x48]        ; 1er argument empilé (sub sp,8)
  fild qword [bp-0x1c]        ; CD3B 6E E4 : sum étendu en 64 bits (haut = 0)
  fstp qword [bp-0x50]        ; 2e argument
  call 0x120c                 ; pow(sum, 3.0)   (nom "pow" @ds:0x35c, matherr)
  call 0x141f                 ; __ftol → r = long   (r1)
  fild r ; fstp tbyte [bp-0x26]       ; DB 7E DA, r en 80 bits
  fild r ; fstp qword (arg) ; call 0x1167   ; sqrt(r)   (CD35 FA = fsqrt, nom "sqrt" @ds:0x34e)
  fld tbyte [bp-0x26] ; faddp              ; DB 6E DA / DE C1 : r + sqrt(r)
  call 0x141f                 ; __ftol → serial attendu
  cmp [bp-8],[bp-4] ; cmp [bp-0xa],[bp-6]  ; égal au serial saisi ?
  ```
  `0x120c` est identifié par ses deux arguments double et le nom `pow` ; `0x1167` par `fsqrt` + nom `sqrt`.
- **`__ftol` @0x141f** : `fstcw`, force l'arrondi vers zéro (`or byte [bp-1],0x0c`), `fldcw`, `fistp qword [bp-0xa]`, retourne `dx:ax = [bp-0xa]` : donc la **troncature** puis les **32 bits bas** (important quand `Σ³ > 2³²`, ce qui arrive pour des noms longs).
- **Assemblage** pour `petik` :
  1. `Σ = 112+101+116+105+107 = 541`
  2. `r = 541³ = 158 340 421`
  3. `sqrt(r) = 12583.5…` → tronqué à la fin : `r + 12583`
  4. serial = **`158353004`**
- Détails de fidélité implémentés dans le solveur : `r` est pris modulo 2³² et traité comme non signé (le `fild` charge un qword dont la partie haute est mise à 0) ; le résultat final est le mod 2³² signé, car `cin >> long` lit un entier signé (noms longs : serial négatif, ex. `AAAAAAAAAAAAAAAAAAAA` → `-2097920424`).

## Vérification (preuve live)

Pas de DOSBox ; `tools/dosrun.py` charge l'EXE d'origine en mémoire (unicorn, mode 16 bits), applique les relocalisations, **remplace en mémoire** les `CD 3x` par de vrais opcodes x87 (le binaire n'est jamais modifié sur disque), et émule les INT 21h nécessaires (30, 25/35, 4A, 40, 3F, 44, 48/49, 4C) ; INT 10h/11h/1Ah sont ignorés.

```text
$ python3 tools/keygenme1-solve.py --user petik --check
name='petik' serial=158353004
OK serial=158353004 -> Well done dude!!!
KO serial=158353005 -> Better luck next time...
```

Contrôle plus large (même harnais) : `abcd`→`61170804`, `Hello World`→`1164286729`, `crackmes.de`→`1287949359`, `l0calh0st`→`599101583`, `zzzzzzzzzzzzzzzzzzzz`→`1641922632`, `~~~~~~~~~~~~~~~~~~~~`→`-1176805344` (débordement), `AAAAAAAAAAAAAAAAAAAA`→`-2097920424` : tous « Well done dude!!! ». Nom `ab` (2 caractères) → `Name is too short/long...Try again`.

## Notes

- Pas de session GDB : analyse statique + émulation unicorn (pas de section « Debug GDB »).
- Pièges : (1) `strings` ne montre pas les messages (XOR par message) ; (2) les `INT 34h–3Dh` sont de la FPU émulée, pas de vraies interruptions ; (3) la 1re boucle de somme est un leurre ; (4) troncature `__ftol` + 32 bits bas + serial signé pour les noms dont `Σ³ ≥ 2³¹`.
- Ce n'est **pas** une comparaison de chaînes : le serial est un entier décimal, calculé avec `pow` et `sqrt`.
