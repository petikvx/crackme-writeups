# vilxd

Auteur local : **`vilxd`** (site : [vilxd](https://crackmes.one/user/vilxd)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [Crack my points](6a70bc1c08712c1a17cbac5a/) | [`6a70bc1c…`](https://crackmes.one/crackme/6a70bc1c08712c1a17cbac5a) | Windows x86-64 | patch DLL → `You have 101` |
| 2 | [CRACK ME DLL](6a6e0d3d91dca16886160b86/) | [`6a6e0d3d…`](https://crackmes.one/crackme/6a6e0d3d91dca16886160b86) | Windows x86-64 | patch `hp` 100→101 |
| 3 | [crack the points](690fa2f12d267f28f69b7c44/) | [`690fa2f1…`](https://crackmes.one/crackme/690fa2f12d267f28f69b7c44) | Windows x86-64 | patch `xor edx,edx` → `mov edx,101` (`Your count points is 101`) |
| 4 | [decode me](69245c422d267f28f69b806e/) | [`69245c42…`](https://crackmes.one/crackme/69245c422d267f28f69b806e) | Windows x86-64 | password `Pa>__-3\\->L@>_>` (`0→_ 1→> 2→\`) |

## Ajouter un crackme

```bash
./scripts/add-crackme.sh --author vilxd <id>
```
