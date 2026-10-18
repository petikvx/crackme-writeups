# sudoddos's crackme

| | |
|---|---|
| **ID** | [`6ad4fb7e4ab951a9999d9ed6`](https://crackmes.one/crackme/6ad4fb7e4ab951a9999d9ed6) |
| **Auteur (site)** | sudoddos |
| **Plateforme** | Python (script `crackme.py`, multiplateforme) |
| **SHA-256** | `7544776833d93234f25b3da6e60f129598f677929c305b76e5d78a7aa8653e3c` |

Origine : [`ORIGIN.yml`](ORIGIN.yml) · page https://crackmes.one/crackme/6ad4fb7e4ab951a9999d9ed6 · ZIP password `crackmes.one`.

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme.py` | script d'origine (1,1 Mo, très obscurci) |
| `tools/simplify.py` | simplificateur d'AST **statique** : repli de constantes (`chr`/`len`/arithmétique), alias, `getattr(x,'a')`→`x.a`, `__import__('builtins').f`→`f`, code mort, renommage |
| `tools/peel.py` | pèle les couches : simplify → ordre d'exécution (mini-interpréteur arithmétique) → fusion → `layer.py` |
| `tools/layer.py` | déchiffre une couche en n'appelant que ses fonctions *pures* (liste blanche `hashlib`/`zlib`/`lzma`/`bz2`/`binascii`), `compile()` remplacé par `return` du texte |
| `tools/irdump.py` | décode l'IR de la dernière couche (protos) |
| `tools/sudoddos-solve.py` | calcule le mot de passe (`-q`, `--check`) |
| `analysis/peel/L{2,3,4}_next.py` | sources déchiffrées des couches 2 à 4 ; `L4_simpl.py` = couche 4 simplifiée |
| `analysis/ir_dump.txt` | le **vrai programme** (IR décodée, 287 lignes) |

## Réponse

**Mot de passe : `PeNiZoBfUsCaT0R67`**

```bash
python tools/peel.py original/crackme.py analysis/peel          # L2_next.py, L3_next.py, L4_next.py, L4_simpl.py  (s'arrête sur la couche 4 : normal)
python tools/irdump.py analysis/peel/L4_simpl.py analysis/ir_dump.txt
python tools/sudoddos-solve.py analysis/ir_dump.txt              # -q : seulement le mot de passe ; --check : compare à la valeur vérifiée en live
```

(Pas de login dans ce challenge : un seul mot de passe, pas d'exemple `petik`.) Toute la chaîne tourne en ~3 s à partir du fichier d'origine.

## Premier regard

```text
$ file crackme.py     -> Python script, UTF-8 text, very long lines
387 lignes, 1 109 073 octets ; la ligne 30 fait 159 218 caractères
```

Le début ressemble à ceci (les noms ne contiennent que `X` et `x`, 18 à 40 caractères) :

```python
XXxXxxXxXxXxxXxXXxxXxXXxXx = chr
xxxXxXxXxxXxxXXxXXxxxXxXXXxXxxxXxxXxxXxX = getattr
XxxXxxxxXxXXxXxxXxXXXxXXxxxXxxXxxxx = __import__
xXxxXXXXxxxXXXxxxxXXXxxxxXXXXXxXXXX = len
XXXXxxxxxX = xXxxXXXXxxxXXXxxxxXXXxxxxXXXXXxXXXX('X')           # = 1
xXxxxX      = xXxxXXXXxxxXXXxxxxXXXxxxxXXXXXxXXXX('XX') * xXxxXXXXxxxXXXxxxxXXXxxxxXXXXXxXXXX('XXXXX')   # = 10
XXxxXxxxx…  = getattr(__import__(chr(len('XXXXXXXXX') * 10 + len('XXXXXXXX')) + …), chr(…) + …)         # = builtins.range, .exec, …
```

Toute constante (entier, caractère, nom de module/attribut) est donc écrite comme une expression en `len('X…')`, `chr(...)`, `*10 +`. Ce n'est **pas** un `.pyc`/PyInstaller : c'est du texte, donc analysable par AST sans rien exécuter.

## Flow

1. Alias (`chr`, `getattr`, `__import__`, `len`, `range`, `exec`, `lzma`, `bz2`…) et une **table de dispatch** à clés entières (`15896337 → compile`, `9575511 → exec`, `11384007 → zlib.decompress`, `16465475 → hashlib.sha256`…).
2. `sys.addaudithook(lambda …)` qui lève dès qu'on essaie d'ajouter un autre hook d'audit (anti-trace).
3. 5 gros **blobs** en alphabet de 256 symboles *box-drawing/emoji* (`─━│┃…🛓`).
4. 8 **chaînes de code** (`exec`) lancées dans un ordre calculé par une suite congruentielle ; 3 clés de dispatch ne correspondent à rien (`v.get(k, lambda: 0)` ⇒ leurres).
5. Contrôles anti-debug (`sys.gettrace`, `getprofile`, `PYTHONBREAKPOINT`, `PYDEVD_*`, `pdb/bdb/pydevd/trace/cProfile`, `/proc/self/status` `TracerPid`, `LD_PRELOAD`…). **S'ils échouent, le script affiche `FLAG{fake_debug_trap}`** : faux flag piège.
6. Sinon : on réordonne les blobs (permutation décodée par `f6`), on décode → XOR SHA-256 → `zlib` → **le programme réel est une nouvelle couche** du même type… 4 couches au total, jusqu'à un petit interpréteur d'IR qui contient enfin le vrai code (une boucle `input()`).

## Comment on trouve le mot de passe

### 1. Ancrage : ne rien exécuter

Le script étant du texte, on le parse avec `ast` (`tools/simplify.py`) :

```bash
python -I tools/simplify.py original/crackme.py analysis/deob1.py     # 1,1 Mo -> ~200 Ko, 190 lignes lisibles
```

Étapes de la simplification (toutes sur l'AST) : évaluation de `len('X…')`/`chr()`/`+ * ^ & | << >>` sur constantes ; remplacement des alias (`X = getattr` …) et de la table de dispatch quand l'index est constant ; `getattr(o, 'nom')` → `o.nom` ; suppression des prédicats opaques (`if 0 != 0`, `x ^ c ^ c`, `for _ in range(0)`) et des affectations mortes ; renommage `v1…`, `f1…`. On obtient des fonctions lisibles (`f5` = mélange SHA-256, `f6`/`f7` = décodeurs, `f8` = déchiffrement + `compile`).

### 2. La couche 1 (blobs → programme)

```python
def f5(a5):                                 # alphabet de 256 symboles mélangé (Fisher-Yates) par SHA-256
    ba = bytearray(); ctr = 0
    while len(ba) < 1024: ba.extend(sha256(a5 + '■■■'.encode() + ctr.to_bytes(4,'big')).digest()); ctr += 1
    al = list(ALPHABET); i = 0; j = 255
    while j > 0:
        r = int.from_bytes(ba[i:i+4],'big') % (j+1); i += 4
        if i + 4 > len(ba): ba.extend(sha256(a5 + '■■□'.encode() + ctr.to_bytes(4,'big')).digest()); ctr += 1
        al[j], al[r] = al[r], al[j]; j -= 1
    return al
```

* `f6('╇╍╹▇@'[::-1])` donne la **permutation** des blobs (`[0,1,3,2,4]`) : chaque caractère est un indice dans l'alphabet mélangé, XORé avec un flux `sha256(clé ‖ nonce ‖ compteur)`.
* `f7(chaîne)` : chaque symbole → son rang, on **saute des positions** `(5·i+56) mod m == t` et on soustrait un masque issu d'un LCG (`×1103515245+12345 mod 2²⁴`, rafraîchi tous les 6 symboles).
* `f8(octets, chaîne)` : XOR avec `sha256(clé ‖ nonce ‖ n)` (piège : **le nonce de `f8` n'a pas le `XOR 255` sur le dernier octet** que `f6` applique), `zlib.decompress`, puis `sha256(chaîne) == K` — c'est un **contrôle d'intégrité**, pas un mot de passe — et `compile(src,'<god>','exec')`.

Ces fonctions sont pures : `tools/layer.py` les exécute isolément (après avoir vérifié par AST qu'elles n'appellent que `hashlib/zlib/lzma/bz2/binascii`) et remplace le `compile()` final par un `return` du texte. Résultat : la source de la couche 2 (85 053 caractères).

### 3. Les couches 2, 3, 4 (même emballage, paramètres différents)

| Couche | Blobs | Permutation | Déchiffrement | Sortie |
|---|---|---|---|---|
| 1 | 5 × 17 822 | `[0,1,3,2,4]` | XOR SHA-256 + `zlib` | 85 053 car. |
| 2 | 5 × 7 416 | `[1,4,2,3,0]` | XOR SHA-256 ×2 + `lzma` | 62 901 car. |
| 3 | 3 × 4 035 | `[2,1,0]` | même schéma (paramètres propres, `lzma`) | 18 311 car. |

L'**ordre d'exécution** des chaînes de code change à chaque couche (suite congruentielle `k ← k·A + B mod 2²⁴`, clés `v50[i] ^ k`, ou variante à triplets) : `tools/peel.py` embarque un mini-interpréteur d'arithmétique (entiers, listes, dicts, `while`/`if`, `lambda`) qui rejoue la boucle de dispatch et note les indices passés à `exec`, sans jamais exécuter les chaînes. Pour la couche 1 il trouve `[0, 6, 4, 2, 1]` (les chaînes 3, 5 et 7 ne sont jamais lancées).

### 4. La couche 4 : un interpréteur d'IR

La dernière couche (`analysis/peel/L4_simpl.py`) ne contient plus de `exec` de chaînes de blobs mais un **mini-VM** :

* `v6 = v1+v2+v3+v4+v5` (blobs), `f3(S, k0)` : permutation d'alphabet par LCG fixe (`v ← v·1103515245+12345 & 0x7fffffff`, `c = v>>13 & 255`) + flux `st ← st·1664525+1013904223`, avec `k0 = (142897697 ^ debug·117327007) & 0xffffffff`.
* contrôle `FNV-like(octets) == 1827820867`, puis `zlib.decompress`, puis `f4` : désérialiseur maison (varint, `None`/int/str/list/tuple/dict).
* `v14` interprète des « protos » : chaque instruction est `[opcode masqué, chaîne Python, …]`, **opcode réel = `(ins[0] − ek[ip] − 3·debug) & 255`** avec `ek` généré par un LCG (`×1017115+578536 mod 2²⁴`). `op102` = `exec(s)`, `op197` = saut si faux, `op134` = saut, `op39` = `return eval(s)`, `op57`/`op223` = `def`/`class`.
* **Piège anti-debug silencieux** : `f2()` (trace/profile/monitoring/`breakpointhook`/`pdb`) alimente `debug` ; si un débogueur est détecté, la clé `k0` et les opcodes sont faux → le hash ne correspond plus et `v13 = v10 = []` : le programme ne fait rien, sans message.

`tools/irdump.py` rejoue `f3` puis `f4` (les deux seules fonctions utiles, pures) avec `debug = 0`, vérifie `hash == 1827820867`, déchiffre les opcodes et écrit `analysis/ir_dump.txt`.

### 5. Le vrai programme (`analysis/ir_dump.txt`)

4 protos : le module, `_rrpn_00001(chunks)`, `_rrpn_00002()`, `__dd_4d2040__(k,…)`. Le flot est « aplati » (variables d'état `_rrpn_xxxx`, `if` à prédicats opaques `183 * 215 > 0`) mais le contenu est court :

```python
ENCODED_CHUNKS = [dd(2041254756), dd(1068542949), dd(1565733145), dd(1550129203), dd(1948581294),
                  dd(1088710518), dd(1268852946), dd(3464399074), dd(4174743113)]

def dd(k):                       # __dd_4d2040__ : toutes les chaînes du programme sont chiffrées dans __tt_4d2040__
    return bytes(x ^ (k >> (8 * (i & 3)) & 255) for i, x in enumerate(__tt_4d2040__[k])).decode()

def _rrpn_00001(chunks):         # mot de passe attendu
    raw = bytes.fromhex(''.join(chunks)).decode(dd(4292841768))      # 'ascii'
    return codecs.decode(raw, dd(2105268996))                         # 'rot13'

def _rrpn_00002():
    attempts = 0
    while True:
        guess = input(dd(1012185899)).strip()                         # 'enter the password: '
        attempts += 1
        if guess == _rrpn_00001(ENCODED_CHUNKS):
            print(f'\nright! the password was found in {attempts} attempt(s).'); break
        print(dd(3353885283))                                         # 'wrong. Try again.\n'
```

### 6. Assemblage de la réponse

`dd(k)` : l'octet `i` de `table[k]` est XORé avec l'octet `i mod 4` de `k` (little-endian). Les 9 chunks :

| clé `k` | chunk |
|---|---|
| 2041254756 | `4372` |
| 1068542949 | `4176` |
| 1565733145 | `4d62` |
| 1550129203 | `4f73` |
| 1948581294 | `4866` |
| 1088710518 | `506e` |
| 1268852946 | `4730` |
| 3464399074 | `4536` |
| 4174743113 | `37` |

Concaténation hexa `43724176 4d624f73 4866506e 47304536 37` → `bytes.fromhex(...).decode('ascii')` = `CrAvMbOsHfPnG0E67` → `rot13` = **`PeNiZoBfUsCaT0R67`** (`C→P r→e A→N v→i M→Z b→o O→B s→f H→U f→s P→C n→a G→T 0 E→R 6 7`).

### Pièges rencontrés

* **Ne rien exécuter** : le script est un loader qui `exec` des chaînes ; on a tout fait par AST (les fonctions de déchiffrement sont pures et filtrées par liste blanche). Seule la vérification finale lance le crackme, après lecture complète de la chaîne, dans un dossier vide et avec `-I`.
* **Premiers blobs ≠ bons blobs** : avant de comprendre qu'il fallait suivre les noms de la liste `[v3[::-1], …]`, une extraction « 5 premières grosses chaînes » échouait.
* **Deux nonces différents** (`f6` avec `XOR 255`, `f8` sans) : l'erreur se manifestait par `zlib.error: incorrect header check`.
* **Seuil de longueur** : certains blobs de la couche 4 font moins de 1 000 caractères.
* **Faux flag** `FLAG{fake_debug_trap}` si un anti-debug se déclenche, **échec silencieux** à la couche 4 sous débogueur.

## Vérification

Binaire d'origine (Windows, `python -I crackme.py`, dossier vide) :

```text
enter the password: PeNiZoBfUsCaT0R67
right! the password was found in 1 attempt(s).

enter the password: wrongpass          -> wrong. Try again.   (redemande la saisie)
```

Aucun screenshot (script console). `python tools/sudoddos-solve.py --check analysis/ir_dump.txt` → `check … OK`.

## Notes

* Ni GDB ni x64dbg/IDA n'ont servi : analyse 100 % statique (AST + Python).
* Le mot de passe alterne majuscules/minuscules avec un `0` et un suffixe `67` (`PeNiZ`·`oBfUsCaT0R`·`67`) ; `FLAG{fake_debug_trap}` n'est **pas** la solution.