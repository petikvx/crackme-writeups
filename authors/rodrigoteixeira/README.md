# RodrigoTeixeira

Auteur local : **`rodrigoteixeira`** (site : [RodrigoTeixeira](https://crackmes.one/user/RodrigoTeixeira)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [Loggin](6abfc1a30885f990699dc0c2/) | [`6abfc1a3…`](https://crackmes.one/crackme/6abfc1a30885f990699dc0c2) | Windows PE32 | `vefxne` / `mrqbixn` (`petik` exclu, hash username unique) |
| 2 | [Simulation password](6ac121acace07d1c3fbc4898/) | [`6ac121ac…`](https://crackmes.one/crackme/6ac121acace07d1c3fbc4898) | Windows PE32 | 40 octets quasi optimaux (hex `3fca41c6…8315`, octets ≥ 0x80 requis) |
| 3 | [Encrypted Password](6a539361a27dfa335e4c851d/) | [`6a539361…`](https://crackmes.one/crackme/6a539361a27dfa335e4c851d) | Windows PE32 | `Password\0` (littéral : `\` puis `0`) |
| 4 | [Roullete Simulator](693c48822d267f28f69b8518/) | [`693c4882…`](https://crackmes.one/crackme/693c48822d267f28f69b8518) | Java class | seed 16 bits retrouvé, all-in sur gains prédits → overflow int32 (money<0) |

## Ajouter un crackme

```bash
./scripts/add-crackme.sh --author rodrigoteixeira <id-ou-url>
```
