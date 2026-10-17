# kawaii-flesh — Key and keygen

| | |
|---|---|
| **ID** | [`5d17962b33c5d41c6d56e1f2`](https://crackmes.one/crackme/5d17962b33c5d41c6d56e1f2) |
| **Auteur** | kawaii-flesh |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `ce8f238c9640ef835813d89d1573b06629d926f24e2c45e920fcd81a338f498f` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/keygenme` | binaire d'origine |
| `tools/keyandkeygen-solve.py` | keygen complet pour n'importe quel nom (`--name`, `-q`, `--check`) |

## Réponse

**Vrai keygen** (fonctionne pour n'importe quel nom). User de référence **`petik`** :

| Nom | Clé |
|---|---|
| `petik` | `l[NE?951.` |

```bash
printf 'petik\nl[NE?951.\n' | ./original/keygenme
python3 tools/keyandkeygen-solve.py --check
```

## Premier regard

```bash
file original/keygenme      # ELF64 PIE, not stripped
strings -n 5 original/keygenme
```

Chaînes : `Enter name: `, `Enter key: `, `Good job!`, `Wrong key! Try again)`. Symbole `encr` présent.

## Flow

`main` : lit `name` puis `key` (`scanf("%s")`), `malloc(10)`, appelle `encr(name, buf)` qui génère la clé attendue dans `buf`, puis `strcmp(buf, key)`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/keygenme | awk '/<encr>:/,/^$/'`.

```c
void encr(char *name, char *out) {
    int n = strlen(name);
    int s = 0;
    for (i = 0; i < n; ++i) s += (signed char)name[i];   // checksum ASCII

    for (i = 0; i <= 8; ++i) {                             // 9 iterations -> cle de 9 caracteres
        unsigned char c = (unsigned)s / (n + i);            // division NON signee
        out[i] = c;
        s += s / (signed char)c;                             // division signee tronquee vers 0
    }
}
```

Deux divisions différentes dans la même boucle (`div` non signée pour calculer `c`, `idiv` signée pour mettre à jour `s`) — piège classique si on relit l'asm trop vite en supposant la même sémantique pour les deux. Le reste est une traduction directe : checksum initial, puis 9 itérations qui dérivent un octet de clé et mettent à jour l'accumulateur.

### Implémentation Python (division tronquée vers zéro, comme en C)

```python
def c_trunc_div(a, b):
    q = abs(a) // abs(b)
    return -q if (a < 0) != (b < 0) else q

def encr(name):
    n, s = len(name), sum(ord(c) for c in name)
    out = bytearray()
    for i in range(9):
        c = (s // (n + i)) & 0xFF
        out.append(c)
        sc = c - 256 if c >= 128 else c
        s += c_trunc_div(s, sc)
    return out.decode()
```

## Vérification

```bash
$ printf 'petik\nl[NE?951.\n' | ./original/keygenme
Enter name: Enter key: Good job!
Now write keygen)

$ printf 'petik\nwrong\n' | ./original/keygenme
Enter name: Enter key: Wrong key! Try again)
```

Testé aussi avec `admin` → clé `hWLC<730-`, même résultat « Good job! » : confirmé générique, pas un cas particulier.

## Notes

- Pas de GDB nécessaire : tout le calcul est statique et déterministe.
- Le `malloc(10)` pour une clé de 9 caractères laisse le 10ᵉ octet non écrit par `encr` ; en pratique le premier `malloc` d'un processus retourne en général de la mémoire fraîchement mappée (zéro), ce qui fournit par chance le `'\0'` terminal attendu par `strcmp` — comportement non garanti par la norme C mais stable sur ce binaire tel que testé.
