# mrAlpha17mr's lamplighter

| | |
|---|---|
| **ID** | [`6aed2ae0c0ad374eab081633`](https://crackmes.one/crackme/6aed2ae0c0ad374eab081633) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | mrAlpha17mr |
| **Plateforme** | Python 3.9+ (script `lamplighter.py`, stdlib seule) |
| **SHA-256** | `db28e508184a3fde69900930f899ba48270c48f310cf72b97499e9dde2eaebb8` |

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP (mdp `crackmes.one`) → `upload-lamplighter.zip` → `lamplighter.py` + `README.txt` |
| `tools/lamplighter-solve.py` | keygen (lit directement `original/`, ne modifie rien) |

## Réponse

Serial `NK-<a>-<b>-<c>` dépendant du nom.

| Nom | Serial | Message du crackme |
|---|---|---|
| `petik` | **`NK-DA9D-0366-2E88`** | `The clerk stamps the ledger. Lantern CMO{37C3E527}.` |
| `CrackMes1` | `NK-1618-6D04-2AB9` | `… Lantern CMO{FB288316}.` (token d'auto-validation) |

```bash
python3 -I tools/lamplighter-solve.py --name petik [-q] [--check]
```

## Premier regard

`download.bin` est un ZIP chiffré (`crackmes.one`) contenant un second ZIP. `lamplighter.py` (8,5 Ko) est truffé de leurres :
- `PORCH_C` : un C « laissé par l'invité » (constante 0x9E38 au lieu de 0x9E37) ;
- `guest_serial` : sérial `ML-…` (c'est le crackme *mothlight*, voisin) → « This ledger does not stamp it » ;
- `MOTH_KEY = "password=mothlight"` affiché sur échec.

Le vrai code est dans `_wake()` : un blob base64 → XOR avec la clé `lamp` (répétée) → `zlib.decompress` → `exec`.

## Comment on trouve

1. Décoder le blob **sans l'exécuter** (le décoder suffit, on lit la source) :
   ```python
   plain = bytes(raw[i] ^ b"lamp"[i%4] for i in range(len(raw)))
   src = zlib.decompress(plain).decode()
   ```
   On obtient un module de ~11 Ko (`ledger`) : `derive_nk`, `respond`, `picture_key`, un PNG base64, des œufs de Pâques.
2. Flot de `run()` : nom validé (`name_ok`) → serial en majuscules → rejeté s'il est `ML-…` (moth), s'il égale `guest_serial` (leurre : serial dérivé de la légende PNG `Note: password=mothlight`, « the caption is lying ») → sinon parse `NK-XXXX-XXXX-XXXX`.
3. Le vrai attendu : `derive_nk(name, picture_key(png))`. La clé de 16 octets n'est **pas** `KEY` (constante `LAMP…`, utilisée seulement par `night_serial`/`token_for`, autre leurre) mais `picture_key` : le **bit de poids faible du canal rouge** des 128 premiers pixels, ligne par ligne (PNG 72×52, RGB 8 bits, filtre 0 → 2 lignes), bit i → octet `i//8`, poids `i%8`.
4. `derive_nk` (3 accumulateurs 32 bits, tronqués à 16 bits avec des morceaux de la clé) :
   - `h` : init `0x6C616D70` ; par octet `h ^= b + key[i%16]*(i+1)`, `h*=0x01000193`, `rol5` ;
   - `g` : init `key[0:4]` ; nom à l'envers : `g ^= (b+0x20+key[(i+7)%16])&0xFF`, `g*=0x85EBCA6B`, `rol3` ;
   - `p` : init `key[4:8] ^ (len*0x100+raw[0])` ; `p += b*(i+3)+key[3i%16]`, `p ^= p>>13`, `p = p*0x27D4EB2D+0x165667B1` ;
   - `a = h^key[8:10]^key[14]`, `b = g^key[10:12]^(key[15]<<1)`, `c = p^key[12:14]^(h>>16)^(key[14]<<8|key[15])`, chacun `&0xFFFF`.
5. Piège « patch » : `respond()` reconstruit la phrase de succès par un keystream LCG dérivé de l'attendu **et** du fourni (`PHRASE[i]^0x5A^got[i]^exp[i]`) ; forcer le saut donnerait du bruit. D'où un keygen.
6. Pièges rencontrés : ma première version ne lisait que la 1re ligne (72 pixels) pour la clé → serial faux (`The lamp stays dark.`) ; il faut bien traverser 2 lignes (stride = 3·72+1 octets).

## Vérification

`--check` écrit le `lamplighter.py` d'origine (extrait en mémoire) dans un dossier temporaire et l'exécute avec le nom + serial :

```text
$ python3 -I tools/lamplighter-solve.py --name petik --check
name=petik
serial=NK-DA9D-0366-2E88
name> serial> The clerk stamps the ledger. Lantern CMO{37C3E527}.

$ python3 -I tools/lamplighter-solve.py --name CrackMes1 --check
… The clerk stamps the ledger. Lantern CMO{FB288316}.

# KO : serial NK-0000-0000-0000 pour petik
name> serial> The lamp stays dark.
```

## Notes

- Aucun GDB / IDA / debugger : reverse 100 % statique (script Python).
- Le script réel lit un seul essai (`input()` x2).
- Ce n'est **pas** le serial `ML-…` de mothlight ni `decoy_serial` (légende PNG) : les deux sont refusés explicitement.
