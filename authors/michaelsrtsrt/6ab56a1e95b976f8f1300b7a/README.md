# michaelsrtsrt's Basics::AHardcodedKeyGoneWrong

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ab56a1e95b976f8f1300b7a) · id `6ab56a1e95b976f8f1300b7a`

PE64 console **Mingw-w64**, image base `0x140000000`. Pas de patch : la règle de l'auteur est de faire afficher `key: accepted`. Le flag du site est la saisie elle-même.

| Fichier | Rôle |
|---|---|
| [`original/keycheck.exe`](original/keycheck.exe) | binaire d'origine |
| [`tools/keycheck-solve.py`](tools/keycheck-solve.py) | affiche la clé ; `--check` sous Wine |
| [`tools/kc_emu.py`](tools/kc_emu.py), [`tools/kc_tab2.py`](tools/kc_tab2.py) | brouillons Unicorn (chemins Windows, pas le solveur) |
| [`analysis/NOTES.md`](analysis/NOTES.md) | notes du parking, périmées sur le texte des fiches |

## Réponse

Mot de passe (et flag) : **`CMO{YouFoundMeWoohoo}`**

```bash
python3 tools/keycheck-solve.py
printf 'CMO{YouFoundMeWoohoo}\n' | wine original/keycheck.exe
# key: accepted
```

`petik` est rejeté : le binaire ne dérive pas un serial d'un login. La longueur utile est 21 octets, exactement la fiche déchiffrée (sans le NUL).

## Premier regard

```text
file original/keycheck.exe
# PE32+ console, x86-64, Mingw-w64
# sha256 d9330a7d06ba9acffc4819e36be4e95aad9cd6d21ad4389512e17bd74a6fcf01
# 184320 octets
```

`strings` ne montre ni `accepted`, ni `rejected`, ni `CMO{`. Sous Wine, une mauvaise ligne donne quand même le bandeau :

```text
printf 'petik\n' | wine original/keycheck.exe
key: rejected
```

`main` est `sub_140002A90` (~aplati, control-flow flattening). Les imports passent par des thunks résolus au démarrage (`sub_1400092E0`), pas par des noms en clair dans le flot de `main`.

## Flow

1. `sub_140001560` exécute une fois la table de constructeurs CRT `0x14002B4F0` (sentinelle `-1`), à l'envers : `0x1400241E0`, `0x1400076D0`, `0x14000B4C0`, `0x140007E30`, `0x140007D90`, `0x140007D60`, `0x140007750`, `0x1400076F0`.
2. Deux coffres s'ouvrent.
   - Chaînes : `sub_1400076F0` → `sub_140009800`, blob `0x140028608`, chiffré `0x14002D160` (0x31 octets). Cinq fiches.
   - Constantes : `sub_140007D60` → `sub_1400087C0`, blob `unk_140028760`, 614 couples de qword.
