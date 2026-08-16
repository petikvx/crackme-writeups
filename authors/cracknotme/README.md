# CrackNotMe

Auteur local : **`cracknotme`** (site : [CrackNotMe](https://crackmes.one/user/CrackNotMe)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [CFB #1](6a1547f42b3df128c1df5ca5/) | [`6a1547f4…`](https://crackmes.one/crackme/6a1547f42b3df128c1df5ca5) | Windows x86-64 | `petik` → serial `3D513B4748` (hex par char) |
| 2 | [CFB #2 Maze Runner](6a15496417539b5175d12386/) | [`6a154964…`](https://crackmes.one/crackme/6a15496417539b5175d12386) | Windows x86-64 | path WASD `SDDSSASSDDSSDDDSSDDD` |

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
./scripts/add-crackme.sh --author cracknotme <id>
```

Doc : [README racine](../../README.md#ajouter-un-crackme-crackmesone).
