# momospc's MyCrackme

| | |
|---|---|
| **ID** | [`6941aea10992a052ab22239d`](https://crackmes.one/crackme/6941aea10992a052ab22239d) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | momospc |
| **Plateforme** | Linux ELF64 x86-64, C++ (GCC 15.2.1), PIE, console |
| **SHA-256** (`original/download.bin`) | `446a0a7a5c572de394d94c0dbef54abac6b168173899a8c742d773a587d4525f` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mot de passe `crackmes.one`), **non modifié** |
| `analysis/extracted/` | contenu des ZIP imbriqués : `MyCrackme` (ELF), `README.md` de l'auteur, `solver.zip` (solveur de l'auteur, **non ouvert**) |
| `tools/momospc-solve.py` | keygen / `--score` / `--check` contre le binaire |

## Réponse

Pas de user : un mot de passe libre, tel que `y(pw) == 0x539` (1337).

**`!!k`** (plus court, minimum lexicographique ; il en existe une infinité d'autres).

```bash
python3 -I tools/momospc-solve.py            # password = !!k
python3 -I tools/momospc-solve.py --check <chemin>/MyCrackme   # preuve live
```

## Premier regard

`download.bin` est un ZIP → `mycrackme.zip` → `MyCrackme` (ELF), `README.md`, `solver.zip`. Le README de l'auteur n'apporte rien (« the password for the solver is: help »). Je n'ai pas ouvert `solver.zip` : reverse refait de zéro.

`strings` : `super_secret_password`, `password: `, `access granted`, `nope`. Symboles non strippés : `main`, `_Z1xx` (`x(long)`), `_Z1yPKc` (`y(const char*)`).

## Flow (`main`, 0x1217)

```
cout << "password: "; cin >> buf;          // buf = rbp-0x50
if (strcmp(buf, "super_secret_password") == 0) return 1;   // 0x1276 -> 0x127f : LEURRE
if (y(buf) == 0x539) cout << "access granted"; else cout << "nope";
```

## Comment on trouve

Ancrage : `objdump -d -M intel MyCrackme` (adresses = offsets fichier PIE).

1. Le `strcmp` avec `super_secret_password` (0x1276) saute à `mov eax,1 ; ... ret` : on sort avec le code 1 **sans rien afficher**. C'est un piège, pas la solution.
2. Le vrai test : `call y ; cmp eax,0x539` (0x128d-0x1292) → « access granted ».
3. `y` (0x11b7) : boucle sur la chaîne, `sum += x(buf[i] + i)` avec `buf[i]` en `movsx` (char signé) et `sum` en int 32 bits.
4. `x` (0x1169), asm commenté :
   ```
   lea  rax,[rdx+rdx]; add rax,rdx ; add rax,7   ; t = 3v + 7
   mov rdx,rax; shr rdx,63; add rax,rdx; sar rax,1 ; t = t / 2  (signé, arrondi vers 0)
   shl rax,2; add rax,rdx; sub rax,11             ; r = 5t - 11
   ```
   Donc `x(v) = 5*((3v+7)/2) - 11`.

Exemple `petik` : `y("petik") = 4155 ≠ 1337` → `nope`. Pour un caractère imprimable `x(v) > 0`, la somme est croissante : un BFS sur (position, somme partielle ≤ 1337) trouve le plus court mot de passe. Pour `!!k` : `x('!'+0)=254`, `x('!'+1)=259`, `x('k'+2)=824` → 254+259+824 = 1337.

Pièges : `cin >>` s'arrête aux espaces (pas de blanc dans le mot de passe) ; buffer de 0x48 octets utiles (rester court) ; l'ajout de l'index `+ i` décale chaque caractère, d'où un mot de passe non trivial.

## Vérification

Binaire d'origine copié hors dépôt (`/tmp`, `chmod +x`), exécution native :

```
$ python3 -I tools/momospc-solve.py --check /tmp/mc/MyCrackme
'!!k':   b'password: access granted\n' OK
'petik': b'password: nope\n' OK
$ echo super_secret_password | ./MyCrackme   # rc=1, aucun message (leurre)
```

## Notes

- GDB non utilisé (reverse 100 % statique + exécution native), donc pas de section GDB.
- Le « super_secret_password » n'est **pas** le mot de passe : il quitte en silence (code 1).
