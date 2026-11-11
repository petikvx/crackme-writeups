# mirunaf's Floating password

| | |
|---|---|
| **ID** | [`6a1896b717539b5175d123cb`](https://crackmes.one/crackme/6a1896b717539b5175d123cb) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | mirunaf |
| **Plateforme** | Windows PE64 console, MinGW-w64 g++ 15.1 (libstdc++ statique, symboles C++ + DWARF présents) |
| **SHA-256 (download.bin)** | `5720e20a496fa729a7374605d1a07eb53099967d438fd84e26918abac0a3e488` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | **ZIP chiffré** (mot de passe `crackmes.one`) contenant `crackme.exe` (2 736 381 o). Le script de scaffold l'a stocké tel quel ; on extrait ailleurs (`/tmp`) sans toucher `original/`. |
| `tools/floating-solve.py` | solveur : réponse, calcul de la seconde gagnante, `--check` (émulation unicorn du vrai code), `--run EXE` |

## Réponse

**`67745`** — mais il faut l'envoyer au bon moment : le programme lit l'entrée, *puis* appelle `srand(time(0))` ; la réponse n'est valable que si `rand()` renvoie `0` pour cette graine.

```bash
python3 tools/floating-solve.py          # réponse + prochaine seconde t* (rand(t*)==0)
python3 tools/floating-solve.py -q       # 67745
python3 tools/floating-solve.py --check  # preuve par émulation du code du .exe
python3 tools/floating-solve.py --run crackme.exe   # lance (wine), attend t*, envoie 67745
```

Procédure manuelle : lancer `crackme.exe`, ne **pas** valider le prompt, attendre l'heure `t*` donnée par le solveur, taper `67745` + Entrée dans la même seconde (le `time()` est lu après la saisie).

## Premier regard

- `file`/`diec` indisponibles ici : `download.bin` commence par `PK\x03\x04` → ZIP ; `zipfile` + mdp `crackmes.one` → `crackme.exe`.
- `objdump -x` : PE32+ x86-64, `.debug_*`, table de symboles COFF **non strippée** → noms C++ lisibles (`_Z2kov`, `_Z3kolv`…), imports UCRT (`api-ms-win-crt-*`).
- Chaînes utiles (`.rdata`) : `So the password is? : `, `that's not it, try again`, `ok, that's it`, `default`, ainsi que `uniform_int_dist.h` → distribution aléatoire.

## Flow

`main` (0x1400018dc) : affiche le prompt, `cin >> he` (float global `he` @0x140101080), puis `ko()`.

`ko()` (`_Z2kov`, 0x1400017be) :

1. `random_device("default")` → `mt19937(seed)` → `a = uniform_int_distribution<int>(4, 0xe17)` (4..3607) → converti en float.
2. `srand(time(0)); b = (float)rand();`
3. `h = K + (sqrt(a) * b / K) * a` stocké dans le float global `h` @0x140101084.
4. `kol()`.

`kol()` (0x140001773) : `ucomiss he, h` ; égal → `koj()` imprime `hh` = « ok, that's it » ; sinon « that's not it, try again » puis `kon()` imprime `rand() * 0x45280` (un float, sans intérêt).

## Comment on trouve

**Ancrage** : `strings` → `So the password is?` ; scan capstone des `lea reg,[rip+x]` vers ces chaînes → xrefs 0x1400018e9 (`main`), 0x14000179c (échec), 0x14000195c (init de `hh`). Puis `objdump -d -M intel --start-address=0x140001710 --stop-address=0x140001925`.

Cœur du prédicat (commenté) :

```asm
1400017f3 mov edx,eax                  ; graine = random_device()()
140001800 call mt19937::mt19937(uint)
140001805 mov r8d,0xe17 ; mov edx,4    ; uniform_int_distribution<int>(4, 3607)
140001828 cvtsi2ss xmm0,eax            ; a (float)  -> [rbp+0x134c]
14001183d call _time64 ; call srand    ; srand(time(0))
140001849 call rand ; cvtsi2ss xmm0,eax; b (float)   -> [rbp+0x1348]
140001868 call sqrtf                   ; sqrt(a)
140001875 mulss xmm0,[rbp+0x1348]      ; * b
140001885 divss xmm0,[K]               ; / K       K = float @0x1400cf194 = 67745.0
14000188c mulss xmm1,[rbp+0x134c]      ; * a
14000189c addss xmm0,xmm1              ; K + ...
1400018a0 movss [h],xmm0
14000178b ucomiss he,h ; jp/jne -> échec   ; égalité float exacte
```

`K = 67745.0f` s'obtient en lisant 4 octets à l'offset fichier `0xcd800 + (0x1400cf194-0x1400cf000)` (`struct.unpack('<f')`).

**Le piège « Floating »** : `a` vient de `random_device("default")`. Le code de `_M_init` (0x1400a1690) montre que `"default"` → `__winxp_rand_s` (`rand_s`, CSPRNG Windows) : `a` est imprévisible, pas de fuite (la branche d'échec n'imprime que le *second* `rand()`). Impossible donc de calculer `h` en général.

**L'astuce** : `h = K + (sqrt(a)·b/K)·a`. Si `b = 0` alors `sqrt(a)*0 = 0`, `0/K = 0`, `0*a = 0` et `h = K = 67745.0` **exactement**, quel que soit `a` (aucun souci d'arrondi float). Or `b = rand()` après `srand(time(0))`, et l'entrée est lue *avant* le `time()`. `rand()` UCRT est le LCG `s = s*214013 + 2531011 ; (s>>16)&0x7fff`, donc on cherche la seconde `t` avec `((t*214013+2531011) mod 2^32 >> 16) & 0x7fff == 0` (la sortie balaie 0..32767 à ~3,3 par seconde : un `t*` tous les ~10 000 s en moyenne ; ex. calculé par le solveur : t*=1794394550). On bloque l'entrée jusqu'à `t*` puis on envoie `67745`.

Exemple d'user : sans objet (pas de nom/login, donc pas de `petik`).

## Vérification

Environnement de cette session : **pas de wine ni de gdb** (`which wine gdb` vide) → pas d'exécution live du `.exe` ; pas de section « Debug GDB » (aucune session GDB, reverse 100 % statique + émulation).

Preuve réalisée : `--check` **émule le vrai code machine** du `.exe` (unicorn, sections PE mappées, départ 0x140001828 jusqu'à la fin de `kol`) avec `rand`/`time`/`srand`/`sqrtf`/`cout` stubés et `a`, `b` fixés :

```
a=    4 b=    0 entrée=67745.0 -> OK     a= 1234 b=0 -> OK     a= 3607 b=0 -> OK
a=   50 b=  777 entrée=67745.0 -> KO     (entrée = formule float32 = 67749.0546875 -> OK)
a= 3607 b=32767 entrée=67745.0 -> KO
CHECK OK
```

OK pour `b=0` quel que soit `a`, KO pour `b≠0` avec 67745, OK avec la formule float32 complète. Le comportement `rand()` UCRT (LCG ci-dessus) et la seconde `t*` n'ont **pas** été confirmés sur le binaire en live ; `--run` l'automatise sur une machine avec wine/Windows.

## Notes

- Ce n'est pas un mot de passe fixe : c'est un défi de timing ; la réponse n'est correcte que pour `b == 0` (une seconde tous les ~10 000 s environ, d'où l'attente).
- Alternative sans attente : deviner `a` parmi 3604 valeurs et `b` via la graine = `time` (≈ 1/3604 de chance par essai) — nettement pire.
- `download.bin` est un ZIP, pas un PE : ne pas lancer `file`/`objdump` dessus directement.
