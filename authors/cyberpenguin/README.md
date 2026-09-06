# cyberpenguin

Auteur local : **`cyberpenguin`** (site : [Cyberpenguin](https://crackmes.one/user/Cyberpenguin)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [What password???](6a83e2f205a9e80a90724421/) | [`6a83e2f2…`](https://crackmes.one/crackme/6a83e2f205a9e80a90724421) | Linux ELF64 NASM | password `kr@meri$dab3st` (XOR `0x27` + addend `2+2i`) |

Section **Debug GDB** : `loop_1` XOR `0x27` + addend.

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
./scripts/add-crackme.sh --author cyberpenguin <id>
```

Doc : [README racine](../../README.md#ajouter-un-crackme-crackmesone).
