# th — ComputeTheKey

| | |
|---|---|
| **ID** | [`6a53f2cb055757d3df60fcd4`](https://crackmes.one/crackme/6a53f2cb055757d3df60fcd4) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | th |
| **Plateforme** | Linux ELF64 PIE, stripped, C, console |
| **Difficulté** | 2.0 |
| **SHA-256** | `e30c8719bd92272bd817de64a0567067755f6eaeac337000e5f36cc6e14980f9` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme_th` | binaire |
| `tools/computethekey-solve.py` | keygen (100% statique) |
| `tools/gdb-dump-key-schedule.py` | preuve live + piège de debug documenté ci-dessous |

## Réponse

```bash
python3 tools/computethekey-solve.py -q
# X_SECRET_KEY_X_1307
./original/crackme_th X_SECRET_KEY_X_1307
# Correct key!
```

## Premier regard

```bash
file original/crackme_th      # ELF64 PIE, stripped
strings -n 6 original/crackme_th
#   Usage: %s key
#   Incorrect key!
#   Correct key!
```

Imports : `memcmp`, `strlen`, `__printf_chk` — pas de `scanf`/`fgets`, le mot de passe passe en `argv[1]`.

## Flow

```bash
./crackme_th <key>
```

## Comment on trouve

**Ancrage.** MCP `ida` sur le binaire strippé : `main` (`0x1342`) décompile proprement :

```c
int main(int argc, char **argv) {
    byte_4018 = sub_1312(main, &loc_13E5 - (void*)main);   // djb2(main[0:163])
    char *key = argv[1];
    size_t len = strlen(key);
    if (len + 1 == n                         // n = 20 -> cle de 19 car.
        && (sub_11C3(key, len + 1), memcmp(key, &unk_4030, n) == 0))
        puts("Correct key!");
    else
        puts("Incorrect key!");
}
```

**`sub_1312`** est un hash façon djb2 (`h = 5381; h = *p++ + 33*h`) calculé **sur les 163 premiers octets de `main` lui-même** (de son adresse jusqu'à l'étiquette `loc_13E5`, le label du message « Correct key! ») — **anti-patch** : modifier un seul octet de `main` change le hash, donc la clé de déchiffrement, donc casse silencieusement la comparaison.

**`sub_11C3`** chiffre `argv[1]` **en place**, en XOR par blocs avec une clé de **3 octets** (`byte_4018[0..2]`) :

```c
// qword_4010 = 3 (nb de blocs), n = 20 (longueur argv[1]+NUL)
v5 = (n-1) / 3;                 // 6 : taille de bloc
// XOR [0:6) avec key[0], [6:12) avec key[1], [12:18) avec key[2], [18:19) avec key[0]
// puis bascule le dernier octet : NUL (0) <-> 1
```

`byte_4018` est une zone `.data` de 8 octets : seul l'octet `[0]` est réécrit à l'exécution (`mov [rip+...], al`, le hash tronqué à 8 bits) ; les octets `[1]` et `[2]` sont des **constantes figées dans le fichier** — `objdump -s -j .data` montre `00 c0 de 00…` à l'offset `0x4018` : `0xC0 0xDE` (« CODE » en hexspeak), un clin d'œil de l'auteur.

**Assemblage de la clé.** Le chiffrement est une **involution** (XOR + bascule d'un bit, tous deux auto-inverses) : appliquer *exactement* la même transformation à la référence `unk_4030` (20 octets fixes en `.data`, `a5 a2 ae b8 be af 85 94 9f 8b 85 99 81 86 81 ef ed ee ca 01`) avec la même clé donne directement `argv[1]` :

```python
hash_byte = djb2(main[0x1342:0x13e5]) & 0xff   # = 0xFD
key = (0xFD, 0xC0, 0xDE)
# XOR-chunks(unk_4030, key) -> b'X_SECRET_KEY_X_1307\x00'
```

→ **`X_SECRET_KEY_X_1307`**.

**Pièges.**
- `byte_4018` ressemble à un tableau mais seul l'octet `[0]` est dynamique — les 2 autres sont des constantes statiques à lire directement dans `.data`, pas à « calculer ».
- Le fichier est PIE : les adresses `.data` affichées par IDA (VA `0x4030`…) ne sont **pas** des offsets fichier directs — ici le décalage est de `0x1000` (`offset_fichier = VA − 0x1000`), vérifié via `ida_loader.get_fileregion_offset` plutôt que deviné.
- **Casser avec GDB à l'intérieur de la zone auto-hashée corrompt la mesure** — voir § Debug GDB, un piège rencontré et documenté en direct.

## Debug GDB (pas à pas)

Script : [`tools/gdb-dump-key-schedule.py`](tools/gdb-dump-key-schedule.py).

**Erreur initiale, instructive.** Première tentative : casser juste avant le `call memcmp` (`0x13ce`) pour lire `byte_4018[0]` en mémoire et vérifier le calcul statique. Résultat observé : `byte_4018[0] = 0xE1` (pas `0xFD`), et relancer `X_SECRET_KEY_X_1307` **sous gdb** donnait *« Incorrect key! »* — alors que le binaire natif (hors gdb) répond *« Correct key! »* pour la même entrée. Cause : `0x13ce < 0x13e5`, donc ce point d'arrêt se trouve **à l'intérieur même de la zone de 163 octets hashée par `sub_1312`** — `gdb` y écrit un octet `0xCC` (`INT3`) dès la commande `break` (avant `continue`), modifiant le code `main` **avant** que le hash ne soit calculé. Le hash observé sous gdb est donc celui d'un `main` *auto-patché par le débogueur lui-même*, pas celui du binaire réel : exactement le mécanisme anti-tamper qui fonctionne comme prévu, juste retourné contre l'analyse.

**Correction.** Casser plutôt sur le `ret` de `sub_1312` (`0x133b`), **avant** `main` (`0x1342`) donc hors de la zone hashée :

```bash
gdb -q -batch -ex "source tools/gdb-dump-key-schedule.py" \
    --args ./original/crackme_th X_SECRET_KEY_X_1307
```

```
PROOF base=0x555555554000
PROOF hash=0x7740fbad661385fd low_byte=0xfd
Correct key!
```

`0xfd` confirme exactement le calcul statique Python, et le programme répond bien *« Correct key! »* dans la même session.

**Piège à retenir** : pour tout code qui se hash/vérifie lui-même, **ne jamais poser de point d'arrêt logiciel à l'intérieur de la zone mesurée** — préférer un point d'arrêt avant l'entrée de la fonction hashée, ou un point d'arrêt matériel (`hbreak`), ou une preuve 100 % statique (ce que fait le solveur final).

## Vérification

```bash
./original/crackme_th X_SECRET_KEY_X_1307
# Correct key!
./original/crackme_th wrong_key_wrong_key
# Incorrect key!
./original/crackme_th
# Usage: %s key
```

## Notes

- Pas de patch binaire : le solveur lit uniquement les octets statiques du fichier d'origine.
- `byte_4018` : nom IDA trompeur (« array ») pour une zone qui mélange 1 octet dynamique (anti-tamper) et 2 octets constants (easter egg `0xC0DE`).
