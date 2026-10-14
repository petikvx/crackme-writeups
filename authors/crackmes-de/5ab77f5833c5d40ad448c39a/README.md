# exceptional — crp (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5833c5d40ad448c39a · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, **C++** (libstdc++), strippé ; readme de l'auteur : « as always no patching please »
- Archive : `original/exceptional.zip` → `exceptional/exceptional` (+ `readme.txt`)
- Usage : lit `name:` puis `key:` sur stdin

## Réponse

La clé est une chaîne de chiffres de **même longueur que le name** (≥ 4, et ≠ `Simon Templar`).

| Name | Key |
|---|---|
| `petik` | `61450` |
| `admin` | `60650` |
| `Zorro` | `00005` |
| `toto123` | `8802503` |

```bash
python3 -I tools/exceptional-solve.py petik --check
# name: petik / key : 61450 / check: OK (accepted=True, clé altérée→failed=True)
printf 'petik\n61450\n' | ./analysis/exceptional/exceptional      # accepted
```

## Premier regard

```text
$ printf 'petik\n12345\n' | ./analysis/exceptional/exceptional
--[exceptional.crp-]-----
name: key: ------------------
failed
$ strings -n 6 analysis/exceptional/exceptional | grep -E "except|Simon|catched|crp"
6exceptIiE  6exceptIbE  6exceptISsE  6exceptISt6vectorIS0_IiSaIiEESaIS2_EEE  2ok  2ko
Simon Templar   --[exceptional.crp-]---   catched :
```

Le code utilise les **exceptions comme valeurs de retour typées** : `except<int>`, `except<bool>`, `except<std::string>`, `except<vector<vector<int>>>`, et deux classes `ok`/`ko` portant une méthode virtuelle qui produit le message final (`accepted` / `failed  `, chaînes décalées d'une constante).

## Flow

`main` @`0x8049d9a` (hexrays le voit vide) : `getline(name)`, `getline(key)` puis `sub_804949A(name, key)` qui n'est qu'une suite de `throw` / `catch` dans la même fonction (landing pads non décompilés) :

1. `0x804a154(key)` : `throw except<int>(len(key))` si `len ≥ 3`, sinon `ko` (`0x804a0fc` = 3).
2. catch int → `0x8048e84(name)` : `throw except<bool>(name == "Simon Templar")`.
3. si `name != "Simon Templar"` : `0x804a1d2(name)` : `throw except<int>(len(name))` si `len ≥ 4` (`0x804a106` = 4) ;
   `len(name)` doit être **égal** à `len(key)`. Pour `Simon Templar`, `edi = -1` ≠ `len(key)` → toujours `ko`.
4. pour `i = 0 .. L-1` : `s = name` ; `next_permutation(s)` appliquée `name[i]*i` fois (`0x80490d8` + `0x804a494`) ; `rotate(s, i)` (`0x804a374`) ; la chaîne devient une ligne d'`int` (`0x804af50`, `0x804b0f0`).
5. `0x804916c(vector<vector<int>>)` : ligne `r` : `e ← (r+1) + e` (`0x804a276`) puis `e ← m_r · e` (`0x804a2ea`), avec `m_r = 11` si `r` impair, `3r+3` sinon ; le résultat est relancé par `throw except<vector<vector<int>>>`.
6. handler @`0x8049a21` : chaque ligne est encore multipliée par `name[r]` (`0x804a2b0`, `movsx`).
7. `0x8048ec0` : `digit_r = (Σ ligne_r) % 10 + '0'` ⇒ chaîne de `L` chiffres, relancée en `except<std::string>`.
8. `0x804905c` : `memcmp(digits, key)` ; égal → `throw ok` (« accepted »), sinon `ko` (« failed »).

## Comment on trouve

**Ancrage** : `bash -ic 'decc exceptional'` (`exceptional.i64.c`) donne les petites fonctions (`sub_804A…`), mais pas les `catch`. Le flot réel est reconstruit avec :

```gdb
gdb -nx -batch -ex 'break __cxa_throw' -ex 'commands' …   # affiche le typeinfo de chaque throw
```

```text
THROW 6exceptIiE      <- len(key)
THROW 6exceptIbE      <- name == "Simon Templar"
THROW 6exceptIiE      <- len(name)
THROW 6exceptISt6vectorIS0_IiSaIiEESaIS2_EEE
THROW 6exceptISsE     <- digits
THROW 2ko             <- memcmp != 0
```

puis `break *0x8049089` (le `memcmp` de `0x804905c`) pour lire la chaîne calculée à côté de la clé saisie :

```text
Breakpoint 1, 0x08049089
0x80538ac: "abcde"   <- clé saisie
0x805388c: "61450"   <- digits calculés pour name=petik
```

Les lignes du `vector<vector<int>>` sont lisibles avec `break __cxa_throw` sur le type `except<vector…>` : ex. pour `petik`, ligne 1 = `1177 1254 1298 1133 1199` = `11·(105+2) …` (`iptek`, `m=11`).

**Pièges :**
- Les `catch` sont dans les landing pads : Hex-Rays n'en montre pas la logique ; la multiplication par `name[r]` (étape 6) n'apparaît que dans le désassemblage du handler (`0x8049a21`). Sans elle on obtient `81410` au lieu de `61450`.
- `Simon Templar` est un piège : le test `edi == len(key)` échoue toujours (`edi = -1`).
- `next_permutation` « boucle » (retour à l'ordre croissant) : la fonction `0x804a494` inverse la chaîne quand elle n'a plus de permutation suivante, ce que le keygen reproduit.
- Arithmétique en `int` signé (`movsx`) : correct pour de l'ASCII.

## Vérification

```text
$ for n in petik admin Zorro; do printf '%s\n%s\n' $n $(tools/exceptional-solve.py $n -q) | ./exceptional; done   # analysis/verify.txt
accepted   accepted   accepted
$ printf 'petik\n61451\n' | ./exceptional
failed
```

Le binaire d'origine n'est jamais modifié (le readme de l'auteur demande « no patching »).

## Fichiers

- `analysis/exceptional/` : `exceptional`, `readme.txt`, `exceptional.i64.c` (Hex-Rays), `dis.txt` (objdump) ; `analysis/verify.txt`
- `tools/exceptional-solve.py` : keygen + `--check` natif
