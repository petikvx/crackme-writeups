# Toronto — c

| | |
|---|---|
| **ID** | [`69e352c2643676f8bb961d2e`](https://crackmes.one/crackme/69e352c2643676f8bb961d2e) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | Toronto |
| **Plateforme** | Linux ELF64 PIE, stripped, C, console |
| **Difficulté** | 1.6 |
| **SHA-256** | `070f760ebce0c2fbdd8b93d26865e3417a8f0ae25fd8164c657339851dbc8823` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/Wrieyster` | binaire (nom interne : `Wrieyster`, titre du challenge : `c`) |
| `tools/c-solve.py` | mot de passe |

## Réponse

```bash
python3 tools/c-solve.py -q
# Shake it, baby!
```

```
Enter password: Shake it, baby!
ok
```

## Premier regard

```bash
file original/Wrieyster       # ELF64 PIE, stripped
strings -n 6 original/Wrieyster
```

`strings` ne donne **aucun texte lisible** directement : toutes les chaînes du binaire sont stockées comme **texte hexadécimal ASCII** (ex. `456e7465722070617373776f72643a20`), décodées à l'exécution. Une vingtaine de ces blobs ressemblent à des leurres : `deadbeef`, `hack_the_net`, `secret_key`, `fake_key`, `virtual_key`, `exploit`, `obsuscated`, `lock_fail`… — autant de noms qui donnent envie de les suivre, pour rien.

## Flow

```
Enter password: <saisie>
ok   | no
```

## Comment on trouve

**Ancrage.** MCP `ida` (headless) sur le binaire strippé : 6 fonctions utilisateur seulement (`main` @ `0x10c0`, et 5 helpers `sub_11D0..sub_1330`). `main` est courte :

```c
sub_1330(...);                       // leurre (voir plus bas)
sub_12A0(off_4100, v13);             // decode hex -> "Enter password: "
printf("%s", v13);
fgets(v10, 128, stdin);
v10[strcspn(v10, "\n")] = 0;
sub_1330(...);                       // leurre
sub_12A0(off_4118, s2);              // decode hex -> MOT DE PASSE ATTENDU
if (strcmp(v10, s2) == 0)
    sub_12A0(off_4110, s);           // "ok"
else
    sub_12A0(off_4108, s);           // "no"
puts(s);
sub_1330(...);                       // leurre
```

**`sub_12A0`** (le décodeur) est trivial une fois lu :

```c
size_t sub_12A0(const char *hex, char *out) {
    size_t n = strlen(hex);
    for (i = 0; i < (n-1)/2 + 1; i++)
        out[i] = strtol(hex + 2*i, NULL, 16);   // 2 car. hex -> 1 octet
    out[i] = 0;
    return n;
}
```
Décodage hex → ASCII standard, rien de caché.

**Le prédicat** : `off_4118` pointe la chaîne hex `5368616b652069742c206261627921`. Décodée :

| hex | `53` | `68` | `61` | `6b` | `65` | `20` | `69` | `74` | `2c` | `20` | `62` | `61` | `62` | `79` | `21` |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| ASCII | `S` | `h` | `a` | `k` | `e` | ` ` | `i` | `t` | `,` | ` ` | `b` | `a` | `b` | `y` | `!` |

→ **`Shake it, baby!`** (15 caractères, espace et virgule inclus).

**Les leurres (`sub_1330`).** Un tableau `off_4060` de 20 pointeurs vers des chaînes hex ; `sub_1330` les décode **une sur trois** (`i % 3 == 0`, testé via une astuce de multiplication `-1431655765 * i` — division par 3 sans `div`) dans un buffer local jamais réutilisé :

```
deadbeef, secret_key, random_val, obsuscated, foo_bar, rev_mod, fake_key
```

Ces appels ne servent à **rien** côté logique — ils existent pour que `strings` / un dump brut affichent plein de noms « intéressants » (`hack_the_net`, `virtual_key`, `exploit`, `lock_fail`…) qui ne sont jamais comparés à quoi que ce soit, pendant qu'on cherche le vrai `strcmp`.

**Pièges.**
- Toutes les chaînes (prompt, « ok », « no », mot de passe, leurres) utilisent le **même encodage hex** : `strings` seul ne distingue pas le vrai prédicat des leurres — il faut lire `main` pour voir **lequel** des blobs décodés alimente le `strcmp`.
- Le mot de passe contient un **espace et une virgule** : une saisie « collée » façon `ShakeItBaby` échoue.
- Pas d'anti-debug, pas d'obfuscation de flot — seul le nommage/encodage des chaînes est trompeur.

## Vérification

```bash
printf 'Shake it, baby!\n' | ./original/Wrieyster
# Enter password: ok

printf 'petik\n' | ./original/Wrieyster
# Enter password: no
```

## Notes

- Pas de GDB utilisé : reverse 100 % statique (MCP `ida`) + preuve par exécution directe, suffisant ici.
- `Wrieyster` est le nom interne du binaire dans l'archive ; le titre crackmes.one est simplement `c`.
