# ShadowLegion

Auteur local : **`shadowlegion`** (site : [ShadowLegion](https://crackmes.one/user/ShadowLegion)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [VaultBreaker](69fba1198fab7bbca27300f2/) | [`69fba119…`](https://crackmes.one/crackme/69fba1198fab7bbca27300f2) | Linux ELF64 PIE C++/Qt6 | `len==10 && utf8==XOR(kEncoded,0x5A)` → `Op3nS3same` |

Section **Debug GDB** : appel direct de `MainWindow::CheckPassword` en live (voir [README](69fba1198fab7bbca27300f2/README.md)).
