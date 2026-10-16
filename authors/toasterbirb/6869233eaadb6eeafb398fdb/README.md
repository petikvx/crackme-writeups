# toasterbirb — main.cpp

| | |
|---|---|
| **ID** | [`6869233eaadb6eeafb398fdb`](https://crackmes.one/crackme/6869233eaadb6eeafb398fdb) |
| **Auteur** | toasterbirb |
| **Plateforme** | Linux : fichier source **polyglotte bash / C++** (pas de binaire) — nécessite `bash` et `g++` |
| **SHA-256** | `557491b6285a2a87364234fab2949737609eb86c64c52d0ce82c0b6b7db97f5e` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/main.cpp` | le « crackme » : un `main.cpp` qui est aussi un script shell |
| `tools/maincpp-solve.py` | décode le script caché, donne le mot de passe et la commande (`-q`, `--check`) |

## Réponse

**Mot de passe : `even_more_secure_password`** — et il faut le passer en **3ᵉ argument** d'un appel avec **au moins 4 arguments** :

```bash
cp original/main.cpp main.cpp          # le script relit « main.cpp » dans le répertoire courant
bash main.cpp a b even_more_secure_password d      # correct!!
python3 tools/maincpp-solve.py --check
```

## Premier regard

Le fichier commence par `#if 0 … #endif` : un bloc ignoré par le préprocesseur C++ mais **exécuté par bash** (`#` = commentaire shell,
`magic_spell=...` est une vraie ligne shell). Le reste est du C++ ordinaire qui compare `argv[1]` à `"extra_secret_password"`
— appât : ce n'est pas le bon mot de passe.

## Flow

1. Bash exécute `echo "${magic_spell//<0xe5>/2}" | tr -d '!' | base64 -d | bash -s "$@"` : décode le `magic_spell` et l'exécute avec les mêmes arguments.
2. `tail -n3 $0 | sh` exécute le bloc de fin (`rm -f ./something_temporary*`) pour nettoyer.
3. Le script décodé compile ce même fichier avec `sed`/`g++`, puis lance l'exécutable.

## Comment on trouve

**Ancrage** : lire la ligne 2 du fichier, extraire `magic_spell`, la décoder.

- Le délimiteur `!…!` est retiré par `tr -d '!'`.
- Un caractère du spell est un octet **0xe5 invalide en UTF-8** (c'est lui qui rend le fichier « ISO-8859 » pour `file`) ; la substitution bash `${magic_spell//<0xe5>/2}`
  le remplace par `2`. Sans cette étape, `base64 -d` échoue ou produit du bruit. Piège principal : `xxd` montre `62 e5 31` à l'offset `0x23`
  → `b2 1`.

Script décodé :

```bash
out=$(mktemp "something_temporaryXXXXXXXXX")
cat main.cpp | sed "s|file_name|\"./$out\"|; s/extra_secret_password/even_more_secure_password/" | g++ -o $out -x c++ -
chmod +x $out

if [ $# -eq 3 ]; then echo wrong...; exit 0; fi

./$out $3
rm $out
```

Conséquences :

1. `sed` **remplace** `extra_secret_password` par `even_more_secure_password` avant compilation, et `file_name` par le chemin de l'exécutable temporaire
   (le C++ vérifie que `argv[0]` correspond, sinon « very wrong... »).
2. L'exécutable n'est lancé qu'avec `$3` : pour que le C++ voie `argc == 2` il faut que `$3` existe, donc **au moins 3 arguments** ;
3. mais `$# == 3` est explicitement rejeté (« wrong... ») → **au moins 4 arguments**, avec `$3` = le mot de passe.

## Vérification

```text
$ bash main.cpp a b even_more_secure_password d   -> correct!!
$ bash main.cpp a b even_more_secure_password     -> wrong...   (3 args)
$ bash main.cpp a b extra_secret_password d       -> wrong...   (mot de passe d'appât)
$ bash main.cpp a b c d                           -> wrong...
```

## Notes

- Pas de GDB : le « binaire » est un script, la compilation est faite à la volée par `g++` (un fichier `something_temporary…` est créé puis supprimé).
- Le fichier doit s'appeler `main.cpp` et être dans le répertoire courant (`cat main.cpp` dans le script décodé).
