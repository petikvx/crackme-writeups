# gregland

Auteur local : **`gregland`** (site : [gregland](https://crackmes.one/user/gregland)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [CrackMe](5b4cc23733c5d467513d2d0d/) | [`5b4cc237…`](https://crackmes.one/crackme/5b4cc23733c5d467513d2d0d) | Windows PE32 VDS/UPX | password `9456145` (Wine OK) |
| 2 | [CrackMe 2](5b4df56233c5d46d830c3f3a/) | [`5b4df562…`](https://crackmes.one/crackme/5b4df56233c5d46d830c3f3a) | Windows PE32 VDS | `SDFG45ERZdqf` + bouton OK 6 (Wine OK) |
| 3 | [CrackMe 3](5b4f76f233c5d41c0b8ae506/) | [`5b4f76f2…`](https://crackmes.one/crackme/5b4f76f233c5d41c0b8ae506) | Windows PE32 VDS/UPX | `bbe6e2be…` (`@_J`, Wine OK) + anti-debug |

## Arborescence d’un challenge

```
<id-crackmes.one>/
  ORIGIN.yml
  README.md
  original/
  analysis/
  tools/
```

## Ajouter un crackme

```bash
./scripts/add-crackme.sh https://crackmes.one/crackme/<id>
# ou forcer le slug :
./scripts/add-crackme.sh --author gregland <id>
```

Doc : [README racine](../../README.md#ajouter-un-crackme-crackmesone).
