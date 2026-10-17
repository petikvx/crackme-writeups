# kawaii-flesh — keygenme

| | |
|---|---|
| **ID** | [`5d24585133c5d410dc4d0cbd`](https://crackmes.one/crackme/5d24585133c5d410dc4d0cbd) |
| **Auteur** | kawaii-flesh |
| **Plateforme** | Linux ELF64 PIE, C, strippé |
| **SHA-256** | `0094ce712626cf5e59de95b00f35128a989a3c809f2da5647b98aceb5be43dc1` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/keygenme` | binaire d'origine |
| `tools/keygenme-solve.py` | keygen (`--name`, `--argv0-len`, `-q`, `--check`) |

## Réponse (dépend de l'invocation)

**Keygen**, `./keygenme <name> <key>` — user de référence **`petik`**, invoqué comme **`./keygenme`** (10 caractères) :

| Nom | Clé |
|---|---|
| `petik` | `865280` |

```bash
./original/keygenme petik 865280     # depuis ce dossier, invoque via "./keygenme"
python3 tools/keygenme-solve.py --check
```

## Premier regard

```bash
file original/keygenme      # ELF64 PIE, strippé
strings -n 5 original/keygenme
```

Chaînes : `keygenme [name] [key]`, `Good job!`, `Wrong key!`. Import `atoi` (la clé saisie est numérique).

## Flow

`main(argc, argv)` : exige `argc==3`, calcule une valeur à partir de `argv[1]` (nom) **et de `argv[0]`**, compare à `atoi(argv[2])`.

## Comment on trouve

**Ancrage** : MCP `ida` sur le binaire strippé (fonctions reconnues par structure), Hex-Rays sur `main` et la petite fonction de somme (`sub_1159`).

```c
int main(int argc, char **argv) {
    if (argc != 3) { puts("keygenme [name] [key]"); return 0; }
    int v4 = (3 * argv[1][0]) ^ checksum(argv[1]);   // checksum = somme des octets du nom
    int v6 = v4 << strlen(argv[0]);                   // PIEGE : argv[0], pas argv[1] !
    puts(v6 == atoi(argv[2]) ? "Good job!" : "Wrong key!");
}

int checksum(char *s) {
    unsigned sum = 0;
    for (i = 0; i < strlen(s); ++i) sum += s[i];
    return sum;
}
```

Le décalage (`<<`) utilise `strlen(argv[0])` — **le chemin par lequel le binaire a été invoqué**, pas le nom fourni. C'est le même type de piège que [chillywilly « racecars »](../../chillywilly/5e76c37d33c5d4439bb2df1b/) (lecture de `argv[0]`), mais ici il affecte un calcul plutôt qu'un test de palindrome : **la clé change selon la commande utilisée pour lancer le programme**.

### Calcul (pour `name="petik"`, invoqué via `./keygenme`)

```python
name = "petik"
v4 = (3 * ord(name[0])) ^ sum(ord(c) for c in name)   # (3*112) ^ 541 = 845
key = v4 << len("./keygenme")                          # 845 << 10 = 865280
```

## Vérification

```bash
$ ./original/keygenme petik 865280
Good job!

$ ./original/keygenme petik 123
Wrong key!
```

## Notes

- Pas de GDB nécessaire : la logique est entièrement statique, le seul piège est de bien distinguer `argv[0]` de `argv[1]` dans le désassemblage/pseudocode.
- La clé **n'est pas portable** : si le binaire est invoqué différemment (chemin absolu, lien symbolique, etc.), `strlen(argv[0])` change et la clé attendue change avec — toujours recalculer `--argv0-len` selon la commande réellement utilisée.
