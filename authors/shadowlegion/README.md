# shadowlegion

Auteur local : **`shadowlegion`** (site : [ShadowLegion](https://crackmes.one/user/ShadowLegion)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [TermBreaker](6a9950e9cab6678aefe9dc90/) | [`6a9950e9…`](https://crackmes.one/crackme/6a9950e9cab6678aefe9dc90) | Linux ELF64 Qt6 | code `TERMATUR` (Σ(i+1)·ord = 2856) |


Section **Debug GDB** : ajoutée dans [`TermBreaker`](6a9950e9cab6678aefe9dc90/README.md).
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
./scripts/add-crackme.sh --author shadowlegion <id>
```

Doc : [README racine](../../README.md#ajouter-un-crackme-crackmesone).
