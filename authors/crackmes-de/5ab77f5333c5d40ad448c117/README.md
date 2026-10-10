# keygen_rivendel — tryger (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c117
- Plateforme : Linux ELF32 i386 (GCC 4.9.2), difficulté 2.0
- Statut : **résolu** (keygen vérifié sur le binaire live)

## Résultat

Le mot de passe fait `3 × len(user)` octets (souvent non imprimables). Exemple :

```
user     = petik
password = 7feb8ef468c42b931697081dd67d09   (hex, 15 octets)
```

```
python3 tools/rivendel-solve.py petik --raw | ./breakme
...
Yout got it, or not... ;)
```

## Comment on trouve

### 1. Le `main` est un leurre

`objdump` montre un `_start` classique qui passe `0x8048932` à `__libc_start_main` : ce « main » remplit un buffer
avec `user+0x20`, `user-10`, `user^0x30` et fait un `strncmp`. Mais `readelf -h` donne
**Entry point = 0x80487b6** : le noyau ne passe jamais par `_start`. Le vrai code démarre directement à `0x80487b6`
(et les en-têtes de sections sont volontairement cassés : « section extending past end of file »).

### 2. Le vrai point d'entrée (0x80487b6)

1. `ptrace(PTRACE_TRACEME)` → si < 0, « You are debugging me ».
2. `fgets(user, 0x29)`, suppression du `\n`.
3. Affiche `Password for the user %s (%d bytes)` avec `3·n`, puis lit `3·n+1` octets avec `getchar` (le dernier, le `\n`, est remplacé par 0).
4. Appelle `check(user, pass, 0, 0, n)` à `0x804856b`. Si le contrôle échoue, la fonction affiche `WRONG SERIAL :-(` et `exit(1)` ; sinon on obtient `Yout got it, or not... ;)`.

### 3. La fonction récursive `check(u, p, i, c, n)` (voir `analysis/check-recursif.asm`)

`c` est un octet qui sert d'accumulateur, passé d'appel en appel :

| zone | calcul de `c` | après la dernière itération |
|---|---|---|
| `i < n` | `c = (c + 0x0F) ^ u[i]` | `c -= 10` quand `i+1 == n` |
| `n ≤ i < 2n` | `c = (0x12 − c) ^ u[i mod n]` | `c += 0x71` quand `i+1 == 2n` |
| `2n ≤ i < 3n` | `c = ((c − 0x4C)·2) ^ u[i mod n]` | — |

À chaque étape il faut `p[i] == c` ; arrivé à `i == 3n` la fonction renvoie 0 (succès).
Le keygen rejoue simplement ces trois passes (`tools/rivendel-solve.py`).

## Vérification

`tools/rivendel-solve.py <user> --raw | ./breakme` → `Yout got it, or not... ;)` pour `petik`, `crackmes`, `abcdefghij` ; un mot de passe faux donne `WRONG SERIAL :-(`.
