# segfaults — Jame's Cybersecurity Company

| | |
|---|---|
| **ID** | [`6a0c8b608fab7bbca2730221`](https://crackmes.one/crackme/6a0c8b608fab7bbca2730221) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | segfaults |
| **Plateforme** | Linux ELF64 PIE, stripped, C++ / **Qt 6.11** (GUI), build Nix |
| **Difficulté** | 2.0 |
| **SHA-256 (zip)** | `9f4e6d21…20ae` |
| **SHA-256 (ELF)** | `1ea688c5982dd70f39b377a9efd73ac5eb323c7a4bd7cc9497e929de1b981a72` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/james-cybersec.zip` | archive d'origine |
| `original/target_bin` | ELF Qt (GUI de login) |
| `original/database.jsonc` | liste des 6 employés (noms d'utilisateur candidats) |
| `analysis/tb.i64.c` | pseudo-C Hex-Rays (`bash -ic 'decc tb'`) |
| `tools/james-solve.py` | keygen mot de passe (`--list` pour les 6 comptes) |
| `tools/gdb-call-sub7840.py` | script gdb : appelle la routine de dérivation du binaire en live (preuve) |

## Réponse

Il faut **username + mot de passe**. Le mot de passe est dérivé du username ; le compte « admin » (bannière `YOU CRACKED!`) est exactement **`john_doe`**.

| Username | Mot de passe |
|---|---|
| **`john_doe`** (admin) | **`MTAwMTA=`** |
| `will_smith` | `MTAxMA==` |
| `marcus_vane` | `MTAxMTAwMA==` |
| `jomes_sandin` | `MTExMTA=` |
| `sarah_jenkins` | `MTAwMTAwMA==` |
| `franklin_sierra` | `MTAxMTAxMA==` |
| `petik` | `MTAwMDAxMQ==` |

```bash
python3 tools/james-solve.py john_doe -q     # MTAwMTA=
python3 tools/james-solve.py --list
```

## Premier regard

```bash
file original/target_bin     # ELF64 PIE, interpreter /nix/store/…/ld-linux-x86-64.so.2, stripped
strings -n 5 original/target_bin
```

- `libQt6Widgets/Gui/Core.so.6` + `Qt_6.11` : application graphique Qt.
- `john_doe` visible en clair, les 6 comptes de `database.jsonc`, et une bannière ASCII « YOU CRACKED! », « Admin Authorization bypass code successfully captured. ».
- Messages : `Authentication failed. Invalid client credentials.`, `Error: Input arguments cannot be NULL`.
- Imports intéressants : `toupper`, `memcmp`, `srand`/`rand` (cosmétique : animation du terminal), pas de `crypto`.
- Note du `database.jsonc` : « Encrypt it with a system. Please do not check the codes! » → le mot de passe est une **transformation** du nom.

## Flow

1. `main` @ `0x46A0` : `srand(time)`, `QApplication`, fenêtre de login (`sub_6BE0`).
2. Clic sur le bouton → `sub_56C0` (slot de login) :
   - lit deux `QLineEdit` → `std::string` (user `v13`, mot de passe `s1`) ;
   - si l'un est vide → `Error: Input arguments cannot be NULL` ;
   - `expected = sub_7840(user)` ; `memcmp(s1, expected, n)` + longueurs égales ;
   - OK → page « Session Established… » avec horodatage ; **en plus**, si `user == "john_doe"` (comparaison 8 octets `0x656F645F6E686F6A`) → bannière admin + `QWidget::show` d'une fenêtre privilégiée.
   - KO → `Authentication failed…`.

Donc n'importe quel utilisateur de la base se connecte avec son mot de passe dérivé, mais seul `john_doe` déclenche la partie « admin ».

## Comment on trouve

**Ancrage.** `decc` (IDA headless) → 35 fonctions décompilées. La chaîne `Authentication failed` mène à `sub_56C0` (@ `0x56C0`) ; la constante `0x656F645F6E686F6A` (= `"john_doe"` LE : `6a 6f 68 6e 5f 64 6f 65`) y est testée sur `v14 == 8` (longueur du user). Le mot de passe attendu vient de `sub_7840(&s2, &user)` @ `0x7840`.

**Lecture de `sub_7840`** (pseudo-C simplifié et commenté) :

```c
copy = std::string(user);
for (c : copy) c = toupper(c);          // 1) majuscules
std::sort(copy.begin(), copy.end());    // 2) tri (introsort + insertion) -> sans effet sur la suite
vector<int> v(copy.begin(), copy.end());// 3) widen char -> int (signé)
int x = sub_7500(v);                    // 4) XOR de tous les éléments
string bits = sub_72A0(x);              // 5) x en binaire ASCII
return sub_7530(bits);                  // 6) base64 de cette chaîne
```

- `sub_7500` @ `0x7500` : boucle `acc ^= *p++` — XOR réduit.
- `sub_72A0` @ `0x72A0` : si `x == 0` → `"0"` ; sinon boucle `(x & 1) + '0'; x >>= 1` qui produit les bits **LSB-first**, puis inversion en place (`while (a < b) swap`) → écriture binaire **MSB-first sans zéros de tête**.
- `sub_7530` @ `0x7530` : base64 classique. L'alphabet est chargé depuis `xmmword_8F40..8F70` = `41..50 / 51..5A…` → `"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"` (les 4 `xmmword` LE : `0x504F…4241` = `A..P`, etc.). Buffer 3 octets→4 caractères par accumulateur 6 bits, padding `=` jusqu'à un multiple de 4.

**Décodage — `john_doe`.**

| étape | valeur |
|---|---|
| `toupper` | `JOHN_DOE` |
| octets | `4A 4F 48 4E 5F 44 4F 45` |
| XOR | `4A^4F=05 ^48=4D ^4E=03 ^5F=5C ^44=18 ^4F=57 ^45=12` → `0x12` |
| binaire | `10010` |
| base64(`"10010"`) | `MTAwMTA=` |

`"10010"` = `31 30 30 31 30` → `MTAw MTA=` → `MTAwMTA=` ✔.

**Pièges.**
- Le **tri** est un leurre : un XOR est commutatif, l'ordre n'a aucune importance (le pseudo-C de l'insertion sort est d'ailleurs peu lisible).
- Le **base64 s'applique à la chaîne ASCII de bits**, pas à la valeur numérique — d'où des mots de passe qui commencent tous par `MT…`/`MA…` (`'1'`=0x31, `'0'`=0x30).
- XOR nul (ex. `AA`) → `"0"` → `MA==` ; mais ça reste valide (vérifié).
- Casse ignorée : `John_Doe` et `JOHN_DOE` donnent le même mot de passe ; en revanche la bannière admin teste le user **brut** (`john_doe` minuscule).
- Binaire non lançable tel quel sur ma machine : interpréteur `/nix/store/…` absent et symbole `Qt_6.11` vs Qt 6.10 système (voir section GDB).

## Debug GDB (pas à pas)

Preuve live sans passer par la GUI : on appelle directement `sub_7840` dans le process.

Préparation (copie de travail **hors dépôt**, l'original reste intact) :

1. L'interpréteur ELF pointe `/nix/store/…/ld-linux-x86-64.so.2` → absent. On lance via le loader système : `/lib64/ld-linux-x86-64.so.2 ./tb_patched`.
2. `ldd` : `version 'Qt_6.11' not found` (Qt système = 6.10.2). Dans une **copie**, on réécrit la chaîne de version `Qt_6.11` → `Qt_6.10` dans `.dynstr` (même longueur, offset fichier `0x2a41`) et le `vna_hash` ELF correspondant (offset `0x2d68`, hash SysV de `Qt_6.10`). Le binaire démarre alors sous `QT_QPA_PLATFORM=offscreen`.

Session (script : [`tools/gdb-call-sub7840.py`](tools/gdb-call-sub7840.py)) :

```bash
export QT_QPA_PLATFORM=offscreen
gdb -q -batch -ex "source tools/gdb-call-sub7840.py" \
    --args /lib64/ld-linux-x86-64.so.2 ./tb_patched
```

- `set breakpoint pending on` + `break time` + `run` : s'arrête dans `main` (`time(NULL)` avant `srand`), PIE chargé ; base lue via `info proc mappings` (ligne du binaire).
- On construit en mémoire un `std::string` SSO (≤ 15 octets : `{ptr, size, buf[16]}`, `ptr` → `buf`) puis `call base+0x7840(out, in)` ; on relit `{ptr,size}` du résultat.
- Sorties observées = celles du solveur pour les 8 entrées testées : `petik→MTAwMDAxMQ==`, `will_smith→MTAxMA==`, `marcus_vane→MTAxMTAwMA==`, `john_doe→MTAwMTA=`, `jomes_sandin→MTExMTA=`, `sarah_jenkins→MTAwMTAwMA==`, `franklin_sierra→MTAxMTAxMA==`, `AA→MA==`.
- Pièges : PIE (offsets `0x7840`, `0x46A0`, `0x56C0` relatifs à la base), `std::string` ABI cxx11, pas d'écran → `offscreen`.

Limite : c'est l'appel de la fonction de dérivation, pas un clic dans la GUI ; la comparaison `memcmp` + test `john_doe` est lue statiquement dans `sub_56C0`.

## Vérification

```bash
python3 tools/james-solve.py --list
# will_smith       MTAxMA==        … (identique aux valeurs relevées sous gdb)
python3 tools/james-solve.py john_doe -q    # MTAwMTA=
python3 tools/james-solve.py AA -q          # MA==     (XOR nul)
```

Cas KO (statique, `sub_56C0`) : mot de passe ≠ dérivé, ou longueur différente → `Authentication failed. Invalid client credentials.` ; champ vide → `Error: Input arguments cannot be NULL`.

## Notes

- Ce n'est pas du chiffrement : une réduction XOR sur 8 bits (≤ 7 bits de bruit) puis base64 — collisions nombreuses (beaucoup d'utilisateurs partagent le même mot de passe).
- Aucun accès réseau : « Connecting to enterprise server… » et les barres de progression sont de la mise en scène (`rand`).
