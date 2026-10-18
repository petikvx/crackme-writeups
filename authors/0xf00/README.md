# 0xf00

Auteur local : **`0xf00`** (site : [0xf00](https://crackmes.one/user/0xf00)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [Ghost](682f69bd6297cca3ff7d7b9b/) | [`682f69bd…`](https://crackmes.one/crackme/682f69bd6297cca3ff7d7b9b) | Linux ELF64 PIE | exploit format string → hijack `meta[0]` → `sub_1960` ("Congratulations, you triggered the ghost heap!") |

Pas de GDB utilisé : reverse statique (MCP `ida`) + vérification dynamique
en boîte noire (pipes vers le binaire natif).
