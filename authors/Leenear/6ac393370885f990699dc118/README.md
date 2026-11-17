# Leenear's (keygenme) Wait, it was all linear? Always have been.

| | |
|---|---|
| **ID** | [`6ac393370885f990699dc118`](https://crackmes.one/crackme/6ac393370885f990699dc118) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | Leenear |
| **Plateforme** | Linux x86-64, ELF PIE (C++, libstdc++) |
| **SHA-256 `original/download.bin`** | `25ad41f3154494156c24b216e42268e026177d816d4a8be799bb6dd8f310fd2d` |

| Fichier | Rôle |
|---|---|
| `original/download.bin` | en réalité le **ZIP** du site (mot de passe `crackmes.one`), non modifié |
| `analysis/extract/crackme` | ELF extrait (sha256 `3034be5b…f43cc2af`) |
| `tools/leenear-linear-solve.py` | solveur / keygen |

## Réponse

Pas de username : un seul serial de 32 caractères.

```text
dixon_lifts_RA+I_mod_2^8_in_O~mn      → flag{dixon_lifts_RA+I_mod_2^8_in_O~mn}
```

```bash
python3 -I tools/leenear-linear-solve.py --check analysis/extract/crackme
```

(`petik` n'est pas applicable : l'entrée n'est pas un nom ; `petik…` de 32 car. donne `nope.`)

## Premier regard

- `download.bin` commence par `PK\x03\x04` : zip chiffré (ZipCrypto) → `python3 -c "zipfile … pwd=b'crackmes.one'"` dans `analysis/extract/`.
- `readelf -h` : DYN, entry `0x1870`. Imports : `fgets`, `strcspn`, `strlen`, `printf`, `puts`. Strings : `password> `, `nope.`, `correct! flag{%s}`.

## Flow

`main` (`0x1090`) : `fgets` 0x80 → retire `\n` → `strlen == 0x20` sinon `nope.` → génère une matrice par xorshift32 → découpe l'entrée en 8 mots u32 LE, XOR avec 8 constantes → calcule 8 qwords → les compare (xor/or SSE) aux 8 qwords de `.rodata`. Tout à zéro = `correct!`.

## Comment on trouve

Ancrage : `objdump -d -M intel crackme`, fonction `main` (pas de symboles utiles, tout est dans `main`).

1. **Mots de l'entrée** (`0x1319`–`0x1506`) : `v[i] = LE32(input[4i..4i+4]) ^ K[i]`, avec
   `K = 9e3779b9, 7f4a7c15, f39cc060, 5cedc834, 2b3e1e9b, a54ff53a, 510e527f, 1f83d9ab`.
   Stockés en qwords à `[rsp+0x10+8i]`.
2. **Génération de la matrice** (boucle `0x11d0`–`0x130d`, 8 tours, état initial `0x6054d23c`) :
   xorshift32 (`x^=x<<13; x^=x>>17; x^=x<<5`). Par ligne `i`, 6 pas :
   - pas 1/3/5 : indice `idx_k = ((b&1) + i + 1 + 2k) & 7` (`b` = valeur après le `>>17`) ;
   - pas 2/4/6 : coefficient `c_k = (état % 15) − 7` (le `imul 0x88888889; shr 0x23` est une division par 15 ; `shl 4 / sub` = ×15).
   Résultat dans `_ZL1q` (`0x40c0`, 0x28 octets/ligne).
3. **Sorties** (`0x1450`–`0x17a5`) : `out[s] = D[s]*v[PERM[s]] + ((c0·v[i0] + c1·v[i1] + c2·v[i2]) << 8)` en 64 bits,
   `D = 5f,75,33,47,21,3f,21,79` (`.rodata 0x2050`), `PERM = 3,0,5,2,7,4,1,6` (ordre des `imul r,r,imm` : `v3*0x5f`, `v0*0x75`, …).
4. **Comparaison** (`0x16bf`–`0x17ee`) : cibles 8 qwords à `.rodata 0x2090..0x20cf`, rangées dans l'ordre slots 4,5 | 6,7 | 0,1 | 2,3 (piège : ordre des `pxor`).

C'est donc un **système linéaire 8×8** sur les `v[i]` (d'où le titre). Le solveur reproduit le générateur, lit les cibles dans le binaire, résout par Gauss-Jordan en `Fraction` (solution entière, dans [0, 2³²), sans retenue 64 bits), puis `word = v ^ K` et sérialise en LE → 32 octets ASCII.

Piège : le ZIP déguisé en `.bin` ; la matrice n'est pas statique (générée à l'exécution), donc pas lisible directement dans `.data`.

## Vérification

```text
$ python3 -I tools/leenear-linear-solve.py --check analysis/extract/crackme
serial: 'dixon_lifts_RA+I_mod_2^8_in_O~mn' (hex 6469786f…6d6e)
password> correct! flag{dixon_lifts_RA+I_mod_2^8_in_O~mn}   rc=0

$ echo -n petikpetikpetikpetikpetikpetikpe | analysis/extract/crackme
password> nope.
```

Exécution native Linux ; reverse 100 % statique (objdump), pas de GDB ni IDA utilisés.
