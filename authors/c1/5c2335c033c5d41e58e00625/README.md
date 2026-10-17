# c1 — c1_keygenme1

| | |
|---|---|
| **ID** | [`5c2335c033c5d41e58e00625`](https://crackmes.one/crackme/5c2335c033c5d41e58e00625) |
| **Auteur** | c1 |
| **Plateforme** | Linux ELF32 (i386) PIE, C, strippé |
| **SHA-256** | `c60bb546711add75669ab8862a62983f08ea53f96a3d1a9d46a772d47ce1c89f` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/keygenme1` | binaire d'origine (32-bit) |
| `analysis/keygenme1.i64` | base IDA |
| `tools/keygenme1-solve.py` | **vrai keygen**, fonctionne pour n'importe quel nom (`--user`, `-q`, `--check`) |

## Réponse

**Vrai keygen** (le programme demande lui-même d'en écrire un : « Please write a keygen :) »). User de référence **`petik`** :

| Username | Clé |
|---|---|
| `petik` | `0000000001010100010001000101010101000101010000000001000100000001-190a55ad` |

```bash
printf 'petik\n0000000001010100010001000101010101000101010000000001000100000001-190a55ad\n' | ./original/keygenme1
python3 tools/keygenme1-solve.py --user petik --check
```

## Premier regard

```bash
file original/keygenme1    # ELF32, PIE, stripped
strings -n 5 original/keygenme1
```

Chaînes : `Please enter your username:`, `Please enter your license key:`, `Invalid license key or username`, `You have entered a valid license key, good job!\nPlease write a keygen :)`. Imports `strtoul`, `__isoc99_sscanf`, `__ctype_b_loc` (classification de caractères).

## Flow

`main` (fonction principale repérée par xref sur les chaînes de prompt, binaire strippé mais sans obfuscation) : lit `username` et `license key`, valide le format (64 hexchars + `-` + checksum hex), décode les 32 octets de clé, et vérifie une relation entre ces octets et le hash de `username`.

## Comment on trouve

**Ancrage** : MCP `ida`, Hex-Rays sur `main` et les fonctions qu'elle appelle (CRC32, parsing).

```c
// sub_1219 = CRC32 standard (table dword_2560, init ~0, retour ~v4) -> crc32(buf, len)

// sub_1371 : coupe la cle au dernier '-' et renvoie le suffixe hex (strtoul base16)
//            -> v9 = checksum attendu, lu APRES le dernier '-'
// la cle doit donc faire EXACTEMENT 64 hexchars (verifie par strlen apres coupe)

h    = crc32(username, strlen(username));
key  = decode_hex(key_field_before_dash);     // 32 octets
for (i = 0; i < 32; i++) {
    bit = (h >> (31 - i)) & 1;
    if ((key[i] ^ bit) & 1) fail();            // LSB de key[i] DOIT valoir ce bit
    key[i] ^= bit;                              // efface ce LSB (devient pair)
}
checksum = crc32(key, 32);                      // sur la version "LSB efface"
if (checksum != v9) fail();
```

### L'astuce du keygen

Le LSB de chaque octet `key[i]` encode un bit du CRC32 du nom d'utilisateur (« stéganographie » triviale). Après vérification, ce LSB est **mis à zéro**. Si on choisit directement `key[i] = bit` (c'est-à-dire l'octet `0x00` ou `0x01`, qui a déjà le bon LSB), la version « LSB effacé » devient **exactement 32 octets nuls**, quel que soit le nom d'utilisateur ! Le checksum attendu est donc une **constante** :

```python
import zlib
CHECKSUM = zlib.crc32(bytes(32)) & 0xFFFFFFFF   # 0x190a55ad, toujours la meme valeur
```

### Construction du keygen complet

```python
def make_key(username):
    h = zlib.crc32(username.encode()) & 0xFFFFFFFF
    key_bytes = bytes((h >> (31 - i)) & 1 for i in range(32))   # 32 octets, chacun 0x00 ou 0x01
    return key_bytes.hex() + "-%08x" % CHECKSUM
```

## Vérification

```bash
$ python3 tools/keygenme1-solve.py --user petik --check
OK: True | KO: True

$ python3 tools/keygenme1-solve.py --user admin --check
OK: True | KO: True
```

Fonctionne pour n'importe quel nom d'utilisateur — confirmé générique, pas un cas particulier.

## Notes

- Pas de GDB nécessaire : tout le calcul (CRC32 standard + logique de bits) est statique et déterministe, reproductible fidèlement en Python avec `zlib.crc32`.
- L'astuce clé du reverse : reconnaître `sub_1219` comme un CRC32 classique (table + `init=~0` + `retour=~v4`) permet d'éviter de la réimplémenter à la main — `zlib.crc32` suffit.
