# 23x41

Auteur local : **`23x41`** (site : [23x41](https://crackmes.one/user/23x41)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [Secure Vault](6a59d79ba27dfa335e4c8597/) | [`6a59d79b…`](https://crackmes.one/crackme/6a59d79ba27dfa335e4c8597) | ELF64 RISC-V static | ret2win `win@0x10476` → `FLAG{0x8A7_RISCV_ROP_WIN}` (statique) |

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
./scripts/add-crackme.sh --author 23x41 <id>
```

Doc : [README racine](../../README.md#ajouter-un-crackme-crackmesone).
