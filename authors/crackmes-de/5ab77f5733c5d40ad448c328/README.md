# crackmes.de's crackme_v4 by logan

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c328`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c328) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | logan (miroir crackmes.de) |
| **Plateforme** | Windows PE32 console, MSVC 7.10 (VS2003), C++ (iostream) |
| **ZIP** | `original/crackme.zip` (mot de passe `crackmes.one`) |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme.zip` | archive d'origine (non modifiée) |
| `analysis/ex/crackme.exe` | exécutable extrait du ZIP (`unzip -P crackmes.one`) |
| `analysis/dis.txt` | `objdump -d -M intel crackme.exe` |
| `tools/crackme-v4-solve.py` | solveur (`-q`, `--check`) |

## Réponse

Pas de user/login : un seul mot de passe.

> **`omgstfuplz`**

```bash
python3 -I tools/crackme-v4-solve.py          # password = omgstfuplz
python3 -I tools/crackme-v4-solve.py -q       # omgstfuplz
python3 -I tools/crackme-v4-solve.py --check  # lance wine via xvfb-run -> "Good Job"
```

## Premier regard

```bash
unzip -P crackmes.one original/crackme.zip -d analysis/ex
file analysis/ex/crackme.exe     # PE32 console, Intel i386, 3 sections
diec analysis/ex/crackme.exe     # MS Linker 7.10, VC++ 13.10, VS2003
objdump -s -j .rdata analysis/ex/crackme.exe
```

Bannière : `(II)CrackmeV4.0 By Logan`, `Your password must be at least 10 length long.`, prompt `Password: `.
Chaînes de résultat dans `.rdata` : `Good Job, now use the password to subit your score.` (@0x40d14c) et `Wrong Password.` (@0x40d180). Pas de packer.

Exécution : `echo petik | xvfb-run -a wine crackme.exe` → `Wrong Password.`

## Flow

Tout est dans une seule fonction, `0x401ce0` (le `main` appelé depuis le CRT, entry `0x404505`) :

1. copie les 3 messages sur la pile (`rep movs`) et les affiche via `operator<<` (`0x401910`) ;
2. lit la saisie avec `istream::get(buf, 11, '\n')` (`0x401770`, buffer à `[esp+0xc]` : 11 = 10 caractères + NUL) ;
3. calcule `strlen` (boucle `0x401e2f`) et exige `== 10` (`cmp eax,0xa` @0x401e3b) ;
4. trois tests indépendants, chacun incrémente `ebp` (compteur) ; `ebp == 3` (`cmp ebp,3` @0x401f81) ⇒ `Good Job`.

## Comment on trouve le prédicat

**Ancrage** : les chaînes `Good Job` / `Wrong Password` (0x40d14c / 0x40d180) ne sont référencées que par la fonction `0x401ce0` (copie vers la pile en `0x401d73`/`0x401d2d`), et la fin de fonction (`0x401f86` vs `0x401f90`) choisit lequel afficher selon `ebp == 3`. On désassemble donc `0x401e3b..0x401f81`.

Notation : `p[i]` = i-ème caractère de la saisie (octet signé). Après `push ebx` (@0x401e50), `p[i]` est à `[esp+0x10+i]` ; avant, à `[esp+0xc+i]`.

### Test 1 — ordre strict (0x401e44..0x401e8f)

```asm
mov al,[esp+0x11]   ; p5       (avant push ebx : base 0xc)
mov cl,[esp+0xe]    ; p2
mov dl,[esp+0xc]    ; p0
push ebx
mov bl,[esp+0x11]   ; p1
cmp al,cl  / jge fail   ; p5 < p2
cmp cl,al  / jge fail   ; p2 < p8   (al rechargé = [esp+0x18] = p8)
cmp al,bl  / jge fail   ; p8 < p1
cmp bl,dl  / jge fail   ; p1 < p0
...                     ; p0 < p7 < p3 < p4 < p6 < p9
mov ebp,1               ; seulement si toute la chaîne est vraie
```

Chaque `jge` saute le `mov ebp,1` : il faut donc

`p5 < p2 < p8 < p1 < p0 < p7 < p3 < p4 < p6 < p9`.

### Test 2 — chaîne de différences (0x401e94..0x401f01)

Le code enchaîne des `lea edx,[reg±k]` / `cmp` / `jne` :

| Asm | Contrainte |
|---|---|
| `lea esi,[p1+2]; cmp p0,esi` | `p0 = p1 + 2` |
| `lea edx,[p2+6]; cmp p1,edx` | `p1 = p2 + 6` |
| `lea edx,[p3-0xc]; cmp p2,edx` | `p2 = p3 − 12` |
| `lea edx,[p4-1]; cmp p3,edx` | `p3 = p4 − 1` |
| `lea edx,[p5+0xe]; cmp p4,edx` | `p4 = p5 + 14` |
| `lea edx,[p6-0xf]; cmp p5,edx` | `p5 = p6 − 15` |
| `lea edx,[p7+5]; cmp p6,edx` | `p6 = p7 + 5` |
| `lea edx,[p8+4]; cmp p7,edx` | `p7 = p8 + 4` |
| `sub p9,0xe; cmp p8,..` | `p8 = p9 − 14` |

Si tout passe : `inc ebp` (@0x401f01).

### Test 3 — somme (0x401f02..0x401f78)

Les 10 caractères sont recopiés comme `int` dans un tableau (@`[esp+0x38]`), additionnés, puis `cmp eax,0x45b` (@0x401f78) ⇒ `Σ p[i] = 1115`.

### Assemblage de la réponse

Tout exprimer en fonction de `x = p9` :

```
p8 = x-14   p7 = x-10   p6 = x-5    p5 = x-20   p4 = x-6
p3 = x-7    p2 = x-19   p1 = x-13   p0 = x-11
Σ = 10x - 105 = 1115  ->  x = 122 = 'z'
```

D'où `p = [111,109,103,115,116,102,117,112,108,122]` = `omgstfuplz`.
Vérification de l'ordre : `f(102) < g(103) < l(108) < m(109) < o(111) < p(112) < s(115) < t(116) < u(117) < z(122)` ✓ (test 1 satisfait, solution unique car la somme fixe `x`).

### Pièges

- `ebp` est incrémenté par **chaque** test : il faut les 3 (un seul test faux ⇒ `ebp != 3`).
- Les `cmp` du test 1 sont signés (`jge`) mais tous les octets sont ASCII < 0x80, donc sans effet.
- Le décalage de 4 octets dû au `push ebx` au milieu du test 1 change les offsets pile (`[esp+0x11]` = `p5` avant, `p1` après).

## Debug GDB

Non utilisé : reverse 100 % statique (`objdump`) + preuve sous Wine.

## Vérification

```bash
$ python3 -I tools/crackme-v4-solve.py --check
password = omgstfuplz
OK                                  # stdout wine contient « Good Job »

$ printf 'omgstfuplz\n' | xvfb-run -a wine analysis/ex/crackme.exe
...Password: Good Job, now use the password to subit your score.

$ printf 'omgstfuplA\n' | xvfb-run -a wine analysis/ex/crackme.exe   # KO : somme/ordre/différence faux
...Password: Wrong Password.
```

## Notes

- Le crackme n'a pas de notion d'utilisateur ; `petik` donne `Wrong Password.` (longueur 5 ≠ 10).
- Le message « subit your score » est une faute de l'auteur (« submit »).
