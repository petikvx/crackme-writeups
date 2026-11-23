# doncris

Auteur local : **`doncris`** (site : [DonCris](https://crackmes.one/user/DonCris)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [DonCris's Existential Vending Machine](696280f08cfebaa7f00e32b0/) | [`696280f0…`](https://crackmes.one/crackme/696280f08cfebaa7f00e32b0) | Windows PE32+ C++ MinGW (ZIP) | keygen `petik→57555` : `((13*sum(nom)+7) ^ 0xface) - 0x7b` |
| 2 | [DonCris's Time Rift 2026](69569523c0f39eab872f88ac/) | [`69569523…`](https://crackmes.one/crackme/69569523c0f39eab872f88ac) | Windows PE64 C++ MinGW (ZIP) | keygen `petik→35738094480` : flux 132, `tomorrow`, `(djb2(nom)^0x2026)*132` |
| 3 | [DonCris's Santa's Secret Gift Vault](6954bb346d227ff9fc540009/) | [`6954bb34…`](https://crackmes.one/crackme/6954bb346d227ff9fc540009) | Windows PE64 C++ MinGW | code `HoHoHo_Merry_Xmas!` : `TARGET[i] ^ 0x1f`, 18 caractères |
| 4 | [DonCris's New Year's Resolution Vault 2026](695549ef6199fe19c0574632/) | [`695549ef…`](https://crackmes.one/crackme/695549ef6199fe19c0574632) | Windows PE64 C++ MinGW | code `petik→2521194965070` : checksum u64 `h=0x7e9; h=rol(h+c*(i+1),3)^0x20262026` |
| 5 | [DonCris's Santa's Network Admin Portal (S.N.A.P.)](69554b1024bfc29298329f00/) | [`69554b10…`](https://crackmes.one/crackme/69554b1024bfc29298329f00) | Windows PE64 C++ MinGW | keygen `petik→524947593` : hash u32 `ror(h^c, c%7+1)+0x5aa55aa5, ^=h<<4`, final `^0xdeadbeef` |