3. `main` décode des identifiants via des wrappers (`sub_140007E50` … `sub_140007F60`), imprime `key: `, lit une ligne (`fgets`), coupe `\r` / `\n` (`strcspn`), puis appelle `sub_140003440` (l'import interne étiqueté `strlen`, id `0x71149CCF`). Ce n'est pas `strlen` : ~17 Ko, c'est le consommateur du mot de passe.
4. À `0x14000314E`, `main` compare le retour de cet appel à une valeur sur la pile. Égal → texte `accepted`, sinon `rejected`. Les deux textes viennent du coffre chaînes.

Identifiants d'API utiles (après le ctor) :

| Id | Rôle | Thunk |
|---|---|---|
| `0xA1FDAF7B` | `fgets` | `0x140002188` |
| `0xFA3B2E08` | `strcspn` | `0x140002158` |
| `0x71149CCF` | check (faux `strlen`) | `sub_140003440` |
| `0x6F597C3B` | `__acrt_iob_func` | `0x140002168` |
| `0xFB1E2F96` | `fflush` | `0x140002180` |

`InitOnceExecuteOnce` (`0x140002248`) n'ouvre pas les coffres : son `InitFn` `0x14000BFD0` ne fait qu'un `InitializeCriticalSection`.

## Comment on trouve le mot de passe

### Ancrage

IDA (idalib) sur `original/keycheck.exe` pour les noms et le pseudo de `main` / `sub_140009DA0` / `sub_140014510`. Le texte en clair ne sort pas d'`objdump` ni de `strings`. La preuve se fait en émulant les constructeurs puis `sub_140009DA0` (Unicorn), puis en rejouant la chaîne sous Wine.

`main` est aplati. L'état du dispatcher est de la forme `v4 XOR v5`, et `v5` est posé à `v4 XOR CONST`. L'identifiant de case est donc la constante elle-même (état initial `v4 XOR 0xF2264486`). Inutile d'inverser tout le graphe une fois les chaînes lues.

### Prédicat opaque, branche morte

`sub_140008540` est toujours vrai : `(lowbyte * ~lowbyte) & 1` vaut toujours 0, donc les deux hashes comparés matchent et `v3 == a1`. Dans `main`, `v7 = (predicate == 0)` est donc toujours faux. Le `CMOV` vers les constantes de rechange (`751877662`, `47045782`) ne part jamais. Les wrappers `ROL` autour de `sub_14000AAE0` / `sub_14000AD40` sont l'identité (`28+36`, `35+29`, `41+23` = 64).

### La formule des notes n'est pas le chemin vivant

Avant init, une valeur de coffre se lit :

```text
stocké XOR H(a4, clé, 0x10000002) XOR H(f2a0, clé, 0x25C66DFD)
```

`H` = `sub_140014510` (SipHash-like, `sub_140013420`). `a4 = 0x316d13db96479267`, `f2a0 = 0x283c961b56bc6371`. Contrôle : `H` sur la clé `0x25061C292E7500EF` donne `0x8c8771434f86e397`.

Après les constructeurs, `byte_14003F258` est armé. `sub_14000AD40` remplace alors le second hash par `sub_14000EA80(&unk_14003F160)` (contexte du chiffre). L'appel vivant `sub_140007ED0(0x25061C292E7500EF)` vaut `0xa715dcf5ca016256`, pas la formule. Les quatre identifiants « manquants » des notes (`0x0BDD0F79` et compagnie) sont des artefacts de cette formule : ils ne sont pas des fiches.

Décodages 32/64 bits réellement utilisés par `main` :

| Appel | Clé | Valeur vive |
|---|---|---|
| `sub_140007E50` | `0x0B8F7FDD1A5A81E9` | `0xb2a20f08` |
| `sub_140007E60` | `0x21842812D55D6365` | `0x41a85599` |
| somme des deux | | `0xf44a64a1` (id du format `printf`) |
| `sub_140007F60` | `0x6938D4C03BCB3917` | `0x975542335c39cff7` (matière du tweak) |
| `sub_140007ED0` | `0x25061C292E7500EF` | `0xa715dcf5ca016256` |
| `sub_140007E70` | `0xCE42959665AD325C` | `0xce05559c` |
| `sub_140007EA0` | `0x0CC820BAF69F9FC8` | `0x31faaaa4` |

### Coffre chaînes

`sub_140011FF0` vérifie le MAC puis déchiffre. Cinq fiches `(id, len, off)` :

| Id | Len | Off | Rôle |
|---|---|---|---|
| `0xF44A64A1` | 6 | 0 | format `printf` |
| `0xCBB564DF` | 3 | 6 | charset `strcspn` |
| `0xB9170251` | 22 | 9 | mot de passe |
| `0xFB285D2E` | 9 | 31 | `rejected` |
| `0xBFB96DDB` | 9 | 40 | `accepted` |

`sub_140009DA0(id, tweak)` ne rend de l'ASCII qu'avec le tweak du chemin vivant. Le premier appel remplit un cache (fiche + nœud) : un appel préalable avec tweak `0` empoisonne la fiche pour toujours. Sans appel précédent :

| Id | Tweak | Clair |
|---|---|---|
| `0xF44A64A1` | `0x30409ec69638ada1` | `key: ` |
| `0xCBB564DF` | `0xae97764c3b04ca77` | `\r\n` |
| `0xB9170251` | `0xb7574c2b43c7d0fb` | `CMO{YouFoundMeWoohoo}` |
| `0xFB285D2E` | `0xc95594baebaa4a29` | `rejected` |
| `0xBFB96DDB` | `0x55ed7b76517e469d` | `accepted` |

`sub_140003440` cherche l'id `0xB9170251` (douze fois sur une mauvaise saisie `petik`) puis retourne `0`. Le `cmp` à `0x14000314E` voit alors `0` contre `0xffffffffffffffff` et `main` affiche `rejected`. La chaîne attendue est le clair de cette fiche, pas une préimage à chercher sur GPU.

### Pièges d'émulation

- `qsort` : le comparateur `0x14000C020` trie des couples **uint64** (taille 16). Un tri par dword casse la recherche binaire ; `sub_140007ED0` retombe à 0. Les voûtes API / chaînes (taille 8) restent en dword (`sub_14000BF50`).
- TLS : `GS_BASE` = TEB, `TEB+0x30` = TEB, `TEB+0x58` = tableau TLS, et `TlsIndex` (`0x14002D21C`, `0xFFFFFFFF` dans le fichier) forcé à 0 avant le déchiffrement.
- `fflush` doit retourner 0. Un `emu_stop` dessus coupe `main` avant le check.
- Les `ROL` et le prédicat opaque ci-dessus : les constantes alternatives ne servent pas.
- `tools/kc_tab2.py` fait `sys.exit(0)` avant le déchiffrement des 614 couples et trie les `qsort` en `<II`. Ce ne sont pas le solveur.

## Vérification

```text
printf 'CMO{YouFoundMeWoohoo}\n' | wine original/keycheck.exe
key: accepted
# exit 0

printf 'CMO{YouFoundMeWoohoo}' | wine original/keycheck.exe
key: accepted

printf 'petik\n' | wine original/keycheck.exe
key: rejected

printf 'CMO{YouFoundMeWoohoo}x\n' | wine original/keycheck.exe
key: rejected
```

```bash
python3 tools/keycheck-solve.py --check
```

## Notes

- Pas de keygen nom → serial. Le H100 ne sert à rien : le mot de passe est en dur, seulement chiffré dans le coffre.
- L'algèbre interne de `sub_140003440` (`v63` / `v66` / `v68` / `v74`, ~2100 lignes de pseudo) n'a pas été inversée. Le binaire charge déjà le clair attendu.
- `sub_140007750` (ctor aplati, retour `0xA0216D4`) non déplié. Appeler `main` avant le ctor des API renvoie cette même constante et n'atteint pas `fgets` (`sub_14000AFB0` retourne 0).
- Pas de session GDB : ELF non concerné, preuve = Unicorn sur les constructeurs + Wine sur l'exe d'origine.
