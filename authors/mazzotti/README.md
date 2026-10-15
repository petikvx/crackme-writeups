# mazzotti

Auteur local : **`mazzotti`** (site : [Mazzotti](https://crackmes.one/user/Mazzotti)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [Getting started patch-me](6a6ef28bdf981859694943d5/) | [`6a6ef28b…`](https://crackmes.one/crackme/6a6ef28bdf981859694943d5) | Linux x86-64 | `eb`→`je` + serial `251949` |
| 2 | [Multi-layer password check](6a6e1787184836c0dbe7d625/) | [`6a6e1787…`](https://crackmes.one/crackme/6a6e1787184836c0dbe7d625) | Linux x86-64 | `MAZZ`×{3,7,12,1,15,7} |
| 3 | [Cortisol level low keygen](6a400d20a4b247348ae806cf/) | [`6a400d20…`](https://crackmes.one/crackme/6a400d20a4b247348ae806cf) | Linux x86-64 C++ | checksum mod10 : `weights=[1,3,7,9,1,3,7,9,1,3]` → `12345678903` |
| 4 | [Getting started keygen](6a3ce36d39dd6183d62b9dfe/) | [`6a3ce36d…`](https://crackmes.one/crackme/6a3ce36d39dd6183d62b9dfe) | Linux x86-64 C++ | `key = Σ(ord(s[i]) XOR table[i])` → `petik` → `746` |
| 5 | [Back To The beginning Keygen](6a37cbc65f26f108ba18b982/) | [`6a37cbc6…`](https://crackmes.one/crackme/6a37cbc65f26f108ba18b982) | Linux x86-64 C++ | `s[0]==':' s[1]=='3' s[4]=='M'` → `:3pkM` |
| 6 | [Rage keygen](6a357cd98a86e4c2c55254d8/) | [`6a357cd9…`](https://crackmes.one/crackme/6a357cd98a86e4c2c55254d8) | Linux x86-64 C++ | XOR pivot + somme==732 + `stoi%27==13` (payload généré, non imprimable) |

Section **Debug GDB** : ajoutée dans [`crackme`](6a6e1787184836c0dbe7d625/README.md) et [`getting_started_patchme`](6a6ef28bdf981859694943d5/README.md). Les 4 autres (3–6) sont résolus en statique pur (désassemblage + petits scripts de vérification), pas de session GDB nécessaire.
## Ajouter un crackme

```bash
./scripts/add-crackme.sh --author mazzotti <id>
```
