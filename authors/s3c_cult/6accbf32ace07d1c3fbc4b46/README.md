# S3c_Cult's Schizo

| | |
|---|---|
| **ID** | [`6accbf32ace07d1c3fbc4b46`](https://crackmes.one/crackme/6accbf32ace07d1c3fbc4b46) |
| **Auteur (site)** | S3c_Cult |
| **Auteur (local)** | s3c_cult |
| **Plateforme** | Linux ELF64 x86-64 PIE, C++ (cpp-httplib, OpenSSL), non strippé |
| **SHA-256 (zip)** | `8bd75780a214c5a63af6188d615437d9a0708d8e47684a3fab36db860671a6e1` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/schizo.zip` | archive d’origine (`lib.so`, `schizo`, `srv.py`, `README.md`) |
| `analysis/extracted/` | contenu dézippé, `lib.dec.so` (lib.so déchiffrée), `lib.dec.so.i64.c` (Hex-Rays) |
| `tools/schizo-solve.py` | déchiffre/inverse les fragments → flag (`--keys`, `--check`, `-q`) |

## Réponse

```
CMO{Th3y_L1K3_T0_h1d3}
```

```bash
python3 -I tools/schizo-solve.py --check     # roundtrip OK sur les 5 fragments
python3 -I tools/schizo-solve.py -q          # CMO{Th3y_L1K3_T0_h1d3}
```

Pas de nom d’utilisateur : le flag est fixe, reconstitué à partir de données embarquées.

## Premier regard

- `schizo` : ELF64 PIE, lié à `libcrypto`, `libstdc++`, contient cpp-httplib (client HTTP). `lib.so` n’est pas un ELF (`file` → `data`) : chiffré.
- `srv.py` : mini serveur sur `:5566` qui répond toujours `SILLY!!` — un leurre, le vrai serveur n’est pas fourni.
- Le binaire a besoin d’un libstdc++ récent (`GLIBCXX_3.4.35`), il ne tourne pas ici : analyse 100 % statique.

## Flow

1. `main` (`sub_A7F6`) calcule la clé, déchiffre `lib.so` en mémoire, `mkstemp` + `dlopen`, puis `dlsym` de `___1`, `___3`, `___4`.
2. Affiche `I know you're watching me. Are you one of them?` (base91 + `___4`).
3. Pour 5 entrées `idx+clé`, envoie `GET http://127.0.0.1:5566` avec `User-Agent: schizo 1.0` et `X-Fragment-Key: <clé>` ; la réponse est stockée dans le slot `idx`.
4. `sub_A0BA` re-chiffre chaque réponse avec `___1`, la compare à la table attendue ; si les 5 matchent, concatène les réponses et les affiche : c’est le flag.

## Comment on trouve

**Ancrage** : `main` à `0xA7F6` (point d’entrée → `__libc_start_main`), `bash -ic 'decc schizo'` pour le pseudo-C.

**1. Déchiffrer lib.so** (`sub_8C7B` + `sub_28025`) :
- `sub_8C7B` mmap `/proc/self/exe`, cherche une section par nom (strcmp) et en fait un hex string en minuscules : la section **`.sforce2`** (`0xA02C1`, taille `0x3C6`).
- `sub_28025` : `key = SHA256(hexstring)`, `AES-256-CBC`, IV = `unk_A7630` = `00 01 … 0f`.
- Piège : le littéral passé à `sub_12F78` dans `sub_8C7B` (`unk_A1859`) est la chaîne vide initiale, pas le nom de section.

```python
sec = d[0xa02c1:0xa02c1+0x3c6]
key = hashlib.sha256(sec.hex().encode()).digest()   # puis openssl enc -d -aes-256-cbc -iv 00..0f
```

→ `lib.dec.so` : ELF valide, exporte `___1`, `___3`, `___4`.

**2. Les chaînes** : `sub_9243` = décodeur **base91 maison** (alphabet `chr(33+v)`, 13 bits par paire, `91*a+b`). `___4(s)[i] = ror8(~(s[i] - 9*i), 3)`. Appliqué à `` `\wiXh4s:… `` → le message ci-dessus, `User-Agent`, `schizo 1.0`, `X-Fragment-Key`, `http://127.0.0.1:5566`.

**3. Tables** (`off_E0F00` clés, `off_E0F40` attendus) : chaque entrée = base91(chiffre d’index) + reste, découpée par `sub_9AF5` (plus petit préfixe dont le décodage est numérique) :

| idx | X-Fragment-Key |
|---|---|
| 0 | `a` |
| 1 | `FA24` |
| 2 | `R*` |
| 3 | `243kopa` |
| 4 | `F*^&` |

**4. `___1`** (SPN, dans `lib.so`) — la clé est dérivée de l’entrée :
- `v27 = (len*0x9E3779B1) ^ (sum*0x85EBCA6B) ^ 0xA3C59AC3` (32 bits, `0xCAFEBABE` si 0), `R = (v27&7)+6` tours ;
- sbox = Fisher-Yates xorshift32 (`seed v27^0xA5A5A5A5`), permutations par tour (`v27^0x3C3C3C3C ^ 0x5A5A5A5A`), tables `A`/`B` (`v27^0xC3C3C3C3`) ;
- par tour : `x^=A[k]`, `sbox`, permutation, `rol((i+k)&7)`, `x+=B[k]` ;
- sortie = `v27` (u32 BE) ‖ `R` ‖ octets.

Comme `v27` et `R` sont en clair dans la sortie et que la longueur est celle du texte, on **inverse** directement : `base91dec(attendu)` → lire `v27` → défaire les tours à l’envers. Le roundtrip `enc(dec(x)) == x` valide chaque fragment (donc `v27` cohérent avec `len/sum`).

**5. Assemblage** (ordre des indices) :

| idx | v27 | fragment |
|---|---|---|
| 0 | `0xdbb7e899` | `CMO{` |
| 1 | `0xb2c43e9b` | `Th3y_` |
| 2 | `0xb47f6e28` | `L1K3_` |
| 3 | `0xb9778b31` | `T0_` |
| 4 | `0xd8f2cff9` | `h1d3}` |

## Vérification

```text
$ python3 -I tools/schizo-solve.py --check
idx 0: roundtrip OK  v27=0xdbb7e899 len=4
...
assemble : CMO{Th3y_L1K3_T0_h1d3}
```

Pas de preuve live : le binaire exige GLIBCXX_3.4.35 (indisponible ici) et le vrai serveur de fragments n’est pas fourni. La preuve repose sur le roundtrip exact de `___1` pour les 5 entrées. Un serveur qui répondrait ces fragments à chaque `X-Fragment-Key` ferait afficher le flag par le binaire.

## Notes

- `srv.py` (`SILLY!!`) est un leurre : avec lui la vérification échoue (`sub_A0BA` branche d’échec).
- Après le flag, le binaire imprime `aHR0cHM6Ly9pbmRlZWQuY29t` (base64 de `https://indeed.com`), clin d’œil du README.
- Pas de GDB ni x64dbg : reverse statique (IDA headless via `decc`).
