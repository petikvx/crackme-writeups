# marco007 — simple crackme

| | |
|---|---|
| **ID** | [`698a6214fb46458f1ef6cef5`](https://crackmes.one/crackme/698a6214fb46458f1ef6cef5) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | marco007 |
| **Plateforme** | Linux ELF64 PIE, **non strippé**, C, console |
| **Difficulté** | 1.4 |
| **SHA-256** | `de69c76c95d806f05e8458169c22354c760424cd7e59ec5344fd5639cd9ef935` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme` | binaire |
| `tools/simple-crackme-solve.py` | mot de passe + flag |

## Réponse

```bash
python3 tools/simple-crackme-solve.py -q
# NAKED_SNAKE
echo NAKED_SNAKE | ./original/crackme
# FLAG{CIPHER_ENCRYPTION}
```

| Mot de passe | Flag |
|---|---|
| `NAKED_SNAKE` | `FLAG{CIPHER_ENCRYPTION}` |

## Premier regard

```bash
file original/crackme     # ELF64 PIE, non strippé
nm original/crackme | grep " D \| B "
#   enc_msg, key, multiplier, offset, flag
```

Binaire non strippé : les globales `enc_msg`, `key`, `multiplier`, `offset`, `flag` sont nommées explicitement — tout est lisible au premier coup d'œil.

## Flow

```
You must enter a password to access this program!
<mot de passe>
FLAG{...}                         (si bon)
wrong password, try again. >      (boucle si mauvais, sans fin : pas de gestion EOF)
```

## Comment on trouve

**Ancrage.** MCP `ida` : `main` décompile directement, aucune obfuscation.

```c
for (i = 0; i <= 10; i++) enc_msg[i] ^= key;        // decode le mot de passe en place
v4 = multiplier ^ offset;
scanf("%s", s1);
while (strcmp(s1, enc_msg) != 0) { printf("wrong..."); scanf("%s", s1); }
for (j = 0; j <= 22; j++) flag[j] ^= j + v4;          // decode le flag (XOR glissant)
puts(flag);
```

Deux XOR indépendants, à lire directement en mémoire via le MCP `ida` :

- `enc_msg` (11 octets, `.data`) XOR `key` (constante 32 bits, seul l'octet bas `0x69` compte) → **mot de passe**.
- `flag` (23 octets, `.data`) XOR `(j + (multiplier ^ offset))` — un XOR dont la clé **glisse** avec l'indice `j` (`multiplier=187`, `offset=3` → `v4 = 187^3 = 184 = 0xB8`) → **flag**.

**Assemblage.**

```python
enc_msg = bytes.fromhex("2728222c2d363a2728222c")
password = bytes(b ^ 0x69 for b in enc_msg)   # b'NAKED_SNAKE'

flag_enc = bytes.fromhex("fef5fbfcc7fef7ef8884909c818b859591999e828383b3")
v4 = 187 ^ 3                                   # 0xB8
flag = bytes(flag_enc[j] ^ ((j+v4)&0xFF) for j in range(23))  # b'FLAG{CIPHER_ENCRYPTION}'
```

**Pièges.**
- Le flag n'est décodé **qu'après** avoir saisi le bon mot de passe — mais comme les deux blobs (`enc_msg`, `flag`) et leurs clés sont tous des constantes statiques en `.data`, les deux se calculent **hors ligne** sans jamais exécuter le binaire.
- En cas de mauvais mot de passe saisi via un pipe (`echo … |`), le programme **boucle indéfiniment** sur `scanf` après EOF (pas de vérification de fin de flux) — couper avec `timeout` si on teste un cas KO en pipe.

## Vérification

```bash
echo NAKED_SNAKE | ./original/crackme
# You must enter a password to access this program!
# FLAG{CIPHER_ENCRYPTION}

echo wrong | timeout 2 ./original/crackme
# You must enter a password to access this program!
# wrong password, try again.
# > wrong password, try again.
# > ...   (boucle jusqu'au timeout)
```

## Notes

- Pas de GDB utilisé : reverse 100 % statique (MCP `ida`), vérifié par exécution directe.
- Pas d'obfuscation ni d'anti-debug : XOR fixe en clair, calculable sans exécuter le binaire.
