# soulreaper

Auteur local : **`soulreaper`** (site : [soulreaper](https://crackmes.one/user/soulreaper)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml) (id ↔ sha256).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [Dead Terminal](6a77c5d1df981859694944b8/) | [`6a77c5d1…`](https://crackmes.one/crackme/6a77c5d1df981859694944b8) | Linux x86-64 | `reap REAPER42` |
| 2 | [XorGate](6a768ab608712c1a17cbacdd/) | [`6a768ab6…`](https://crackmes.one/crackme/6a768ab608712c1a17cbacdd) | Linux x86-64 | `petik`→`5346574a48@password` ; `FLAG{SoulReaper_XOR_Crackme}` |
| 3 | [Death Trap](6a7d0ce1184836c0dbe7d77e/) | [`6a7d0ce1…`](https://crackmes.one/crackme/6a7d0ce1184836c0dbe7d77e) | Linux x86-64 | serial `mLE1AAHrQU3xAhAV` (java+ROL, double-fork) |

Les trois ont une section **Debug GDB (pas à pas)** (XorGate : XOR `0x23` ; Dead Terminal : follow-fork + `reap` ; Death Trap : double-fork / deux hashs).

## Ajouter un crackme

```bash
./scripts/add-crackme.sh --author soulreaper <id>
```
