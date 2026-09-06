# pera

Auteur local : **`pera`** (site : [Pera](https://crackmes.one/user/Pera)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [Simple keygenme for beginners](6a8e45513b246e477b6c09a9/) | [`6a8e4551…`](https://crackmes.one/crackme/6a8e45513b246e477b6c09a9) | Windows PE64 | `petik→60704` (`first*(sum^3)`) |
| 2 | [Pera's Tiktok comment crackme](6a937f87cab6678aefe9dbc2/) | [`6a937f87…`](https://crackmes.one/crackme/6a937f87cab6678aefe9dbc2) | Linux ELF64 SDL | part1 `ach6` ; part2 `petik→aadp0` |


Section **Debug GDB** : ajoutée dans [`thisismebtw`](6a937f87cab6678aefe9dbc2/README.md).
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
./scripts/add-crackme.sh --author pera <id>
```

Doc : [README racine](../../README.md#ajouter-un-crackme-crackmesone).
