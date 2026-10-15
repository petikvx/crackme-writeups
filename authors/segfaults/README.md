# segfaults

Auteur local : **`segfaults`** (site : [segfaults](https://crackmes.one/user/segfaults)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [Jame's Cybersecurity Company](6a0c8b608fab7bbca2730221/) | [`6a0c8b60…`](https://crackmes.one/crackme/6a0c8b608fab7bbca2730221) | Linux ELF64 PIE C++/Qt6 | `base64(bin(XOR(toupper(user))))` — `john_doe` → `MTAwMTA=` (`petik` → `MTAwMDAxMQ==`) |

Section **Debug GDB** : appel direct de `sub_7840` en live (voir [README](6a0c8b608fab7bbca2730221/README.md)).
