# jeffli6789's Date of Birth

| | |
|---|---|
| **ID** | [`5f4efbb133c5d4357b3b00a0`](https://crackmes.one/crackme/5f4efbb133c5d4357b3b00a0) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | jeffli6789 |
| **Plateforme** | Linux ELF64 x86-64, PIE, strippé (GCC 7.5, Ubuntu 18.04) |
| **SHA-256** | `dc6c1fde7304aa4997f4c9871fb5891d78869202b4e2f2fad6ce33a4f5d1ea9a` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/date_of_birth` | binaire d'origine (non patché) |
| `tools/date-of-birth-solve.py` | solveur : calcule la date à taper pour **aujourd'hui** (`-q`, `--check`, `--now`) |
| `analysis/verification.txt` | transcript de la preuve native (cas OK + KO) |

## Réponse

La bonne date de naissance **dépend du jour où on lance le programme** : il faut taper
la date de *aujourd'hui − ~128 ans* (exactement : celle dont `now - dob` retombe le
**31/12/2097** en heure locale).

| Jour d'exécution | Date à saisir (`mm/dd/YYYY`) |
|---|---|
| 2026-10-03 (CEST) | **`10/03/1898`** |

```bash
python3 tools/date-of-birth-solve.py          # candidats pour maintenant
python3 tools/date-of-birth-solve.py -q       # date seule
python3 tools/date-of-birth-solve.py --check  # + lance le binaire
```

Sortie attendue :

```text
Congrats! Now you can use Discard app!
Unfortunately this app has absolutely no functionality
```

(Pas de username ici, donc pas de `petik`.)

## Premier regard

```bash
file original/date_of_birth
strings -n 6 original/date_of_birth
```

- ELF64 PIE strippé, libc dynamique : `scanf`, `strptime`, `mktime`, `time`, `localtime`, `puts`.
- Chaînes utiles : `Please type you date of birth here:`, `You are too young! …`,
  `Congrats! Now you can use Discard app!`, formats `%20s` et `%m/%d/%Y`.
- **Aucune** chaîne « Unfortunately … » dans `strings` : le message final est chiffré
  (XOR) dans la pile, d'où l'intérêt de lire le code plutôt que de se fier aux strings.
- Piège : le crackme **segfault** sur le chemin « trop jeune » (voir Notes).

## Flow

`main` (VMA `0x710`, appelé via `__libc_start_main` depuis `_start` `0x8c0`) :

1. 3 × `puts` (bannière + invite), `scanf("%20s")` ;
2. `strptime(buf, "%m/%d/%Y", &tm)` puis `dob = mktime(&tm)` (tm mis à 0 → minuit local, `tm_isdst = 0`) ;
3. `diff = time(NULL) - dob` puis `localtime(&diff)` : le **delta** est réinterprété comme
   un *timestamp absolu depuis 1970* → on lit `tm_mday` (+0x0c), `tm_mon` (+0x10), `tm_year` (+0x14) ;
4. test d'« âge » sur ces trois champs ;
5. si OK : `puts("Congrats!…")` puis `0x9d0` déchiffre et affiche le message ; sinon « too young ».

## Comment on trouve

### Ancrage

```bash
objdump -d -M intel original/date_of_birth --start-address=0x710 --stop-address=0x8b4
objdump -d -M intel original/date_of_birth --start-address=0x9d0 --stop-address=0xae0
objdump -s -j .rodata original/date_of_birth
```

### Lecture de la condition d'âge (`0x7f1`–`0x8a3`)

```asm
7f1: mov r12d,[rax+0xc]     ; D = tm_mday  (1..31)
7f5: mov ebx,[rax+0x14]     ; tm_year
7f8: mov ebp,[rax+0x10]     ; M = tm_mon   (0..11)
7fb: lea eax,[r12+1]        ; al = D+1
800: sub ebx,0x46           ; Y = tm_year - 70  (= âge en années)
805: cmp al,0x1e / jle 853  ; D+1 <= 30 ?
```

Le graphe se réduit (tous les `cmp` sont sur des **octets signés**) :

| Chemin | Test | Conséquence |
|---|---|---|
| `D+1 <= 30` (D ≤ 29) → `0x853` → `0x89e` | `cmp r12b, al` = `D >= D+1` | **jamais vrai** → « too young » |
| `D ≥ 30`, `M < 11` → `0x813` | `cmp bpl, cl` = `M >= M+1` | jamais vrai → « too young » |
| `D ≥ 30`, `M == 11` → `0x859` | `cl = (int8)(Y+1)`, `dl = (int8)Y` ; `cl > dl` → « too young » | **vrai sauf si `Y+1` déborde** |

Le seul moyen de passer : `M = 11` (décembre), `D ∈ {30, 31}` et **`Y = 127`** pour que
`(int8)(Y+1) = -128 < 127` (débordement `int8`). Donc `tm_year = 197` → **année 2097**.
Le crackme exige un « âge » de 127 ans, calculé comme une date : `localtime(diff)` doit
tomber un **30 ou 31 décembre 2097**.

### Déchiffrement (`0x9d0`)

```asm
9d0: mov edx,edi ; movzx edx,dh        ; b1 = (arg >> 8) & 0xff
9da: shr r8d,0x10                      ; b2 = (arg >> 16)
9e2: xor eax,edx ; xor r8d,eax         ; key = b0 ^ b1 ^ b2  (r8b)
...  movabs rax,0x051e1f19040d053e ... ; blob de 54 octets sur la pile
a78: xor byte [rdi+rsi],r8b            ; boucle (strlen inlinée) : buf[i] ^= key
abf: call puts
```

L'argument est assemblé en `0x86e`–`0x895` : `Y | (M << 8) | (D << 16)`, donc
`key = Y ^ M ^ D`.

Le blob (`3e 05 0d 04 19 1f 1e 05 …`, 54 octets) se brute-force sur les 255 clés :
une seule donne du texte lisible, **107 = 0x6b** :
`Unfortunately this app has absolutely no functionality`.

Avec `Y = 127`, `M = 11` : `127 ^ 11 = 116`, puis `116 ^ D = 107` ⇒ **`D = 31`**
(`D = 30` donne la clé 106 = texte illisible, cf. KO ci-dessous).

### Assemblage de la réponse

On veut `localtime(now - dob)` = 2097-12-31 (heure locale) :

1. `2097-12-31 12:00 UTC` = epoch `4039329600` ;
2. `dob ≈ now - 4039329600 s` → autour de **1898-10** si `now` = 2026-10-03 ;
3. le solveur essaie ±5 jours autour, recalcule exactement `mktime((y,m,d,0,0,0,0,0,0))`
   (`isdst=0` comme le binaire) puis `localtime(int(now-dob))`, et garde la/les dates où
   `year == 2097`, `mon == 12`, `mday == 31` → `10/03/1898`.

Comme la fenêtre « 31 décembre » dure 24 h et que `dob` avance de 24 h par jour, il y a
en pratique **une seule** date valide (parfois deux avec les décalages DST / LMT) ; elle
glisse d'un jour à chaque jour qui passe.

### Pièges

- Le message n'apparaît pas dans `strings` (XOR sur la pile, immédiats `movabs`).
- La « date de naissance » n'est pas un âge : c'est `time() - mktime()` relu comme **date**
  par `localtime` (année 1970 + delta). D'où l'année 2097 et la dépendance au jour.
- Les comparaisons `cmp cl, dl` sont sur 8 bits : c'est le **débordement int8 à Y=127**
  qui ouvre la porte, pas un âge « réaliste ».
- Dépend du fuseau horaire (`localtime`/`mktime`) : le solveur utilise la même libc/TZ que
  le binaire. Près de minuit, relancer le solveur juste avant le crackme.

## Vérification

Preuve native complète : [`analysis/verification.txt`](analysis/verification.txt).

| Entrée (le 2026-10-03, CEST) | Résultat |
|---|---|
| `10/03/1898` (solveur) | `Congrats!` + `Unfortunately this app has absolutely no functionality`, rc 0 |
| `10/04/1898` (D = 30) | `Congrats!` mais texte **illisible** (`Tognsuto…`, clé 106) |
| `10/02/1898` (D = 1 de janvier 2098) | « trop jeune » → **segfault** (rc 139) |
| `01/01/2000` | « trop jeune » → **segfault** (rc 139) |

## Notes

- Le segfault sur « too young » est un bug du crackme : après le `puts("You are too young!…")`
  il fait `puts(argc)` (`movsxd rdi, r13d` à `0x828`) → déréférence l'entier `argc` comme
  pointeur. Avec un pipe, stdout n'est pas flushé et on ne voit même pas le message.
- Analyse **100 % statique** (`objdump`) + preuve native ; pas de session GDB.
- Ce n'est pas un vrai contrôle d'âge : « 128 ans » est un artefact du `time_t` relu en date.
