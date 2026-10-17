# D4RKFL0W — Easy_firstCrackme-by-D4RK_FL0W

| | |
|---|---|
| **ID** | [`5c8e1a9533c5d4776a837ecf`](https://crackmes.one/crackme/5c8e1a9533c5d4776a837ecf) |
| **Auteur** | D4RKFL0W |
| **Plateforme** | Linux ELF64 PIE, C++, non strippé |
| **SHA-256** | `666be87d793ccfdc122becb763ad96a5de5c7f3c04e28b408449bf966da02172` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crack1_by_D4RK_FL0W` | binaire d'origine |
| `tools/crack1-solve.py` | mot de passe (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **Mot de passe** | `H1DD3N` |

```bash
echo H1DD3N | ./original/crack1_by_D4RK_FL0W
python3 tools/crack1-solve.py --check
```

## Premier regard

```bash
file original/crack1_by_D4RK_FL0W   # ELF64 PIE, C++, not stripped
strings -n 5 original/crack1_by_D4RK_FL0W
```

Chaînes : `Crackme1 By D4RK_FL0W`, `Password: `, `Well Done, password is `, ` Is WRONG!`.

## Flow

`main` compare chaque octet saisi (via `getline` dans un buffer global `password`) à une constante codée en dur, octet par octet.

## Comment on trouve

**Ancrage** : MCP `ida`, Hex-Rays sur `main` (`0x1195`) — comparaisons directes, aucun calcul :

```c
if (password != 72) failed();      // 'H'
if (byte_42A1 != 49) failed();     // '1'
if (unk_42A2 != 68) failed();      // 'D'
if (unk_42A3 != 68) failed();      // 'D'
if (unk_42A4 != 51) failed();      // '3'
if (unk_42A5 != 78) failed();      // 'N'
if (unk_42A6 != 0) failed();       // '\0' (fin de chaine)
success();
```

`chr(72)+chr(49)+chr(68)+chr(68)+chr(51)+chr(78)` = `"H1DD3N"`.

## Vérification

```bash
$ echo H1DD3N | ./original/crack1_by_D4RK_FL0W
Crackme1 By D4RK_FL0W

Password: 
Well Done, password is H1DD3N
```

## Notes

- Pas de GDB nécessaire : comparaisons triviales en immediates ASCII.
