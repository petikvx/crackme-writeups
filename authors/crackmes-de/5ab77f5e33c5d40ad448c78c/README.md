# crackme05 — seveb (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5e33c5d40ad448c78c · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 **et** ELF64 (`crackme05_32bit`, `crackme05_64bit`), C, non strippés ; « Write a keygen and tell us how you solved the crackme »
- Archive : `original/crackme05.tar.gz` → `crackme05/` + `readme`
- Usage : `./crackme05_64bit <serial>`

## Réponse

Serial de **19 caractères**, ex. :

```
0zz0-bcda-aefb-0yy0
```

```bash
python3 -I tools/crackme05-solve.py --check
# check: OK (4 serials × 2 binaires acceptés=True, altérés rejetés=True)
./analysis/crackme05/crackme05_64bit 0zz0-bcda-aefb-0yy0     # … Good Job!
```

Famille complète (`--seed N` génère d'autres serials valides) : voir les règles ci-dessous.

## Premier regard

```text
$ ./analysis/crackme05/crackme05_64bit abc
ROCK 4: Serial not 19 chars!
          ,--.!,   __/   -*-  ...  (art ASCII)
I have not failed. I've just found 10,000 ways that won't work.   - Thomas Edison
```

Quatre vérifications nommées d'après un jeu : `rock`, `paper`, `scissors`, `cracker`. La moindre erreur appelle `bomb()` qui affiche un art ASCII et une citation (XOR-décodée par `decraycray`) puis `exit(1)`.

## Comment on trouve

**Ancrage** : `bash -ic 'decc crackme05_64bit'` (non strippé : `main`, `rock`, `paper`, `scissors`, `cracker`, `bomb`, `decraycray`). `main` appelle dans l'ordre `rock(argv[1])`, `paper`, `scissors`, `cracker`, puis affiche « Good Job! ».

| Fonction | Contrainte sur `s` |
|---|---|
| `rock` | chaque caractère ∈ `-`, `0-9`, `A-Z`, `a-z` (rejette ≤44, 46–47, 58–64, 91–96, >122) ; longueur = 19 |
| `paper` | `v2 = (s[8]^s[10]) + 48 ∈ [48,57]`, `v3 = (s[5]^s[13]) + 48 ∈ [48,57]` ; `s[3] = s[15] = v2` ; `s[0] = s[18] = v3` |
| `scissors` | `s[1]+s[2] > 170`, `s[16]+s[17] > 170`, et `s[1]+s[2] ≠ s[16]+s[17]` |
| `cracker` | `s[4]+s[9]+s[14] = 135` ⇒ les trois valent `-` (45) : seule combinaison d'octets ≥ 45 |

Construction de `0zz0-bcda-aefb-0yy0` : `s[4]=s[9]=s[14]='-'` ; `s[8]=s[10]='a'` (xor 0 → `v2='0'` → `s[3]=s[15]='0'`) ; `s[5]=s[13]='b'` (xor 0 → `v3='0'` → `s[0]=s[18]='0'`) ; `s[1]=s[2]='z'` (244) et `s[16]=s[17]='y'` (242) ; `s[6,7,11,12]` libres.

**Pièges :**
- `rock` autorise exactement `-` comme séparateur (45) mais pas `.`/`/` (46–47) ni `_` (95) : lire les bornes avec soin.
- `paper` : `v2`/`v3` sont des **caractères chiffres** ; ils servent aussi de caractères du serial (donc `s[0]`, `s[3]`… sont des chiffres).
- `cracker` impose les trois tirets alors que `rock` les autorise tous : ne pas en mettre ailleurs que 4, 9, 14 n'est pas requis, mais ces trois-là sont obligatoires.

## Vérification

```text
$ ./analysis/crackme05/crackme05_64bit 0zz0-bcda-aefb-0yy0     # analysis/verify.txt
In order to succeed you must fail, so that you know what not to do the next time.
-Anthony J. D'Angelo

Good Job!
```

## Fichiers

- `analysis/crackme05/` : `crackme05_32bit`, `crackme05_64bit`, `readme`, `crackme05_64bit.i64.c` ; `analysis/dis.txt`, `analysis/verify.txt`
- `tools/crackme05-solve.py` : générateur (`--seed`) + `--check` sur les 2 binaires
