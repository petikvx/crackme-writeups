# noname_User's A test suite with obfuscated source code

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ae0a43e5fa39ab0d4ac1ec3) · id `6ae0a43e5fa39ab0d4ac1ec3`

Crackme **Python** pur (5 Mo), obfusqué par « Dark Magic » (même auteur que [Unbreakable Python?](../699c06a46ca1599050950670/) et [Test my obf. PLS](../69a138ff7a778cfffbfb6797/)).  
**Statut : partiel — pas de réponse vérifiable.** Le script n'a ni input ni flag (l'auteur précise « I don't know how to use the flag feature » ; 0 solve sur le site). Le but implicite est de retrouver la source d'origine (une suite de 106 tests).

| Fichier | Rôle |
|---|---|
| [`original/obf-test2.py`](original/obf-test2.py) | crackme (45 lignes, ligne 43 = payload de 5 Mo) |
| [`tools/darkmagic-unwrap.py`](tools/darkmagic-unwrap.py) | déballe les couches 1 et 2 **sans exécuter** le fichier |
| [`tools/sandbox-run.sh`](tools/sandbox-run.sh) | exécution sous `bwrap` (sans réseau, `/home` masqué) |
| [`analysis/stage1.py`](analysis/stage1.py) | helpers `__PowerfulObfuscator__` / `__PyHydraIsTheBest__` |
| [`analysis/run-output.txt`](analysis/run-output.txt) · [`cases.txt`](analysis/cases.txt) | sortie complète et liste des 106 cas |

## Ce qui est établi

```bash
python3 -I tools/darkmagic-unwrap.py     # stage1.py + stage2.py (stage2 non versionné, 5 Mo)
./tools/sandbox-run.sh                   # 106 × [CASE-PASS], 0 FAIL, rc=0
```

1. **Couche 0** (lignes 15-41) : classes aux noms Unicode, chaînes reconstruites par `chr(x ^ k)` ; l'appel en chaîne `__DarkMagic__()()()…` n'est qu'un trampoline.
2. **Couche 1** (ligne 21) : `a85decode → XOR 64 → zlib` → 858 o de source : deux fabriques  
   `__PowerfulObfuscator__` = `lzma.decompress(a85decode(s))` et `__PyHydraIsTheBest__` = `exec(compile(src, …), globals())`.
3. **Couche 2** (ligne 43) : `a85decode → lzma` → **4 974 172 o** de Python : prédicats opaques (`if (((687) or 2706) or …) != 0`), code mort, faux `try/pass`, tables de tuples.
4. **Loader** (fin de `stage2`, l.1068-1256) :
   - watcher d'intégrité du fichier (blake2b par tranches de 64 Ko → `watch-slice`) ;
   - clé « couronne » dérivée par `sha256` + MAC (`crown-shard-mac`) ;
   - anti-debug : `sys.gettrace()` / `sys.getprofile()` / `sys.monitoring` → un octet entre dans la dérivation de clé (un debugger donne de mauvaises clés plutôt qu'une erreur) ;
   - **72 « shells »** déchiffrés en chaîne (`sha256` de la clé précédente + XOR d'un keystream sha256-CTR, MAC `shell-frame-mac`), compilés puis `exec` dans un dict commun ; `compile`/`exec` doivent rester des builtins natifs (`funnel-pin`) → un hook Python sur `compile` est détecté.
5. Les shells contiennent ensuite des « shatter » (66), des modules `<70dadd18…>`, `<7937e5d6…>`, `<a194c4fb…>` : shards XOR-és et une VM maison (tables de tuples entiers, `while state != N` avec états XOR-és).

## Observation dynamique (sandbox)

- `sys.addaudithook` (événements `compile`, `exec`, `marshal.loads`) n'est pas détecté par le loader : 240 sources capturées, dont les 72 shells et 66 shatters. Les `marshal.loads` sont uniquement des `.pyc` de la stdlib (`pkgutil`, `collections`, …).
- **Le texte des 106 tests n'apparaît dans aucune source capturée** (`grep CASE-BEGIN` vide) : il vit dans la VM, pas en clair. Il reste donc à dévirtualiser les shatters pour retrouver le code d'origine.
- Sortie : `[CASE-BEGIN] add` … `heavy_csv_pipeline`, chaque cas `[RESULT] nom = valeur` puis `[CASE-PASS]`. Valeurs reproductibles hors adresses mémoire (`contextvar`).

## Suite possible

Dévirtualiser un shatter (les plus petits : `<shatter>` ~22 Ko, n°162-163) : identifier le dispatch, la table d'opcodes, puis rejouer la VM statiquement pour sortir le code d'un cas. À faire pour l'objectif « source d'origine ». Aucun solveur n'existe tant qu'il n'y a pas de flag à produire.

## Notes

- Ne **pas** lancer le fichier hors sandbox (l'obfuscateur annonce lui-même qu'il peut cacher du malware) ; ici : `bwrap --unshare-net`, aucun écriture hors tmp.
- Le fichier pèse 5 Mo : seuls les artefacts utiles sont gardés sous `analysis/`.
