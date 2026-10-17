# kawaii-flesh — Simple crackme

| | |
|---|---|
| **ID** | [`5d0d1e1333c5d41c6d56e155`](https://crackmes.one/crackme/5d0d1e1333c5d41c6d56e155) |
| **Auteur** | kawaii-flesh |
| **Plateforme** | Linux ELF64 PIE, C++, strippé |
| **SHA-256** | `193b2f71045b4aa509d2a0d9564f05602418ff0c3b343c4af98121d5bf45a424` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme` | binaire d'origine |
| `analysis/crackme.i64` | base IDA |
| `tools/simplecrackme-solve.py` | clé (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **Clé** | `bd4c217637bc828982c090b2de41b84d` |

```bash
echo bd4c217637bc828982c090b2de41b84d | ./original/crackme
python3 tools/simplecrackme-solve.py --check
```

## Premier regard

```bash
file original/crackme     # ELF64 PIE, C++, stripped
strings -n 5 original/crackme
```

**Trois chaînes de 32 caractères** qui ressemblent toutes à des hash MD5, plus `Enter key: `, `good job!`, `try again!`. L'une d'elles (`1381d5357780928686957ce0bb9c1eaa`) est **déjà** au format hexadécimal propre — un leurre très convaincant pour qui cherche « LE hash » à la main.

## Flow

`main` (strippé mais retrouvé via xref sur `"Enter key: "`) définit 3 chaînes locales, décode l'**une d'elles** avec `sub_1179` (`XOR` chaque octet par `3`), et compare le résultat à `scanf("%s")`.

## Comment on trouve

**Ancrage** : MCP `ida`, xref data sur la chaîne `"Enter key: "` → fonction `main`.

```c
char v5[] = "ag7`124504a`;1;:;1`3:3a1gf72a;7g";   // decodee -> la VRAIE cle
char v6[] = "1381d5357780928686957ce0bb9c1eaa";    // deja "propre", jamais utilisee -> leurre
char v7[] = ";7;:2;1a:;1``gfa3a25a11`47307g4g";    // meme forme brouillee que v5, jamais utilisee -> leurre

sub_1179(v5, 32, 3);                 // XOR chaque octet par 3, IN PLACE
scanf("%s", input);
if (strcmp(input, v5) == 0) puts("good job!"); else puts("try again!");
```

```c
void sub_1179(char *s, int len, char key) {
    for (i = 0; i < len; ++i) s[i] ^= key;
}
```

Seule `v5` est réellement décodée et utilisée — `v6` et `v7` ne servent à rien d'autre qu'à faire perdre du temps à qui essaie `v6` en premier (il a « l'air » déjà décodé).

```python
encoded = "ag7`124504a`;1;:;1`3:3a1gf72a;7g"
key = "".join(chr(ord(c) ^ 3) for c in encoded)
# -> "bd4c217637bc828982c090b2de41b84d"
```

## Vérification

```bash
$ echo bd4c217637bc828982c090b2de41b84d | ./original/crackme
Enter key: good job!

$ echo wrong | ./original/crackme
Enter key: try again!
```

## Notes

- Pas de GDB nécessaire : XOR à clé fixe (3), triviale à inverser une fois `sub_1179` identifiée.
- Piège principal : trois chaînes de même longueur et de même « look » (hex-like), une seule réellement utilisée — vérifier l'usage réel (quelle variable est passée à `sub_1179` puis `strcmp`) plutôt que de supposer que la chaîne la plus « propre » est la bonne.
