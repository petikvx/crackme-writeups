# bitfriends

Auteur local : **`bitfriends`** (site : [BitFriends](https://crackmes.one/user/BitFriends)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [nasm crack](5ea48a1433c5d47611746436/) | [`5ea48a1433c5d47611746436`](https://crackmes.one/crackme/5ea48a1433c5d47611746436) | Linux ELF64 NASM | password `supersecret` (live) |
| 2 | [rop](5f3d7ed033c5d42a7c667d95/) | [`5f3d7ed033c5d42a7c667d95`](https://crackmes.one/crackme/5f3d7ed033c5d42a7c667d95) | Linux ELF64 | ret2csu leak + ret2libc `system("/bin/sh")` |

Section **Debug GDB** : `repz cmpsb` vs `supersecret`.

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
./scripts/add-crackme.sh --author bitfriends <id>
```

Doc : [README racine](../../README.md#ajouter-un-crackme-crackmesone).
