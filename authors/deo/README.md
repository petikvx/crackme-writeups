# deo

Auteur local : **`deo`** (site : [deo](https://crackmes.one/user/deo)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [DEOBF ME](6af9c31f2c7537120cbe8b07/) | [`6af9c31f…`](https://crackmes.one/crackme/6af9c31f2c7537120cbe8b07) | Windows PE64 MSVC, 10 Mo de code muté + stub packer | Pas de serial : blob chiffré du stub (RVA `0xa1c080`, 0x828 octets, xor/add rolling) localisé et déchiffré (`tools/deo-deobf-solve.py`) |
