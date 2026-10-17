# BinaryNewbie — Simple obfuscation

| | |
|---|---|
| **ID** | [`5d6da7bc33c5d46f00e2c3a3`](https://crackmes.one/crackme/5d6da7bc33c5d46f00e2c3a3) |
| **Auteur** | BinaryNewbie |
| **Plateforme** | Linux ELF64, C, statiquement lié, strippé |
| **SHA-256** | `d94fe502df5e9134fe4b0ae04971459eb196d53b7d72bb3bfd524f7c682216d3` (binaire `crackme` ; archive d'origine `cr4ck.tar.gz`, voir note dans `ORIGIN.yml`) |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/cr4ckme/crackme` | binaire d'origine |
| `original/source/crackme.c` | source C fourni par l'auteur dans `flag.zip` (déchiffré avec la clé trouvée) |
| `original/source/flag.txt` | flag (idem) |
| `analysis/crackme.i64` | base IDA |
| `tools/simpleobfuscation-solve.py` | clé (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **Clé** | `jcdefghiab` |
| **Flag** (dans `flag.zip`, protégé par cette même clé) | `FL4G{Ass1st4nt_Pr0f3ss0r}` |

```bash
./original/cr4ckme/crackme jcdefghiab
python3 tools/simpleobfuscation-solve.py --check
unzip -P jcdefghiab original/source/flag.zip   # confirme : meme cle = mot de passe du zip
```

## Premier regard

```bash
file original/cr4ckme/crackme   # ELF64, statically linked, stripped
strings -n 5 original/cr4ckme/crackme | grep -iE "key|usage|crack|wrong"
```

Chaînes : `Wrong key, ...try again...`, `Usage %s <key>`. Binaire **statiquement lié** : des milliers de symboles libc noient les ~5 fonctions utiles — `strings`/`objdump` bruts sont peu pratiques, MCP `ida` utilisé pour remonter des chaînes vers leurs appelants directement.

## Flow

`main` (trouvé via xref data sur la chaîne `"Usage %s <key>\n"`) : exige `argc==2`, `ptrace(PTRACE_TRACEME,...)` (anti-debug — échoue si déjà tracé), longueur de `argv[1]` **exactement 10**, puis `verify_key(argv[1], 10)`.

## Comment on trouve

**Ancrage** : MCP `ida` — recherche des chaînes (`db.strings.get_all()`), xref data vers `"Usage %s <key>\n"` → fonction `main` (`0x401610`), puis son appel à `verify_key` (`0x401d10`).

```c
// verify_key(input, 10) — pseudocode Hex-Rays nettoyé
password = "abcdefghij" (a=97, incrémenté sur 10 octets)
for i in 0..9:
    for j in 0..8:
        swap(password[i], password[j])     // deroule en "jcdefghiab", voir ci-dessous
c = 0
for i in 0..9:
    if input[i] == password[i]: c -= 1
if ((c ^ (0xdeadbeef>>10 & 0xc) ^ 0xffffffff) + 5 ^ 10) == 0:
    "Cracked...."
```

### 1. Dérouler la double boucle de swaps

Plutôt que de deviner, on **simule exactement** la boucle en Python (ordre des indices identique à l'asm) :

```python
buf = list(b"abcdefghij")
for i in range(10):
    for j in range(9):
        buf[i], buf[j] = buf[j], buf[i]
print(bytes(buf))   # -> b'jcdefghiab'
```

### 2. Résoudre l'équation finale

`c` compte (négativement) les positions où `input[i]==password[i]`. L'équation `((c ^ mask) ^ 0xffffffff) + 5 ^ 10 == 0` avec `mask = (0xDEADBEEF>>10)&0xC = 0xC` se résout en `c == -10` — **les 10 positions doivent matcher**, donc `input == password == "jcdefghiab"`.

Le code source original (récupéré après coup, voir § Vérification) confirme exactement cette lecture, y compris le piège visuel de l'équation (le commentaire `// 0xfffffff6` dans le source est lui-même un indice vers la valeur cible, laissé par l'auteur).

## Vérification

```bash
$ ./original/cr4ckme/crackme jcdefghiab
Welcome to this little crackme!!!!
There is only one key, try to find it and decrypt the .zip
Good luck
Developed by Binary Newbie

Humm lets see what you are doing .....
Cracked....

$ ./original/cr4ckme/crackme wrongkey12
...
Wrong key, ...try again...
```

L'archive d'origine contient aussi un `flag.zip` protégé par mot de passe (le même mécanisme « décrypte le zip avec la clé » annoncé par le menu du programme) :

```bash
$ unzip -P jcdefghiab original/source/flag.zip
  inflating: crackme.c
  extracting: flag.txt
$ cat original/source/flag.txt
FL4G{Ass1st4nt_Pr0f3ss0r}
```

Le zip s'ouvre avec exactement la clé retrouvée par reverse — double confirmation indépendante de la clé, et bonus : la source originale fournie par l'auteur correspond trait pour trait à la lecture Hex-Rays.

## Notes

- Pas de GDB nécessaire : anti-debug `ptrace(PTRACE_TRACEME)` présent mais contourné simplement en ne lançant pas sous debugger (l'exécution native suffit).
- Binaire statique + strippé : chercher par **xref sur une chaîne** (`"Usage %s <key>\n"`) via le MCP `ida` est bien plus rapide que de parcourir des milliers de fonctions libc à la main.
