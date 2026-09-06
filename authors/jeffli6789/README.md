# jeffli6789

Auteur local : **`jeffli6789`** (site : [jeffli6789](https://crackmes.one/user/jeffli6789)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [RE CTF 2026 — wallpaper](69a2911b7a778cfffbfb67ca/) | [`69a2911b…`](https://crackmes.one/crackme/69a2911b7a778cfffbfb67ca) | Linux ELF64 asm | `CMO{1001223210123010301233322110103321001}` |
| 2 | [x86](5f01df5633c5d4285070948b/) | [`5f01df56…`](https://crackmes.one/crackme/5f01df5633c5d4285070948b) | Linux ELF64 | `374274518` |
| 3 | [Maze](5f009fa233c5d42850709479/) | [`5f009fa2…`](https://crackmes.one/crackme/5f009fa233c5d42850709479) | Linux ELF64 | path 1252×`1..4` |

Les trois challenges ont une section **Debug GDB (pas à pas)** dans leur `README.md` (maze : piège `read` fd=2 ; x86 : patch shellcode + `mprotect` ; wallpaper : état / WALL).

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
./scripts/add-crackme.sh --author jeffli6789 <id>
```

Doc : [README racine](../../README.md#ajouter-un-crackme-crackmesone).
