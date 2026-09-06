# fentcat

Auteur local : **`fentcat`** (site : [FentCat](https://crackmes.one/user/FentCat)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [Assembler Crackme](68fce1922d267f28f69b783a/) | [`68fce1922d267f28f69b783a`](https://crackmes.one/crackme/68fce1922d267f28f69b783a) | Windows PE32 asm | password `@CBEDGFI` (live Wine) |

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
./scripts/add-crackme.sh --author fentcat <id>
```

Doc : [README racine](../../README.md#ajouter-un-crackme-crackmesone).
