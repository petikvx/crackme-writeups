# paypain — Election

| | |
|---|---|
| **ID** | [`5d64749533c5d46f00e2c324`](https://crackmes.one/crackme/5d64749533c5d46f00e2c324) |
| **Auteur** | paypain |
| **Plateforme** | Linux ELF64, C, non strippé, debug info |
| **SHA-256** | `7072cb5007bc9f7cc08d2913b1a800488f1051080327ef9494785352261a4eca` (archive `Election.tar` d'origine ; binaire `election` extrait) |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## ⚠️ Challenge atypique : pas de mot de passe, une manipulation runtime

`README_ELECTION.txt` (fourni par l'auteur) pose explicitement les règles : il faut faire gagner le candidat **« s4r »** par **injection de processus / `LD_PRELOAD` / rootkit**, et **interdit le patch** du binaire. Ce n'est donc pas un crackme « trouver le mot de passe » mais un exercice de manipulation runtime légitime, sur un binaire jouet auto-contenu — pas de cible réelle.

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/election` | binaire d'origine |
| `original/README_ELECTION.txt` | règles du challenge (fournies par l'auteur) |
| `tools/fake_rand.c` | bibliothèque `LD_PRELOAD` qui fait gagner Sar |
| `tools/election-solve.py` | compile le shim et rejoue le binaire (`-q`, `--check`) |

## Réponse

**Précharger une bibliothèque qui (1) efface `LD_PRELOAD` de l'environnement avant que `main()` ne le lise, et (2) redéfinit `rand()` pour forcer les votes.**

```bash
gcc -shared -fPIC -o tools/fake_rand.so tools/fake_rand.c
LD_PRELOAD=./tools/fake_rand.so /lib64/ld-linux-x86-64.so.2 ./original/election
python3 tools/election-solve.py --check
```

## Premier regard

```bash
file original/election       # ELF64, not stripped, debug_info
strings -n 5 original/election
```

Chaînes clés : `LD_PRELOAD`, `[LD_PRELOAD ALERT] Corruption ! S4r is trying to manipulate the election !!`, `[Anti-debug ALERT] ...`. Le binaire **se défend lui-même** contre les deux techniques les plus évidentes.

## Flow

`main` (`objdump -d -M intel --no-show-raw-insn original/election | awk '/<main>:/,/^$/'`) :

1. `getenv("LD_PRELOAD")` → si non NULL, imprime l'alerte et `exit(1)` **avant même d'afficher le menu**.
2. `ptrace(PTRACE_TRACEME, 0, 0, 0)` → si `< 0` (déjà tracé), alerte anti-debug et `exit(1)`.
3. `clock_gettime` → `srand()`, puis trois `rand()` consécutifs pour construire les votes : `Bob = rand()%99`, `Poe = rand()%(99-Bob)`, `Sar = rand()%(99-Poe)`.
4. `rank()` : classement strict (`>`, pas `>=`) sur ces trois valeurs.
5. `telao()` : affichage final.

## Comment on trouve

**Ancrage** : lecture statique de `main`, `rank` et `telao` en désassemblage (binaire non strippé, symboles présents).

### Le piège : l'auto-détection de `LD_PRELOAD`

Le programme appelle lui-même `getenv("LD_PRELOAD")`. Une bibliothèque préchargée classique laisserait cette variable visible → détection immédiate. **Astuce** : le dynamic linker utilise `LD_PRELOAD` **avant** `main()`, pour mapper la bibliothèque — rien n'empêche cette bibliothèque d'effacer la variable de son propre environnement dans un **constructeur** (`__attribute__((constructor))`, exécuté automatiquement après le chargement, avant `main`). Au moment où `main()` appelle `getenv`, la variable n'existe plus, alors que les symboles déjà résolus (notre `rand()`) restent actifs pour tout le process.

```c
__attribute__((constructor))
static void hide_preload(void) { unsetenv("LD_PRELOAD"); }
```

### Forcer le résultat : hooker `rand()`

`main()` appelle `rand()` **exactement 3 fois**, toujours dans le même ordre (Bob, Poe, Sar). En redéfinissant `rand()` dans la bibliothèque préchargée (elle prime sur celle de `libc.so.6` par l'ordre de résolution des symboles), on contrôle les trois tirages :

```c
int rand(void) {
    static int call = 0;
    call++;
    if (call == 3) return 98;   /* tirage de Sar */
    return 0;                    /* tirages de Bob et Poe */
}
```

Résultat : `Bob=0%99=0`, `Poe=0%99=0`, `Sar=98%99=98` → dans `rank()`, Sar bat strictement les deux autres (`>`, pas d'égalité) → 1ʳᵉ place sans ambiguïté.

### Anti-debug `ptrace`

Jamais déclenché ici : on ne lance pas sous un débogueur, juste via le *loader* explicite (`/lib64/ld-linux-x86-64.so.2`, nécessaire car l'interpréteur embarqué du binaire pointe vers `/lib/ld-linux-x86-64.so.2`, chemin absent sur cette distribution).

## Vérification

```bash
$ LD_PRELOAD=./tools/fake_rand.so /lib64/ld-linux-x86-64.so.2 ./original/election
Welcome to election of United Crackme of One .

Counting the votes . . .
Total votes: 98
The final result is:
	Bob -> 3 Place with 0 votes
	Sar -> 1 Place with 98 votes
	Poe -> 3 Place with 0 votes
```

Pas d'alerte `[LD_PRELOAD ALERT]` : la détection a bien été neutralisée *avant* que `main()` ne la voie. À titre de comparaison, sans préchargement, le résultat est aléatoire à chaque exécution (`srand` basé sur `clock_gettime`).

## Notes

- Aucun octet du binaire `original/election` n'est modifié — conforme à la règle `FORBIDDEN: PATCHING` du challenge : toute la manipulation se fait au niveau du processus, par `LD_PRELOAD`, exactement comme l'énonce `ALLOW: LD_PRELOAD`.
- Le binaire teste explicitement ce vecteur (`getenv("LD_PRELOAD")`) : c'est le cœur du challenge — contourner une détection applicative de sa propre technique d'injection, pas juste l'utiliser brutalement.
- `tools/fake_rand.so` n'est pas commité (artefact de compilation) ; `tools/election-solve.py --check` le (re)compile à la volée depuis `fake_rand.c`.
