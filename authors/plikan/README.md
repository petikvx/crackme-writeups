# plikan

Auteur local : **`plikan`** (site : [plikan](https://crackmes.one/user/plikan)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [Easy Keygen Crackme](6a7d865b184836c0dbe7d789/) | [`6a7d865b…`](https://crackmes.one/crackme/6a7d865b184836c0dbe7d789) | Windows PE32 .NET | HWID → … → `EBD19-CAF83-9A28D-42ED6-3AFD7` (live) |
| 2 | [Ez Crackme](692272032d267f28f69b7ff5/) | [`69227203…`](https://crackmes.one/crackme/692272032d267f28f69b7ff5) | Windows PE32 .NET | mot de passe en dur `ar@gerg554y345@htw54` (live) |
| 3 | [Very Ez Crackme](694f2baf0c16072f40f5a495/) | [`694f2baf…`](https://crackmes.one/crackme/694f2baf0c16072f40f5a495) | Windows .NET WinForms | `AAAAMMJJ + 4777` (ex. 2026-11-11 → `20265888`) (statique, pas de run live) |

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
./scripts/add-crackme.sh --author plikan <id>
```

Doc : [README racine](../../README.md#ajouter-un-crackme-crackmesone).
