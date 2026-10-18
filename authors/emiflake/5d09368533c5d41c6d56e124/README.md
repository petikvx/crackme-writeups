# emiflake's Time is of the Essence

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5d09368533c5d41c6d56e124) · id `5d09368533c5d41c6d56e124`

ELF64 PIE console C++, **non strippé**. Diff. site **2.0**.
Famille : [`../README.md`](../README.md).

| Fichier | Rôle |
|---|---|
| [`original/crackme`](original/crackme) | binaire (non strippé, symboles `Decryptor::*` démanglables) |
| [`tools/time-solve.py`](tools/time-solve.py) | mot de passe courant / `--check` |

## Réponse

Pas un mot de passe fixe : le check dépend de **l'heure système au
moment de l'exécution**. Mot de passe = **la minute courante** (0-59, en
décimal, sans zéro de tête).

```bash
python3 tools/time-solve.py           # affiche le mot de passe valide MAINTENANT
python3 tools/time-solve.py --check    # lance le binaire avec ce mot de passe, 0/1
date +%-M | ./original/crackme         # equivalent manuel
```

## 1. Premier regard

```text
crackme: ELF 64-bit LSB pie executable, x86-64, dynamically linked, not stripped
sha256  c92cd4b5f685dfe8666136cd398bcc8384d98c5a5445f321ffd895085821aa91
size    ~17 KiB
```

```bash
nm -C original/crackme | grep -i decrypt
strings -n 6 original/crackme | grep -vE "^_Z|^GLIBC|^CXXABI"
```

Imports révélateurs : `time`, `localtime`, `memcmp`/`vsnprintf` (C++
iostreams) — et surtout `Decryptor.cpp` / `Decryptor::decrypt` dans les
symboles **non strippés**, ainsi que les messages `Password Correct` /
`Password Wrong`. Le titre du challenge ("Time is of the Essence") est
déjà un indice fort.

## 2. Comment on trouve — pseudocode (MCP `ida`, démanglé)

`main` lit une ligne sur `stdin`, construit un `Decryptor`, puis appelle
`Decryptor::decrypt(input)` dont le résultat pilote directement le message.

`Decryptor::decrypt` (adresse `0x1ca0`) :

```c
bool Decryptor::decrypt(string input) {
    vector<int> v;
    time_t now = time(nullptr);
    tm *t = localtime(&now);
    for (size_t i = 0; i < t->tm_min; ++i)
        v.push_back(t->tm_year * i);     // valeur poussee : jamais relue !
    return input == std::to_string(v.size());
}
```

Piège de lecture : `t->tm_year * i` ressemble à un calcul important (année
courante mélangée à l'indice de boucle) — mais **la valeur poussée dans
le vecteur n'est jamais utilisée**, seule la **taille finale** du vecteur
compte (`v.size()`), et cette taille vaut très exactement le nombre
d'itérations de la boucle, c'est-à-dire `t->tm_min` : **la minute courante
de l'heure locale système** (`localtime`, pas UTC). `std::to_string` la
convertit en décimal sans zéro de tête (minute 3 → `"3"`, pas `"03"`).

Le reste (`Decryptor::Decryptor`, destructeurs) ne fait rien d'autre que
stocker le mot de passe saisi — tout le prédicat est dans `decrypt`.

## 3. Vérification

```text
$ date +%M
03
$ printf '3\n' | ./original/crackme
Password Correct

$ printf '4\n' | ./original/crackme   # une minute plus tard, ou un essai au hasard
Password Wrong
```

Edge case : si on saisit la minute avec un zéro de tête (`"03"` au lieu
de `"3"`), `strcmp`/`operator==` échoue — confirmé en testant les deux
formes à la minute `03`.

## 4. Notes

- Pas de GDB utilisé (reverse statique MCP `ida`, binaire non strippé,
  démanglage direct) — pas de section "Debug GDB" (voir `AGENTS.md`,
  § Debug GDB : uniquement si GDB a servi).
- Le solveur doit être lancé **à la même minute** que le binaire cible
  (c'est le principe du challenge) : `tools/time-solve.py` calcule la
  minute courante de la machine qui l'exécute, cohérent avec `--check`
  qui lance le binaire dans la foulée.
