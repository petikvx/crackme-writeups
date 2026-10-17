# Jenya — nice_crackme

| | |
|---|---|
| **ID** | [`659fde9deef082e477ff59ba`](https://crackmes.one/crackme/659fde9deef082e477ff59ba) |
| **Auteur** | Jenya |
| **Plateforme** | Linux ELF64 PIE, C ; **sources et `solution.txt` fournis** dans le zip |
| **SHA-256 (zip)** | `119f4ccb881d2740fcfe1f20e5c3431c03f4ccb8f2cdb40bf0a6fe723ce470e0` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/nice_crackme.zip` | archive d'origine (`main`, `source_code/main.c`, `solution.txt`) |
| `analysis/x/nice_crackme/` | contenu extrait |
| `tools/nice-solve.py` | génère un mot de passe valide (`WORD`, `-q`, `--check`) |

## Réponse

Il n'y a pas un seul mot de passe : toute chaîne dont la **longueur est un multiple de 4** et dont **chaque bloc de 4 caractères est un palindrome `xyyx`** est acceptée (5 essais).

| Exemple | Blocs |
|---|---|
| `abba` | `abba` |
| `peeptiitkxxk` (construit depuis `petik`) | `peep` `tiit` `kxxk` |

```bash
printf 'peeptiitkxxk\n' | ./analysis/x/nice_crackme/main      # CORRECT!
python3 tools/nice-solve.py --check
```

## Premier regard

L'archive contient le binaire, **le code source** et un `solution.txt` de l'auteur : on le traite comme un crackme de lecture, mais je ne me suis pas fié au texte de l'auteur — chaque affirmation a été rejouée sur le binaire.

## Flow

`main` : 5 tentatives de `fgets(p, 201)` ; `p[len(p)-1] = 0` (retire le `\n`) ; `check_all(p)` → « CORRECT! » (et `exit(0)`) sinon « WRONG number of attempt: i » ; « Game Over » au bout de 5 échecs.

## Comment on trouve

**Ancrage** : `source_code/main.c` :

```c
int check_len(char* p){ return !(len(p) % 4); }
int check_palindrom4(char *p){ return (*p == *(p+3)) && (*(p+1) == *(p+2)); }   // xyyx
int check_palindrom_every_four(char *p){
    if (*p) return check_palindrom4(p) & check_palindrom_every_four(p+4);
    return 1;
}
int check_all(char *p){ return check_len(p) && check_palindrom_every_four(p); }
```

Donc : `len % 4 == 0` et pour chaque bloc `p[i]==p[i+3]` et `p[i+1]==p[i+2]`.
Génération : pour `petik` (5 lettres, complété par `x`) on prend les paires `pe`, `ti`, `kx` et on écrit `xyyx` : `peep`, `tiit`, `kxxk`.

Points vérifiés sur le binaire (pas seulement sur la source) :
- **la chaîne vide est acceptée** (ligne vide : `len(p)-1` retire le `\n`, longueur 0, `0 % 4 == 0`, récursion immédiate à 1) ;
- sur une entrée qui s'arrête (EOF), `fgets` échoue et laisse `p` inchangé, mais `p[len(p)-1]=0` raccourcit `p` d'un caractère à chaque tour : `abab` finit par donner `CORRECT!` à la 5ᵉ tentative après avoir été réduit à la chaîne vide — artefact d'un pipe, pas une solution ;
- un mot de passe de longueur impaire ou avec un bloc non palindrome est refusé.

## Vérification

```text
$ printf 'abba\n' | ./main          -> CORRECT!
$ printf 'peepikki\n' | ./main      -> CORRECT!
$ printf 'abab\n' | ./main          -> WRONG number of attempt: 1 (…)
$ printf '\n' | ./main              -> CORRECT!   (chaîne vide)
```

## Notes

- Reverse par lecture du source + essais live sur le binaire ; pas de GDB.
