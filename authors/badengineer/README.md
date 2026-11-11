# badengineer

Auteur local : **`badengineer`** (site : [BadEngineer](https://crackmes.one/user/BadEngineer)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [BadEngineer's First Crackme](694f817e0c16072f40f5a4a0/) | [`694f817e…`](https://crackmes.one/crackme/694f817e0c16072f40f5a4a0) | Windows PE32 (MinGW) | mot de passe 9 chars dérivé du 1er char `c` (`p[i]=p[i-1]+i`), ex. `0136:?ELT` (émulation unicorn, pas de Wine) |
| 2 | [BadEngineer's BeginnerFriendly](69523463044ecfaf9923f9c5/) | [`69523463…`](https://crackmes.one/crackme/69523463044ecfaf9923f9c5) | Windows PE32 (MinGW) | somme des chars == 0x4d8 (1240), len ≤ 16 ; ex. `petik`→`petikuuuttt` (émulation unicorn, pas de Wine) |
