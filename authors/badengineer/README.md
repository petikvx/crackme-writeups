# badengineer

Auteur local : **`badengineer`** (site : [BadEngineer](https://crackmes.one/user/BadEngineer)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [BadEngineer's First Crackme](694f817e0c16072f40f5a4a0/) | [`694f817e…`](https://crackmes.one/crackme/694f817e0c16072f40f5a4a0) | Windows PE32 (MinGW) | mot de passe 9 chars dérivé du 1er char `c` (`p[i]=p[i-1]+i`), ex. `0136:?ELT` (émulation unicorn, pas de Wine) |
| 2 | [BadEngineer's BeginnerFriendly](69523463044ecfaf9923f9c5/) | [`69523463…`](https://crackmes.one/crackme/69523463044ecfaf9923f9c5) | Windows PE32 (MinGW) | somme des chars == 0x4d8 (1240), len ≤ 16 ; ex. `petik`→`petikuuuttt` (émulation unicorn, pas de Wine) |
| 3 | [BadEngineer's EasiestEver](697fd52a16739b40dcb5dabd/) | [`697fd52a…`](https://crackmes.one/crackme/697fd52a16739b40dcb5dabd) | Windows PE64 (MinGW) | ≤ 16 chars, ≥ 1 char de chacune des 10 classes (0-4,H-N,t-y,a-f,!-&,;-?,j-m,z-},o-s,\\-`) ; ex. `0Hta!;jzo\\` (émulation unicorn, pas de Wine) |
| 4 | [BadEngineer's PlsCrackMe](697f67fe977274421cc111ef/) | [`697f67fe…`](https://crackmes.one/crackme/697f67fe977274421cc111ef) | Windows PE64 (MinGW, dans un ZIP) | 13 chars : 3 chiffres + 3 spéciaux + 3 majuscules + 4 minuscules, ex. `Pe7!Tk9@Ik#2x` (Wine OK) |
