# facets — monads (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5833c5d40ad448c411 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, strippé, clang 3.7 / gold ; segment de données **RWE** (code auto-modifiant)
- Archive : `original/facets_main.tar.gz` → `facets_main` (extrait sous `analysis/`)
- Usage : `./facets_main <nombre>`

## Réponse

```
./facets_main 7        # good.
```

Plus généralement tout entier `n` avec **`n & 0xffff == 7`** (`65543`, `-65529`, `131079`, …). Le `90` donné en exemple par le message d'usage (`run as ./prog a_number (e.g. ./prog 90)`) est un leurre : `bad.`

```bash
python3 -I tools/facets-solve.py --check
# check: OK (good=[7, 65543, -65529], bad=[0, 8, 90, 23, 65536])
```

## Premier regard

```text
$ ./analysis/facets_main
run as ./prog a_number (e.g. ./prog 90)
$ ./analysis/facets_main 90
bad.
```

Binaire de 3,8 Ko ; seules chaînes : `good.` / `bad.`, usage, `strtol`, `printf`. Le test n'est pas visible dans le code statique.

## Comment on trouve

**Ancrage** : `main` @`0x8049754` (`objdump -d -M intel`) : `argc == 2` sinon usage ; `strtol(argv[1], NULL, 10)` ; `call 0x80496e0` ; `eax != 0` → `printf("good.")` sinon `"bad."`.

La fonction `0x80496e0` est faite de **code auto-modifiant** : elle commence par `mov dword [0x804974b], 0xc324148b` puis `call 0x804974b` ; les `mov [edx+…], imm` écrasent les octets suivants pendant l'exécution (chaque `call 804974b` exécute le morceau que l'on vient d'écrire). L'analyse statique ne montre donc qu'un squelette ; le code réel se lit **après exécution** :

```gdb
gdb -nx -batch ./analysis/facets_main -ex 'break *0x80497e4' -ex 'run 7' -ex 'x/20i 0x80496e0'
```

```asm
0x80496e0: mov  edx,[esp]                  ; adresse de retour (technique « get pc »)
           …
           mov  eax,[esp+8]  ...
           cmp  word ptr [esp+4], 0x7      ; <- le test : 16 bits bas de l'argument == 7
           mov  ax,1 / cmove …             ; eax = 1 si égal, 0 sinon
           ret
```

Le test porte sur un **mot de 16 bits** (`cmp word …, 7`) : le haut de l'entier est ignoré, d'où `65543 = 0x10007` et `-65529` valides.

**Vérification par force brute** : `seq -1000 4000 | xargs -P8 … ./facets_main` → un seul « good » dans cette plage (`7`) ; le test à 16 bits donne les autres solutions hors plage (`65543`, …).

**Pièges :**
- Le segment `.data` est `RWE` (et `GNU_STACK` RWE) : l'auto-modification fonctionne telle quelle, rien à patcher.
- L'exemple `90` du message d'usage mène à `bad.` (leurre).
- Le test n'apparaît pas dans `objdump` : il faut lire le code **après** l'écriture (`gdb` : point d'arrêt sur l'instruction qui suit le `call`).

## Debug GDB (pas à pas)

```gdb
gdb -nx -batch ./analysis/facets_main \
    -ex 'break *0x80497df' \      # call 0x80496e0 (avant la fonction auto-modifiante)
    -ex 'break *0x80497e4' \      # retour de la fonction : le code est maintenant réécrit
    -ex 'run 7' \
    -ex 'continue' -ex 'x/20i 0x80496e0' -ex 'info registers eax'
# eax = 0x1  -> « good. »
```

`eax` vaut 1 pour `7`, 0 pour `8`/`90`.

## Vérification

```text
7 -> good.     65543 -> good.     8 -> bad.     90 -> bad.      (analysis/verify.txt)
```

## Fichiers

- `analysis/facets_main`, `analysis/dis.txt` (objdump), `analysis/verify.txt`
- `tools/facets-solve.py` : valeur + `--check` natif
