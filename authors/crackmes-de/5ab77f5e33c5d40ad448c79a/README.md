# sorting_server_ctf (warsaw)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5e33c5d40ad448c79a) · id `5ab77f5e33c5d40ad448c79a`  
> Import crackmes.de — auteur **warsaw**.

Crackme **Python 2** (HTTP) : service de tri d’entiers dont le quicksort est seedé par un **flag 32-bit** secret (`flag.txt`). Diff ~4.0.

| Fichier | Rôle |
|---|---|
| [`original/sortingserver.zip`](original/sortingserver.zip) | archive site |
| [`original/_u/sortingserver.py`](original/_u/sortingserver.py) | source (Py2 : `BaseHTTPServer` / `urlparse`) |
| [`tools/sortingserver-solve.py`](tools/sortingserver-solve.py) | oracle CRT + `--serve-check` |

## Réponse

Le flag est un **entier non signé 32-bit** (contenu de `flag.txt` modulo `2**32`), pas une string. Il dépend de l’instance ; le solveur le **récupère** via l’oracle `?action=sort`.

```bash
# auto-test local (oracle Py3 + flag connu 0xC0FFEE42)
python3 tools/sortingserver-solve.py --serve-check
# flag_in  = 3237998146 (0xc0ffee42)
# flag_out = 3237998146 (0xc0ffee42)
# check    = Correct!

# contre un serveur déjà lancé (Py2 original ou port) :
python3 tools/sortingserver-solve.py --url http://127.0.0.1:8000 -q --check
```

---

## Premier regard

```text
$ file original/_u/sortingserver.py
Python script, ASCII text executable, with CRLF line terminators

Actions HTTP :
  /?action=sort&data=1,5,23
  /?action=checkFlag&data=0xDEADBEEF   # 5 essais max
  /?action=displaySource
```

Seed du RNG = `int(open('flag.txt').read()) % 2**32`.

## Prédicat / oracle

LCG « glibc-like » :

```python
x = (x * 1103515245 + 12345) % 2**32
return x & ((1 << 30) - 1)   # sortie tronquée 30 bits
```

Pivot : `i = rand.next() % len(vals)`. Partition :

```python
left  = [x for x in vals if x <= pivot]
right = [x for x in vals if x > pivot]
```

Si `pivot == max(vals)` et pas tous égaux → `left` a la **même** cardinalité que `vals` → récursion infinie →  
`"An error occured while sorting your data"`.

**Fuite** : tableau `n` zéros + un seul `1` à l’index `k` :

```text
erreur  ⟺  (first_rand % n) == k
```

On obtient `first_rand` (30 bits) par **CRT** sur des modules `2,3,5,…,31`, puis 4 lifts  
`x1 = r30 + t·2^30` (`t=0..3`) → `seed = (x1 - c) * inv(a) mod 2^32`.  
Désambiguïsation avec un second tirage LCG dans la même requête (tableau `[0,1,2]` forcé).

## Vérification

```bash
python3 tools/sortingserver-solve.py --serve-check
# check = Correct!
```

## Notes

- Ce n’est **pas** un keygen name→serial ; c’est un **side-channel** sur le choix de pivot.
- Le binaire d’origine est **Python 2** ; le solveur embarque un oracle Py3 équivalent pour `--serve-check`.
- `checkFlag` limite à 5 essais — le CRT évite le bruteforce `2^32`.
