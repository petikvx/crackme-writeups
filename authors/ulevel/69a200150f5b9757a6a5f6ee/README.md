# Ulevel's rsame_v3

| | |
|---|---|
| **ID** | [`69a200150f5b9757a6a5f6ee`](https://crackmes.one/crackme/69a200150f5b9757a6a5f6ee) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | Ulevel |
| **Plateforme** | Windows PE64, console, C++ MSVC |
| **SHA-256 (ZIP)** | `ee36f2891128acc0282e2963ef1bae7843dc3fe45ea7871022f4cc4a80be48c3` |
| **SHA-256 (exe)** | `7fa47dd5f4c40fe0c0c904a175bb5c16f66cb0ee9350f22d6d0411792ba85f11` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/RSAme_v3.zip` | archive d'origine (mot de passe `crackmes.one`), non modifiée |
| `analysis/x/` | contenu extrait (`RSAme_v3.exe`, `readme.txt`) |
| `analysis/full.asm` | `objdump -d -M intel` complet |
| `tools/ulevel-rsame-v3-solve.py` | keygen / `--check` via Wine |

## Réponse

Le crackme demande `Name:` puis `Signature (hex):`. La signature est `MD5(name)^d mod n`.

| Name | Signature (hex) |
|---|---|
| `petik1` | `20a2ef0578285296f0f318853a214eb6` |
| `admin` | `82b266edce0e60cc83a0f2c769fd00b7` |

`petik` seul est **impossible** : `MD5("petik") = cdc64cab…` ≥ n et le binaire ne réduit pas le hash (testé : la signature de `MD5 mod n` est refusée). D'où `petik1`, le plus proche.

```bash
python3 -I tools/ulevel-rsame-v3-solve.py --name petik1          # affiche n, signature
python3 -I tools/ulevel-rsame-v3-solve.py --name petik1 -q       # signature seule
cd analysis/x && python3 -I ../../tools/ulevel-rsame-v3-solve.py --check RSAme_v3.exe
```

## Premier regard

- `readme.txt` : « simple rsa-128 signature verifier — the solution is the correct signature for given name ».
- `file` : PE32+ console x86-64. `strings` : `Name: `, `Signature (hex): `, `The signature is VALID` / `The siganture is INVALID`, `%02x`, et deux chaînes suspectes : `b4480fc7b2481311435cab0751d0caed` (32 hex = 128 bits) et `10001`.

## Flow

`main` (`0x140001230` environ) :

1. alloue 4 bignums (`0x1400039b0`), charge `n` ← `"b4480fc7…caed"` et `e` ← `"10001"` via `0x140004880` (parse hex) ;
2. lit `Name`, calcule **MD5** (constantes `0x67452301 / 0xefcdab89 / 0x98badcfe / 0x10325476` en `0x14000135d…`, transform en `0x140001b90`) ;
3. formate le digest en hex (`"%02x"` en `0x14000b514`, boucle de 16 octets) et le parse en bignum `m` ;
4. lit la signature hex `s` ;
5. `0x140005270(s, e, n)` = exponentiation modulaire `s^e mod n` ; `0x140003ed0` compare le résultat à `m` → VALID / INVALID.

## Comment on trouve

- **Ancrage** : `objdump -d -M intel RSAme_v3.exe > analysis/full.asm`, puis recherche des xrefs sur les chaînes (`.rdata` VA `0x14000b4e0` = n, `0x14000b504` = e, `0x14000b50c` = `Name: `, `0x14000b538` = INVALID). Le MCP `ida`/`decc` n'était pas disponible dans cette session : lecture à l'`objdump`.
- **Lecture** : les `movups` de `0x1400012b9` copient la chaîne de n sur la pile, puis `call 0x140004880` la convertit en bignum ; les 4 IV MD5 identifient l'algorithme sans ambiguïté.
- **Modèle** : signature RSA « textbook » sans padding : `s^65537 mod n == int(md5hex(name),16)`.
- **Cassage** : n = `0xb4480fc7b2481311435cab0751d0caed` = 239635204672823224276222448766416898797 se factorise avec GNU `factor` (~3 min) en
  `15090658028802823693 × 15879705458532216929`. Un Pollard-rho Python pur est trop lent (facteurs de 64 bits, ~2³² itérations).
- **Clé privée** : `d = e⁻¹ mod (p-1)(q-1)`, signature `s = m^d mod n`.
- **Exemple** `petik1` : `md5 = 43179ce6d84e97e0fdfdeddca1e594f9` (< n) → `s = 20a2ef0578285296f0f318853a214eb6`.
- **Piège** : le hash 128 bits est parfois ≥ n (≈ 30 % des noms, dont `petik`) : aucune signature n'existe alors, car le binaire compare sans réduction.

## Vérification

Wine (`xvfb-run -a wine`), binaire d'origine extrait :

| Entrée | Résultat |
|---|---|
| `petik1` / `20a2ef0578285296f0f318853a214eb6` | `The signature is VALID` |
| `admin` / `82b266edce0e60cc83a0f2c769fd00b7` | `The signature is VALID` |
| `petik` / `ab2e1fdda6bbebb7c66a24356e0f503d` (hash réduit mod n) | `The siganture is INVALID` |
| `petik` / `1234abcd` | `The siganture is INVALID` |

## Notes

- L'implémentation interne du bignum (`0x140005270`) n'a pas été relue : le modèle `s^e mod n` est confirmé par les signatures VALID obtenues.
- Pas de GDB ni de debug live utilisés.
