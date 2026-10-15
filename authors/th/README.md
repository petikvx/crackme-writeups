# th

Auteur local : **`th`** (site : [th](https://crackmes.one/user/th)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [ComputeTheKey](6a53f2cb055757d3df60fcd4/) | [`6a53f2cb…`](https://crackmes.one/crackme/6a53f2cb055757d3df60fcd4) | Linux ELF64 PIE C | XOR par blocs, clé = hash djb2 anti-patch de `main()` + `0xC0DE` → `X_SECRET_KEY_X_1307` |

Section **Debug GDB** : piège documenté (breakpoint posé dans la zone auto-hashée corrompt la mesure) — voir [README](6a53f2cb055757d3df60fcd4/README.md).
