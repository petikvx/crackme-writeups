# firefly (XuPoxuTo) — notes de recon (non résolu, dé-obfuscation partielle)

## Identité
- `original/cRackmEEE.py` — script Python UTF-8 de 556 KB, 42 lignes
- sha256 `ee4b1489e23df9794f824e8c37391eef48f3558b637714f822ea6aa4e7f414c7`

## Il faut Python 3.13
Sous 3.14 le script meurt sur `RuntimeError: !!! Editing is prohibited !!!`.
Le bytecode embarqué (voir pool 4) commence par `\x95\x00` puis `S\x01` :
en 3.13 `0x95 = RESUME` et `0x53 = LOAD_CONST`, en 3.14 ce sont
`CALL_BUILTIN_O` / `LOAD_DEREF`. Donc :

```bash
python3.13 original/cRackmEEE.py      # → "enter a password: "
```

Le check d'intégrité est un `sha256` sur `co_code` + `co_consts` + `co_names` +
`__doc__` de la frame `<module>` (pool 2 entrées 34–38), comparé au digest
`b'\xf1C\xd5\\~\xfe\n\x81…'` (pool 2 entrée 69) : il échoue dès que le bytecode
du module diffère, donc dès qu'on change de version de CPython.

## Chaîne d'obfuscation (obfuscateur « FireFly »)
1. **Stage 1** = les 42 lignes : anti-tamper + `exec(marshal`-style via
   `base64.b85decode` → **gzip** (pas zlib : en-tête `1f 8b`) → 1.5 MB de Python.
   Extraction : `tools/firefly-fold.py`.
2. **Stage 2** = 3003 lignes : noms `Xx…_FireFly_…`, constantes en
   `(lambda: 5)()+(lambda: 57)()`, control-flow aplati en `match/case` sur un
   compteur d'état, `getattr` indirect. Le pliage de constantes par AST donne
   `analysis/stage2-folded.py` (lisible).
3. **4 string pools chiffrés**, chacun :
   `zlib.decompress(blob ^ shake_128(key).digest(len(blob)))`, puis
   `n = u32[0]`, bitmap de `(n+7)//8` octets (str vs bytes), `n+1` offsets u32,
   puis les données. Dumpés par `tools/firefly-pooldump.py` :

| fichier | entrées | contenu |
|---|---|---|
| `analysis/pool1-bootstrap.txt` | 112 | noms de builtins, `types.CodeType`, serials leurres `2DMH07XR-Z3KT-…` |
| `analysis/pool2-integrity.txt` | 70 | le check d'intégrité ci-dessus + le docstring ASCII-art |
| `analysis/pool3-antidebug.txt` | 226 | anti-debug : `frida`, `debugpy`, `pydevd`, `de4py`, `hunter`, `snoop`, `viztracer`, Termux (`/data/data/`, `libtermux-exec`), `LD_PRELOAD`, `DYLD_INSERT_LIBRARIES`, `IsDebuggerPresent`, `sys.addaudithook`, `sys.monitoring`, `gettrace`/`getprofile` |
| `analysis/pool4-vm.txt` | 4036 | **co_code bruts** reconstruits en `types.CodeType` + messages `Invalid VM function flags` / `Invalid VM blob flags` |

## Pourquoi ce n'est pas fini
Le prompt `enter a password: ` n'apparaît dans aucun des 4 pools : il y a une
**VM supplémentaire** au-dessus (les « VM blob » du pool 4). Il faut reconstruire
les code objects du pool 4 (loader maison, en 3.13) et les désassembler pour
atteindre le prédicat.

## Reste à faire
1. Écrire le loader des code objects du pool 4 et `dis.dis` chaque fonction.
2. Trouver la comparaison du mot de passe et le solveur.
