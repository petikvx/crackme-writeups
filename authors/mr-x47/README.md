# mr-x47

Auteur local : **`mr-x47`** (site : [Mr.X47](https://crackmes.one/user/Mr.X47)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [Mr.X47's BiLoop Cipher](6a48e4146840520e01b22041/) | [`6a48e414…`](https://crackmes.one/crackme/6a48e4146840520e01b22041) | Linux ELF64 PIE (GCC) | keygen `petik123→iemgo1#3` (XOR `K[i]` i pair + `K[31-j]` j%3==0, non imprimable → `*`) |

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
./scripts/add-crackme.sh --author mr-x47 <id>
```

Doc : [README racine](../../README.md#ajouter-un-crackme-crackmesone).
