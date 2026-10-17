# bahha — easy_keygenme

| | |
|---|---|
| **ID** | [`5c1cc7d533c5d41e58e005ee`](https://crackmes.one/crackme/5c1cc7d533c5d41e58e005ee) |
| **Auteur** | bahha |
| **Plateforme** | Linux ELF64 PIE, C++, non strippé |
| **SHA-256** | `9674bf535c249a19be24e49815067ad3ed8f9d10f78e7ebc838ae3b66957cbcf` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/keygenme` | binaire d'origine |
| `tools/easykeygenme-solve.py` | **vrai keygen**, fonctionne pour n'importe quel nom (`--user`, `-q`, `--check`) |

## Réponse

**Vrai keygen** (le programme demande lui-même d'en écrire un : « write a keygen for this challenge, don't just patch »). User de référence **`petik`** :

| Username | Clé |
|---|---|
| `petik` | `ujynp` |

```bash
printf 'petik\nujynp\n' | ./original/keygenme
python3 tools/easykeygenme-solve.py --user petik --check
```

## Premier regard

```bash
file original/keygenme    # ELF64 PIE, C++, not stripped
strings -n 5 original/keygenme
```

Chaînes : `Hi! can you write a keygen for this challenge, don't just patch :)`, `Enter Username: `, `Enter a Key: `, `Congratulation you got the Key !`, `Wrong key try again !`. Symbole `gks` (« get key string »).

## Flow

`main` : exige un username de 3 à 10 caractères, uniquement alphabétique (`isalpha`), passe à `gks(username, len(username))` pour obtenir la clé attendue.

## Comment on trouve

**Ancrage** : MCP `ida`, Hex-Rays sur `gks` (`0x1515`).

```c
string gks(string s, int n) {
    for (i = 0; i < s.length(); ++i) {
        if (isalpha(s[i])) {
            for (j = 0; j < n; ++j) {           // repete n fois (n = longueur du username)
                if (s[i] == 'z') s[i] = 'a';
                else if (s[i] == 'Z') s[i] = 'A';
                else s[i]++;
            }
        }
    }
    return s;
}
```

C'est un **ROT-N** classique où `N = len(username)` : chaque lettre avance de `N` positions dans l'alphabet, en bouclant (`z→a`, `Z→A`), casse préservée.

```python
def rot(s, n):
    return "".join(
        chr((ord(c) - 97 + n) % 26 + 97) if c.islower() else
        chr((ord(c) - 65 + n) % 26 + 65) if c.isupper() else c
        for c in s
    )
key = rot(username, len(username))
```

## Vérification

```bash
$ printf 'petik\nujynp\n' | ./original/keygenme
Congratulation you got the Key !

$ printf 'Hacker\nNgiqkx\n' | ./original/keygenme
Congratulation you got the Key !
```

Fonctionne pour n'importe quel username valide — confirmé générique.

## Notes

- Pas de GDB nécessaire : transformation entièrement statique et déterministe.
- Contrainte : username de 3 à 10 caractères, lettres uniquement (pas de chiffres ni caractères spéciaux).
