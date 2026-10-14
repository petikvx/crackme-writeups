# bf — crp (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5833c5d40ad448c39b · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, strippé, C ; readme de l'auteur : « obviously the goal is to make a keyfile generator, so no patches please. get bonus points for a generic keyfile :) »
- Archive : `original/bf.tar.gz` → `bf/bf` + `bf/readme.txt`
- Usage : `./bf` lit `./key.bf` ; pas d'argument

## Réponse

Il faut un **keyfile** `key.bf` : un programme **brainfuck** dont la sortie est le nombre `3·H(user) mod 2³²` en décimal, terminé par un octet `NUL`.

```bash
python3 -I tools/bf-solve.py petik -o key.bf      # écrit key.bf (84 octets)
./analysis/bf/bf                                  # (dans le dossier contenant key.bf, utilisateur courant = petik)
# --[ bf.crp- ]---
# checking key:
# ........
# --------------------------------------[ACCEPTED]--
```

Pour `petik` : sortie attendue `8692167`, keyfile = `++++…+.--.+++.…` (voir `analysis/key.bf`).

Le keyfile dépend du **nom d'utilisateur** de la machine (`getpwuid(getuid())`) : le générateur le calcule pour n'importe quel nom (`bf-solve.py <user>`). Un keyfile générique (un seul fichier valable pour tout utilisateur, lisant le nom avec `,`) n'est **pas** fourni.

## Premier regard

```text
$ ./analysis/bf/bf
--[ bf.crp- ]-------------------------------------
no key.
$ strings -n 6 analysis/bf/bf | grep -E "key|ACCEPTED|INVALID|getpwuid"
key.bf   no key.   checking key:   [ACCEPTED]   [INVALID]   getpwuid()
```

## Flow

`main` @`0x80489ac` (via `bash -ic 'decc bf'`, `analysis/bf/bf.i64.c`) :

1. `sub_80487A4` : `getpwuid(getuid())->pw_name` → `user`.
2. `sub_80487E3` : `fopen("key.bf")`, taille ≤ 4096, `malloc` + `fread` (**sans NUL final**).
3. `sub_80488E3(user, key)` : interpréteur BF puis `strcmp(sortie, attendu)`.
4. `ACCEPTED` si égal, `INVALID` sinon ; `no key.` si `key.bf` absent.

## Comment on trouve

**Interpréteur** (`sub_8048A54` init, `sub_8048ADE` boucle, un handler par instruction) :

| Instr. | Handler | Effet |
|---|---|---|
| `+` `-` | `0x8048c21`, `0x8048c39` | cellule (octet, wrap 256) ±1 |
| `>` `<` | `0x8048bca`, `0x8048bf7` | ptr ±1, modulo 4096 (tape circulaire) |
| `,` | `0x8048c91` | cellule = octet suivant du **nom d'utilisateur**, 0 à la fin |
| `.` | `0x8048c51` | ajoute la cellule à la sortie (≤ 4095 octets, sinon erreur 2) |
| `[` `]` | `0x8048ce9`, `0x8048d42` | boucles standard (`]` revient toujours à `[` qui re-teste) |
| autre | `0x8048d7c` | ignoré (commentaire) |

Le programme s'arrête quand l'octet de programme vaut `0` (fin) → code 0 « fini » ; sinon erreur `2` → `INVALID`.

**Valeur attendue** (`sub_804886B(user, s2)`) :

```c
L  = min(strlen(user), 40);
s  = Σ_{i<L} (L + user[i]);                // signed char
h  = (L * s) << 10;                         // int 32 bits
for (j = 0; j < L; j++) h = j + h - user[j];
sprintf(s2, "%u", 3 * h);                   // unsigned 32 bits
```

Pour `petik` (L=5) : `s = 5·5 + 541 = 566`, `h = (5·566) << 10 = 2 897 920`, puis `+Σ j − 541 = 10 − 541` → `h = 2 897 389`, `3h = 8 692 167`. ✓

**Keyfile** : un programme linéaire qui, pour chaque chiffre ASCII, ajuste la cellule de la différence avec le chiffre précédent (`+`/`-`) puis `.` ; terminé par `\0` (le binaire fait `strcpy` sur le tampon de `fread`, non terminé : sans NUL il lirait le tas au-delà).

**Pièges :**
- Le fichier doit finir par un octet `NUL`, sinon `strcpy` copie du tas non initialisé après le programme.
- `getpwuid` = utilisateur **réel** du process : la clé n'est valable que pour la session qui lance `./bf` (d'où le générateur paramétré).
- Les noms de plus de 40 caractères sont tronqués à 40 dans le hash.

## Vérification

```text
$ python3 -I tools/bf-solve.py petik --check            # (utilisateur courant = petik)
check: OK (vm=True, binaire[petik]=True)
```

Le test exécute le binaire d'origine avec un `key.bf` valide (`ACCEPTED`) puis avec le keyfile d'un autre nom (`INVALID`) ; `analysis/ok.txt` en garde la sortie. Une réplique de l'interpréteur en Python (`vm()`) vérifie aussi d'autres noms.

## Fichiers

- `analysis/bf/` : `bf`, `readme.txt`, `bf.i64.c` (Hex-Rays) ; `analysis/key.bf`, `analysis/ok.txt`
- `tools/bf-solve.py` : générateur de keyfile + `--check`
