# cbm-hackers — jumpjumpjump

| | |
|---|---|
| **ID** | [`5c1a939633c5d41e58e005d1`](https://crackmes.one/crackme/5c1a939633c5d41e58e005d1) |
| **Auteur** | cbm-hackers |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `42214fc24b0578200736d1531c7a57da7c440c7dbc122a86ff8271948952f858` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/rev03` | binaire d'origine |
| `tools/jumpjumpjump-solve.py` | magic string + flag attendu (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **Magic string** | `}}}}}}}}` (8× `}`, **sans retour à la ligne final**) |
| **Flag** | `flag{!#&*/5<DMW}` |

```bash
printf '}}}}}}}}' | ./original/rev03
python3 tools/jumpjumpjump-solve.py --check
```

## Premier regard

```bash
file original/rev03     # ELF64 PIE, not stripped
strings -n 5 original/rev03
```

Chaînes : `enter the magic string`, `too long...sorry no flag for you!!!`, `flag is flag{`, `wrong string`, `No flag for you.`. Symbole `strcat_str`.

## Flow

`main` lit une ligne (`fgets`), exige `strlen <= 11`, somme des octets == `0x3e8` (1000), puis appelle `strcat_str()` pour construire le flag et l'affiche.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/rev03 | awk '/<main>:/,/^$/'`.

```asm
1213: cmp rax,0xb ; jbe ok           -> strlen(saisie) <= 11
1248: add [sum],eax (char signe)     -> accumulation
1269: cmp [sum],0x3e8 ; jne echec     -> somme == 1000
```

**Piège** : `fgets` inclut le `'\n'` final dans la chaîne lue. Si on envoie l'entrée avec un retour à la ligne (`printf '...\n'` ou `echo`), sa valeur (`10`) s'ajoute à la somme et sa longueur au compte total — il faut envoyer l'entrée **sans** saut de ligne final (`printf '%s'` sans `\n`, pas `echo`).

Avec 8 octets identiques : `1000 / 8 = 125 = '}'` → `"}}}}}}}}"` (longueur 8, ≤ 11, somme exactement 1000).

### Le flag (`strcat_str`)

```c
// strcat_str() — ne depend PAS de l'entree utilisateur
buf[0] = 0x21;                     // '!'
for (i = 1; i <= 9; ++i)
    buf[i] = buf[i-1] + i + 1;
// -> "!#&*/5<DMW" (10 octets)
```

```python
buf = [0x21]
for i in range(1, 10):
    buf.append((buf[-1] + i + 1) & 0xFF)
flag = "flag{" + bytes(buf).decode() + "}"
# -> "flag{!#&*/5<DMW}"
```

## Vérification

```bash
$ printf '}}}}}}}}' | ./original/rev03
enter the magic string
flag is flag{!#&*/5<DMW}
```

## Notes

- Pas de GDB nécessaire : tout le calcul est statique et déterministe.
- Le flag est une **constante** indépendante de l'entrée (tant que le gabarit `strlen<=11`/`somme==1000` est satisfait) : toute magic string valide donne le même flag.
- Piège classique shell/C : `printf` **sans** `\n` final évite que `fgets` compte un octet supplémentaire dans la somme et la longueur.
