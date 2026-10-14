# crackme04 — seveb (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5e33c5d40ad448c78a · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 **et** ELF64 (`crackme04_32bit`, `crackme04_64bit`), C, GCC 2014
- Archive : `original/crackme04.tar.gz`
- ⚠ **Le crackme se supprime** : un échec appelle `remove(argv[0])` (le binaire disparaît du dossier). Toujours l'exécuter sur une copie.

## Réponse

À **13:37** et avec un **PID égal à 1337** (0x539), le serial attendu est :

```
217552398261569-545326772-1082328767-1082328760-1082328765-1082328753
```

```bash
python3 -I tools/crackme04-solve.py --check
# check: OK (pid=1337 & 13:37 → WIN=True, mauvais serial→LOSE=True, sans shim→LOSE=True)
```

(Le `--check` force le PID et l'heure par un `LD_PRELOAD` `tools/shim.c` — `getpid`, `strftime`, `remove` — sur une copie du binaire ; sans la substitution, le programme affiche `YOU LOSE!`.)

## Premier regard

```text
$ ./crackme04_64bit               (sur une copie !)
-=[ CrackMe #4 ]=-
YOU LOSE!                           <- et le fichier est supprimé
$ strings -n 4 analysis/crackme04_64bit | grep -E "13:37|7030726e|remove|getpid"
13:37   7030726e   remove   getpid   strftime
```

## Comment on trouve

**Ancrage** : `objdump -d -M intel analysis/crackme04_64bit` (non strippé : `main` @`0x40093d`, `theEnd`, `theOtherEnd`, `oil`, `getCurTime`).

```asm
400979: call getCurTime                       ; strftime("%H:%M") -> [rbp-0x560]
4009ee: strcmp(heure, "13:37") ; jne -> theOtherEnd(argv[0])   ; puts("YOU LOSE!") ; remove(argv[0]) ; exit(1)
400a09: cmp [pid], 0x539 ; jne -> theOtherEnd
400a27: acc = 0x35478 ; p = "7030726e" ; for i in 0..6 :
          t = p[i] + 0x5c ; acc ^= pid ; t += acc ; oil(&acc,&t)  ; t ^= 4, acc |= 0x2e39f3
          sprintf(tmp, "%d", t) ; strncat(out, tmp) ; acc <<= 7
400b5d: fgets(saisie, strlen(out)+1) ; strcmp(saisie, out) == 0 -> theEnd() « YOU WIN »
```

L'heure et le PID servent de **portes** : le serial lui-même ne dépend que de `pid = 1337` (xoré dans `acc`), pas de l'heure. Les 7 valeurs sont concaténées en décimal (certaines négatives : le `-` fait partie du serial).

**Pièges :**
- `remove(argv[0])` : lancer plusieurs fois l'original l'efface ; restaurer depuis `original/crackme04.tar.gz` (c'est arrivé pendant l'analyse).
- PID **exactement** 1337 et minute **13:37** : en pratique il faut forcer `getpid()`/`strftime()` (shim) ou patcher une copie.
- `fgets(…, strlen(out)+1)` : la longueur lue est exactement celle du serial attendu (66 caractères avec les signes).
- Les quatre dernières valeurs sont très proches (`1082328753…767`) parce que `acc` sature à `0x2e39f3 << 7` (bits `|=` répétés).

## Vérification

```text
$ python3 -I tools/crackme04-solve.py --check          # analysis/verify.txt
check: OK (pid=1337 & 13:37 → WIN=True, mauvais serial→LOSE=True, sans shim→LOSE=True)
```

## Fichiers

- `analysis/crackme04_32bit`, `analysis/crackme04_64bit`, `analysis/dis.txt`, `analysis/verify.txt`
- `tools/crackme04-solve.py` : calcule le serial + `--check` (copie + shim) · `tools/shim.c`
