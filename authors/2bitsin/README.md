# 2bitsin

Auteur local : **`2bitsin`** (site : [2bitsin](https://crackmes.one/user/2bitsin)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| — | [Secret message from a traveller](650c14b528b5870bef26308d/) | [`650c14b5…`](https://crackmes.one/crackme/650c14b528b5870bef26308d) | Floppy x86 / BIOS ROM | XTEA + ROM `92F9674` → `teso{john_titor_was_here}` |

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
./scripts/add-crackme.sh --author 2bitsin <id>
```

Doc : [README racine](../../README.md#ajouter-un-crackme-crackmesone).
