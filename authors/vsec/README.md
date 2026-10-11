# vsec

Auteur local : **`vsec`** (site : [vsec](https://crackmes.one/user/vsec)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [Challenger No.1](6acace8cca34abba98f8305a/) | [`6acace8c…`](https://crackmes.one/crackme/6acace8cca34abba98f8305a) | Windows PE64 Go (garble + VM_Garble) | **solved** — serial = 64 hex `R ^ SHA256(user‖"NIGHTMARE")[:8]` (`R` = `math/big`, secp256k1 / 2²⁵⁵−19) ; `petik→96e401d4…1923` ; flag lisible avec `elite` : `CMO{UsrN4m3_S3r14l_N1ghtm4r3_0nly_3l1t3_R3s_w1ll_p4ss}` |