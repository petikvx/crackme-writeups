# m00ny — am i really random?

| | |
|---|---|
| **ID** | [`5cb7533133c5d4419da5584b`](https://crackmes.one/crackme/5cb7533133c5d4419da5584b) |
| **Auteur** | m00ny |
| **Plateforme** | Linux ELF64 PIE, C++, non strippé |
| **SHA-256** | `0a5ffbe69f838e9413f8e488f85cfde1dbee7fa00134de61cd317ddc81be4221` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## ⚠️ Réponse dépendante de `argv[0]`

Le mot de passe se calcule à partir du **nom/chemin utilisé pour invoquer le binaire** (`argv[0]`), pas d'une constante figée — même famille de piège que [chillywilly « racecars »](../../chillywilly/5e76c37d33c5d4439bb2df1b/), [kawaii-flesh « keygenme »](../../kawaii-flesh/5d24585133c5d410dc4d0cbd/) et [ker2x « guild hall adventure Ch.1 »](../../ker2x/5d0fa1ac33c5d41c6d56e172/).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackMe-by-m00ny-1` | binaire d'origine |
| `tools/really_random-solve.py` | mot de passe pour une invocation donnée (`-q`, `--check`) |

## Réponse

Pour une invocation **`./crackMe-by-m00ny-1 <password>`** depuis ce dossier :

```bash
cd original
./crackMe-by-m00ny-1 c0ck
```

```bash
python3 tools/really_random-solve.py --check
```

## Premier regard

```bash
file original/crackMe-by-m00ny-1    # ELF64 PIE, C++, not stripped
strings -n 5 original/crackMe-by-m00ny-1
```

Chaînes : `You dirty little cheater! rename me back to: crackMe-by-m00ny-1`, `or at least something with a minimum length of 16 characters ;-)`, `You cracked me!`, `flag{%s}`, `INFO: there are multiple ways to solve this puzzle`. Le nom du binaire fait exactement 18 caractères — un indice que sa longueur (et son contenu) comptent.

## Flow

`main` : exige `strlen(argv[0]) > 15` (sinon message « cheater »), compare `argv[1]` à un mot de passe de 4 caractères construit à partir de `argv[0]`, puis affiche un flag **aléatoire** (`rand()`, non seedé — change à chaque exécution, ce n'est pas la vraie « réponse »).

## Comment on trouve

**Ancrage** : MCP `ida`, Hex-Rays sur `main` (`0x11a9`).

```c
char s2[4]; char v7;             // contigus en memoire -> s2 + terminateur
*(int*)s2 = 12288;               // = 0x00003000 LE -> s2[0]=0x00, s2[1]='0'(0x30), s2[2]=0,s2[3]=0
v7 = 0;                           // terminateur de "chaine" s2
s2[0] = argv[0][5];
s2[2] = argv[0][2];
s2[3] = argv[0][6];
// s2[1] reste '0' (jamais ecrase)
if (strcmp(argv[1], s2) == 0) { /* succes */ }
```

Le mot de passe attendu est donc `argv0[5] + '0' + argv0[2] + argv0[6]`. Pour `argv[0] = "./crackMe-by-m00ny-1"` :

```
index: 0='.' 1='/' 2='c' 3='r' 4='a' 5='c' 6='k' 7='M' ...
argv0[5]='c', argv0[2]='c', argv0[6]='k'
password = "c" + "0" + "c" + "k" = "c0ck"
```

L'indice « there are multiple ways to solve this puzzle » fait référence au fait qu'on peut **renommer ou copier** le binaire (tant que le nouveau nom fait ≥16 caractères) pour obtenir un mot de passe différent — amusant à explorer, mais la contrainte de longueur minimale limite les noms exploitables.

## Vérification

```bash
$ cd original && ./crackMe-by-m00ny-1 c0ck

You cracked me!

	flag{<aleatoire, change a chaque execution>}

$ ./crackMe-by-m00ny-1 wrong

nope, that was not the correct password
```

## Notes

- Pas de GDB nécessaire : tout le calcul est lisible statiquement.
- Le flag affiché (`flag{...}`) est généré par un `rand()` **non seedé** (donc dépendant de l'état interne du PRNG au démarrage du processus, différent à chaque run) — il n'y a pas de « vrai » flag fixe à retrouver, seul le mot de passe constitue la réponse stable et reproductible.
