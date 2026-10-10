# KeygenMe N°1 — LXD (xxlxdxx, crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c108
- Plateforme : Windows PE32 GUI, C/C++ (MSVC, CRT statique), x86 — difficulté 2.5
- Archive : `original/LXDs_KeygenMe_N°1.zip` (mot de passe `crackmes.one`). Règles de l'auteur : pas de patch, pas de self-keygen.

## Réponse (keygen)

Le serial dépend du **nom** et du **processeur** (somme des `eax` de `cpuid` feuilles 0 à 4). Il faut donc d'abord récupérer l'octet CPU de la machine qui lance le crackme :

```bash
gcc -o cpuid-byte tools/cpuid-byte.c && ./cpuid-byte      # ex. 0x34 sur le box
python3 tools/keygenme_n1-solve.py petik 0x34
# petik 7671121155-6177616665-1569176451
```

Avec un octet CPU à 0 : `python3 tools/keygenme_n1-solve.py petik 0`.

## Comment on trouve

1. `strings` : `Congratz you've done it :)` est référencé en `0x4013d3`, dans la DialogProc. Sur clic, `GetDlgItemTextA(0x3e9)` lit le nom (12 car. max, en `0x40da7c`) et `GetDlgItemTextA(0x3ea)` le serial (33 max, en `0x40da90`) ; il faut au moins 32 caractères puis `0x4011fa` doit renvoyer 1.
2. **Format** (`0x4011fa`) : `serial[10] == serial[21] == '-'`, tout le reste des chiffres. `0x4011b6` coupe en 3 blocs de 10 (`[0:10]`, `[11:21]`, `[22:32]`) et `0x40118e` permute chaque bloc du serial : pour i = 0..9, `swap(b[i], b[P[i]])` avec `P = 3,5,9,4,2,1,0,6,8,7` (table en `0x40cdd4`).
3. **Chaîne attendue** (`0x4010e1`) :
   - `0x401000` : MD5 du nom (constantes `67452301`/`efcdab89`… reconnaissables), sortie hex via `%02x` ;
   - `0x408993` = `_strupr` → hex en **majuscules** ;
   - boucle `cpuid` (ecx = 0) sur les feuilles 0..4, on additionne `eax` ; l'octet bas `k` est XORé sur les 32 caractères ;
   - XOR avec la chaîne en `0x40cdb0` = `d41d8cd98f00b204e9800998ecf8427e` (le MD5 de la chaîne vide) ;
   - chaque octet signé `v` → `|v|` → `sprintf("%1d")` et on garde **le premier caractère** (premier chiffre décimal).
   Les 3 blocs de cette chaîne sont comparés (`strcmp`) aux blocs permutés du serial.
4. Keygen : on calcule la chaîne attendue, on coupe en 3 blocs et on applique la **permutation inverse** (mêmes swaps en ordre inverse) sur chaque bloc.

## Vérification

GUI non pilotable en headless, donc la preuve passe par **l'émulation du vrai code du binaire** avec Unicorn (`analysis/emu-gen.py`) : `cpuid` est intercepté pour imposer l'octet CPU, et malloc / sprintf / _strupr / free / cookie sont remplacés par des stubs. Le reste (MD5, xor, permutation, comparaisons) tourne tel quel :

```
$ python3 analysis/emu-gen.py tools k.exe petik 0x34 7671121155-6177616665-1569176451
check(0x4011fa) = 1
$ ... petik 0x34 7671121155-6177616665-1569176450      # dernier chiffre modifié
check(0x4011fa) = 0
```

Même résultat (1) avec l'octet CPU 0 et le serial correspondant. La chaîne attendue émulée par `0x4010e1` est identique à celle du keygen (`16715217514616651676766511174659` pour petik/0x34).
