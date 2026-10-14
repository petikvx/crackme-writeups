# rr7

Auteur local : **`rr7`** (site : [RR7](https://crackmes.one/user/RR7)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [RR7's Secret key](6a46f20c8a86e4c2c5525631/) | [`6a46f20c…`](https://crackmes.one/crackme/6a46f20c8a86e4c2c5525631) | Windows PE64 MinGW | number `33` puis key `102` (`cmp 0x21` / `cmp 0x66` après `scanf("%i")`) |

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
./scripts/add-crackme.sh --author rr7 <id>
```

Doc : [README racine](../../README.md#ajouter-un-crackme-crackmesone).
